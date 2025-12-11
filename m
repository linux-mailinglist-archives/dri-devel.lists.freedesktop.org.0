Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CBCB5734
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 11:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC3210E7CC;
	Thu, 11 Dec 2025 10:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BF/QRY6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B2E10E7CC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 10:09:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BB9ZQmK1054761; Thu, 11 Dec 2025 10:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=iWnyfbxTVPkKeLEE7XBQor
 6ONyFDohuekEjxqOB5Mtc=; b=BF/QRY6AoPgJ8nuglg5sb8wLNpuUqPTuSepfm8
 +pDH0XGWNFB8Wjl4Ha7Z7Z6+yJWDhKI+Azt0QYfiX5c+GOfQcH4cjTFNocPpQ4Ra
 8v/Inow14kk6mrTngkrbaIcgoiq6qkuZ3FaUa8wFoIFBNV1jd7Zws9OeIjvbPSEG
 95yvnoGvKCj25JZNLQJv2dpjalEpt1L3pla2r++HAnUtf+6AnklW+D877+PEFbpT
 vIDUMzL44PYocgnced87LzMRvRGAuXfXurljXWRI8w28BzmGK/FzoBngSGmm9d0M
 g3c/MfkO9uyyLyl9brp5sniASVf7tJAn5fNPfrM28Mh/wVWw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1yaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBA9cAS013828; 
 Thu, 11 Dec 2025 10:09:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4avdjnupnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:38 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BBA9cpv013823;
 Thu, 11 Dec 2025 10:09:38 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BBA9bVv013815
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:38 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 7CB9E56A; Thu, 11 Dec 2025 15:39:36 +0530 (+0530)
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
Subject: [PATCH v6 0/4] Add ADSP and CDSP support on Kaanapali SoC
Date: Thu, 11 Dec 2025 15:39:29 +0530
Message-Id: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
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
X-Proofpoint-GUID: bKnkgQtWDnJ6Dzlk1aukj_hg_efkfsHy
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a9866 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=12PqH8mLdQwCrg6kZbUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NyBTYWx0ZWRfX/yXLXC8swRMy
 O+E+azwGnBga5iL/A2rmcIcO+EJUqWgjB9S1sfxb4JBYVthAp2k1kUFpYLgV38sPbrxm794V0mc
 4VkF2q5C3EVu3JHqh44x31dpdhVb6Bvj8T3T5kayYv8eAvwh4kw2aNqS4sB5nk8xKg8l2tbcZR9
 Nrne2ijU8cp2vU6L1g3DHQTrSyU9K8hfbBcYZCSRHPE65+bxkH4wqwb2mFHFNSfmSZLAh37PWfR
 NtKVxiv4ftaBJwYVo/4k48kNTVfws8bgyrcumIXxzwtRHW1GeDlQpgKOAjaTz3Y7SizP7+fBB+U
 scJ+EAGb0jC8H5fZQEv9vqnTAmR1JA/C9w9wjjBVD/rThoBztJBP73MD+HkkMGU2DzA/uXyS0p7
 sOkIihalAPwMYL4diOHLqTMhBxLGPg==
X-Proofpoint-ORIG-GUID: bKnkgQtWDnJ6Dzlk1aukj_hg_efkfsHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110077
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

Patch [v5]:https://lore.kernel.org/all/20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com/

Changes in v6:
  - Update the commit messages and drop the unnecessary items from bindings
  - Add the function fastrpc_compute_dma_addr as the wrapper for more readability
  - Update the comments for better visiblity and use of GENMASK to avoids 
    subtle precedence pitfalls
  - Renamed the dma_addr_bits_extended to dma_addr_bits_cdsp to highlight 
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

 .../bindings/misc/qcom,fastrpc.yaml           |   7 +-
 drivers/misc/fastrpc.c                        | 141 +++++++++++++-----
 2 files changed, 107 insertions(+), 41 deletions(-)

-- 
2.34.1

