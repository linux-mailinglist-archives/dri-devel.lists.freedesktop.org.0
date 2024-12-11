Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C759ED84B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1222A10E63D;
	Wed, 11 Dec 2024 21:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="n/9VC+Hq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056810E639
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:19:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHDO0d002411;
 Wed, 11 Dec 2024 21:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Aj/zp2/T6DzcCENEe1lXgl
 tCmZ7QwaGn3NNpQozcrf0=; b=n/9VC+HqOdBjwJ92LLRwlfCjRTv2jYOY1JYMyC
 pK35J5j1pDl8ItKh9DitRmeX0XKWcnzhS7BUa04vvp1u6wOnTe6ZzonXBdU5ccu2
 dcy3vYCGqLQVyKrLRqPOkEgk3MrzaELSm2kKqcvMlljZf0AP46OiksxDG20DrN83
 DKy1f0jckKrIUtXph3CqK9ijRmxaP+7PslxWSucIRbSr+4A6Kw2DnTyQoJmMmAhb
 isDlovYuoB220DIl+BhGaBKUO87ChPNPIfuov2LwxuE2PYlV7JQoRwJ+NlSOvwcs
 RlZY8WpFeH0687mSSDSSPj0iMtZ67Ps0EYGAUm6tuBC/kQ8g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg63d7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 21:18:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBLIvar007938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 21:18:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 13:18:57 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are changed
Date: Wed, 11 Dec 2024 13:18:41 -0800
Message-ID: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEBWmcC/4WOwQrCMBBEf0VydmWzRhs9+R9SJDZbu0gbTWpRp
 P9uKih48vgG5s08VeIonNR29lSRB0kSugzL+UxVjetODOIzK0IymnAD7thI54YztMFz4h5quUN
 h7NrU2jNar3L1EjnHb+2+zFzH0ELfRHZfGW5wRaQ1mQWtbEGFBg3Xm1SHz8JuIumqRRXaSdpI6
 kN8vK8ONKn/vBoIEIxHtPWanfX4YyzHcXwBbs+XUf8AAAA=
X-Change-ID: 20241209-abhinavk-modeset-fix-74864f1de08d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733951937; l=1325;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=S7/HrgG+BmhmmegVnh/3esYwG2OEDHW4+ltlL604FiE=;
 b=R3ZX9cCYnxdQMGwsvOeE+fMyC+3qwOtd9C3AiTKQLR5ARLb8/YUB3k8zP5TyrM8SfucsHlk6d
 pFT5XNf+OAeB5FxzpoMKS+55b2iJvfICnRmE3WNEVskn3urVnAvxtcm
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cu1h1pabrPe8aYOwhMpu1MeQnN1OV6TT
X-Proofpoint-ORIG-GUID: cu1h1pabrPe8aYOwhMpu1MeQnN1OV6TT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=627 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110149
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

Call encoder mode_set() when connectors are changed. This avoids issues
for cases where the connectors are changed but CRTC mode is not.

---
Changes in v3:
- BUILD_BUG_ON() for encoders and connectors array size check (Dmitry)
- Added more descriptive, file-specific names for helper functions
  (Dmitry)
- Added comment to test documenting what the test does (Dmitry)
- Return drm_connector_helper_get_modes_fixed() directly for encoder
  get_modes() instead of returning 1 (Dmitry)
- Move local variable declarations to top of function (Dmitry)
- Link to v2: https://lore.kernel.org/r/20241209-abhinavk-modeset-fix-v2-0-4d008f6ea8d0@quicinc.com

Changes in v2:

- Added kunit test

---
Abhinav Kumar (1):
      drm: allow encoder mode_set even when connectors change for crtc

Jessica Zhang (1):
      drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()

 drivers/gpu/drm/drm_atomic_helper.c           |   2 +-
 drivers/gpu/drm/tests/Makefile                |   1 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 244 ++++++++++++++++++++++++++
 3 files changed, 246 insertions(+), 1 deletion(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241209-abhinavk-modeset-fix-74864f1de08d

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

