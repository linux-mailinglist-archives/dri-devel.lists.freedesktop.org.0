Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056BE74A4EA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 22:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE34010E4BE;
	Thu,  6 Jul 2023 20:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6BF10E4A8;
 Thu,  6 Jul 2023 20:27:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366JXVLJ001122; Thu, 6 Jul 2023 20:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=q21Hkg1SeAFZRghhSdVTbU3w1zuvGv0Lntvgsg8ofxI=;
 b=jDyK+IcNcZIo2ck6whOCzJc8DiQQPZnVr2BX4V7VHKg0so/e1lBkIoG6E17dPbiB7Re1
 pHaxZa3XhFXOEUPWpDxf8PAy1LCVygx2PPEHkZYilpH2SzsV+nRgXnDnVIaCm6FajM3N
 xmuDdQdfvji/0UH+AMUFx3YvGM0IB9bXCEn4XRcM/yrVR8bau+xjBAmaERf81YGr8GMu
 uKA61xMlIyP9otuaQsD2OhFuV5QdXGhIZbBZP9Aw+GcFRPfZPjkJsXQBlw497tphfHq9
 +RMNGeNngqtZn/047oIA87fHDEZu9mcMIcqlRRiG+KoOyJIJV7RL7o9mzGEqwwqimmfW oA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rnx4x0x5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 20:27:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 366KRj2j026329
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Jul 2023 20:27:46 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 13:27:45 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Subject: [PATCH v3 0/6] Add support to print sub-block registers in dpu hw
 catalog
Date: Thu, 6 Jul 2023 13:26:46 -0700
Message-ID: <20230622-devcoredump_patch-v3-0-83601b72eb67@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIcjp2QC/4WOQQ7CIBBFr2JYO6ZCpK0r1x5BYwwdBksitEJLN
 KZ3l3bnRpfvZ/7782aRgqXI9qs3C5RstJ3PINYrhq3yNwKrMzNecFFIzkFTwi6QHl1/7dWALWh
 TUmWk0VJwlnuNigRNUB7buXk8gYsOPD0HuI9O3eabPpCxz2X3fMnc2jh04bW8kbZz+msxbaEA0
 XDUiFLtSnl4jBatxw12js2+xP86eHbUVBeqKrWohfl2TNP0AeFSmtQcAQAA
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688675265; l=2395;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=i+TPACK4IRxgParuA6RqZUve2po/P32gxGzH3K7rF94=;
 b=QmFtMLmzhUdV8VplJ3Okj3UVuqjqOf5kzHf4Pilgemk5zUzGhvu/C3ssYN8IK4K0uBfuEvCMO
 lplDPWc4BP+CqWy5/YnwVglEf5vr3fd2uyv++lC7qLpoxag/0tn5evL
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zunmeKmo_uNf7zMVf_Cp29IksrC9gHAD
X-Proofpoint-GUID: zunmeKmo_uNf7zMVf_Cp29IksrC9gHAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxlogscore=987 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060179
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The purpose of this patch series is to add support to print the registers
of sub-blocks in the DPU hardware catalog and fix the order in which all
hardware blocks are dumped for a device core dump. This involves:

1. Changing data structure from stack to queue to fix the printing order
of the device core dump.

2. Removing redundant suffix of sub-block names.

3. Removing redundant prefix of sub-block names.

4. Eliminating unused variable from relevant macros.

5. Defining names for sub-blocks that have not yet been defined.

6. Implementing wrapper function that prints the registers of sub-blocks
when there is a need.

Sample Output of the sspp_0 block and its sub-blocks for devcore dump:
======sspp_0======
...registers
...
====sspp_0_scaler====
...
...
====sspp_0_csc====
...
...
====next_block====
...

---
Changes in v3:
- Split sub-block changes and main block changes into two commits
- Corrected typo in comment located in DSC for loop block
- Eliminated variables mmio and base
- Dropped unnecessary "%s"
- Link to v2: https://lore.kernel.org/r/20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com

Changes in v2:
- Changed spelling "sub block" to "sub-block" or "sblk".
- Capitalized DPU.
- Eliminated multiplexer/wrapper function. Inlined instead.
- Changed if statements from feature checks to length checks.
- Squashed prefix and suffix patch into one.
- Link to v1: https://lore.kernel.org/r/20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com

---
Ryan McCann (6):
      drm/msm: Update dev core dump to not print backwards
      drm/msm/dpu: Drop unused num argument from relevant macros
      drm/msm/dpu: Define names for unnamed sblks
      drm/msm/dpu: Remove redundant prefix/suffix in name of sub-blocks
      drm/msm/dpu: Refactor printing of main blocks in device core dump
      drm/msm/dpu: Update dev core dump to dump registers of sub-blocks

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 90 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 94 ++++++++++++++++++-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  2 +-
 3 files changed, 120 insertions(+), 66 deletions(-)
---
base-commit: a0364260213c96f6817f7e85cdce293cb743460f
change-id: 20230622-devcoredump_patch-df7e8f6fd632

Best regards,
-- 
Ryan McCann <quic_rmccann@quicinc.com>

