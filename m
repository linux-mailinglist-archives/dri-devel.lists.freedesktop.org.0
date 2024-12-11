Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6839ED513
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 19:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72010E60B;
	Wed, 11 Dec 2024 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kETN8+Jf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5001C10EBEB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 18:53:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 34D88A418B7;
 Wed, 11 Dec 2024 18:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C42C4CED2;
 Wed, 11 Dec 2024 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733943227;
 bh=1s1oXBbynOKYRxIx8NkEYOr7+xr9N+ldup6y4maCt6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kETN8+JfnclYCXpEd9SsiTw8Nea19TVvF06/4hZtLJ0kmGA27Q5aXnGdVR3SESOgN
 7yCkq3xYIKlB/Yd5mBinOHDmkT3WdkXCafSA8P8w/zCjDonFGxKwUZTrxPfyEWRvhf
 0m4em5nZ6oEYJN0fqCHohCxNclUhmQLUEx6vRYfw9CStGt8qf4N4WpI2MYXDMDgDPN
 4Y6sNx4+jLt6UojdZL9gkwi0VP9YTTgdBC63K44/RLUDR7PdcCwjY52fxnNOmR9WXX
 /rQgjpSi5/fKBVEY4qlODqRAgSb6KTyuP+e+CRztnQ9HOUxkkDwz2Y8oAWVnpS54fr
 QmflKLZTDTkMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Imre Deak <imre.deak@intel.com>, Lyude Paul <lyude@redhat.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@intel.com, harry.wentland@amd.com,
 alexander.deucher@amd.com, Wayne.Lin@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 13/15] drm/dp_mst: Reset message rx state after
 OOM in drm_dp_mst_handle_up_req()
Date: Wed, 11 Dec 2024 13:53:05 -0500
Message-ID: <20241211185316.3842543-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185316.3842543-1-sashal@kernel.org>
References: <20241211185316.3842543-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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

[ Upstream commit 2b245c97b1af5d8f04c359e0826cb5a5c81ef704 ]

After an out-of-memory error the reception state should be reset, so
that the next attempt receiving a message doesn't fail (due to getting a
start-of-message packet, while the reception state has already the
start-of-message flag set).

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241203160223.2926014-7-imre.deak@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e677a8eb45a4e..7321dcfb74a9a 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3996,6 +3996,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 {
 	struct drm_dp_pending_up_req *up_req;
 	struct drm_dp_mst_branch *mst_primary;
+	int ret = 0;
 
 	if (!drm_dp_get_one_sb_msg(mgr, true, NULL))
 		goto out_clear_reply;
@@ -4004,8 +4005,10 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		return 0;
 
 	up_req = kzalloc(sizeof(*up_req), GFP_KERNEL);
-	if (!up_req)
-		return -ENOMEM;
+	if (!up_req) {
+		ret = -ENOMEM;
+		goto out_clear_reply;
+	}
 
 	INIT_LIST_HEAD(&up_req->next);
 
@@ -4072,7 +4075,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_mst_topology_put_mstb(mst_primary);
 out_clear_reply:
 	memset(&mgr->up_req_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.43.0

