Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A3C5C08C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A76D10EA08;
	Fri, 14 Nov 2025 08:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh60oeBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2956210EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:41:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8UlPU1620946; Fri, 14 Nov 2025 08:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=faRmBI6MvBat95N+ckKLUb
 d37ZL964ezj74YdT6EbkU=; b=kh60oeBRZrObZT6/N/F2+wg7oTZd9k39+1qAho
 33g+bNgVrg+Krlqi2L8fnqYGdmXQExo3Y3yT5qH+njaNpSJdv/WZFfQyQllYdH+S
 sq9UxviR+FdshEzMTV1NUuSZxY8Ejp1I7ad9Zqh2pQlEWE2RBuIUAgHETjLlMeGK
 4tZg6/W9I4a1X/srO7ilERjFhyazR9S+R2guK1cT4Sma03HLu7PjApmXZKpVqoLL
 l0iLcIqqK1sFoXTnzhBuiClLpUf8dkxxHXLc4APOZXYNFqmsnwGj0X6sWrZRF2wU
 +NnYYn0yx4ofFLUB74gm0USsJv9nVJc0x6KVqGlsSKwCK2uA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h1edf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8fkYV001437; 
 Fri, 14 Nov 2025 08:41:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxn3dkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:46 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8fjpB001425;
 Fri, 14 Nov 2025 08:41:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AE8fjjb001421
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 62212534; Fri, 14 Nov 2025 14:11:44 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v3 0/4] Add ADSP and CDSP support on Kaanapali SoC
Date: Fri, 14 Nov 2025 14:11:38 +0530
Message-Id: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FKw1HgpbZxETQMnJsC1bIBWkj9hKWKiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2OCBTYWx0ZWRfX4DdbDm/+QN0b
 yUxMfi9H7zipnrrIS6yy9i/pZVq9GbUbt8+PztXVXbnSdu4jONHkKX2o3K6tBB5fjIPt7x3npWM
 z9UWRzihNcbnJ8G2Pxl/oD0UeoKCXpaVA7OOMBMgq0izMC686Lo88kAoNBFx9kczD4OlI8vAG26
 +SsRkqZj2nqwIatu2wdKheSrlYQBu44g59ZOtGumyHNe02aee8RCR0AXHN1nyLTKm73IV8sQ7Fq
 13BeT2mrwBwga5rumGE0SVSF9ctgQsGIQb3K8hsq2AOKRahb2+wyZjiYImEaWKiLk8nCO39pewm
 00sLmEqvgx+VGsjpxXsWQBb+H1FxWRWwfozN5NGXxE4YV4kTBKIF5dBHnr9NsnXGZymdWBl3pAb
 lgwsMqcZZ/pGpan5Bt9goVZqvf6q2g==
X-Proofpoint-GUID: FKw1HgpbZxETQMnJsC1bIBWkj9hKWKiX
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6916eb4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KXkd8hKGogo_UzYOO18A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140068
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

Introduces support for new DSP IOVA formatting and hardware-specific
configuration required to enable ADSP and CDSP functionality on the
Kaanapali SoC.

Add support for a new IOVA formatting scheme by adding a sid_pos to the DSP
driver. Sid_pos standardizes the placement of the stream ID (SID) within the
physical address, which is required for DSPs to operate correctly on
Kaanapali. DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access.
This is being upgraded to 34-bit PA + 4-bit SID due to a hardware revision
in CDSP for Kaanapali SoC, which expands the DMA addressable range.
To support CDSP operation, this series updates the DMA mask configuration
to reflect the expanded DMA addressable range.

Patch [v2]:https://lore.kernel.org/all/20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com/

Changes in v3:
  - dt-bindings documentation update to support Kaanapali Soc
  - update comments to ensure clarity
  - Read SoC-specific data by matching the SoC’s .compatible field
    in the driver’s of_device_id match table instead of root node
  - Rename the dma_mask to the dma_bits for more clarity and set it's
    value based on the dsp_default_dma_bits instead of hardcode to 32

Kumari Pallavi (4):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Kaanapali
  misc: fastrpc: Rename phys to dma_addr for clarity
  misc: fastrpc: Add support for new DSP IOVA formatting
  misc: fastrpc: Update dma_bits for CDSP support on Kaanapali SoC

 .../bindings/misc/qcom,fastrpc.yaml           |   5 +-
 drivers/misc/fastrpc.c                        | 127 ++++++++++++------
 2 files changed, 91 insertions(+), 41 deletions(-)

-- 
2.34.1

