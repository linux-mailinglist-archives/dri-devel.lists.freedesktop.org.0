Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D88C8E93
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 01:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EA710E1D2;
	Fri, 17 May 2024 23:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="arJWlw6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3D10E1B9;
 Fri, 17 May 2024 23:38:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HI00d6015781;
 Fri, 17 May 2024 23:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=+PhWCjT
 jycCCMywpgQ3tsK6PhXSGgOauTcstB8Gxvlk=; b=arJWlw6noRCFpEqCX1gP49b
 rjfy4KKXXiK4rrS6DKlxbWquem1i29NxtujZ6x4h2bycfDJM/ATGu6y3HqgFkrLF
 GgbBzIanxxz2XYDc2ybK+GFsCOqxbc6FZIjet/I8ovfexA7mqTyZUnyMPeJSc/7I
 hg19GDjlneGNoL+yZNmi1az2SI8ZEf++MpxwKZpHXXX5GymwpaeUrqWbVo9778I0
 vIOa229dNsJ4BxKG+FXMGnYDXLPy2gzPwn+4vtl0HqYtSjrUXLqajT4jZJ30mVmp
 CKgBenZW7RkmmMo3RRGyUGPn3T9N6HEIVsBqnWI6EpC/4Y5BlJTmeSgiWqGOpIA=
 =
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egh9w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2024 23:38:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HNc9VR006544
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2024 23:38:09 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 May 2024 16:38:09 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <quic_jesszhan@quicinc.com>
Subject: [RFC PATCH 0/4] drm/msm: add a display mmu fault handler
Date: Fri, 17 May 2024 16:37:55 -0700
Message-ID: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HNMARDMd4q91HuEE6S66zcfM08fX1k8D
X-Proofpoint-ORIG-GUID: HNMARDMd4q91HuEE6S66zcfM08fX1k8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_11,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=792 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170184
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

This is only compile tested at the moment, till a suitable method
to trigger the fault is found and see if this handler does the needful
on the device.

Abhinav Kumar (4):
  drm/msm: register a fault handler for display mmu faults
  drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
  drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
  drm/msm: switch msm_kms to use msm_iommu_disp_new()

 drivers/gpu/drm/msm/msm_iommu.c | 34 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_kms.c   | 27 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h   |  1 +
 3 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.44.0

