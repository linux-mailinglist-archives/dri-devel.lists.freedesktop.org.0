Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D26B37F2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4910E968;
	Fri, 10 Mar 2023 08:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C44389CC4;
 Thu,  9 Mar 2023 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1678400473; x=1709936473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yVuCSofNXc4xFq2MIhmOj+IftFzTz6jbp1BPLOvSYTc=;
 b=damD0ZgtpEpe7n60W4199petnCgl+jh1al3dF5FtAUqeAvIj1A5zLDVD
 ULv05qKWyABjRaFSqHAHDRcN/c0MrjFCOakibbVVo+riAZPJ8AVPs1ifn
 bluUn4mLVsmfLd1c5dRv5Up88/cfsWqXQtRl95ijPGdnDwQJIQ8B50u3M A=;
X-IronPort-AV: E=Sophos;i="5.98,247,1673913600"; d="scan'208";a="191702044"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-47cc8a4c.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 22:21:11 +0000
Received: from EX13MTAUWB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-47cc8a4c.us-east-1.amazon.com (Postfix)
 with ESMTPS id 01C01160DA9; Thu,  9 Mar 2023 22:21:06 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Thu, 9 Mar 2023 22:21:05 +0000
Received: from u0d599d08243c5b.ant.amazon.com (10.187.171.27) by
 EX19D047UWB002.ant.amazon.com (10.13.138.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.24; Thu, 9 Mar 2023 22:21:04 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm: Check for the GPU IOMMU during bind
Date: Thu, 9 Mar 2023 15:20:49 -0700
Message-ID: <20230309222049.4180579-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.171.27]
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
Precedence: Bulk
X-Mailman-Approved-At: Fri, 10 Mar 2023 08:02:13 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jordan Crouse <jorcrous@amazon.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While booting with amd,imageon on a headless target the GPU probe was
failing with -ENOSPC in get_pages() from msm_gem.c.

Investigation showed that the driver was using the default 16MB VRAM
carveout because msm_use_mmu() was returning false since headless devices
use a dummy parent device. Avoid this by extending the existing is_a2xx
priv member to check the GPU IOMMU state on all platforms and use that
check in msm_use_mmu().

This works for memory allocations but it doesn't prevent the VRAM carveout
from being created because that happens before we have a chance to check
the GPU IOMMU state in adreno_bind.

There are a number of possible options to resolve this but none of them are
very clean. The easiest way is to likely specify vram=0 as module parameter
on headless devices so that the memory doesn't get wasted.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++++-
 drivers/gpu/drm/msm/msm_drv.c              | 7 +++----
 drivers/gpu/drm/msm/msm_drv.h              | 2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..4f19da28f80f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -539,7 +539,11 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
 		config.rev.minor, config.rev.patchid);
 
-	priv->is_a2xx = config.rev.core == 2;
+	/*
+	 * A2xx has a built in IOMMU and all other IOMMU enabled targets will
+	 * have an ARM IOMMU attached
+	 */
+	priv->has_gpu_iommu = config.rev.core == 2 || device_iommu_mapped(dev);
 	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index aca48c868c14..a125a351ec90 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -318,11 +318,10 @@ bool msm_use_mmu(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	/*
-	 * a2xx comes with its own MMU
-	 * On other platforms IOMMU can be declared specified either for the
-	 * MDP/DPU device or for its parent, MDSS device.
+	 * Return true if the GPU or the MDP/DPU or parent MDSS device has an
+	 * IOMMU
 	 */
-	return priv->is_a2xx ||
+	return priv->has_gpu_iommu ||
 		device_iommu_mapped(dev->dev) ||
 		device_iommu_mapped(dev->dev->parent);
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f0c184b02a0..f33f94acd1b9 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -126,7 +126,7 @@ struct msm_drm_private {
 	struct msm_gpu *gpu;
 
 	/* gpu is only set on open(), but we need this info earlier */
-	bool is_a2xx;
+	bool has_gpu_iommu;
 	bool has_cached_coherent;
 
 	struct drm_fb_helper *fbdev;
-- 
2.34.1

