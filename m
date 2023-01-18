Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6F672240
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE5E10E77A;
	Wed, 18 Jan 2023 15:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E8610E775;
 Wed, 18 Jan 2023 15:58:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1671B81D7D;
 Wed, 18 Jan 2023 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB98CC433EF;
 Wed, 18 Jan 2023 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674057510;
 bh=pEEVf/Jora3k9fJs7MkNDz8h6qM3plpE8adDbzqBFOc=;
 h=From:To:Cc:Subject:Date:From;
 b=oarDxp9l6MGmeqdtPPlPcdcbct7dpxUxhM4ZbO0nB/h5L1I/bWMWT+F4COW6gdFuG
 ka9uVRj0MBzO/PovATGhagFvnLVoGhVt9G3I1LO1xyY9kfG5IqOrjAJZP7Zl/qgYlv
 6L0hvziRSN4jmqOJDOFRRFpiKNndCh0ggr0dntwoM1JG7GRQUGNE5FJo0JLoRvjF0y
 NKPqAvqHFVaXZHU1ccf/FYF52DgvTbWPikkg3D8T0KkzILemeh+co8C+tjw+5RkntU
 0Qz8dKIMvdmpTHejRPydgnFn/g8+EZJ+cBDARMBwAPLowgmKyFS4N4ocHLdjGyh8sz
 qMSJkca+YFgqg==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/gpu: Add proper DEVFREQ_GOV_SIMPLE_ONDEMAND dependency
Date: Wed, 18 Jan 2023 16:58:05 +0100
Message-Id: <20230118155825.4071424-1-arnd@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

DRM_MSM can no longer be built when devfreq is disabled:

WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
  Depends on [n]: PM_DEVFREQ [=n]
  Selected by [y]:
  - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=n] || SOC_IMX5 [=n] || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=y] || QCOM_COMMAND_DB [=y]=n)

In file included from drivers/gpu/drm/msm/msm_gpu.h:18,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
drivers/gpu/drm/msm/msm_drv.h:238:45: error: field 'gpu_devfreq_config' has incomplete type
  238 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
      |                                             ^~~~~~~~~~~~~~~~~~

Device drivers should never select user-visible options, especially
in other subsystems. This one can simply be expressed as a Kconfig
'depends on' statement, though a better approach would be to
let the driver keep working even without devfreq.

Note that the same symbol selects a bunch of other drivers that
should probably be turned into 'depends on' as well, but doing so
has the potential to introduce regressions, so I'm not touching
that here.

Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 871870ddf7ec..7f6f5202648a 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -9,6 +9,7 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
@@ -23,7 +24,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
-	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.39.0

