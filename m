Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C657CDE673
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 08:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9BA11A4E6;
	Fri, 26 Dec 2025 07:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUJAmUzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0044811A4E6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 07:05:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BPNUeqW3676441; Fri, 26 Dec 2025 07:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=D1BEHpxdCA+cW1HdVeNgDl
 T4i11qNTh6BNZ3WDIoEr0=; b=hUJAmUzQjoKKyGBw9qqc/KNTZ6DBa9U+odglyy
 y7scXCQwndLOYhw+Jv0PJKQcQW4wWChTkh0gUTzUhKigTXPBZ9r2DAVFpYyFBh4W
 ot/WCe9EV3OQNxozfBqWeR4BRmBdD2Kgc3FAE/YGbUCT3Pf05g0mUfohM0JabLRC
 wsm2WIpbIQib8dsjWVhwMbpY5Dd0RlXJj5twnhSSO8ci1X8Qp2nPZv7H3ZFPv43J
 J63qmqZ3lPdtpheZxfS2Sq3BS8AWfriLqfZ6mWXBEJ9FpC3D/XSfojToX2WAnT+w
 dzOQ+IUyc1hE5GhhKWSharrsQyrdK00T/yX17jpO2LvnEylQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9f2fmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Dec 2025 07:05:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQ75c8v023343; 
 Fri, 26 Dec 2025 07:05:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn69xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Dec 2025 07:05:38 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQ75cwW023338;
 Fri, 26 Dec 2025 07:05:38 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BQ75bfL023337
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Dec 2025 07:05:38 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 96E27576; Fri, 26 Dec 2025 12:35:36 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: [PATCH v7 0/4] Add ADSP and CDSP support on Kaanapali SoC
Date: Fri, 26 Dec 2025 12:35:30 +0530
Message-Id: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0lchtneVH_Rmlhlssp6RI2om25jejD1Z
X-Proofpoint-ORIG-GUID: 0lchtneVH_Rmlhlssp6RI2om25jejD1Z
X-Authority-Analysis: v=2.4 cv=O8U0fR9W c=1 sm=1 tr=0 ts=694e33c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2bbDxhzQx0xIUR0aIjkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA2NCBTYWx0ZWRfX2E3T6lSoT7HO
 sMZhumh3YwljoRcs+zJ94DwnCUKSfV3WUNPAhHcuiwrsOydW0a3jYbiea9h17u1BjWPWDpu6iWJ
 erEFZplRiNBjiUMYlTwjaf0h/GhTJvtQ38CwHMFPNmbcCnEpKVi0kIwPFrslw4ljqh28rEe0Xme
 EOFBiPzZOGPMOmU8YL602QuEVpfXl8ExyzRK+qFsPWoerlYoWxtKZt4aHWb05AZdU3Np5u+VZiQ
 OlfDA7lKcC5QFSN7/cWZwuMgt7vM+HtaD/cr4QcA4Ay0TZ5u16Z/hWo/VjUdhXDMal8Nux4evnU
 OWi0Vvlou2wek+BafuPZjbsWkU3CLsC9j4EulT1AdgEeiHEQAGzofk84UgU+3ZAEhcDdihGNeYZ
 /sOZPUoJeoM1ZKyu2fcD4zECTCGUDH9CFMovpZ8Pqq8kFariJe8kYFCgfth53ehn2v5gKb6JsLJ
 85PfaBBeU9y4RHbFXFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260064
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
driver. Sid_pos standardizes the placement of the stream ID (SID) within
the physical address, which is required for DSPs to operate correctly on
Kaanapali. DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access.
This is being upgraded to 34-bit PA + 4-bit SID due to a hardware revision
in CDSP for Kaanapali SoC, which expands the DMA addressable range.
To support CDSP operation, this series updates the DMA mask configuration
to reflect the expanded DMA addressable range.

Patch [v6]:https://lore.kernel.org/all/20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com/

Changes in v7:
  - Update the bindings to support qcom,kaanapali-fastrpc or qcom,fastrpc
  - Rename the function and update its parameters to enhance code
    maintainability and readability
  - Drop the unnecessary curve brackets

Changes in v6:
  - Update the commit messages and drop the unnecessary items from bindings
  - Add the function fastrpc_compute_dma_addr as the wrapper for more readability
  - Update the comments for better visiblity and use of GENMASK to avoids 
    subtle precedence pitfalls
  - Rename the dma_addr_bits_extended to dma_addr_bits_cdsp to highlight 
    maintainability

Changes in v5:
  - Update the commit message to clearly explain the background of the change
  - Use the proper format specifier (%pad) for printing dma_addr_t instead of %llx
  - Remove unnecessary NULL assignments where not required
  - Rearrange code for proper alignment and style compliance

Changes in v4:
  - Resolve warnings reported by make dt_bindings_check
  - Convert the data type of the dma_addr to dma_addr_t
  - Replace the macro with an inline function for more readability
  - Rename the cdsp_dma_bits to dma_addr_bits_extended and default_dma_bits
    to the dma_addr_bits_default for more clarity

Changes in v3:
  - dt-bindings documentation update to support Kaanapali Soc
  - update comments to ensure clarity
  - Read SoC-specific data by matching the SoC’s .compatible field
    in the driver’s of_device_id match table instead of root node
  - Rename the dma_mask to the dma_bits for more clarity and set it's
    value based on the dsp_default_dma_bits instead of hardcode to 32

Changes in v2:
  - Rename phys to dma_addr for clarity
  - Remove iova_format, add soc_data with sid_pos in channel ctx
  - Remove sid_pos and pa_bits from the session ctx

Kumari Pallavi (4):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Kaanapali
  misc: fastrpc: Rename phys to dma_addr for clarity
  misc: fastrpc: Add support for new DSP IOVA formatting
  misc: fastrpc: Update dma_bits for CDSP support on Kaanapali SoC

 .../bindings/misc/qcom,fastrpc.yaml           |   4 +-
 drivers/misc/fastrpc.c                        | 142 ++++++++++++------
 2 files changed, 102 insertions(+), 44 deletions(-)

-- 
2.34.1

