Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4A66D096
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 21:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D343710E4D0;
	Mon, 16 Jan 2023 20:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6EE10E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6vtZ2dhit4YIV0BW8xpsm1HI6evGTR9S+h1Hyo/oL7c=; b=pRfUtyGnpyn0wZsbstsvNQj8oF
 XUAVOci1gEmUM9tq8LSlnFrSlrdxp4VrUw7DxeKkE9XHO8NhtHkxs7r8lEsukghLTnFJBFC3kKVf+
 NjgBMzuHmcMiEBIIZ920LAvNsYYD85qKUFszYcMwTuHhRGzkhmat4o9WFU80SNPLNhQT7On7iPj4/
 TCKMTS+obCElMmthzjuOrNrIW5M6DcRcYPlvdWFCs4BD+rayQbUpppL05Fif90xHcv64Dwy2DM/yH
 ehEpu1VtVn4UCRvkhd9rXaykNa3tg4S+2cu9WzzjPdw9TzeBGntJXCVKU35LRgO5IFEOSSO0TZLc4
 WoSJOggw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHWZK-00A7qv-Ri; Mon, 16 Jan 2023 21:59:03 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH 1/2] drm/vkms: Use drmm_crtc_init_with_planes()
Date: Mon, 16 Jan 2023 17:58:00 -0300
Message-Id: <20230116205800.1266227-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
to get rid of the explicit destroy hook in struct drm_crtc_funcs.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..515f6772b866 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -161,7 +161,6 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.set_config             = drm_atomic_helper_set_config,
-	.destroy                = drm_crtc_cleanup,
 	.page_flip              = drm_atomic_helper_page_flip,
 	.reset                  = vkms_atomic_crtc_reset,
 	.atomic_duplicate_state = vkms_atomic_crtc_duplicate_state,
@@ -282,8 +281,8 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
 	int ret;
 
-	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
-					&vkms_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
+					 &vkms_crtc_funcs, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
 		return ret;
-- 
2.39.0

