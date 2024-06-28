Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DB91C871
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 23:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C6D10E1C1;
	Fri, 28 Jun 2024 21:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="k9dlJFqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3419310E110;
 Fri, 28 Jun 2024 21:48:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SL2Axa008938;
 Fri, 28 Jun 2024 21:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=i0Ks/4CaxAzW4hfLyWGALP
 JDE5uJqsdDQvPxjf7MKtQ=; b=k9dlJFqB9BGyaX+MMfX1AE28+FHPLmQm+LvALX
 MWFkL3TBbm2g5+ohAI+1+/WV0KJ+eeUeAsYSVQR/n2z3XSDgHIczyotyzIo9koJn
 mjDmzPql3+Xvc9uRneBJzhk7V5Lmboys25kIBDLjRmHGPJ8U2KWQOJU4If58yaRm
 H3/68uFax42vQB5b169uG1tvIrzqDiPyUXDKFOMHXj71hPaalPqib9JTCutw3jKa
 8kBRuj86JEbUp9GKWHaUbhoZQUEPyTOeUv9kWhtWLLFkD4J5UWskVwvu/AEarGLG
 515hNPL3roYbc3mlyyMvrQWlUCvnKKkeczAlOvBkdVa7SOVg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5avp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 21:48:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45SLmWcR018319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 21:48:32 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 14:48:31 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>
Subject: [PATCH 0/5] drm/msm: add a display mmu fault handler
Date: Fri, 28 Jun 2024 14:48:11 -0700
Message-ID: <20240628214817.4075379-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Nc_TOgfEYune_maIt5xc78uUZN1WEodx
X-Proofpoint-ORIG-GUID: Nc_TOgfEYune_maIt5xc78uUZN1WEodx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=717 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280164
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

To debug display mmu faults, this series introduces a display fault
handler similar to the gpu one.

This series has been tested on sc7280 chromebook by using triggering
a smmu fault by forcing an incorrect stride on the planes.

changes since RFC:
	- move msm_mmu_set_fault_handler() to msm_kms_init_aspace
	- make msm_kms_fault_handler return -ENOSYS
	- use msm_disp_snapshot_state() instead of msm_disp_snapshot_state_sync()
	  because smmu fault handler should not sleep
	- add a rate limiter for the snapshot to avoid spam

Abhinav Kumar (5):
  drm/msm: register a fault handler for display mmu faults
  drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
  drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
  drm/msm: switch msm_kms to use msm_iommu_disp_new()
  drm/msm/dpu: rate limit snapshot capture for mmu faults

 drivers/gpu/drm/msm/msm_iommu.c | 32 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_kms.c   | 19 ++++++++++++++++++-
 drivers/gpu/drm/msm/msm_kms.h   |  3 +++
 drivers/gpu/drm/msm/msm_mmu.h   |  1 +
 4 files changed, 51 insertions(+), 4 deletions(-)

-- 
2.44.0

