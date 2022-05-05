Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E951B487
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 02:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197D810F918;
	Thu,  5 May 2022 00:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78110F913
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 00:16:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x33so4999823lfu.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6BZ7IebefRthM/nq1GeRPMj1Jfg2tTeYdhhJgi+YZc=;
 b=cpM1sATn9RUViJ1Bic7cx1LRL5UPGi6fxqpEieurV0Bsb5T/fFkJpcbQ+ePtVEBZKb
 akl4IUYvuuDmGtdEsD+IAuGIUUXtird5hqRDZ6BacP8sCRacTOri8m0KOzicuPOdK10k
 k2DKqA54+95QRLCaOrjwNEi58WMiRjOkSjb9Oe4ywfJ3UuVrY9vEQg/VLbqGi9mFXoDx
 xjGVqMX4WF1Ale+soM4Xt1pPsjlVDLCATB9g8VwNJF0AaBYnRsqmt1lJmR236qv5Z43X
 gxyVi9xyFoDLtAiTDG3tmfEoIi49vs0dyAu/mPx16FD10APgnyV4ohM1/sP92tiFJ5Rj
 eviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6BZ7IebefRthM/nq1GeRPMj1Jfg2tTeYdhhJgi+YZc=;
 b=ii5uq8WaLSfuvXQvKrfmi4x/rZWo38azdBclKp6CalvOq7Dhn9OBVUGnIjti9HdcRZ
 k8dVv89HMd+E/3wes7Ktla0qD+ZsTLWgpvGUGxKLiBZlMc2lPaIfixnc4ytT9tRnE2ti
 eQEhspMawMg3AsA423q4xDJUbQg0BGgxtGK0zrgb4brgGU/+tlqNBFb/CuAub7I8jISJ
 lHsSwnzrrJlS7OXZ5NTFGqOnMNIAfzRQ5NEaMFtjnh2cptAlcCF9RnuD+CRu5g0TreNc
 Flj+4AToM+Se3xmCx9IuDyZ0t3hRdA0sLI/x5WRtm24eZ4Q6WlFDobs5JOKX8xSsHFet
 OsCg==
X-Gm-Message-State: AOAM531SxPhc5e4mVeXeZx1QFzR0IiaUEHfZmYtN64w+TgFTcjdRrAb3
 lHzis5rlrxo6GLBmUK0SKOJg0w==
X-Google-Smtp-Source: ABdhPJxYtgU3N55D/VVUNnbpsOw/zycbxS6tYCG4Ppx3nvIcbx7NYbNwi0Hmse3nHEeZJ472gaFN/A==
X-Received: by 2002:ac2:544a:0:b0:471:f568:59d6 with SMTP id
 d10-20020ac2544a000000b00471f56859d6mr16053392lfn.492.1651709767179; 
 Wed, 04 May 2022 17:16:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 17:16:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/5] drm/msm/dpu: check both DPU and MDSS devices for the
 IOMMU
Date: Thu,  5 May 2022 03:16:01 +0300
Message-Id: <20220505001605.1268483-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
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

