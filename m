Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F020C83402
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 04:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7082910E345;
	Tue, 25 Nov 2025 03:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com
 [115.124.28.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC34210E345;
 Tue, 25 Nov 2025 03:34:26 +0000 (UTC)
Received: from aliyun.com(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.fV91Bm9_1764041662 cluster:ay29) by smtp.aliyun-inc.com;
 Tue, 25 Nov 2025 11:34:23 +0800
From: zhangzhijie <zhangzhijie@bosc.ac.cn>
To: jani.nikula@linux.intel.com, jeff@jeffgeerling.com, zhangzhijie@bosc.ac.cn,
 wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2/2] i915: Support Intel GPU porting on any non-x86 system.
Date: Tue, 25 Nov 2025 11:34:20 +0800
Message-Id: <20251125033420.2265288-1-zhangzhijie@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

inb/outb speccial wire not support on other ARCH.
Should detect whether arch platform support or not.

Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++-------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 6e125564db34..d85622ba10fc 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -41,6 +41,15 @@ static bool has_vga_pipe_sel(struct intel_display *display)
 	return DISPLAY_VER(display) < 7;
 }
 
+static bool intel_arch_support_vga_pm(struct intel_display *display)
+{
+#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
+	return true;
+#else
+	return false;
+#endif
+}
+
 /* Disable the VGA plane that we never use */
 void intel_vga_disable(struct intel_display *display)
 {
@@ -64,13 +73,15 @@ void intel_vga_disable(struct intel_display *display)
 	drm_dbg_kms(display->drm, "Disabling VGA plane on pipe %c\n",
 		    pipe_name(pipe));
 
-	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
-	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
-	outb(0x01, VGA_SEQ_I);
-	sr1 = inb(VGA_SEQ_D);
-	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
-	vga_put(pdev, VGA_RSRC_LEGACY_IO);
-	udelay(300);
+	if (likely(intel_arch_support_vga_pm(display))) {
+		/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
+		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+		outb(0x01, VGA_SEQ_I);
+		sr1 = inb(VGA_SEQ_D);
+		outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
+		vga_put(pdev, VGA_RSRC_LEGACY_IO);
+		udelay(300);
+	}
 
 	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
 	intel_de_posting_read(display, vga_reg);
@@ -90,9 +101,11 @@ void intel_vga_reset_io_mem(struct intel_display *display)
 	 * sure vgacon can keep working normally without triggering interrupts
 	 * and error messages.
 	 */
-	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
-	outb(inb(VGA_MIS_R), VGA_MIS_W);
-	vga_put(pdev, VGA_RSRC_LEGACY_IO);
+	if (likely(intel_arch_support_vga_pm(display))) {
+		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+		outb(inb(VGA_MIS_R), VGA_MIS_W);
+		vga_put(pdev, VGA_RSRC_LEGACY_IO);
+	}
 }
 
 int intel_vga_register(struct intel_display *display)
-- 
2.34.1

