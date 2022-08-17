Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E75976F1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 21:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C77D113DEC;
	Wed, 17 Aug 2022 19:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4A8A5291
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lwx8PaWh6vygwU1UFyt3KfAFGt9fHxhNC+ENd2udmJQ=;
 b=MGq1JATpu7KR0b/Zdvo5U5wXjieM4jhOlOmZwOyZYMLwUAW8KUTsrg01x6VplFY9ZK64iw
 HtJ4MUTdthzl17IOIaWPwsDDDWFLN5N+n+bazyUUWk9W5jOv+PI8hMKggwX+Zj5h1Ewi73
 9exJ9fsAuBGMnADdGox+P5GQs1hUs5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-Ud7XGgcCPoq0YbT_jcJUOQ-1; Wed, 17 Aug 2022 15:40:39 -0400
X-MC-Unique: Ud7XGgcCPoq0YbT_jcJUOQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9FE8032FB;
 Wed, 17 Aug 2022 19:40:38 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FCB2492C3B;
 Wed, 17 Aug 2022 19:40:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v4 14/17] drm/display/dp_mst: Drop all ports from topology on
 CSNs before queueing link address work
Date: Wed, 17 Aug 2022 15:38:43 -0400
Message-Id: <20220817193847.557945-15-lyude@redhat.com>
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

We want to start cutting down on all of the places that we use port
validation, so that ports may be removed from the topology as quickly as
possible to minimize the number of errors we run into as a result of being
out of sync with the current topology status. This isn't a very typical
scenario and I don't think I've ever even run into it - but since the next
commit is going to make some changes to payload updates depending on their
hotplug status I think it's a probably good idea to take precautions.

Let's do this with CSNs by moving some code around so that we only queue
link address probing work at the end of handling all CSNs - allowing us to
make sure we drop as many topology references as we can beforehand.

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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 97e8f8a83ed4..a5460cadf2c8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2509,7 +2509,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 	return ret;
 }
 
-static void
+static int
 drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 			    struct drm_dp_connection_status_notify *conn_stat)
 {
@@ -2522,7 +2522,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 
 	port = drm_dp_get_port(mstb, conn_stat->port_number);
 	if (!port)
-		return;
+		return 0;
 
 	if (port->connector) {
 		if (!port->input && conn_stat->input_port) {
@@ -2575,8 +2575,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 
 out:
 	drm_dp_mst_topology_put_port(port);
-	if (dowork)
-		queue_work(system_long_wq, &mstb->mgr->work);
+	return dowork;
 }
 
 static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
@@ -4060,7 +4059,7 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	struct drm_dp_mst_branch *mstb = NULL;
 	struct drm_dp_sideband_msg_req_body *msg = &up_req->msg;
 	struct drm_dp_sideband_msg_hdr *hdr = &up_req->hdr;
-	bool hotplug = false;
+	bool hotplug = false, dowork = false;
 
 	if (hdr->broadcast) {
 		const u8 *guid = NULL;
@@ -4083,11 +4082,14 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* TODO: Add missing handler for DP_RESOURCE_STATUS_NOTIFY events */
 	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
-		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
+		dowork = drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
 		hotplug = true;
 	}
 
 	drm_dp_mst_topology_put_mstb(mstb);
+
+	if (dowork)
+		queue_work(system_long_wq, &mgr->work);
 	return hotplug;
 }
 
-- 
2.37.1

