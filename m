Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CA748DE5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 21:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E63D10E3BB;
	Wed,  5 Jul 2023 19:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE21710E3B3;
 Wed,  5 Jul 2023 19:32:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365DLAmX027545; Wed, 5 Jul 2023 19:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=8t9qAMzgTsQUz99/Ke1SCyllQDUBcDRqLoHQpfN2gX0=;
 b=AjPPOrduCjukD9WnBebklW5Yf+rIrLQsdOMQUzZ7wZPFLLTipFiMsRKGzVfe8QTF1Xpl
 C0wxiA285MdL4Qbs9Xz5k7JePmeifLOXxoqJ1B02wlCQ0avQ883GADam7AjX4aKBArn1
 vAn6Pu2D/I4HHOOy0nLCslyJW1w/clS9aMpx8/ToAdtiFALKB938AFwAxNSRWGUm4gmE
 /dgWMdI94bDh/osAHWs3msqeOhSCL/PL6gqZINvcXQ5HWRLhhLREo2jICm4tx9WZU0jc
 gasjL8TQ6XhDR/JNi+YKdSI/jwJUuk/4SuS4zc0fKKlEL5AFxhVMWlNHLXoIlSYIWY5l fg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rn2w59py5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:32:13 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 365JWC89019902
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jul 2023 19:32:12 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 5 Jul 2023 12:32:12 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Subject: [PATCH v2 0/5] Add support to print sub-block registers in dpu hw
 catalog
Date: Wed, 5 Jul 2023 12:30:14 -0700
Message-ID: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMbEpWQC/32OQQ6CMBREr2K69hsosRhXrj2Chpjy+wtNbIstN
 BjC3S0cwOWbzMvMwiIFQ5FdDwsLlEw03mXgxwPDXrqOwKjMjBe8KgTnoCihD6QmO7wGOWIPStd
 00UIrUXGWvVZGgjZIh/1m3h9gowVH8wjvycpu6wyBtJn33WeTuTdx9OG730jllv5bTCUUULUcF
 aKQ51rcPpNB4/CE3rJmXdcfALJwEtgAAAA=
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688585532; l=2012;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=CFO75SyInIG+Ex8vWmtEvRKBLBb3YU7p9isOQTlQkfQ=;
 b=0bNrMK0xpqdPqX3InuL4EIvd9+7/0LXg2srCPOqRS2eSxv21jGRpISqVCYSCfXEv2ekzOLVc3
 6aXIlimaM5uAMKRWu6ITTL32tm5zs714iXHTbqPauUsXBTqulMC2OIX
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KsuoXY9Nvh-LwbiY4TZv-8j1gfrMtHi6
X-Proofpoint-GUID: KsuoXY9Nvh-LwbiY4TZv-8j1gfrMtHi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_10,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=809
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050178
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
Changes in v2:
- Changed spelling "sub block" to "sub-block" or "sblk".
- Capitalized DPU.
- Eliminated multiplexer/wrapper function. Inlined instead.
- Changed if statements from feature checks to length checks.
- Squashed prefix and suffix patch into one.
- Link to v1: https://lore.kernel.org/r/20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com

---
Ryan McCann (5):
      drm/msm: Update dev core dump to not print backwards
      drm/msm/dpu: Drop unused num argument from relevant macros
      drm/msm/dpu: Define names for unnamed sblks
      drm/msm/dpu: Remove redundant prefix/suffix in name of sub-blocks
      drm/msm/dpu: Update dev core dump to dump registers of sub-blocks

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  90 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 106 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |   2 +-
 3 files changed, 128 insertions(+), 70 deletions(-)
---
base-commit: a0364260213c96f6817f7e85cdce293cb743460f
change-id: 20230622-devcoredump_patch-df7e8f6fd632

Best regards,
-- 
Ryan McCann <quic_rmccann@quicinc.com>

