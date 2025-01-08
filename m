Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67EBA0687F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4475A10E967;
	Wed,  8 Jan 2025 22:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ONeQOGpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F6E10E964;
 Wed,  8 Jan 2025 22:41:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Igaaw007885;
 Wed, 8 Jan 2025 22:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5TcPL8L9MCetsP4xQlnAFz
 YYzHUR76FXshbTlJ5if2Q=; b=ONeQOGpiDiv7D0e6LLkxXO1WNsxrsxg3HI7Ia7
 WzQMrObfF2VAuVbXenYgIGMKtJEpN7doogcFxejXC2z5G3P1Gf3IgR4jmi/9wQpc
 PbS11wSG6FHAlATwSFPWN5dUCklmjgxsHdP1kq/XHNIdpGOP0DmVGqXXJ5ZtujKT
 eYA7OyIzj2b5OI+vUMwsRUj+ydTs6wqKG7uukj7cOFqlt8zwlcBd+Ri/dhR9b2hO
 77weOoLbkJ2LWfYCVZEk6hh5Dvldyzxtk+CwmjfXOjlGI9LEhAEHNJ+v7SDwwPvq
 SgyRabXg1AS8BLjLLf8+LQr15z3Mx/xq4X6mPNDDK4wm+PVw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrfmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 22:41:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Mf672003593
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 22:41:06 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 14:41:05 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 0/2] drm/msm/dpu: Minor virtual planes fixes
Date: Wed, 8 Jan 2025 14:40:46 -0800
Message-ID: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7+fmcC/x2LWwqAIBAArxL7naBL0eMq0cdiay2EhZYE0d2zf
 gaGYW6IHIQj9MUNgZNE2XwWUxZgF/IzK5myA2qstdGtShKOk1a1r+Q5KifXx8qwww6RbAN53QP
 /IZ/D+DwvWGSEc2YAAAA=
X-Change-ID: 20250108-virtual-planes-fixes-f41ef2922ac7
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376065; l=1038;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=+iay958krtRqU2ep2SDQFCVEnxEbjSddMCAaPd9dG9I=;
 b=6PkDfh1YlEJmxKKfmNpLpFeLOqaMDh1iGCJi5TRdz+2b7zavrwzMS/d2Jls7FK9VkRX69FPBT
 KDMOIxpjmPKD26ub24sH0g0xIczacO2TMU01Vwnkeb9hbFbUkuyuKvE
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PtG3g32k4_ehjr973dFK2e5PHXIBV6y2
X-Proofpoint-ORIG-GUID: PtG3g32k4_ehjr973dFK2e5PHXIBV6y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=954 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186
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

This series adds the following fixes related to the virtual planes code
changes:

1) Initialize the return value of dpu_assign_plane_resources() so that
   the function doesn't return a garbage value if all planes are
   disabled/otherwise not visible.
2) Remove extraneous return value for dpu_crtc_reassign_planes()

These were discovered when setting `msm.dpu_use_virtual_planes=1` in the
command line arguments, but not forcing virtual planes to be used.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Jessica Zhang (2):
      drm/msm/dpu: Initialize return value for dpu_assign_plane_resources()
      drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250108-virtual-planes-fixes-f41ef2922ac7

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

