Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA01F237B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4536E9B0;
	Mon,  8 Jun 2020 23:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F626E9AE;
 Mon,  8 Jun 2020 23:15:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCC312068D;
 Mon,  8 Jun 2020 23:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658126;
 bh=zDJc7RsUzm7UigBtyyVjcH3t6Z0lzN8dVVi27bY+PYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fMTZ4QB9C2cPbyYmKU69vEIx40/lewoP6rihk/wV7GhOQIvTFl073Gwd53RjOXRF1
 IkR/pyqiNd59Fwe/8cjmoEdDEGefnkdVhwAbeEOWG9Pqg4EYtzdmlD/Uvbr/SIUuqT
 6L9dv5CcWNRQ/TM1HIqoTVl4yGK1kM/fvO4ApoZI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 162/606] drm/i915/gvt: Init DPLL/DDI vreg for
 virtual display instead of inheritance.
Date: Mon,  8 Jun 2020 19:04:47 -0400
Message-Id: <20200608231211.3363633-162-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Colin Xu <colin.xu@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Xu <colin.xu@intel.com>

commit f965b68188ab59a40a421ced1b05a2fea638465c upstream.

Init value of some display vregs rea inherited from host pregs. When
host display in different status, i.e. all monitors unpluged, different
display configurations, etc., GVT virtual display setup don't consistent
thus may lead to guest driver consider display goes malfunctional.

The added init vreg values are based on PRMs and fixed by calcuation
from current configuration (only PIPE_A) and the virtual EDID.

Fixes: 04d348ae3f0a ("drm/i915/gvt: vGPU display virtualization")
Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20200508060506.216250-1-colin.xu@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/display.c | 49 +++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index a62bdf9be682..59aa5e64acb0 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -207,14 +207,41 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
 				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
 				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
-		vgpu_vreg_t(vgpu, LCPLL1_CTL) |=
-				LCPLL_PLL_ENABLE |
-				LCPLL_PLL_LOCK;
-		vgpu_vreg_t(vgpu, LCPLL2_CTL) |= LCPLL_PLL_ENABLE;
-
+		/*
+		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
+		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
+		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
+		 *   setup_virtual_dp_monitor, we can bind DPLL0 to any PORT_x
+		 *   so we fixed to DPLL0 here.
+		 * Setup DPLL0: DP link clk 1620 MHz, non SSC, DP Mode
+		 */
+		vgpu_vreg_t(vgpu, DPLL_CTRL1) =
+			DPLL_CTRL1_OVERRIDE(DPLL_ID_SKL_DPLL0);
+		vgpu_vreg_t(vgpu, DPLL_CTRL1) |=
+			DPLL_CTRL1_LINK_RATE(DPLL_CTRL1_LINK_RATE_1620, DPLL_ID_SKL_DPLL0);
+		vgpu_vreg_t(vgpu, LCPLL1_CTL) =
+			LCPLL_PLL_ENABLE | LCPLL_PLL_LOCK;
+		vgpu_vreg_t(vgpu, DPLL_STATUS) = DPLL_LOCK(DPLL_ID_SKL_DPLL0);
+		/*
+		 * Golden M/N are calculated based on:
+		 *   24 bpp, 4 lanes, 154000 pixel clk (from virtual EDID),
+		 *   DP link clk 1620 MHz and non-constant_n.
+		 * TODO: calculate DP link symbol clk and stream clk m/n.
+		 */
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) = 63 << TU_SIZE_SHIFT;
+		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) |= 0x5b425e;
+		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) = 0x800000;
+		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) = 0x3cd6e;
+		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) = 0x80000;
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
+			~DPLL_CTRL2_DDI_CLK_OFF(PORT_B);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_B);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_B);
 		vgpu_vreg_t(vgpu, SFUSE_STRAP) |= SFUSE_STRAP_DDIB_DETECTED;
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
@@ -235,6 +262,12 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
+			~DPLL_CTRL2_DDI_CLK_OFF(PORT_C);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_C);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_C);
 		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTC_HOTPLUG_CPT;
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
@@ -255,6 +288,12 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
 	}
 
 	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) {
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=
+			~DPLL_CTRL2_DDI_CLK_OFF(PORT_D);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_D);
+		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=
+			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_D);
 		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTD_HOTPLUG_CPT;
 		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=
 			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
