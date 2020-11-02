Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36C2A25D6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452146E42E;
	Mon,  2 Nov 2020 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56446E283
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 02:59:01 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [58.213.83.156])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id D17FA482B85;
 Mon,  2 Nov 2020 10:58:56 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: make crtc check before new_connector circle
Date: Sun,  1 Nov 2020 18:58:51 -0800
Message-Id: <20201102025851.3613-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZShhOTE1PGBpOHR9KVkpNS09JQ05CSExLTUlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6SRw4Tj8pLyEOMzgxCDNN
 NjhPCzlVSlVKTUtPSUNOQkhMTU5CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlOQ1VJ
 SkhVQ0hVSk5NWVdZCAFZQUlOQ0o3Bg++
X-HM-Tid: 0a7586e4b56793bakuwsd17fa482b85
X-Mailman-Approved-At: Mon, 02 Nov 2020 08:08:52 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function prepare_signaling, crtc check (c==0) is not related
with the next new_connector circle, maybe we can put the crtc
check just after the crtc circle and before new_connector circle.
This change is to make the code to run a bit first.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 25c269bc4681..566110996474 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1182,6 +1182,12 @@ static int prepare_signaling(struct drm_device *dev,
 
 		c++;
 	}
+	/*
+	 * Having this flag means user mode pends on event which will never
+	 * reach due to lack of at least one CRTC for signaling
+	 */
+	if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
+		return -EINVAL;
 
 	for_each_new_connector_in_state(state, conn, conn_state, i) {
 		struct drm_writeback_connector *wb_conn;
@@ -1220,13 +1226,6 @@ static int prepare_signaling(struct drm_device *dev,
 		conn_state->writeback_job->out_fence = fence;
 	}
 
-	/*
-	 * Having this flag means user mode pends on event which will never
-	 * reach due to lack of at least one CRTC for signaling
-	 */
-	if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
-		return -EINVAL;
-
 	return 0;
 }
 
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
