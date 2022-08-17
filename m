Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCF5976B3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 21:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB17A52ED;
	Wed, 17 Aug 2022 19:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B92A52EA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulBqU/UC4+G7ZCOp5gWa2ib+D+JCAcv6bqRwjOAxJYg=;
 b=B9b3VKWPCsoML4vt/OJTCzN8KIN3rucHMpbQjTd+ef3GWZJ68cnC2bPAv6kKRMRtPDZo0l
 qJvLyqNDWZc72kGdXTJXKF1OrKrgqcb9+Ylx8ttghpB9ksjk1OJ7/vR1YGnDfbmN7h//gy
 eNzNn+k5zCUGsvbdPSDJ5WgBl1mRO4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-6OArxlt0NWamL6T1UMoD-Q-1; Wed, 17 Aug 2022 15:39:44 -0400
X-MC-Unique: 6OArxlt0NWamL6T1UMoD-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47D96811E76;
 Wed, 17 Aug 2022 19:39:43 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2F4E492C3B;
 Wed, 17 Aug 2022 19:39:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v4 05/17] drm/display/dp_mst: Fix confusing docs for
 drm_dp_atomic_release_time_slots()
Date: Wed, 17 Aug 2022 15:38:34 -0400
Message-Id: <20220817193847.557945-6-lyude@redhat.com>
In-Reply-To: <20220817193847.557945-1-lyude@redhat.com>
References: <20220817193847.557945-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For some reason we mention returning 0 if "slots have been added back to
drm_dp_mst_topology_state->avail_slots". This is totally misleading,
avail_slots is simply for figuring out the total number of slots available
in total on the topology and has no relation to the current payload
allocations.

So, let's get rid of that comment.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index fad80ab2b9db..8a2ddfde594a 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4456,8 +4456,7 @@ EXPORT_SYMBOL(drm_dp_atomic_find_time_slots);
  * drm_dp_mst_atomic_check()
  *
  * Returns:
- * 0 if all slots for this port were added back to
- * &drm_dp_mst_topology_state.avail_slots or negative error code
+ * 0 on success, negative error code otherwise
  */
 int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 				     struct drm_dp_mst_topology_mgr *mgr,
-- 
2.37.1

