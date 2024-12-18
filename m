Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1759F5B62
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 01:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0310E30B;
	Wed, 18 Dec 2024 00:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fhTp/YGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374E10E30B;
 Wed, 18 Dec 2024 00:28:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHKrYhP013630;
 Wed, 18 Dec 2024 00:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bLKMfP728/tBS9278o0oEg
 mLp67j8qDmpi5nITFL0J8=; b=fhTp/YGmn1sHJODHji8N9iFivfk9FTQAoj+osE
 EKEfrubPOM1FeFIOLqWD8ecvMov/EZhIqn/hQpTP4TxWhPJFGaku+EVNbGTQEJ6w
 CVAcao0H1O78Og1hjSUWu5BPpyZ04R6GnfEKBFVXHgqFCDRtal5B+3hHNaJedv/Y
 uwG85E8xBF1gStDQTr5AVeWCYfcs66/E7LbgjsQiC1kC6APleXe3j378oSUBpNU2
 F3bCJUGtwCi/ZaP5lVlSeaz8ZB2hCEz+nuSPKQXRyxC0SIErg6n0ah0iXSCE091I
 djjp0AhCtc4cvtRbFFoUmMok9lMC8+Zpb6+mb3hkRyuwzOvg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kgr10bhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 00:28:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SMwT026413
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 00:28:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:21 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 0/5] drm/msm: add a display mmu fault handler
Date: Tue, 17 Dec 2024 16:27:52 -0800
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgXYmcC/z3N0QqCMBTG8VeRXXdkG1NnV75HRKx5lofcrE0lE
 N+9FdTlDz7+38YSRsLEjsXGIq6UaAoZ8lAwO5hwQ6A+m0kulZCiAXMdKJj1Dsn7BZxZxhnysB8
 xgumxqRy6VvOW5cIjoqPXt346Z7s4eZiHiObf5LXUUiitdKl4U9WVAAHPhezld9R9RMGWdvJs3
 9+W7bspsgAAAA==
X-Change-ID: 20241217-abhinavk-smmu-fault-handler-ade75fef9809
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=1480;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=8v8tVxwIEalWudvsQhTGI/+8TbyqYgg05+y8nly2gSg=;
 b=/WNx18im+refjr6pFDOMLybuorQGq7tRR04sAQisWReZEojEv6fUoZYR4Eh+2lIzp9VGpfqfQ
 N5N5Zf/K3OaDZfhf9R6lF2V27aFeIRNOFUx0gMZN1ad8xRL3MRMVime
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sdJ1SLXlnfa2jvPRQfKWQCwyvFl7FPGM
X-Proofpoint-ORIG-GUID: sdJ1SLXlnfa2jvPRQfKWQCwyvFl7FPGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=868 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180001
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

---
Changes in v2:
- Reset fault_snapshot_capture flag in atomic commit tail (Rob)

changes since RFC:
	- move msm_mmu_set_fault_handler() to msm_kms_init_aspace
	- make msm_kms_fault_handler return -ENOSYS
	- use msm_disp_snapshot_state() instead of msm_disp_snapshot_state_sync()
	  because smmu fault handler should not sleep
	- add a rate limiter for the snapshot to avoid spam

---
Abhinav Kumar (5):
      drm/msm: register a fault handler for display mmu faults
      drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      drm/msm: switch msm_kms to use msm_iommu_disp_new()
      drm/msm/dpu: rate limit snapshot capture for mmu faults

 drivers/gpu/drm/msm/msm_atomic.c |  2 ++
 drivers/gpu/drm/msm/msm_iommu.c  | 32 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_kms.c    | 18 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_kms.h    |  3 +++
 drivers/gpu/drm/msm/msm_mmu.h    |  1 +
 5 files changed, 52 insertions(+), 4 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241217-abhinavk-smmu-fault-handler-ade75fef9809

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

