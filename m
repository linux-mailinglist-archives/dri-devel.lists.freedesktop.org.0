Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01E382023
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 19:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB856E15F;
	Sun, 16 May 2021 17:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1336E15F;
 Sun, 16 May 2021 17:14:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so2242161wmf.1; 
 Sun, 16 May 2021 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yyj+hGPOXvlG9agMuR9BE8l+uPdhGMcekWIUcWb7KfI=;
 b=dexWcb8Am0IfXI7swyTOIVu2/vZdNGtkqQXtDyt4B372OUB2SIqLeyoA2dHcnffz7P
 k5R9f0M277/NlnbfgWeK4XEIh7bi5EBgfUyacH/NYicTFEMyFgLvwkJjU6hfm8QbSzEB
 0ABA9NtJd5dfv2Jb60Drggw2jnKyBDa3AlqqaHdNaRVTCRjtu3IHZZbWoi79MllcurZA
 SUuouw3BmkNXQqSSBcYbzbFEDtG6mgNbegCSGqjc2NNG5r60uEJ0zf4gAp8gt+0Z9SGa
 WWXBLJRHmIcjAemMtCx3FY9MgI6xJeOb1u+rY9enk0MNd4waaezFuUZLlDX6Qu4uEzJD
 M7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yyj+hGPOXvlG9agMuR9BE8l+uPdhGMcekWIUcWb7KfI=;
 b=PqTqbscgCYJTJuWQuzBiYF/qMUKlNB12l3gUB6FWSQDE/Lh3xSlQbQlxU7IoMfRi4l
 73C7palNCwIy3l3fB37XPTPchayILavoAuJCdXiI5LbXlzJgki/hTHqXFGz/naEGgSac
 KEOI8yaXdmZ1O+rzgFp8jSItnAqVTPAShnsVlfsMtw83hY5ywtTh3S8vjLMnaSTonMfN
 Hpnf84qJiMJBao7PPToXMHKIijfe1wDT1laby0UKGmzBVwmLFSHC24sCtPCVKrVHg004
 PUVYIK88kGn3biPhpe+1+qNSKiidhs+9dODuKlCz5wAXu5jlnvmfSEg1tDWWkMf7/1vW
 KZIg==
X-Gm-Message-State: AOAM530Vs+KhT0FWukeRbNTkeJevMznrjPiAB5Y1tcv+VSEiDbSotuoW
 Fi9qyUUSgsteIZjDknwa2SU=
X-Google-Smtp-Source: ABdhPJzTzCNYcRjoHzq4JKJIcpimEj4+rpQsbWjdexdbzLuKBGP/HzWj2e96GXJPRvFbbk94yB+0Hw==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr5676976wmi.125.1621185280708; 
 Sun, 16 May 2021 10:14:40 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id j14sm14052555wmj.19.2021.05.16.10.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 10:14:40 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: only disable default vga device
Date: Sun, 16 May 2021 18:14:32 +0100
Message-Id: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vivek Das Mohapatra <vivek@collabora.com>

This patch is to do with seamless handover, eg when the sequence is
bootloader → plymouth → desktop.

It switches the vga arbiter from the "other" GPU to the default one
(intel in this case), so the driver can issue some io().

Signed-off-by: Vivek Das Mohapatra <vivek@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
Greetings all,

This patch has been downstream for a while now yet it seems perfectly
reasonable thing to have in the Linux kernel.

https://github.com/ValveSoftware/steamos_kernel/commit/5431b5b1999c3d3b5efee817fb3373fbbd473063


 drivers/gpu/drm/i915/display/intel_vga.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index be333699c515..4f07b5ad5fa0 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -30,12 +30,14 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
 	u8 sr1;
 
 	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
-	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
-	outb(SR01, VGA_SR_INDEX);
-	sr1 = inb(VGA_SR_DATA);
-	outb(sr1 | 1 << 5, VGA_SR_DATA);
-	vga_put(pdev, VGA_RSRC_LEGACY_IO);
-	udelay(300);
+	if (pdev == vga_default_device()) {
+		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+		outb(SR01, VGA_SR_INDEX);
+		sr1 = inb(VGA_SR_DATA);
+		outb(sr1 | 1 << 5, VGA_SR_DATA);
+		vga_put(pdev, VGA_RSRC_LEGACY_IO);
+		udelay(300);
+	}
 
 	intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);
 	intel_de_posting_read(dev_priv, vga_reg);
-- 
2.27.0

