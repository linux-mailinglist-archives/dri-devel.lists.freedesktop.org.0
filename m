Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC92809B46
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 06:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B1610E9D5;
	Fri,  8 Dec 2023 05:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A2510E9D5;
 Fri,  8 Dec 2023 05:06:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B84hBbC011864; Fri, 8 Dec 2023 05:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=crkqiVW0IKIM8kh8akgeBflTIrqECd4QIAVifC6DFQU=;
 b=Tl2SRT+zV1+stVyyazaTQSpetMTCmsMzaK/kRtmFmqpYm2I/Tp5KOzY2NycUAD0JOgFc
 5kyI0GC4thjL9hUWqm4O032aOXC62I8mvQ0CvsOTeKqx6ilbwhYcy5Hh/Zo5vSLzeDdy
 aLn9N56gr5DKP9OnPrP+UHVE5kgsX11A+lIrJz5Do/wseWB+M5RNq1rxE3/txXjqovvR
 7VfmDx+5EwLV0rYecXv7yATPdd2Q1bhjREYN1L1e64rQ32XXjto135UDbpv+PNhZic2s
 13iqvpC34ZKARgEPApGIeM/iahxaAo0YgK/Y2K5fw72wmPLnSjl0t+ZrcOmzFG31B+Al mQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu8p0b0ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 05:06:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B856uqI006498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 05:06:56 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 21:06:56 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 00/16] Add CDM support for MSM writeback
Date: Thu, 7 Dec 2023 21:06:25 -0800
Message-ID: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: umzs4pbI0Gm1fi3iHTNDKeBA9CuUmKr5
X-Proofpoint-ORIG-GUID: umzs4pbI0Gm1fi3iHTNDKeBA9CuUmKr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=579 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080038
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
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

changes in v2:
	- rebased on top of current msm-next-lumag
	- fix commit text of some of the patches
	- move csc matrices to dpu_hw_util as they span across DPU
	- move cdm blk define to dpu_hw_catalog as its common across chipsets
	- remove bit magic in dpu_hw_cdm with relevant defines
	- use drmm_kzalloc instead of kzalloc/free
	- protect bind_pingpong_blk with core_rev check
	- drop setup_csc_data() and setup_cdwn() ops as they
	  are merged into enable()
	- protect bind_pingpong_blk with core_rev check
	- drop setup_csc_data() and setup_cdwn() ops as they
	  are merged into enable()
	- move needs_cdm to topology struct
	- call update_pending_flush_cdm even when bind_pingpong_blk
	  is not present
	- drop usage of setup_csc_data() and setup_cdwn() cdm ops
	  as they both have been merged into enable()
	- drop reduntant hw_cdm and hw_pp checks
	- drop fb related checks from dpu_encoder::atomic_mode_set()
	- introduce separate wb2_format arrays for rgb and yuv

Abhinav Kumar (16):
  drm/msm/dpu: add formats check for writeback encoder
  drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
    functionality
  drm/msm/dpu: fix writeback programming for YUV cases
  drm/msm/dpu: move csc matrices to dpu_hw_util
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
  drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
  drm/msm/dpu: add cdm blocks to dpu snapshot

 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   5 +-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   5 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  37 +++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 117 +++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  47 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 276 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 114 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  35 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  71 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  39 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  51 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +
 25 files changed, 815 insertions(+), 52 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

-- 
2.40.1

