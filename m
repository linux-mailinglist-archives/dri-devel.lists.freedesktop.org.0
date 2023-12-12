Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7280DFF6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8D10E52F;
	Tue, 12 Dec 2023 00:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E834B10E109;
 Tue, 12 Dec 2023 00:23:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BC0HkJc023486; Tue, 12 Dec 2023 00:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=THBAUI8
 s/kOCakupZihQQnJYj+kDm0UrGdfuDolHDuY=; b=N+tqCJVJoEOpf1DGub4iEhC
 t8NS7W+/rjePiruYoYbjOwEUHj9+/EpRH+0t3YUxQSKz79xZQs41GBAQ9cC61yzT
 mL29E69asjtT4aOs0kF/PlCX+tWsTxg7dorTOiS/i6E8/ollZoH5QNOuAjRURa+l
 iuqZ1XOSOFhPwtQ2PHzo1dY/YFXht8P6FgNFcGlPyxx7XIY+FRtuH6vM+/PeD8XM
 mx59LoAraDfT05wWbaa9Zi6WrThfc/4ZPRAj4erNkwS1QxECbVEFSUY4H9vli9Wk
 qgXbdzd4pN8khHB+FzDsmxJGWNGfw2UAfLTQh+ROggLdEtea0XNFeTzZP2VR6NA=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux28s9j1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:22:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0MtYi027114
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:22:55 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:22:54 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 00/15] Add CDM support for MSM writeback
Date: Mon, 11 Dec 2023 16:22:30 -0800
Message-ID: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pYXszPl3fW9YIMBWLdNyUdlvMY1xtBLZ
X-Proofpoint-GUID: pYXszPl3fW9YIMBWLdNyUdlvMY1xtBLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=578 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312120001
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
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

changes in v3:
	- rebase on top of msm-next
	- drop the extra wrapper and export the CSC matrices directly
	- fixes in commit text as requested
	- fixes for kbot errors as reported
	- drop "enable" parameter from bind_pingpong_blk() as we can
	  just use PINGPONG_NONE for disable cases
	- squash cdm changes in encoder cleanup to the change which allocates cdm
 
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

Abhinav Kumar (15):
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
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   6 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 114 +++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  47 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 263 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 130 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  33 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  44 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  31 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  51 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +
 24 files changed, 777 insertions(+), 46 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

-- 
2.40.1

