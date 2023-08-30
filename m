Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC778E299
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5A410E60D;
	Wed, 30 Aug 2023 22:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0971D10E161;
 Wed, 30 Aug 2023 22:49:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37UMb5Dv007237; Wed, 30 Aug 2023 22:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=sjBhFRt7Da6DMTS5j7RsIzQExhOD/0qVXrzP3XUT67s=;
 b=hmyQQCpyo08LhUegE2K05llINiAbHrpWHwreb5Yv+bC9d3hjmM2XEe1CRD6SL+okhcd/
 qWhfOtBwy1vTSGn/+Cl6YNNpoQ57TbRiwBZNwNxCx+jIFqMYJbzYoY4pB8E8Jzz5t7Tx
 ryFLB63kcLkw2pjC3aVy0FNCi/exUS9jl8zY9xhvm0fZ1UqX7H/bf963k76S/hL9fuEF
 SrGwETUKCXmRb7HFuPlQK7JNNmupleBRA+jQNBQ58PWjPn/Z77qqTUmLmbzb+laZ9jow
 euTL84Spma5UjEnjtAL2cHCK7mAGKSNpYnKQywBkBkDrD+DZZlPt5dHy96FsL2rWRK0r mA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st6ct93uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:49:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMnh65027294
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:49:43 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:49:43 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 00/16] Add CDM support for MSM writeback
Date: Wed, 30 Aug 2023 15:48:53 -0700
Message-ID: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VwT-aqWhQG75a3yGYtULEjRgkKzi6-wN
X-Proofpoint-ORIG-GUID: VwT-aqWhQG75a3yGYtULEjRgkKzi6-wN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=755
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300206
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
Cc: quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
which among other things has a CSC block that can convert RGB input
from the DPU to YUV data.

This block can be used with either HDMI, DP or writeback interface.

In this series, lets first add the support for CDM block to be used
with writeback and then follow-up with support for other interfaces such
as DP.

This was validated by adding support to pass custom output format to the
IGT's kms_writeback test-case, specifically only for the output dump
test-case [1].

The usage for this is:

./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>

So for NV12, this can be verified with the below command:

./kms_writeback -d -f NV12

[1] : https://patchwork.freedesktop.org/series/122125/


Abhinav Kumar (16):
  drm/msm/dpu: fix writeback programming for YUV cases
  drm/msm/dpu: add formats check for writeback encoder
  drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
    functionality
  drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
  drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
  drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
  drm/msm/dpu: add cdm blocks to RM
  drm/msm/dpu: add support to allocate CDM from RM
  drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
  drm/msm/dpu: add support to disable CDM block during encoder cleanup
  drm/msm/dpu: add an API to setup the CDM block for writeback
  drm/msm/dpu: plug-in the cdm related bits to writeback setup
  drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
  drm/msm/dpu: do not allow YUV formats if no CDM block is present
  drm/msm/dpu: add NV12 in the list of supported WB formats
  drm/msm/dpu: add cdm blocks to dpu snapshot

 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   9 +
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  43 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 150 +++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 272 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 135 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  34 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  11 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  62 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   6 +-
 18 files changed, 758 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

-- 
2.40.1

