Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D417C8D4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795006EDA3;
	Fri,  6 Mar 2020 23:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E286ED9A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RmJSlccTvU8mlTIA7x4XcUPMjO0l6ilMljMhGOAI5Y=;
 b=Iq3SToaBJYhURgkbJTeXcocE6EXXAaUvjZ+CMNCgTljf9gwKz66NXcQWEHc6HXVNfd3nEZ
 vdoUI7y6/n4N2w4UWdvRPYynPJmnELsfCArANOS0eRn6w9z+ROEPl7R0A96AdwbICM6NuZ
 2fDdyW+S0uRlbTn0h+dqnE0Vyqw5CFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-jFjZfsLLPRyCTGmH_Adl-Q-1; Fri, 06 Mar 2020 18:46:35 -0500
X-MC-Unique: jFjZfsLLPRyCTGmH_Adl-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 125C8800053;
 Fri,  6 Mar 2020 23:46:34 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F02487389A;
 Fri,  6 Mar 2020 23:46:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/dp_mst: Reprobe path resources in CSN handler
Date: Fri,  6 Mar 2020 18:46:21 -0500
Message-Id: <20200306234623.547525-4-lyude@redhat.com>
In-Reply-To: <20200306234623.547525-1-lyude@redhat.com>
References: <20200306234623.547525-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We used to punt off reprobing path resources to the link address probe
work, but now that we handle CSNs asynchronously from the driver's HPD
handling we can do whatever the heck we want from the CSN!

So, reprobe the path resources from drm_dp_mst_handle_conn_stat(). Also,
get rid of the path resource reprobing code in
drm_dp_check_and_send_link_address() since it's needlessly complicated
when we already reprobe path resources from
drm_dp_handle_link_address_port(). And finally, teach
drm_dp_send_enum_path_resources() to return 1 on PBN changes so we know
if we need to send another hotplug or not.

This fixes issues where we've indicated to userspace that a port has
just been connected, before we actually probed it's available PBN -
something that results in unexpected atomic check failures.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 48 ++++++++++++++-------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 79ebb871230b..b81ad444c24f 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2299,12 +2299,16 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 		mutex_unlock(&mgr->lock);
 	}
 
-	if (old_ddps != port->ddps) {
-		if (port->ddps) {
-			if (!port->input) {
-				drm_dp_send_enum_path_resources(mgr, mstb,
-								port);
-			}
+	/*
+	 * Reprobe PBN caps on both hotplug, and when re-probing the link
+	 * for our parent mstb
+	 */
+	if (old_ddps != port->ddps || !created) {
+		if (port->ddps && !port->input) {
+			ret = drm_dp_send_enum_path_resources(mgr, mstb,
+							      port);
+			if (ret == 1)
+				changed = true;
 		} else {
 			port->full_pbn = 0;
 		}
@@ -2398,11 +2402,10 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 	port->ddps = conn_stat->displayport_device_plug_status;
 
 	if (old_ddps != port->ddps) {
-		if (port->ddps) {
-			dowork = true;
-		} else {
+		if (port->ddps && !port->input)
+			drm_dp_send_enum_path_resources(mgr, mstb, port);
+		else
 			port->full_pbn = 0;
-		}
 	}
 
 	new_pdt = port->input ? DP_PEER_DEVICE_NONE : conn_stat->peer_device_type;
@@ -2553,13 +2556,6 @@ static int drm_dp_check_and_send_link_address(struct drm_dp_mst_topology_mgr *mg
 		if (port->input || !port->ddps)
 			continue;
 
-		if (!port->full_pbn) {
-			drm_modeset_lock(&mgr->base.lock, NULL);
-			drm_dp_send_enum_path_resources(mgr, mstb, port);
-			drm_modeset_unlock(&mgr->base.lock);
-			changed = true;
-		}
-
 		if (port->mstb)
 			mstb_child = drm_dp_mst_topology_get_mstb_validated(
 			    mgr, port->mstb);
@@ -2987,6 +2983,7 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
 	if (ret > 0) {
+		ret = 0;
 		path_res = &txmsg->reply.u.path_resources;
 
 		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
@@ -2999,13 +2996,22 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 				      path_res->port_number,
 				      path_res->full_payload_bw_number,
 				      path_res->avail_payload_bw_number);
+
+			/*
+			 * If something changed, make sure we send a
+			 * hotplug
+			 */
+			if (port->full_pbn != path_res->full_payload_bw_number ||
+			    port->fec_capable != path_res->fec_capable)
+				ret = 1;
+
 			port->full_pbn = path_res->full_payload_bw_number;
 			port->fec_capable = path_res->fec_capable;
 		}
 	}
 
 	kfree(txmsg);
-	return 0;
+	return ret;
 }
 
 static struct drm_dp_mst_port *drm_dp_get_last_connected_port_to_mstb(struct drm_dp_mst_branch *mstb)
@@ -3582,13 +3588,9 @@ drm_dp_mst_topology_mgr_invalidate_mstb(struct drm_dp_mst_branch *mstb)
 	/* The link address will need to be re-sent on resume */
 	mstb->link_address_sent = false;
 
-	list_for_each_entry(port, &mstb->ports, next) {
-		/* The PBN for each port will also need to be re-probed */
-		port->full_pbn = 0;
-
+	list_for_each_entry(port, &mstb->ports, next)
 		if (port->mstb)
 			drm_dp_mst_topology_mgr_invalidate_mstb(port->mstb);
-	}
 }
 
 /**
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
