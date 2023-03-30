Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F06CFCEF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF010ED0F;
	Thu, 30 Mar 2023 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDFD10ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:36:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58D3F21ADF;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNNOL/lWdVbxL4t1f0l8ZdkexG+cACWw4qmbFgADDvE=;
 b=akeyAXYrHgfGFSqL9FFlNWaWVotWwL/B8B3iSy9AZGpDRtycaz7jPmlwXhUvX3tuQpfEXc
 Moy2GQxtrvRyrP6PAbW4EQmHlm40fIAYHQB7DIwaJUTIGDIsaexbbg9b+PoTnmJp3hIYzI
 MoFJgAuY3KA6h0Uor2H/4c+VBrc2bEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNNOL/lWdVbxL4t1f0l8ZdkexG+cACWw4qmbFgADDvE=;
 b=J46ec2tTFhJQdPCOXUQxX0Gf4NJlmFoSktceKdmQUn5mdP0Llt61Q24PMTazsQW5XWLkA2
 KkAzBj/+bdI7beCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CFCD1390D;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4OQRBgc8JWQJewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH 1/5] drm/exynos: Remove exynos_gem from struct exynos_drm_fbdev
Date: Thu, 30 Mar 2023 09:36:31 +0200
Message-Id: <20230330073635.7409-2-tzimmermann@suse.de>
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

Fbdev's framebuffer stores a pointer to the GEM object. Remove
struct exynos_drm_fbdev.exynos_gem, which contains the same value.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 4929ffe5a09a..f11895d32982 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -16,6 +16,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
@@ -32,17 +33,14 @@
 
 struct exynos_drm_fbdev {
 	struct drm_fb_helper	drm_fb_helper;
-	struct exynos_drm_gem	*exynos_gem;
 };
 
-static int exynos_drm_fb_mmap(struct fb_info *info,
-			struct vm_area_struct *vma)
+static int exynos_drm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = info->par;
-	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(helper);
-	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
+	struct drm_gem_object *obj = drm_gem_fb_get_obj(helper->fb, 0);
 
-	return drm_gem_prime_mmap(&exynos_gem->base, vma);
+	return drm_gem_prime_mmap(obj, vma);
 }
 
 static const struct fb_ops exynos_drm_fb_ops = {
@@ -89,7 +87,6 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 				    struct drm_fb_helper_surface_size *sizes)
 {
-	struct exynos_drm_fbdev *exynos_fbdev = to_exynos_fbdev(helper);
 	struct exynos_drm_gem *exynos_gem;
 	struct drm_device *dev = helper->dev;
 	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
@@ -113,8 +110,6 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 	if (IS_ERR(exynos_gem))
 		return PTR_ERR(exynos_gem);
 
-	exynos_fbdev->exynos_gem = exynos_gem;
-
 	helper->fb =
 		exynos_drm_framebuffer_init(dev, &mode_cmd, &exynos_gem, 1);
 	if (IS_ERR(helper->fb)) {
-- 
2.40.0

