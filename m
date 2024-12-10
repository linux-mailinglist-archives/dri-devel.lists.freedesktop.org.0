Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421C9EA419
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE7810E368;
	Tue, 10 Dec 2024 01:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iHuUohg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC910E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:09:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9E6nJN006957;
 Tue, 10 Dec 2024 01:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=hihwtORQ3J5gmPYIqkK7Pc
 irve1YL8nj94uXsgevIfI=; b=iHuUohg3sXHXTGc5+K24/jaOkbBjjRJYfpemFB
 HOpxUcx7nf+V/N1fpUGgRy0Izh3gWtBTO3TvRGO1rOI9vsuaBjaO2/Dx5FIwdavC
 MrWnF89mCb8Hi129OZXzjPzoAaak/3wZb0BZw9YmAAbTG2gu5o/MZguP2ofiHIz4
 MbDSadcCA2g0fG4fItFFZipIKxVDIkPZpT2kACrezSvNYbEGbXsZGUoFKXd8L6sS
 Lw/gts9ET4ZYvmge9shceZ/JVEaEsau6qYdk3pQb2FtXJHy+iM81sNkE0ENlEE66
 XOfczQCyBOWNBUv8wNBcK+N7gpo5zENbLvyx+IGqFTizqfmg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bhmg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 01:09:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA19eQm021935
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 01:09:40 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 17:09:40 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 0/2] drm: Allow encoder modeset when connectors are changed
Date: Mon, 9 Dec 2024 17:09:23 -0800
Message-ID: <20241209-abhinavk-modeset-fix-v2-0-4d008f6ea8d0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOUV2cC/z3NwQrCMBAE0F+RPbslWVLbevI/RCQmW7tIE01qE
 Ur/3Sjo8Q3MzAKZk3CG/WaBxLNkiaGAthtwgw1XRvHFQIqMJtWhvQwS7HzDMXrOPGEvL2xMuzO
 99qxaD6V6T1zi7+zxVNynOOI0JLb/MdWpmkhrMhXVbUONRo2Pp7jz7+HwkQRXuTjCur4BThF4N
 6sAAAA=
X-Change-ID: 20241209-abhinavk-modeset-fix-74864f1de08d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733792980; l=803;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=phvM2X+UVFDIy/V1s/zNxJxXM3HjDaAybf+KsomAVtA=;
 b=WAkCv7uA4ZzaT1eSCvLdpLv7sfYzZCnvzXaJFDpX3N9rmg108Fq33nJhdN/uI+rYTJowda3jx
 Lt5TbEW9GmWAMhTNEdRGA7Rbgg0Kbe281rMr8iXioLn99VnEGmVZyJw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JOZLLTglOcyhbRzI-L8NOchRySmCInS-
X-Proofpoint-ORIG-GUID: JOZLLTglOcyhbRzI-L8NOchRySmCInS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxlogscore=695 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100005
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

Changes in v2:

- Added kunit test

---
Abhinav Kumar (1):
      drm: allow encoder mode_set even when connectors change for crtc

Jessica Zhang (1):
      drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()

 drivers/gpu/drm/drm_atomic_helper.c           |   2 +-
 drivers/gpu/drm/tests/Makefile                |   1 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 242 ++++++++++++++++++++++++++
 3 files changed, 244 insertions(+), 1 deletion(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241209-abhinavk-modeset-fix-74864f1de08d

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

