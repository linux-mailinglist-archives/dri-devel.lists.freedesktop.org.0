Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6D24BB88B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F76910EBC2;
	Fri, 18 Feb 2022 11:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A210ED73
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J+rRNDls/ju+huBYt5djRYvtPipgQzrZeloYiORvFeI=; b=LENxateumiBnveV23r6262JWWv
 0OrHv3wH+LWMNIFvJUppfim0dTHplEZeIabcBg7VEAy2aNlqY4ASntZPaA2/+r1r33SbICe15l31e
 0Tvy2U7Ai/62EcYKgq1i975L6B3NEO16sLIpAifsvEE8XGEbe1xCzS/h7osUBRArb+l7UcMvpCUdz
 OY2C02VjiYM9oeFM7+RaEIyy/K8QrQDOsnw+SD0NtuNPyGisV0q8Z4E4xq+A1i5BP+wLY9LGX126u
 TuLgaafAiqhRrTEo8if7MGK8F0UHZdLog7niuwSW/ngElXzJbBzvTakxv3azd4qeQAra3WbHX1bLJ
 3HsIOewA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1nL1fq-0006eP-7M; Fri, 18 Feb 2022 13:43:42 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Subject: [PATCH v3 5/9] iommu/arm-smmu: Attach to host1x context device bus
Date: Fri, 18 Feb 2022 13:39:48 +0200
Message-Id: <20220218113952.3077606-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218113952.3077606-1-mperttunen@nvidia.com>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set itself as the IOMMU for the host1x context device bus, containing
"dummy" devices used for Host1x context isolation.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4bc75c4ce402..23082675d542 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -39,6 +39,7 @@
 
 #include <linux/amba/bus.h>
 #include <linux/fsl/mc.h>
+#include <linux/host1x_context_bus.h>
 
 #include "arm-smmu.h"
 
@@ -2051,8 +2052,20 @@ static int arm_smmu_bus_init(struct iommu_ops *ops)
 			goto err_reset_pci_ops;
 	}
 #endif
+#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
+	if (!iommu_present(&host1x_context_device_bus_type)) {
+		err = bus_set_iommu(&host1x_context_device_bus_type, ops);
+		if (err)
+			goto err_reset_fsl_mc_ops;
+	}
+#endif
+
 	return 0;
 
+err_reset_fsl_mc_ops: __maybe_unused;
+#ifdef CONFIG_FSL_MC_BUS
+	bus_set_iommu(&fsl_mc_bus_type, NULL);
+#endif
 err_reset_pci_ops: __maybe_unused;
 #ifdef CONFIG_PCI
 	bus_set_iommu(&pci_bus_type, NULL);
-- 
2.35.0

