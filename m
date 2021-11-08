Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC95449A8E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1256489FF9;
	Mon,  8 Nov 2021 17:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCC789FF9;
 Mon,  8 Nov 2021 17:12:27 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y5so6386621pfb.4;
 Mon, 08 Nov 2021 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hGvO+FT4c2EJbxVYCDLmWLN/y9tCrxnSNXxEMsXuwNQ=;
 b=PEXo9EJ8iyOs6JYtLc/77yuf3gv2+qmOaRxZ/t9gKovlJPftYz0nG0N+vgAMQrzQ4i
 kNkOdJBlkeE/hZ6MODTHJLLrwXgvJnT/K6EX0chnqcK2yGVtopLE3UZg2leAGvZbl3LN
 64kttVS3G4UKARK1dMYKiUjOGmY8M4KlUB4uGdl56x8atLwBvciap3B2qM5Ve4ah0rbR
 JHeHvQRBp6QyA02S3Ok6G2ObBMX0tOjwcBU/elZbj5iChuMAeeb29F1iO9YXCuDr0WmS
 3dA5OVsnzNLM6MuM5kv8tGGk+wI0/n1LaF7IdCi20tMea79itbKo6koYALO1VLXF6R48
 n96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hGvO+FT4c2EJbxVYCDLmWLN/y9tCrxnSNXxEMsXuwNQ=;
 b=jchLJUhqQWQovf0gSbCGSRRg8PCYMzE9sAhrXso5S1ZEkapS6PGl9Zg9ba3F3SX0xK
 +g0P193lkMe1OBc3+5bu0/uqwwsXT2Y7L98Xk2pnHtNx5QBfQxBvlFUY9jyw+f0rmyMs
 DH0Szuz1QAWOUej/9VX1lbhLaLzC+lH3xXl2OsyzsUVW2qo2o79BiNyzTvuzHsECc/Qo
 Ro2S+7mY6B6B4X5oC4amxEGIUhjwLUIcl4/DM7LFUxwPPq71GmG2hxDqDnO9VrbwLuKa
 EzmufzsXVMNKPwMWpPWds0onK6tKuR+TX3CJb7XBFcxtgd2XrKpgLHHRtF1WD7lMiwnM
 SGpQ==
X-Gm-Message-State: AOAM5323+DgyIyqcdp9RzP//XGJ7oMRfwrvg8N2WWXNqSAbS9WwT1B6F
 WrjYb2hCxjZvFEkZYgAa3sg=
X-Google-Smtp-Source: ABdhPJzliYBpPaMk022dk/QMrNH7Vg6W2agrDSJIDzTqNmxTzHAPQJOF1S2MqpYK5Ecosi0pxfxalA==
X-Received: by 2002:a62:5ec2:0:b0:44d:47e2:4b3b with SMTP id
 s185-20020a625ec2000000b0044d47e24b3bmr82851281pfb.38.1636391547336; 
 Mon, 08 Nov 2021 09:12:27 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p16sm12810610pgd.78.2021.11.08.09.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 09:12:26 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/arm-smmu-qcom: Fix TTBR0 read
Date: Mon,  8 Nov 2021 09:17:23 -0800
Message-Id: <20211108171724.470973-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Anholt <eric@anholt.net>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is a 64b register, lets not lose the upper bits.

Fixes: ab5df7b953d8 ("iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault info")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 55690af1b25d..c998960495b4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -51,7 +51,7 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
 	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
-	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
+	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
 }
 
-- 
2.31.1

