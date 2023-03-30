Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DA6CFCEB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD9510ED0D;
	Thu, 30 Mar 2023 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01B10ECFB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:36:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9B831FE92;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEZaVpJU3qEkKtywxW07EVAjjN44se8OWxU4qiBKPog=;
 b=TsZ2FAgX82lFatsdrg4OpGVjZFrI2WU4BAYD3WaVxDs0PItqtfYTnYszKrK2k8J4tp7fwm
 Jg+GxVbED3DMwTRU2NV6fDWAqmdEMnkYwlPKHdOBqXBa4QR7U4i8MY/1K6gXTT1KkEHK8x
 OXUMDhU5ov5LyUPpAgllkihYHie656E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEZaVpJU3qEkKtywxW07EVAjjN44se8OWxU4qiBKPog=;
 b=uDUZexHfMT7UAHgAyGfYYHe1YY2N01EqHQ/upXChU2Lv7KrVc2Bv8rT2M7OSz/G/9rxgm9
 qRadHQTc5hIgmODQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E76F1390D;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uPtxJQc8JWQJewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH 3/5] drm/exynos: Remove fb_helper from struct
 exynos_drm_private
Date: Thu, 30 Mar 2023 09:36:33 +0200
Message-Id: <20230330073635.7409-4-tzimmermann@suse.de>
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

The DRM device stores a pointer to the fbdev helper. Remove struct
exynos_drm_private.fb_helper, which contains the same value. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 --
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 15 +++++----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6ae9056e7a18..81d501efd013 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -197,8 +197,6 @@ struct drm_exynos_file_private {
  * @wait: wait an atomic commit to finish
  */
 struct exynos_drm_private {
-	struct drm_fb_helper *fb_helper;
-
 	struct device *g2d_dev;
 	struct device *dma_dev;
 	void *mapping;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e7059850baa2..81f909cb5c9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -137,7 +137,6 @@ static const struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
 
 int exynos_drm_fbdev_init(struct drm_device *dev)
 {
-	struct exynos_drm_private *private = dev->dev_private;
 	struct drm_fb_helper *helper;
 	int ret;
 
@@ -148,8 +147,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 	if (!helper)
 		return -ENOMEM;
 
-	private->fb_helper = helper;
-
 	drm_fb_helper_prepare(dev, helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
@@ -172,7 +169,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 	drm_fb_helper_fini(helper);
 err_init:
 	drm_fb_helper_unprepare(helper);
-	private->fb_helper = NULL;
 	kfree(helper);
 
 	return ret;
@@ -197,14 +193,13 @@ static void exynos_drm_fbdev_destroy(struct drm_device *dev,
 
 void exynos_drm_fbdev_fini(struct drm_device *dev)
 {
-	struct exynos_drm_private *private = dev->dev_private;
+	struct drm_fb_helper *fb_helper = dev->fb_helper;
 
-	if (!private || !private->fb_helper)
+	if (!fb_helper)
 		return;
 
-	exynos_drm_fbdev_destroy(dev, private->fb_helper);
-	drm_fb_helper_unprepare(private->fb_helper);
-	kfree(private->fb_helper);
-	private->fb_helper = NULL;
+	exynos_drm_fbdev_destroy(dev, fb_helper);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
 }
 
-- 
2.40.0

