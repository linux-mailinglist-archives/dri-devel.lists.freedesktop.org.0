Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619006CFCEA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4411E10ED0E;
	Thu, 30 Mar 2023 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA55F10ED0E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:36:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A26421B01;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZTpKz6L8f1fe9PoKyrygbmsbD0wLYxCPYj/fI5lK9s=;
 b=ONBZxDj3kcG+ptzuMVBbpAXGMlKdPCE3xXwLl79Q4OeutUyTV14a9sWDgWVi16qm+j65nR
 rcymzeezDuu/wIxZN26E6bu9m/RTqqDfRLBSAD+5/VHgPHxfXo3TgYESRuLRZaCLKs66le
 kKTlJFVpXWDglokMvXxSiLLcUf8RXD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZTpKz6L8f1fe9PoKyrygbmsbD0wLYxCPYj/fI5lK9s=;
 b=sJwECjBDYHomRTTm9jXUNYy+ntj82UsDbDn+tmZBvt3njZrTBexgahRfAoUmGrP6g7+JxE
 647xFAOIytcEgJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DBC81348E;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QD30FQc8JWQJewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH 2/5] drm/exynos: Remove struct exynos_drm_fbdev
Date: Thu, 30 Mar 2023 09:36:32 +0200
Message-Id: <20230330073635.7409-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073635.7409-1-tzimmermann@suse.de>
References: <20230330073635.7409-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove struct exynos_drm_fbdev, which is an empty wrapper around
struct drm_fb_helper. Use the latter directly. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index f11895d32982..e7059850baa2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -28,13 +28,6 @@
 #define MAX_CONNECTOR		4
 #define PREFERRED_BPP		32
 
-#define to_exynos_fbdev(x)	container_of(x, struct exynos_drm_fbdev,\
-				drm_fb_helper)
-
-struct exynos_drm_fbdev {
-	struct drm_fb_helper	drm_fb_helper;
-};
-
 static int exynos_drm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = info->par;
@@ -144,7 +137,6 @@ static const struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
 
 int exynos_drm_fbdev_init(struct drm_device *dev)
 {
-	struct exynos_drm_fbdev *fbdev;
 	struct exynos_drm_private *private = dev->dev_private;
 	struct drm_fb_helper *helper;
 	int ret;
@@ -152,11 +144,11 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 	if (!dev->mode_config.num_crtc)
 		return 0;
 
-	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev)
+	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
+	if (!helper)
 		return -ENOMEM;
 
-	private->fb_helper = helper = &fbdev->drm_fb_helper;
+	private->fb_helper = helper;
 
 	drm_fb_helper_prepare(dev, helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
 
@@ -181,7 +173,7 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 err_init:
 	drm_fb_helper_unprepare(helper);
 	private->fb_helper = NULL;
-	kfree(fbdev);
+	kfree(helper);
 
 	return ret;
 }
@@ -206,16 +198,13 @@ static void exynos_drm_fbdev_destroy(struct drm_device *dev,
 void exynos_drm_fbdev_fini(struct drm_device *dev)
 {
 	struct exynos_drm_private *private = dev->dev_private;
-	struct exynos_drm_fbdev *fbdev;
 
 	if (!private || !private->fb_helper)
 		return;
 
-	fbdev = to_exynos_fbdev(private->fb_helper);
-
 	exynos_drm_fbdev_destroy(dev, private->fb_helper);
 	drm_fb_helper_unprepare(private->fb_helper);
-	kfree(fbdev);
+	kfree(private->fb_helper);
 	private->fb_helper = NULL;
 }
 
-- 
2.40.0

