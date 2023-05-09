Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A96FC9D5
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 17:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D68F10E023;
	Tue,  9 May 2023 15:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578EB10E023
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mqbwDK0oua4eLEV7xfDqRwStcIbAyhs8EQpD1SNvfAs=; b=AaFAmwyUXOxVxz+fmPkw7Q1Q7F
 FkxjaBHeGx0A5+bgWEGHTMi5bpTvjZfKVB9IjZhs2AhUIO6o5KT+AZOyqQNFdaK7B0jOILcjcsgxd
 +9uaaL3YS/kafnASWV1otDuElDHBf+k2/OAYvHHt4IZ0X/MsR/mlGcQ2e+plZUlortO1E/gwimRMM
 f2pclDFU8ydXUNB6TPOSpL3cRxs0xlw5b578cjPv1uoX0tT4OySMUSnfud/KayMkVncXUEvaRGSJW
 R7bZ086ax0A9LTg5xeM/+58QMditZP7/q3mnNYylvAFEydPsWSz/YrHcu0eMeQFRYIWwFRd2GAhMZ
 q+8nTwMw==;
Received: from 179-241-20-132.3g.claro.net.br ([179.241.20.132] helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwOuU-004xfg-SQ; Tue, 09 May 2023 17:05:51 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 1/2] drm/vkms: Refactor vkms_composer_worker() as preparation
 for virtual HW
Date: Tue,  9 May 2023 12:05:00 -0300
Message-Id: <20230509150501.81875-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509150501.81875-1-mcanal@igalia.com>
References: <20230509150501.81875-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new function vkms_composer_common(). The actual plane
composition work has been moved to the helper function,
vkms_composer_common(), which is called by vkms_composer_worker() and
will be called in the implementation of the virtual HW mode as well.

Co-developed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 38 ++++++++++++++++++----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 906d3df40cdb..f488675ccc62 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -212,6 +212,30 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	return ret;
 }
 
+static int vkms_composer_common(struct vkms_crtc_state *crtc_state,
+				struct vkms_output *out, bool wb_pending, uint32_t *crc32)
+{
+	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
+	int ret;
+
+	if (wb_pending)
+		ret = compose_active_planes(active_wb, crtc_state, crc32);
+	else
+		ret = compose_active_planes(NULL, crtc_state, crc32);
+
+	if (ret)
+		return ret;
+
+	if (wb_pending) {
+		drm_writeback_signal_completion(&out->wb_connector, 0);
+		spin_lock_irq(&out->composer_lock);
+		crtc_state->wb_pending = false;
+		spin_unlock_irq(&out->composer_lock);
+	}
+
+	return 0;
+}
+
 /**
  * vkms_composer_worker - ordered work_struct to compute CRC
  *
@@ -227,7 +251,6 @@ void vkms_composer_worker(struct work_struct *work)
 						struct vkms_crtc_state,
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
-	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	bool crc_pending, wb_pending;
 	u64 frame_start, frame_end;
@@ -251,21 +274,10 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (wb_pending)
-		ret = compose_active_planes(active_wb, crtc_state, &crc32);
-	else
-		ret = compose_active_planes(NULL, crtc_state, &crc32);
-
+	ret = vkms_composer_common(crtc_state, out, wb_pending, &crc32);
 	if (ret)
 		return;
 
-	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
-		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
-	}
-
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
-- 
2.40.1

