Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEAE552406
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 20:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ABC10EE71;
	Mon, 20 Jun 2022 18:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E710F275
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 18:36:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so11496045pjl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r8NdoW5AddDmipkvsjih16CXPQjsU0eZxi3OxKkBmN8=;
 b=H+lKfc53MfoKWbnqFT89h/mhsoe7NhhEKrckelerE5pE/432Z3iaw7F1SU5lSMGrqJ
 FnKa6NPxdxUeaC+s00glxACfjiGk/WGnMJlbQIH6u00gpgD9cckUxtxVCnf1jyvOPQoU
 +fOslEDBVTSL1Gy7THBQtu2BMSdTLxqQeFir4ZRti+VfxfwhPYYzcwujuor+6XA5+K6l
 MO5/6PRdBvYtwVWe+/26N26yUtMeZgxY8fqyDx3J3uqp8zTy0Cu2L3YwStQF9WTEZpAb
 DWpePaBt/jlMP9L50HQ27nqGppXu167xQ65N079vLwRk9Ybn982GujmmWrz52Kjfdw0x
 84xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r8NdoW5AddDmipkvsjih16CXPQjsU0eZxi3OxKkBmN8=;
 b=S9yzHPIFQlVxmGMfH6XRfRQuF/1730hElCO9O20JBXKr/b4BhtUZQu4nHtTCjcv9fg
 BuppHk3W0xzKyOHnXwvraqbEqm1sgsZ3b5j9ArvKuY1nIVm+OyxZFX28e9wZKcyTgib2
 FFBux2Yq4eHimkPS4jXRQAK8QIFCBAVG5FM0u6RHJPWtjZ8Sp/2XRs4FdcxvWkylHnGR
 osHza1dERTwYS/Uclr+d2KvfWuGEH1demHbk26TSRF+/z+FXd4FbhDzI20SOoeNTDOH0
 3yIMGiAjow2FKjvRFpb39krabadbFKDermtedbcKpNMhoEqMMirPKw0Y+zhy7l7UR9ws
 +RMQ==
X-Gm-Message-State: AJIora8M+ogTjExnX2ZrroXCksPLmdHq0i1HsOOQVVkSa9QCpWwAf5pF
 tIfOwXfn5nxIEbosnAIIarVoazGv7YhYx8HSn/s=
X-Google-Smtp-Source: AGRyM1uQfz7pZ9DWLMJTwN2MFiyDfq/jBEgrSB5FWoXIJh1Yc8zL8k5KuFSfqFGI+JOH70LUpG/riQ==
X-Received: by 2002:a17:902:d718:b0:168:d9df:4f1c with SMTP id
 w24-20020a170902d71800b00168d9df4f1cmr25205344ply.41.1655750204246; 
 Mon, 20 Jun 2022 11:36:44 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.187.17])
 by smtp.gmail.com with ESMTPSA id
 ds12-20020a17090b08cc00b001e0c1044ceasm8500041pjb.43.2022.06.20.11.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 11:36:43 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 0/2] per-process page tables for qcom 8250
Date: Mon, 20 Jun 2022 11:36:31 -0700
Message-Id: <20220620183633.1131760-1-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
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
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This enable per-process page tables on the Qualcomm RB5 boards I'm
setting up for Mesa CI.  Has survived a full deqp-vk run.

v2: moved qcom,adreno-smmu compatible earlier

Emma Anholt (2):
  iommu: arm-smmu-impl: Add 8250 display compatible to the client list.
  arm64: dts: qcom: sm8250: Enable per-process page tables.

 arch/arm64/boot/dts/qcom/sm8250.dtsi       | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.36.1

