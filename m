Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612376F8AB9
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2288A10E0F4;
	Fri,  5 May 2023 21:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B9710E0AE;
 Fri,  5 May 2023 21:24:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345KHQh9012432; Fri, 5 May 2023 21:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=rVzmO3/8OqoWF/+vJ6RhxHVcSzHR6TKoYzoM+GO5ESc=;
 b=YIU0SbxVrT3acBPe+Yi0SiQgRR/NpevEP86jZ+uoKsqgrnaZ4iSSqAfQ4+zXtssDxsoU
 NuDbe+Zhd5OHuJaOVZXm2ILBNwNnr91fVAMlAOtf2HDmp08b1/iZ0CYw1ldE7NZoKkLp
 Y6Mbxz3tu1jfWm56gU2DZBmG51O6QGULliImnf8u21AgfWq+fCRFvRL9ROOpWX1INv3g
 0WJFTkolNam1bivtGtclURvo1aZ5ulqs8Nkd+EKWh2t2FzCXC3CyUavmGSL5qp841cI1
 WLZ0+UXVZZmmmX1CUelxoSe86fCNcfR/33/bdx8Yrh9/gNMWkWXVRlWOSGYGGx/rxNF2 oA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qctfua1dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 21:24:04 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345LO3qb011979
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 May 2023 21:24:03 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 5 May 2023 14:24:03 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 0/4] Add DSC v1.2 Support for DSI
Date: Fri, 5 May 2023 14:23:47 -0700
Message-ID: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONzVWQC/3WNOw6DMBAFrxK5zkY2BvKpco+Iwp8lbIFNvICIE
 HePoU8572k0q2BMhCwep1UknIkphgzF+SRcZ8IbgXxmUchCy1JWYLwHzw54GoaYRmhRaWlNeb+
 VSmTLGkawyQTX7V7PPQRcxv0aEra0HLFXk7kjHmP6Hu1Z7ev/zKxAQm1d3Upt8Kqr52ciR8FdX
 OxFs23bDxfVnPDLAAAA
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683321843; l=1960;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=6BbpC86xjXc0XHFd1x6qXXxS28hFrPmY3crN8mrsv0Y=;
 b=o9CYNBF/0tZlZu7sK47OD0ZX+iQqNLNcjwIKz1c33TIot1KQ0gK5Bci/AvAFEQr6DsQ4er+2s
 WbWRdcgs2/VBMkWDpr290EA+O4ZCAprV2tQ3nVRYX6v+iEjbNGyeqV+
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eB_sNAZTnUzkpMaasas2jSarU8o7FCmc
X-Proofpoint-ORIG-GUID: eB_sNAZTnUzkpMaasas2jSarU8o7FCmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_27,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050173
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a series of changes for DSI to enable command mode support
for DSC v1.2.

This includes:

1) Adjusting pclk_rate to account for compression
2) Fixing the word count calculation for DSC
3) Setting the DATA_COMPRESS bit when DSC is enabled

With these changes (and the dependency below), DSC v1.2 should work over
DSI in command mode.

Note: Changes that add DSC v1.2 support for video mode will be posted
with the DP support changes.

Depends-on: "add DSC 1.2 dpu supports" [1] and "Introduce MSM-specific
DSC helpers" [2]

[1] https://patchwork.freedesktop.org/series/116789/
[2] https://patchwork.freedesktop.org/series/115833/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v2:
- Changed pclk math to only divide hdisplay by compression ratio
- Reworded word count TODO comment
- Make DATA_COMPRESS an INTF flag
- Read INTF_CFG2 before setting DATA_COMRPESS register
- Reworded commit messages and cover letter for clarity
- Link to v1: https://lore.kernel.org/r/20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com

---
Jessica Zhang (4):
      drm/msm/dsi: Adjust pclk rate for compression
      drm/msm/dsi: Fix compressed word count calculation
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag
      drm/msm/dpu: Set DATA_COMPRESS for command mode

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 11 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 26 +++++++++++++++++-----
 6 files changed, 40 insertions(+), 6 deletions(-)
---
base-commit: 70e08302e024bfac485b12972099237f7f39d829
change-id: 20230405-add-dsc-support-fe130ba49841

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

