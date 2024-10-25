Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E59B0CB4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 20:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A90D10EB6A;
	Fri, 25 Oct 2024 18:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="B9KhsNqg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A9610EB6A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:10:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBowBO009099;
 Fri, 25 Oct 2024 18:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=sxUUwmhFaPuoMwnZaOrlOdteCBTzOmWEbOZ3EA4q5B0=; b=B9
 KhsNqg5Uju0YmojfqFyDc/wO1rutaFMWu8ZkLTQ0Sd1pThirlHTySGR68e3rb1JO
 FbPCJ7HIZxBup4Od4GLwBe4IExJkqj6jI0CkwPf/Ws5MA18SI4XIwjOlk9NiGb6B
 j0Hpx5ulOkyVVpmwxxIvBUpUWDmQN3bZIqSEwrgAuJEDVjtBtcMvQYKyjJHanTgV
 96U+lxbiDkmxKWRjIgwcM2nR+sd5Wa95FG8+Wx5SSvNSxALLoIKcoc0rjNufbUZ7
 yOHwm03fhJjpHLBLyDpUkA9SwIglvUt3QIlOzlqs2PoFM0GMNaP5Aeffxb89xn+m
 X8OD9gVwJFMoTsOCBZeA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43j1q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:10:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIAStK023486
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:10:28 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 11:10:24 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
Subject: [PATCH v2 0/3] Add Block event interrupt support for I2C protocol
Date: Fri, 25 Oct 2024 23:40:07 +0530
Message-ID: <20241025181010.7555-1-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: G3ymxqY7NZ-QQOQ6UtigGScoJJVLo1ra
X-Proofpoint-ORIG-GUID: G3ymxqY7NZ-QQOQ6UtigGScoJJVLo1ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250138
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

The I2C driver gets an interrupt upon transfer completion.
For multiple messages in a single transfer, N interrupts will be
received for N messages, leading to significant software interrupt
latency. To mitigate this latency, utilize Block Event Interrupt (BEI)
only when an interrupt is necessary. This means large transfers can be
split into multiple chunks of 8 messages internally, without expecting
interrupts for the first 7 messages completion, only the last one will
trigger an interrupt indicating 8 messages completed.

By implementing BEI, multi-message transfers can be divided into
chunks of 8 messages, improving overall transfer time.
This optimization reduces transfer time from 168 ms to 48 ms for a
series of 200 I2C write messages in a single transfer, with a
clock frequency support of 100 kHz.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v1 -> v2:
  - DT changes are reverted for adding dma channel size as a new arg of
    dma-cells property.
  - DT binding change reveted for ma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues
	 

Jyothi Kumar Seerapu (3):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: qcom_geni: Update compile dependenices for qcom geni
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |  49 +++++++
 drivers/i2c/busses/Kconfig         |   1 +
 drivers/i2c/busses/i2c-qcom-geni.c | 203 +++++++++++++++++++++++++----
 include/linux/dma/qcom-gpi-dma.h   |  37 ++++++
 4 files changed, 265 insertions(+), 25 deletions(-)


base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
-- 
2.17.1

