Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065C58D0DF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1D7ADDC2;
	Mon,  8 Aug 2022 23:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE80A71EA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2leLlKnhht5Zd1Jvvd0vHV196LjRIIKrLG7rDDvvSk=;
 b=P4N8TceYiMsTwC1LBoWR+R74SIXnThPH8yjOQ0vpW0EJJlbafx8YIVTy354ynSg5EotTxE
 uB8iJyOJlhqMYk9wcKR6r9swqfT3Jem8+ij8OJrVlNwhR6XVHpsvIMKRYqtSxeOK8ZujAE
 VMsgQxS9ZZJ1pLeiRAwxPD48p3pKc3k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-ViECr-QnNtKXqpg0guHCpg-1; Mon, 08 Aug 2022 19:55:11 -0400
X-MC-Unique: ViECr-QnNtKXqpg0guHCpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 366EF3C0CD5A;
 Mon,  8 Aug 2022 23:55:11 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BA89C15BA1;
 Mon,  8 Aug 2022 23:55:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v2 15/18] drm/display/dp_mst: Skip releasing payloads if last
 connected port isn't connected
Date: Mon,  8 Aug 2022 19:52:00 -0400
Message-Id: <20220808235203.123892-16-lyude@redhat.com>
In-Reply-To: <20220808235203.123892-1-lyude@redhat.com>
References: <20220808235203.123892-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

In the past, we've ran into strange issues regarding errors in response to
trying to destroy payloads after a port has been unplugged. We fixed this
back in:

This is intended to replace the workaround that was added here:

commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by ports in stale topology")

which was intended fix to some of the payload leaks that were observed
before, where we would attempt to determine if the port was still connected
to the topology before updating payloads using
drm_dp_mst_port_downstream_of_branch. This wasn't a particularly good
solution, since one of the points of still having port and mstb validation
is to avoid sending messages to newly disconnected branches wherever
possible - thus the required use of drm_dp_mst_port_downstream_of_branch
would indicate something may be wrong with said validation.

It seems like it may have just been races and luck that made
drm_dp_mst_port_downstream_of_branch work however, as while I was trying to
figure out the true cause of this issue when removing the legacy MST code -
I discovered an important excerpt in section 2.14.2.3.3.6 of the DP 2.0
specs:

"BAD_PARAM - This reply is transmitted when a Message Transaction parameter
is in error; for example, the next port number is invalid or /no device is
connected/ to the port associated with the port number."

Sure enough - removing the calls to drm_dp_mst_port_downstream_of_branch()
and instead checking the ->ddps field of the parent port to see whether we
should release a given payload or not seems to totally fix the issue. This
does actually make sense to me, as it seems the implication is that given a
topology where an MSTB is removed, the payload for the MST parent's port
will be released automatically if that port is also marked as disconnected.
However, if there's another parent in the chain after that which is
connected - payloads must be released there with an ALLOCATE_PAYLOAD
message.

So, let's do that!

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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 51 +++++++------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a5460cadf2c8..e9cf09a4b2a4 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3128,7 +3128,7 @@ static struct drm_dp_mst_port *drm_dp_get_last_connected_port_to_mstb(struct drm
 static struct drm_dp_mst_branch *
 drm_dp_get_last_connected_port_and_mstb(struct drm_dp_mst_topology_mgr *mgr,
 					struct drm_dp_mst_branch *mstb,
-					int *port_num)
+					struct drm_dp_mst_port **last_port)
 {
 	struct drm_dp_mst_branch *rmstb = NULL;
 	struct drm_dp_mst_port *found_port;
@@ -3144,7 +3144,8 @@ drm_dp_get_last_connected_port_and_mstb(struct drm_dp_mst_topology_mgr *mgr,
 
 		if (drm_dp_mst_topology_try_get_mstb(found_port->parent)) {
 			rmstb = found_port->parent;
-			*port_num = found_port->port_num;
+			*last_port = found_port;
+			drm_dp_mst_get_port_malloc(found_port);
 		} else {
 			/* Search again, starting from this parent */
 			mstb = found_port->parent;
@@ -3161,7 +3162,7 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 				   int pbn)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
-	struct drm_dp_mst_branch *mstb;
+	struct drm_dp_mst_branch *mstb = NULL;
 	int ret, port_num;
 	u8 sinks[DRM_DP_MAX_SDP_STREAMS];
 	int i;
@@ -3169,12 +3170,22 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 	port_num = port->port_num;
 	mstb = drm_dp_mst_topology_get_mstb_validated(mgr, port->parent);
 	if (!mstb) {
-		mstb = drm_dp_get_last_connected_port_and_mstb(mgr,
-							       port->parent,
-							       &port_num);
+		struct drm_dp_mst_port *rport = NULL;
+		bool ddps;
 
+		mstb = drm_dp_get_last_connected_port_and_mstb(mgr, port->parent, &rport);
 		if (!mstb)
 			return -EINVAL;
+
+		ddps = rport->ddps;
+		port_num = rport->port_num;
+		drm_dp_mst_put_port_malloc(rport);
+
+		/* If the port is currently marked as disconnected, don't send a payload message */
+		if (!ddps) {
+			ret = -EINVAL;
+			goto fail_put;
+		}
 	}
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
@@ -3375,7 +3386,6 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_s
 	struct drm_dp_mst_port *port;
 	int i, j;
 	int cur_slots = start_slot;
-	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
 	for (i = 0; i < mgr->max_payloads; i++) {
@@ -3390,16 +3400,6 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_s
 			port = container_of(vcpi, struct drm_dp_mst_port,
 					    vcpi);
 
-			mutex_lock(&mgr->lock);
-			skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
-			mutex_unlock(&mgr->lock);
-
-			if (skip) {
-				drm_dbg_kms(mgr->dev,
-					    "Virtual channel %d is not in current topology\n",
-					    i);
-				continue;
-			}
 			/* Validated ports don't matter if we're releasing
 			 * VCPI
 			 */
@@ -3500,7 +3500,6 @@ int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_mst_port *port;
 	int i;
 	int ret = 0;
-	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
 	for (i = 0; i < mgr->max_payloads; i++) {
@@ -3510,13 +3509,6 @@ int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
 
 		port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
 
-		mutex_lock(&mgr->lock);
-		skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
-		mutex_unlock(&mgr->lock);
-
-		if (skip)
-			continue;
-
 		drm_dbg_kms(mgr->dev, "payload %d %d\n", i, mgr->payloads[i].payload_state);
 		if (mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL) {
 			ret = drm_dp_create_payload_step2(mgr, port, mgr->proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
@@ -4769,18 +4761,9 @@ EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port)
 {
-	bool skip;
-
 	if (!port->vcpi.vcpi)
 		return;
 
-	mutex_lock(&mgr->lock);
-	skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
-	mutex_unlock(&mgr->lock);
-
-	if (skip)
-		return;
-
 	drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
 	port->vcpi.num_slots = 0;
 	port->vcpi.pbn = 0;
-- 
2.37.1

