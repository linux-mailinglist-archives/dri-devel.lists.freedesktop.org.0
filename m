Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E884C890B3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5386710E11B;
	Wed, 26 Nov 2025 09:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFr4kcLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A110E57F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:45:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQ92fNk3255839; Wed, 26 Nov 2025 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=c1QJlbfWy/2dtf1n3VIQWCFVj/DL0FwuReC
 BFuuqKyk=; b=pFr4kcLxskeztk9kDLFUiMmyfEEfOuclv0dLTXRQbEUN+Xk3L2L
 ic+zlrUUljCTZbqtJLivhtbwMoJQnft8KgiqyAZKKipHKjOzaJq4jRQp09AO1KzI
 nemi9hns+F2c2jbkcpdsAce7lL+S8c28T0NtcTL9b2TCTcH1zk8mIsazTJ0zWWUt
 V+f490gQp3VkzSWqJa7Vzv1TweNkW1nNezrF3aleqDp8R8sUthvuZ+hWpQnVOVN1
 Pwgptlil2cDSD0vfVGyJ6DQuFgm7OLCY+ZiYfpqP94PrpAEJFeU1cXwv7iN9z5LR
 iB+khhIosurkFfgfwUwnLa0BzndzDSeM1jA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c3cau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Nov 2025 09:45:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQ9joYY010071; 
 Wed, 26 Nov 2025 09:45:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4anw4ssw7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Nov 2025 09:45:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AQ9jolf010065;
 Wed, 26 Nov 2025 09:45:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AQ9jo4c010054
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Nov 2025 09:45:50 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 09E8B515; Wed, 26 Nov 2025 15:15:49 +0530 (+0530)
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
Subject: [PATCH v4 0/4] Add ADSP and CDSP support on Kaanapali SoC
Date: Wed, 26 Nov 2025 15:15:41 +0530
Message-Id: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pMI0LeOUcywE4L9706-QNIOlLkZNJlAI
X-Proofpoint-ORIG-GUID: pMI0LeOUcywE4L9706-QNIOlLkZNJlAI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX0N/R9/A/9Uls
 r0PYF5WwPe3i4/60cX1M8JSX255Q8eum0q5UBkvB2riKaRYsjgPVPZ1Tuf0X+AGzMS9uN29q1Ms
 E90I5OdkO7fvMhmPRW/MlfmfcMGnud0xs+uR3XvXfupSBNtrjTh0xa1lOUw8XcQ9MIRe+871YSP
 Wcs3WGl6csm73uLEV5TJPytBl/MvZIvTvrtnZK3aWlL1ZmT7AjXa1jLVyQTidMg9rNmEY6TaARL
 cJq6U7JnjAREKOffUtvDEBiX6AbLVfzfEIpuFvFHt6gTZlVnXpNkjcNvIs9+l1YEAUHfWdcn8eZ
 RJDEd4QwzBobv7TMs4zzUZ/0tXG1MV8nnEFH1wQtUjQhUFGwaJZKkYn9wvm9LERJW31sFrwalIw
 ARDRDHipWYuQHNn48x9et4JRUYhHbA==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6926cc51 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mRQkYbyLXEYurZiQm2UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079
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

Patch [v3]:https://lore.kernel.org/all/20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com/

Changes in v4:
  - Resolve warnings reported by make dt_bindings_check
  - Convert the data type of the dma_addr to dma_addr_t
  - Replace the macro with an inline function for more readability
  - Rename the cdsp_dma_bits to dma_addr_bits_extended and default_dma_bits
    to the dma_addr_bits_default for more clarity 

Kumari Pallavi (4):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Kaanapali
  misc: fastrpc: Rename phys to dma_addr for clarity
  misc: fastrpc: Add support for new DSP IOVA formatting
  misc: fastrpc: Update dma_bits for CDSP support on Kaanapali SoC

 .../bindings/misc/qcom,fastrpc.yaml           |   5 +-
 drivers/misc/fastrpc.c                        | 130 ++++++++++++------
 2 files changed, 94 insertions(+), 41 deletions(-)

-- 
2.34.1

