Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49626516397
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 12:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D1110EAEB;
	Sun,  1 May 2022 10:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E1B10EAC8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 10:10:25 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b18so2051520lfv.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6BZ7IebefRthM/nq1GeRPMj1Jfg2tTeYdhhJgi+YZc=;
 b=x0WLWXgfnSOjWXAOlv5T8ikE2AvIsJvghkqfUvzaZFO+TJQFjU0viRJKy+ZgvXt68F
 Kj/hBSnljsPbPc4Az3awoo4s4yLgAg2QZgNFtTHlOdNqZE+EmXC/+115SN5pxcpSFraC
 uqVIf51UL0bDF8lx7Ss8Wuklhw4+2mHYE+ql2qLaYUhyrzXgxATtFiDKCTZlQ9eZjeR1
 4ApFSBb5+CVwfUYPujgOapIpAhi9mRL6L6tNOp5Swk0VKPg5OLrI74DVsFjA6ZVmz4wg
 hMcBD9eRa6ZvnJPVpK5t5YRcVZjBmvvHP4crAy8m8F9LE/D7r9bYHYOoV1OXe5F/qZUG
 HXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6BZ7IebefRthM/nq1GeRPMj1Jfg2tTeYdhhJgi+YZc=;
 b=xD5mqnT+K8/1hLY3XgIVajvmB2z+7r/UYZwdFQTf9W5f8ojUpsptcBlNH1r4MF/JTX
 0VJM1IeZH18r3JeFWshQHMcTlHWl6cJKPeot3699zJLFAj2mS/3Md9sciVopztenB5BR
 X68u880NsnvFQBuC8olv2HTeTXibJoGyasVs2FwdX6JuJyWw3pNx+Ds0druAeO6Geox8
 iEmL3MN6dedsHxEELMQQ+L65I+8SSauFAqfNshRzh2xHAwwgHa6mYcsZfsLew2woa2Pk
 kCFqW/fMem8UiXM7MvNiY18ZGpyyWRgDit0mT7s2DHPg+dzJTMdOzlJQCK1bnABPTime
 ECCQ==
X-Gm-Message-State: AOAM532qYQt9NFin0Hqg6Yux8Qn+zhCEQ0c2vdOVlYgh6WKVFVL8AbWX
 ygUhm2Q6iiNAuhvt+j9gHTJZvA==
X-Google-Smtp-Source: ABdhPJzz7Fwj/ogJKl0mXT3YjdI8YwpcM0MXQsR2xOULe+kyoVMLWn8dwYrIQOMZ8hqjScUUdUOEZw==
X-Received: by 2002:a05:6512:3f96:b0:44a:f504:597f with SMTP id
 x22-20020a0565123f9600b0044af504597fmr5758946lfa.621.1651399824316; 
 Sun, 01 May 2022 03:10:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:10:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
Date: Sun,  1 May 2022 13:10:20 +0300
Message-Id: <20220501101022.3931295-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the lead of MDP5 driver and check both DPU and MDSS devices for
the IOMMU specifiers.

Historically DPU devices had IOMMU specified in the MDSS device tree
node, but as some of MDP5 devices are being converted to the supported
by the DPU driver, the driver should adapt and check both devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 143d6643be53..5ccda0766f6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1004,14 +1004,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	struct msm_mmu *mmu;
 	struct device *dpu_dev = dpu_kms->dev->dev;
 	struct device *mdss_dev = dpu_dev->parent;
+	struct device *iommu_dev;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
 		return 0;
 
-	/* IOMMUs are a part of MDSS device tree binding, not the
-	 * MDP/DPU device. */
-	mmu = msm_iommu_new(mdss_dev, domain);
+	/*
+	 * IOMMUs can be a part of MDSS device tree binding, or the
+	 * MDP/DPU device.
+	 */
+	if (dev_iommu_fwspec_get(dpu_dev))
+		iommu_dev = dpu_dev;
+	else
+		iommu_dev = mdss_dev;
+
+	mmu = msm_iommu_new(iommu_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(mmu);
-- 
2.35.1

