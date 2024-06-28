Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266DB91C874
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 23:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572D10E21F;
	Fri, 28 Jun 2024 21:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bmbmT0fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E792210E1C6;
 Fri, 28 Jun 2024 21:49:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SEMYOt015304;
 Fri, 28 Jun 2024 21:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=i0Ks/4CaxAzW4hfLyWGALP
 JDE5uJqsdDQvPxjf7MKtQ=; b=bmbmT0fmpowGtU2H791sbOXm3qt5Z1JIkVWLjH
 HviBLVM6sMJbCN8PEs8V1FRL2Q7aNiIJ2VEGtgb0GSv+/Q7X6eLi1LzihcnJxAO3
 FgZ59llLSjzwiM2Yq1GKmhlUqs3rJ4DcfBz2QUiNfWNqdfBAmZ2h8OTFqAXi4BpS
 Ubye+MJIBjhqw2yJshJjODT7ptfatT717ODEf3C53dv9yXKaQFPeHLi/KQGcRoJE
 d4NGkRL8Ancd3Jb7Jwtl7fuJ/1hixoRygMXmo0wfLjXB5A26Ke1nffqrCY6tyGk7
 /wX3+fH7XALjgazcKRaNx+qYsBGyg5HbzBwGNlbGn2n+ctYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcmgbfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 21:49:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45SLn0Gs013389
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 21:49:00 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 14:49:00 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>
Subject: [PATCH 0/5] drm/msm: add a display mmu fault handler
Date: Fri, 28 Jun 2024 14:48:42 -0700
Message-ID: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: mO3P4mHuTzAaIcCg2HioLx6Zw7tUDDVS
X-Proofpoint-ORIG-GUID: mO3P4mHuTzAaIcCg2HioLx6Zw7tUDDVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxlogscore=717 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

