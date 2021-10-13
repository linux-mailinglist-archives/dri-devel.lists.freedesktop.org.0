Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84242C3BD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CF96EA09;
	Wed, 13 Oct 2021 14:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA0C6EA09;
 Wed, 13 Oct 2021 14:43:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E667661166;
 Wed, 13 Oct 2021 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634136193;
 bh=3YOpUj7zJIjHOwNL7dHDpxdkIPlsudzfvv538+Bhka0=;
 h=From:To:Cc:Subject:Date:From;
 b=ioHRl71JgzZ0mbftYm/WArKiGSk5dzcVQvzsXVP7zv2nWL4M22qfgruxeGeqOkzHO
 +u7kIJ7Af439F+wP9OuveVQDGGLgnD1nwQc3CmOlSsyLO8t4AiyWj0DzN6eZwWTCal
 tnuHzV/3oZaLuOHeGuB0wpxSoNmTRYNA9GHWnA0Qp3uh+p5iaLH6j6Ez/ldAjVxHS1
 vmL2is+oMpacdVpqgx0ymn1tCl+Gx0KEVSnalG5F5eDYtceNwRNUSkLc45R5hdO0Sr
 Udc8D60oJar4TuxLNhJnjjoS391ykJf7K2SswEs6zjPZkTxWxRvvtL0XwgaHQKjDal
 DxliTR8fRQprw==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alex Elder <elder@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
Date: Wed, 13 Oct 2021 16:42:56 +0200
Message-Id: <20211013144308.2248978-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
phy code is left out, which results in a link failure:

ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'

This was only exposed after it became possible to build
test the driver without the clock interfaces.

Make COMMON_CLK a hard dependency for compile testing,
and simplify it a little based on that.

Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig  | 2 +-
 drivers/gpu/drm/msm/Makefile | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f5107b6ded7b..cb204912e0f4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -4,8 +4,8 @@ config DRM_MSM
 	tristate "MSM DRM"
 	depends on DRM
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
+	depends on COMMON_CLK
 	depends on IOMMU_SUPPORT
-	depends on (OF && COMMON_CLK) || COMPILE_TEST
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 904535eda0c4..bbee22b54b0c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -23,8 +23,10 @@ msm-y := \
 	hdmi/hdmi_i2c.o \
 	hdmi/hdmi_phy.o \
 	hdmi/hdmi_phy_8960.o \
+	hdmi/hdmi_phy_8996.o \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
+	hdmi/hdmi_pll_8960.o \
 	edp/edp.o \
 	edp/edp_aux.o \
 	edp/edp_bridge.o \
@@ -37,6 +39,7 @@ msm-y := \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
 	disp/mdp4/mdp4_lvds_connector.o \
+	disp/mdp4/mdp4_lvds_pll.o \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
@@ -117,9 +120,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_audio.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
-msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
-msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
-msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_phy_8996.o
 
 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-- 
2.29.2

