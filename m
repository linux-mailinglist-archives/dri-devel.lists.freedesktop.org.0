Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7C6A8672
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D88E10E02D;
	Thu,  2 Mar 2023 16:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFBD10E02D;
 Thu,  2 Mar 2023 16:33:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322EiXND014795; Thu, 2 Mar 2023 16:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=quExULxqwktiCqvwqBilD9v+P4OLIQqOgu545Ik7ilE=;
 b=JYLRNdRxRb8t6hXFdyfpTjNtAJXn2XFvKvjdBLrmAhctFrZtac1hHblGal5VlfMgNyMJ
 trCX69B7OhYiWurxQw84ulVoibFoPRm6JhKD9eMxcva/YLB+otvkn9W0dU+zt1D19iSP
 Q+tfQS34k+eHfZWtMh+3eIuGgtq2rufv2yjnm3z+tZ41KfqnLndqkc9pON/7J3ZC+qvW
 ArHsOjEJ6WJvkQh2/TgsO4R0z+KCUkIANc6h3vgfsh975j11aJ40eow1F0xk5pntHJE+
 9tk+T5Ljd0Rsv+DjUXP5oAd5jlT3ptUfGkiWzNINthu3wPo8nwjvmzBGu7VELh8t978L vA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p288r3t7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:33:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 322GXeXs019061
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Mar 2023 16:33:40 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 2 Mar 2023 08:33:35 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v14 00/14] Add PSR support for eDP
Date: Thu, 2 Mar 2023 22:03:03 +0530
Message-ID: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Qxk7w2WKmgKPwoHJbz7_Iz3BEkxdHYI6
X-Proofpoint-ORIG-GUID: Qxk7w2WKmgKPwoHJbz7_Iz3BEkxdHYI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020143
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
  - Use dp bridge to set psr entry/exit instead of dpu_enocder.
  - Don't modify whitespaces.
  - Set self refresh aware from atomic_check.
  - Set self refresh aware only if psr is supported.
  - Provide a stub for msm_dp_display_set_psr.
  - Move dp functions to bridge code.

Changes in v3:
  - Change callback names to reflect atomic interfaces.
  - Move bridge callback change to separate patch as suggested by Dmitry.
  - Remove psr function declaration from msm_drv.h.
  - Set self_refresh_aware flag only if psr is supported.
  - Modify the variable names to simpler form.
  - Define bit fields for PSR settings.
  - Add comments explaining the steps to enter/exit psr.
  - Change DRM_INFO to drm_dbg_db. 

Changes in v4:
  - Move the get crtc functions to drm_atomic.
  - Add atomic functions for DP bridge too.
  - Add ternary operator to choose eDP or DP ops.
  - Return true/false instead of 1/0.
  - mode_valid missing in the eDP bridge ops.
  - Move the functions to get crtc into drm_atomic.c.
  - Fix compilation issues.
  - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
  - Check for crtc state enable while reserving resources.

Changes in v5:
  - Move the mode_valid changes into a different patch.
  - Complete psr_op_comp only when isr is set.
  - Move the DP atomic callback changes to a different patch.
  - Get crtc from drm connector state crtc.
  - Move to separate patch for check for crtc state enable while
reserving resources.

Changes in v6:
  - Remove crtc from dpu_encoder_virt struct.
  - fix crtc check during vblank toggle crtc.
  - Misc changes. 

Changes in v7:
  - Add fix for underrun issue on kasan build.

Changes in v8:
  - Drop the enc spinlock as it won't serve any purpose in
protetcing conn state.(Dmitry/Doug)

Changes in v9:
  - Update commit message and fix alignment using spaces.(Marijn)
  - Misc changes.(Marijn)

Changes in v10:
  - Get crtc cached in dpu_enc during obj init.(Dmitry)

Changes in v11:
  - Remove crtc cached in dpu_enc during obj init.
  - Update dpu_enc crtc state on crtc enable/disable during self refresh.

Changes in v12:
  - Update sc7180 intf mask to get intf timing gen status
based on DPU_INTF_STATUS_SUPPORTED bit.(Dmitry)
  - Remove "clear active interface in the datapath cleanup" change
as it is already included.

Changes in v13:
  - Move core changes to top of the series.(Dmitry)
  - Drop self refresh aware disable change after psr entry.(Dmitry)

Changes in v14:
  - Set self_refresh_aware for the PSR to kick in.

Vinod Polimera (14):
  drm: add helper functions to retrieve old and new crtc
  drm/bridge: use atomic enable/disable callbacks for panel bridge
  drm/bridge: add psr support for panel bridge callbacks
  drm/msm/disp/dpu: check for crtc enable rather than crtc active to
    release shared resources
  drm/msm/disp/dpu: get timing engine status from intf status register
  drm/msm/disp/dpu: wait for extra vsync till timing engine status is
    disabled
  drm/msm/disp/dpu: reset the datapath after timing engine disable
  drm/msm/dp: use atomic callbacks for DP bridge ops
  drm/msm/dp: Add basic PSR support for eDP
  drm/msm/dp: use the eDP bridge ops to validate eDP modes
  drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
    functions
  drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
  drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
    during self refresh
  drm/msm/dp: set self refresh aware based on psr support

 drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
 drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  36 +++--
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 173 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  36 +++++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 ++++
 include/drm/drm_atomic.h                           |   7 +
 22 files changed, 683 insertions(+), 43 deletions(-)

-- 
2.7.4

