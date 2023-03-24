Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52FC6C7C0D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0755510EBB1;
	Fri, 24 Mar 2023 09:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC63010E4FF;
 Fri, 24 Mar 2023 09:55:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5505CB822F4;
 Fri, 24 Mar 2023 09:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563CDC4339B;
 Fri, 24 Mar 2023 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679651709;
 bh=telboDqiszRZh0CV9SUq1HH8wUjYC0sO5QRS2X/7S7A=;
 h=From:To:Cc:Subject:Date:From;
 b=Z3o1wAe1nhJEbNptRXR/e656omWLHuax/+a08CAs/i17BT6BhOoIW/H/HYiaew41Z
 fkx0RFFQph2vatjjEWfQ5z9DTKRYATrfT/yP05qIDlAmyIF17E0Q3wYKm6EVhs/5zC
 jelAmDSgdnoDllnvH1i8l4WUGxHqRRHBmC/dsHCwp6OBPPSaBjN6peMOBU5GrL9WXc
 EtO2J9e2dOA5FGovSDG6QZgJMAh1ArFxeEDTOnK09Kz9k26FrS0H7azxZ1ZzNLNdhS
 9e/IUqlzxHlr/A81r0z0bxKg/tsbHEwEq9LegPSBKRq56r45QhqlxkQ49Lce+fm4sZ
 471WdPsrT/eqA==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH] drm/msm/a6xx: add CONFIG_PM dependency
Date: Fri, 24 Mar 2023 10:54:45 +0100
Message-Id: <20230324095502.3289094-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Sean Paul <sean@poorly.run>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Selecting CONFIG_PM_GENERIC_DOMAINS causes a build failure when CONFIG_PM
is not enabled:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [m]:
  - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM [=y] || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=y] || QCOM_OCMEM [=y]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=y] || QCOM_COMMAND_DB [=y]=n) && DEVFREQ_GOV_SIMPLE_ONDEMAND [=y]

drivers/base/power/domain.c:654:13: error: use of undeclared identifier 'pm_wq'
        queue_work(pm_wq, &genpd->power_off_work);
                   ^
drivers/base/power/domain.c:853:26: error: no member named 'ignore_children' in 'struct dev_pm_info'
                if (!dev || dev->power.ignore_children)
                            ~~~~~~~~~~ ^

Fixes: c11fa1204fe9 ("drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 1c417ba53b5b..85f5ab1d552c 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -9,6 +9,7 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on PM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-- 
2.39.2

