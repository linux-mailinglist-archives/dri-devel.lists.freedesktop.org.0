Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A3B06E8E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B6D10E66D;
	Wed, 16 Jul 2025 07:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-104.mail.aliyun.com (out28-104.mail.aliyun.com
 [115.124.28.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3E610E1A8;
 Tue, 15 Jul 2025 07:36:15 +0000 (UTC)
Received: from aliyun.com(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.dnAL8W3_1752564970 cluster:ay29) by smtp.aliyun-inc.com;
 Tue, 15 Jul 2025 15:36:11 +0800
From: zhangzhijie <zhangzhijie@bosc.ac.cn>
To: zhangzhijie@bosc.ac.cn, wangran@bosc.ac.cn, zhangjian@bosc.ac.cn,
 daniel@ffwll.ch, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/xe: Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
Date: Tue, 15 Jul 2025 15:36:08 +0800
Message-Id: <20250715073608.2387698-1-zhangzhijie@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Jul 2025 07:13:52 +0000
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

    inb/outb speccial wire not support on other ARCH.
Should detect whether arch platform support or not.

Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 4b98833bfa8c..5e48e3282670 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -33,6 +33,7 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
 	if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
 		return;
 
+#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
 	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
 	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
 	outb(0x01, VGA_SEQ_I);
@@ -40,6 +41,7 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
 	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
 	udelay(300);
+#endif
 
 	intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);
 	intel_de_posting_read(dev_priv, vga_reg);
@@ -80,6 +82,7 @@ void intel_vga_redisable(struct drm_i915_private *i915)
 
 void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 {
+#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	/*
@@ -95,6 +98,7 @@ void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
 	outb(inb(VGA_MIS_R), VGA_MIS_W);
 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
+#endif
 }
 
 int intel_vga_register(struct drm_i915_private *i915)
-- 
2.34.1

