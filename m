Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A29ED507
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 19:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A8110EBE8;
	Wed, 11 Dec 2024 18:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aTurvEmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5310EBE8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 18:52:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ACBF8A40BEF;
 Wed, 11 Dec 2024 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04937C4CEDE;
 Wed, 11 Dec 2024 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733943176;
 bh=kdQ7Ib6f+G3Cc5oYVyNsbeJHI3RPzf1uzbuTM1qK414=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aTurvEmPW+IO7zcmmDc1YJIgsaR8yCQjnVbwrK4pNqlbJnsA1ovnEuqlF7estWBvy
 w6/LSrL4fnwfchMVPStv6yD8wQTtBIBHUBPgyXe0VPtJtaF504biACl2c9a2+/dK8t
 4lJu8MLBxTQuOSSpTBqhkYIQfjrEWEtbrmBXo/pDXZAB2tvAcHLWnZBhLGTgMG8rQh
 q0Ai5ZdsxChqU6+RBVeXjNmd8hLY8C+EBq69jmws+5HiqdMnRvERnHDnOU5uPrKQee
 /ao0RiALD0KMfq/w0qiLHjqdSurzyyCNovvzSJJ4CFZg/t+oP3ja8mfLFXaA+HNMBz
 0LNGPrMa5zilw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Imre Deak <imre.deak@intel.com>, Lyude Paul <lyude@redhat.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@intel.com, harry.wentland@amd.com,
 alexander.deucher@amd.com, Wayne.Lin@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 19/23] drm/dp_mst: Ensure mst_primary pointer is
 valid in drm_dp_mst_handle_up_req()
Date: Wed, 11 Dec 2024 13:51:56 -0500
Message-ID: <20241211185214.3841978-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185214.3841978-1-sashal@kernel.org>
References: <20241211185214.3841978-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.65
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

[ Upstream commit e54b00086f7473dbda1a7d6fc47720ced157c6a8 ]

While receiving an MST up request message from one thread in
drm_dp_mst_handle_up_req(), the MST topology could be removed from
another thread via drm_dp_mst_topology_mgr_set_mst(false), freeing
mst_primary and setting drm_dp_mst_topology_mgr::mst_primary to NULL.
This could lead to a NULL deref/use-after-free of mst_primary in
drm_dp_mst_handle_up_req().

Avoid the above by holding a reference for mst_primary in
drm_dp_mst_handle_up_req() while it's used.

v2: Fix kfreeing the request if getting an mst_primary reference fails.

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com> (v1)
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241204132007.3132494-1-imre.deak@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 6ead31701e79e..4d954e50964f0 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3995,9 +3995,10 @@ static void drm_dp_mst_up_req_work(struct work_struct *work)
 static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 {
 	struct drm_dp_pending_up_req *up_req;
+	struct drm_dp_mst_branch *mst_primary;
 
 	if (!drm_dp_get_one_sb_msg(mgr, true, NULL))
-		goto out;
+		goto out_clear_reply;
 
 	if (!mgr->up_req_recv.have_eomt)
 		return 0;
@@ -4015,10 +4016,19 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		drm_dbg_kms(mgr->dev, "Received unknown up req type, ignoring: %x\n",
 			    up_req->msg.req_type);
 		kfree(up_req);
-		goto out;
+		goto out_clear_reply;
+	}
+
+	mutex_lock(&mgr->lock);
+	mst_primary = mgr->mst_primary;
+	if (!mst_primary || !drm_dp_mst_topology_try_get_mstb(mst_primary)) {
+		mutex_unlock(&mgr->lock);
+		kfree(up_req);
+		goto out_clear_reply;
 	}
+	mutex_unlock(&mgr->lock);
 
-	drm_dp_send_up_ack_reply(mgr, mgr->mst_primary, up_req->msg.req_type,
+	drm_dp_send_up_ack_reply(mgr, mst_primary, up_req->msg.req_type,
 				 false);
 
 	if (up_req->msg.req_type == DP_CONNECTION_STATUS_NOTIFY) {
@@ -4035,13 +4045,13 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 			    conn_stat->peer_device_type);
 
 		mutex_lock(&mgr->probe_lock);
-		handle_csn = mgr->mst_primary->link_address_sent;
+		handle_csn = mst_primary->link_address_sent;
 		mutex_unlock(&mgr->probe_lock);
 
 		if (!handle_csn) {
 			drm_dbg_kms(mgr->dev, "Got CSN before finish topology probing. Skip it.");
 			kfree(up_req);
-			goto out;
+			goto out_put_primary;
 		}
 	} else if (up_req->msg.req_type == DP_RESOURCE_STATUS_NOTIFY) {
 		const struct drm_dp_resource_status_notify *res_stat =
@@ -4058,7 +4068,9 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	mutex_unlock(&mgr->up_req_lock);
 	queue_work(system_long_wq, &mgr->up_req_work);
 
-out:
+out_put_primary:
+	drm_dp_mst_topology_put_mstb(mst_primary);
+out_clear_reply:
 	memset(&mgr->up_req_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
 	return 0;
 }
-- 
2.43.0

