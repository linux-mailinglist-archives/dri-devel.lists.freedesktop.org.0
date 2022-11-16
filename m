Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21DC62C0D6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BEA10E4AD;
	Wed, 16 Nov 2022 14:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97AC10E4AD;
 Wed, 16 Nov 2022 14:30:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGEU7I7018059; Wed, 16 Nov 2022 14:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=2koXY0aEfYtayLecGazENv7+KqrR7v4BhKdVunVKIsc=;
 b=YgWvaGbGEPSu+oDKr/oo/ckI6lVkPTqbJtetHaPoxd8fDVmxisZ1gRzWRMyHanM4f5M7
 RyhfpYhJ39n/WvGzex9vMRN4aCT6f4TRSfr4NhvP7U6X7R+NPIVNjvia5ZbLs3YErbhR
 40iIbI1M9HR3Ye1pVyg54TYz0QNCoQ9OBw5j13xnQZrrO+ucMVgXyLEjE5/1QRfbPN20
 z1xE6tVw/2UiqHnSB2U2timrP4JSZWOiMvT9vOtRvFL4wFywmVIxxYaV9vfxAgCcdI3T
 sQSVr9/kOo7+BbVEdSgfwxhJa4PFjzXwsakq2YCIqvAOvFoKeUMPSv0XaCjrhT0kUyvR kA== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvyg9gat2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 14:30:48 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AGEUiH4008022; 
 Wed, 16 Nov 2022 14:30:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kt4jkxbc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 16 Nov 2022 14:30:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGEUiee008017;
 Wed, 16 Nov 2022 14:30:44 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2AGEUham008016;
 Wed, 16 Nov 2022 14:30:44 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 339CA48A0; Wed, 16 Nov 2022 06:30:43 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] add color management support for the crtc
Date: Wed, 16 Nov 2022 06:30:37 -0800
Message-Id: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _P8hv34Ke4rusqaOYJq9kpVEnmXNrCPD
X-Proofpoint-ORIG-GUID: _P8hv34Ke4rusqaOYJq9kpVEnmXNrCPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=590 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160100
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add color management support for the crtc provided there are
enough dspps that can be allocated from the catalog

Kalyan Thota (3):
  drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
  drm/msm/disp/dpu1: add helper to know if display is pluggable
  drm/msm/disp/dpu1: add color management support for the crtc

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 75 ++++++++++++++++++++++++++---
 5 files changed, 101 insertions(+), 14 deletions(-)

-- 
2.7.4

