Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66242665F56
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0F10E2BD;
	Wed, 11 Jan 2023 15:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051F810E767
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id ay40so11400191wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OGvydfcnswB5kCTr6pgmQFxcgFjCL3fOh+5DF0n/kHQ=;
 b=MlaP4iz9T5QOEdEs7QRCj0LRht0gbuOE12jC5lqdYaja6OmWEu3x44yTN6+eBPdseA
 ZRP3gRxjIwfx/RvbvL1abOvvxn4IUBTB76ngU0gOrbj6czdukqRxbFjuguKcKlCvBiAi
 OIRDopYxEw1xY1T5KE6yRdOqY5ob94mIqBzMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGvydfcnswB5kCTr6pgmQFxcgFjCL3fOh+5DF0n/kHQ=;
 b=M4JXAvyk4YSJnfmp+NgtmUZ/xZx2RTNZr8csEPYiTmDn/dlODIa1JODjLMc5OOvrhb
 wZnI/XfIt6YP0T1iHvSNEngJybWaT9Ylj7vR0orjv2hvc74DOUxLnXk5wLlzFGjCc67e
 t89x9vyFpHYK1WO04xbVOhjcbf4T6+BiI496jhmxdd4XoOvhv6npNC5zk7HpcO5Vsm7J
 XV0kcODzKmhki1l0zYNUKfThvXanBAECSBllFLDQiyuRMLn5IsK6VkFn7xM+gHBZViJj
 KJVHCPM4gkuUJaeU9scZSEoNP4yebxhOlC5G7zq+l1CV8ASZBNajrQ7psOqnkJyFetca
 NasQ==
X-Gm-Message-State: AFqh2koZiLtoRIuOQv9/KTYzRBGAz6UvTtIYXTYxe1Y7279d49+v+0u7
 ovrItbx3+wk5CmxyA3dDUJ8B9O5Tb8YzoRGE
X-Google-Smtp-Source: AMrXdXvZL6+Fq4x6+s6c1TzAuUbbiOvtCaS9MpQRLMdhQaJKNpbYwvT73xPCftXvxiNmLgwrl3Fc5Q==
X-Received: by 2002:a05:600c:3482:b0:3d3:4f56:62e1 with SMTP id
 a2-20020a05600c348200b003d34f5662e1mr51193693wmq.27.1673451681375; 
 Wed, 11 Jan 2023 07:41:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Date: Wed, 11 Jan 2023 16:41:02 +0100
Message-Id: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's just open coded and matches.

Note that Thomas said that his version apparently failed for some
reason, but hey maybe we should try again.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/gpu/drm/ast/ast_drv.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 420fc75c240e..3ac24a780f50 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -90,27 +90,13 @@ static const struct pci_device_id ast_pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, ast_pciidlist);
 
-static int ast_remove_conflicting_framebuffers(struct pci_dev *pdev)
-{
-	bool primary = false;
-	resource_size_t base, size;
-
-	base = pci_resource_start(pdev, 0);
-	size = pci_resource_len(pdev, 0);
-#ifdef CONFIG_X86
-	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
-#endif
-
-	return drm_aperture_remove_conflicting_framebuffers(base, size, primary, &ast_driver);
-}
-
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct ast_private *ast;
 	struct drm_device *dev;
 	int ret;
 
-	ret = ast_remove_conflicting_framebuffers(pdev);
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &ast_driver);
 	if (ret)
 		return ret;
 
-- 
2.39.0

