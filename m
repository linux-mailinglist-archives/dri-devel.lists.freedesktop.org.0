Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE874BB0F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0A410E181;
	Sat,  8 Jul 2023 01:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F36910E05B;
 Sat,  8 Jul 2023 01:25:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3680xobJ023394; Sat, 8 Jul 2023 01:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=dAUH3rNutTBRq0tBWhMCNWIlQTDnOnNFszA5XOxwwqA=;
 b=HvFqFmjBBY5jDv7l8rUxiZ3MbANYT3DA88uoiCfexoKkS1yhyFApbgia7Q86oRkmLbNo
 oBOaXtvXyRS7i0DHksHWKJoDMMIKmYjiK6VLGLTsNHWRy8rFS5UZfj0WcFdACmRzqfyZ
 Ehh7SvP0Q1G7uF7R8ZruHcRE3PRduTrWFfZSAvry2z5ZzMiJFuJRzCdZZXnvF00OKYmK
 FGJxsgMrkFo6WNOJZHjg4g7r2OEAf0YTct4m4VOuhVh5YcqZ5beFCWJaHHR1/xZ04/NH
 ZzgpYG1LY7X+wlb3LBvaxSzjVQB+sUOdjPtbKiVfB/rMJLug4NDIhFc9GMEBmmYlvFX9 cw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpcxntd5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Jul 2023 01:24:58 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3681OuDY015398
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Jul 2023 01:24:57 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 18:24:56 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Subject: [PATCH v5 0/6] Add support to print sub-block registers in dpu hw
 catalog
Date: Fri, 7 Jul 2023 18:24:39 -0700
Message-ID: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANe6qGQC/4XOQW7DIBAF0KtErEuFwQG7q657hERVBcMQIwXsg
 o1SRb57cXZVpHr5R/PfzJ1kTB4zeTvcScLisx9jDceXA4FBxwtSb2smnHHBJOfUYoExoV3C9DX
 pGQZqncLOSWel4KT2jM5ITdIRhq35caIhBxrxNtPrEvRl25kSOn973D1/1jz4PI/p5/FGabbpf
 xdLQxkVhoMFkPqo5Pv34sFHeIUxkM0rfNfg1eixZ7pTVvTCPRti1xDV6IRkjVEcjVTPRrtrtNV
 AwVprDfay7f4a67r+AsF6YcWkAQAA
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688779496; l=2946;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=UdwkB0d6HBesBoIZfhIANK0u8o/m20N6wYyPH/PPVbY=;
 b=/U89misig/SeQGpY8arXmlDT/EwmBYbd+EQWvqrk/o/Dz6Hb8tChkzKS47BhJPo5DSeGC4bDH
 sGvr1tYAD8FAatVVeDq2B45htpXtjjZf7vM3eGyVF1mF5UmgmQorTvL
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X0lMg8W_rh5yKrTQEY_6XEVZ85gcauFk
X-Proofpoint-ORIG-GUID: X0lMg8W_rh5yKrTQEY_6XEVZ85gcauFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307080010
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

This series depends on https://patchwork.freedesktop.org/series/119776/.

---
Changes in v5:
- Fixed indentation in refactor main block printing patch
- Fixed formatting issues to satisfy checkpatch
- Instead of passing 0 for DSC block, used actual length thanks to https://patchwork.freedesktop.org/series/119776/
- Link to v4: https://lore.kernel.org/r/20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com

Changes in v4:
- Added review tags
- Link to v3: https://lore.kernel.org/r/20230622-devcoredump_patch-v3-0-83601b72eb67@quicinc.com

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 90 +++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 74 +++++++++++++++----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  2 +-
 3 files changed, 104 insertions(+), 62 deletions(-)
---
base-commit: a92b5625851098af521cd92e4c518429b661c8f4
change-id: 20230622-devcoredump_patch-df7e8f6fd632

Best regards,
-- 
Ryan McCann <quic_rmccann@quicinc.com>

