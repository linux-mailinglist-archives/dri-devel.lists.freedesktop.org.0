Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD59F1810
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 22:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3303A10EEA3;
	Fri, 13 Dec 2024 21:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NPTO1x5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACA310E45C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 21:34:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDIJhDp026835;
 Fri, 13 Dec 2024 21:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PvH8FIvLMMGj4iRucg7GYAoOK96A7mACsCJKpC18frM=; b=NPTO1x5L/tBZONSN
 lYno7IxUnq/XBd/F0vrbl48lU7I5ZYfCdlDHfijQ/ZeBZEdgC+sylLW8Qh5zDJy+
 /ySXqC5tENNCikMNjMWGXg9hd7FD0U850ImOimm1cAaGS3ffpMLa6G/DhoaxGWEH
 UQpkKe0LKBAZQuy5VjrqfTOKM7RMDhIsBTqbXlTo5M0U5OjYHqLYk3IJNsPoEuv5
 g++k7HQjxaNOO6M5NIYlvZV3S0v8c7rtaPDXDcpTT+SCOGwtbW0OtNB3MjaUAKU3
 d55xARDH3GFAZzgskXdUzd/t0zIfTrpAmo/EkL1Br8wVB0XTS4Tpm1wcJY4v8sA0
 IaS5lg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40qknp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:34:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLY67j024845
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:34:06 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:34:05 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH 4/7] accel/qaic: Add support for MSI-X
Date: Fri, 13 Dec 2024 14:33:37 -0700
Message-ID: <20241213213340.2551697-5-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FmYvfEi25d3qZFJdRW_6iCn8VC2BvuhB
X-Proofpoint-ORIG-GUID: FmYvfEi25d3qZFJdRW_6iCn8VC2BvuhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130152
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Youssef Samir <quic_yabdulra@quicinc.com>

AIC200 device will support MSI-X while AIC100 devices will keep using
MSI. pci_alloc_irq_vectors() will try to allocate MSI-X vectors if it
is supported by the target device, otherwise, it will fallback to MSI.

Add support for MSI-X vectors allocation for AIC200 devices.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 6e9bed17b3f1..ce0428f6cb82 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -471,9 +471,9 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 	int i;
 
 	/* Managed release since we use pcim_enable_device */
-	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI);
+	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (ret == -ENOSPC) {
-		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 		if (ret < 0)
 			return ret;
 
-- 
2.34.1

