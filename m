Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3025EA26
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB376E2C0;
	Sat,  5 Sep 2020 20:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6959D6E2C0;
 Sat,  5 Sep 2020 20:04:55 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id u3so1343302pjr.3;
 Sat, 05 Sep 2020 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ExFb876Zpeyb1xoghNKq/lathY4dq7rmwE6M/oL73CQ=;
 b=T5hzkFVJ906JGMEGcKzWOIyfp4RZO093Wgyzbv3F8qEos8PoXpghOhJPYdnPqHOE9d
 tRckNjK7Lb9T4PX3poifyFY6PsJfV9V1wpOQU0QuU7QGgYtqx5ngy8bIyDV8kqeyFDPN
 tuPUvhIR5/DeC3c8Bf/y+BaLGA2Xdp7cxc882CDBXvGwbSAuogBqIWywBd1rO4/yt430
 Orlwi/mIssTh3pd4sEgnH7r38fD35d9BJWnPaVrqMhRn0yhya+Ik+EZ57jsuQNkJgcX5
 6pxJmO6E4AXXPMhS5xSij0iEciaP4yNv32wCwgnJsvmAWG7+wFC9u6/gAYEAMSGNJ7pN
 /t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ExFb876Zpeyb1xoghNKq/lathY4dq7rmwE6M/oL73CQ=;
 b=l46yMizrqpe9Ce18TDn6bCDhIGOHkV4rSAK0IVDErGBC1282x2+X6UaMQccxJOeuFP
 /bx5V929YcaOYaRxyU9ayyzaa9l/yFOJshKcY2F7GEp8y93S4ZUkyp+nh1o6zvpl2KIl
 GQQ2AQnXQ4JYTNKJlEO6zc7heZq/QJgXfnmvP8/HBOlasgP75MzwoGtAaTgk4Dd9o3Ff
 UHtd1R7TVGyzTbB+iuZ6NXEnWhq74/IaPU96ltyJw8dyrUuwhva/s779DDSoDIjdUUzK
 jF1UDNoobsl3oOxUFqnTt7snqRlbheUKtat6UDhZ4MywT0HLki4sH2Uh+9vb4k9ER2lo
 BFgw==
X-Gm-Message-State: AOAM5336nC88jDpNUarIETsgoK/Fc8Cph0Z0218g34kUYX3xcPCX4VvF
 g/GAfOSy8PopqcgUHQ6KJkc=
X-Google-Smtp-Source: ABdhPJwrvjF9LVJOg5UrKaixKkZOaQCEUmOTh1VsmLMJvfbpixbh1oqxeYJIfz/zv4DDASl+uqUl8g==
X-Received: by 2002:a17:902:8d82:: with SMTP id
 v2mr14095552plo.180.1599336295014; 
 Sat, 05 Sep 2020 13:04:55 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y195sm10492742pfc.137.2020.09.05.13.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:04:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 15/20] iommu/arm-smmu: Constify some helpers
Date: Sat,  5 Sep 2020 13:04:21 -0700
Message-Id: <20200905200454.240929-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Sprinkle a few `const`s where helpers don't need write access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 9aaacc906597..1a746476927c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -377,7 +377,7 @@ struct arm_smmu_master_cfg {
 	s16				smendx[];
 };
 
-static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_tcr(const struct io_pgtable_cfg *cfg)
 {
 	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
 		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
@@ -398,13 +398,13 @@ static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 	return tcr;
 }
 
-static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_tcr2(const struct io_pgtable_cfg *cfg)
 {
 	return FIELD_PREP(ARM_SMMU_TCR2_PASIZE, cfg->arm_lpae_s1_cfg.tcr.ips) |
 	       FIELD_PREP(ARM_SMMU_TCR2_SEP, ARM_SMMU_TCR2_SEP_UPSTREAM);
 }
 
-static inline u32 arm_smmu_lpae_vtcr(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_vtcr(const struct io_pgtable_cfg *cfg)
 {
 	return ARM_SMMU_VTCR_RES1 |
 	       FIELD_PREP(ARM_SMMU_VTCR_PS, cfg->arm_lpae_s2_cfg.vtcr.ps) |
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
