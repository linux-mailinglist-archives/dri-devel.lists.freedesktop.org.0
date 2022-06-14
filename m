Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181654BE05
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 01:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AB2112D56;
	Tue, 14 Jun 2022 23:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F343112A34
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 23:01:39 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id n18so8954427plg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4m9A8Qo6zOltjkzi0N0zgRLf5Grbh0WeCZKflLJ7DY=;
 b=vuq62C9vlXng27Gng4avkt6GXFI/9GQfRmTb1j/9RpzgytIr+h8bLihhhQ2Kdu8qxN
 U+0N/Nw3VoStnuJhi1y87mQxOG1cio2AKy7jHmg5PzX9HABxw99eoZH8NbNDLwKdran/
 fMfs22HceHQFa3ZNFgHaxWQzaVuRvEUx0a9d0DMc7Jqywcn0FIiLIIxTKKPYTkQZMJQi
 M71kLAhFrB9vsfTpMpS1gunPEJdIJ70J4KofJg1WUloyOIQVqeebQRQacQeatC2GYSUi
 XEiGzsqY2R9EQEVXD5wqx1AVGpGOSc9XCoMEGLgnWj17FTo4dnXsKWyPBO7FNhC+v8Um
 xy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4m9A8Qo6zOltjkzi0N0zgRLf5Grbh0WeCZKflLJ7DY=;
 b=tygzqfisu/Kgm8tLCOYHj8ZmvnbH4bJHL0QvwF7ErWzwv83sZ2vLj4lSqtVqaOXjuQ
 WmA2Nmjrbhav3dOW9SGnBJfjs7Klj823CV6IsEO3zusux2+V2vFwO0tyOsjVupH6kYnR
 wNo4qChV/pNntzdpeHGPQtKmvETi0ZdTCzt8cPd2qbjTdEt6CBJitRmpc0MuO+brdwil
 MmIPAI8DPpLei+dwleoJaISzqCNheS5w8WjyEGuX8QjAuZkqes/BFxf9mFNIbPp2VG2j
 /mwbHeZKwUoDA97Neid52PlOFSD77X+ZMv5fJiZZzggzLlWHA7UHJxkl6T3jr/FuE1ZA
 Vagg==
X-Gm-Message-State: AJIora/HgKsibKNJae23iRt05WjtlWtm3TwowSsrxyyteqjKMRvF3K/u
 SRN4WYB1KHDcS6qVuvVQG262B6zsmuf90NSoPKVrYw==
X-Google-Smtp-Source: AGRyM1sysLwTU+O4gfQ75Td7Y5l63JSZ6kQ5+2cLmKQHoxX1bX2xDe6Y/djjDLJekIO9y4ae3uDmHw==
X-Received: by 2002:a17:90b:1bcd:b0:1e2:c8da:7c29 with SMTP id
 oa13-20020a17090b1bcd00b001e2c8da7c29mr6858481pjb.4.1655247698383; 
 Tue, 14 Jun 2022 16:01:38 -0700 (PDT)
Received: from wildbow.anholt.net (97-115-79-125.ptld.qwest.net.
 [97.115.79.125]) by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b00168c5230332sm7787768plb.148.2022.06.14.16.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:01:38 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Enable per-process page tables.
Date: Tue, 14 Jun 2022 16:01:36 -0700
Message-Id: <20220614230136.3726047-2-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614230136.3726047-1-emma@anholt.net>
References: <20220614230136.3726047-1-emma@anholt.net>
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

This is an SMMU for the adreno gpu, and adding this compatible lets
the driver use per-fd page tables, which are required for security
between GPU clients.

Signed-off-by: Emma Anholt <emma@anholt.net>
---

Tested with a full deqp-vk run on RB5, which did involve some iommu faults.

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a92230bec1dd..483c0e0f1d1a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2513,7 +2513,7 @@ gpucc: clock-controller@3d90000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500", "qcom,adreno-smmu";
 			reg = <0 0x03da0000 0 0x10000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.36.1

