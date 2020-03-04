Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75F179BD3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 23:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D846EB7B;
	Wed,  4 Mar 2020 22:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B396EB77
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 22:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583361393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0zrfOs4JuymdtRCnr7U9xphdhpEK889s02AHeFJ8k4=;
 b=H9MaIJ4MjAI4KLaUGooQySpFX0ZCQ4vvr5o1NJNsH4w93OlrDbyeJm5b+krR6Rfc5WEIc7
 jkidwvep9QzTFErWDBxzYnhSoPUfBtZcx/I6LWcssAKVuQlE+IzEzxkPCBpshqkIC3jtA+
 41XxWHhLXMdhWoon0L8BmmWmSBlOe/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-0oXYgCd2MnyXZ_A8bEPi7w-1; Wed, 04 Mar 2020 17:36:30 -0500
X-MC-Unique: 0oXYgCd2MnyXZ_A8bEPi7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EEEC107BA99;
 Wed,  4 Mar 2020 22:36:28 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E779C60BE0;
 Wed,  4 Mar 2020 22:36:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 3/3] drm/dp_mst: Rewrite and fix bandwidth limit checks
Date: Wed,  4 Mar 2020 17:36:13 -0500
Message-Id: <20200304223614.312023-4-lyude@redhat.com>
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
References: <20200304223614.312023-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sigh, this is mostly my fault for not giving commit cd82d82cbc04
("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
enough scrutiny during review. The way we're checking bandwidth
limitations here is mostly wrong.

First things first, we need to follow the locking conventions for MST.
Whenever traversing downwards (upwards is always safe) in the topology,
we need to hold &mgr->lock to prevent the topology from changing under
us. We don't currently do that when performing bandwidth limit checks.

Next we need to figure out the actual PBN limit for the primary MSTB.
Here we actually want to use the highest available_pbn value we can find
on each level of the topology, then make sure that the combined sum of
allocated PBN on each port of the branch device doesn't exceed that
amount. Currently, we just loop through each level of the topology and
use the last non-zero PBN we find.

Once we've done that, we then want to traverse down each branch device
we find in the topology with at least one downstream port that has PBN
allocated in our atomic state, and repeat the whole process on each
level of the topology as we travel down. While doing this, we need to
take care to avoid attempting to traverse down end devices. We don't
currently do this, although I'm not actually sure whether or not this
broke anything before.

Since there's a bit too many issues here to try to fix one by one, and
the drm_dp_mst_atomic_check_bw_limit() code is not entirely clear on all
of these pain points anyway, let's just take the easy way out and
rewrite the whole function. Additionally, we also add a kernel warning
if we find that any ports we performed bandwidth limit checks on didn't
actually have available_pbn populated - as this is always a bug in the
MST helpers.

This should fix regressions seen on nouveau, i915 and amdgpu where we
erroneously reject atomic states that should fit within bandwidth
limitations.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 101 ++++++++++++++++++++------
 1 file changed, 78 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7b0ff0cff954..87dc7c92d339 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4853,41 +4853,90 @@ static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
 	return false;
 }
 
-static inline
-int drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
-				     struct drm_dp_mst_topology_state *mst_state)
+static int
+drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
+				 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_mst_port *port;
 	struct drm_dp_vcpi_allocation *vcpi;
-	int pbn_limit = 0, pbn_used = 0;
+	int pbn_limit = 0, pbn_used = 0, ret;
 
-	list_for_each_entry(port, &branch->ports, next) {
-		if (port->mstb)
-			if (drm_dp_mst_atomic_check_bw_limit(port->mstb, mst_state))
-				return -ENOSPC;
+	if (branch->port_parent)
+		DRM_DEBUG_ATOMIC("[MSTB:%p] [MST PORT:%p] checking [MSTB:%p]\n",
+				 branch->port_parent->parent,
+				 branch->port_parent, branch);
+	else
+		DRM_DEBUG_ATOMIC("Checking [MSTB:%p]\n", branch);
 
-		if (port->available_pbn > 0)
+	list_for_each_entry(port, &branch->ports, next) {
+		/* Since each port shares a link, the highest PBN we find
+		 * should be assumed to be the limit for this branch device
+		 */
+		if (pbn_limit < port->available_pbn)
 			pbn_limit = port->available_pbn;
-	}
-	DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch has %d PBN available\n",
-			 branch, pbn_limit);
 
-	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
-		if (!vcpi->pbn)
+		if (port->pdt == DP_PEER_DEVICE_NONE)
 			continue;
 
-		if (drm_dp_mst_port_downstream_of_branch(vcpi->port, branch))
-			pbn_used += vcpi->pbn;
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
+			list_for_each_entry(vcpi, &mst_state->vcpis, next) {
+				if (vcpi->port != port)
+					continue;
+				if (!vcpi->pbn)
+					break;
+
+				/* This should never happen, as it means we
+				 * tried to set a mode before querying the
+				 * available_pbn
+				 */
+				if (WARN_ON(!port->available_pbn))
+					return -EINVAL;
+
+				if (vcpi->pbn > port->available_pbn) {
+					DRM_DEBUG_ATOMIC("[MSTB:%p] [MST PORT:%p] %d exceeds available PBN of %d\n",
+							 branch, port,
+							 vcpi->pbn,
+							 port->available_pbn);
+					return -ENOSPC;
+				}
+
+				DRM_DEBUG_ATOMIC("[MSTB:%p] [MST PORT:%p] using %d PBN\n",
+						 branch, port, vcpi->pbn);
+				pbn_used += vcpi->pbn;
+				break;
+			}
+		} else {
+			list_for_each_entry(vcpi, &mst_state->vcpis, next) {
+				if (!vcpi->pbn ||
+				    !drm_dp_mst_port_downstream_of_branch(vcpi->port,
+									  port->mstb))
+					continue;
+
+				ret = drm_dp_mst_atomic_check_bw_limit(port->mstb,
+								       mst_state);
+				if (ret < 0)
+					return ret;
+
+				pbn_used += ret;
+				break;
+			}
+		}
 	}
-	DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch used %d PBN\n",
-			 branch, pbn_used);
+	if (!pbn_used)
+		return 0;
+
+	DRM_DEBUG_ATOMIC("[MSTB:%p] has total available PBN of %d\n",
+			 branch, pbn_limit);
 
 	if (pbn_used > pbn_limit) {
-		DRM_DEBUG_ATOMIC("[MST BRANCH:%p] No available bandwidth\n",
-				 branch);
+		DRM_DEBUG_ATOMIC("[MSTB:%p] Not enough bandwidth (need: %d)\n",
+				 branch, pbn_used);
 		return -ENOSPC;
 	}
-	return 0;
+
+	DRM_DEBUG_ATOMIC("[MSTB:%p] using %d PBN\n", branch, pbn_used);
+
+	return pbn_used;
 }
 
 static inline int
@@ -5085,9 +5134,15 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 		ret = drm_dp_mst_atomic_check_vcpi_alloc_limit(mgr, mst_state);
 		if (ret)
 			break;
-		ret = drm_dp_mst_atomic_check_bw_limit(mgr->mst_primary, mst_state);
-		if (ret)
+
+		mutex_lock(&mgr->lock);
+		ret = drm_dp_mst_atomic_check_bw_limit(mgr->mst_primary,
+						       mst_state);
+		mutex_unlock(&mgr->lock);
+		if (ret < 0)
 			break;
+		else
+			ret = 0;
 	}
 
 	return ret;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
