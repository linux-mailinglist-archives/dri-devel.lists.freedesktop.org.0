Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBC76D68B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F7110E567;
	Wed,  2 Aug 2023 18:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD65610E55D;
 Wed,  2 Aug 2023 18:09:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372HYZln001884; Wed, 2 Aug 2023 18:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=Z7+m9MRkLgFH+BPGaAMKQBZw7dNNSAUMw86L9LjuQT4=;
 b=pBYWg6bqqO+P7gm0idvDtquXErMi287qKDhleNpSRDQZQBx/qBwFZynSwHXrSpha8ctk
 mBYLxQ8rB8g2gZo7p+I/8U0M5XgvoakfLrJF3MF2c0bi+wXpPUyxn6+z0Zy+T3q4yYRQ
 gAAfc+98qXL79qyCbbu9c9+AvHk0uYrL1QtR7/eV9yHT8Gh51BP8JQwUGc/QeUMvIZWU
 j2au4T7dM/lmidqDBdafg3dQHVMJwYEiHLvsLwSNQtp+/n/fTcoUK+WH2CE367KvtQ3l
 O/4fKZxQ4AMvpuoygdJBgMFEFDDYlZuGv/dPVJDk6pF66dsMdDqyBBF9wq4pz680nzD3 Jg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s72gquknk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 18:09:08 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372I97aP031812
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 18:09:07 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 11:09:07 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 0/4] drm/msm: Enable widebus for DSI
Date: Wed, 2 Aug 2023 11:08:47 -0700
Message-ID: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+bymQC/32OwQ6CMBBEf8X07Jq2WKqePPsJGg+lXWQTKdgCY
 gz/bvFiTIzH2dl5M08WMRBGtls8WcCBIjU+iWy5YLYy/oJALmkmucy4kgqMc3Anh0UfIfZt24Q
 OSr1Rap0jaiVYShYmIhTBeFvN2cMR6liDx7GDa1+by/zTBixpfDefzklXFLsmPN5DBjFf/3cOA
 jhYzfNtKbG0RuxvPVnydmWbms3EQX4oWmS/KRJEMnjy0Ald5N+UaZpe/xzU9yIBAAA=
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690999747; l=2617;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=KSfiJP412T3sckmGlUyt/6jwYPL+0fA6TPTN0rnG9v8=;
 b=S4OFU+fQO4meMNBdHdwTBiylgxl45k+bnNV2xiuZnMKzOtbFSBbMTtXy3Nl48xWRB+Nw3GsqM
 NLFkcdPK7ycDa2WZMCaF6N46g6h3+PWRePFQji9WyMz7EssgBenpehQ
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HQVgJKg8RMigtvrwcskcpUvataQOK3pP
X-Proofpoint-ORIG-GUID: HQVgJKg8RMigtvrwcskcpUvataQOK3pP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_15,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308020160
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI 6G v2.5.x+ and DPU support a data-bus widen mode that allows DSI
to send 48 bits of compressed data per pclk instead of 24.

For all chipsets that support this mode, enable it whenever DSC is
enabled as recommended by the hardware programming guide.

Only enable this for command mode as we are currently unable to validate
widebus for video mode.

Depends on: "drm/msm/dpu: Drop encoder vsync_event" [1]

Note: The dsi.xml.h changes were generated using the headergen2 script in
envytools [2], but the changes to the copyright and rules-ng-ng source file
paths were dropped.

[1] https://patchwork.freedesktop.org/series/121742/
[2] https://github.com/freedreno/envytools/

--
Changes in v3:
- Split commit into DPU, dsi.xml.h, and DSI changes (Dmitry)
- Add DSC enabled check to DSI *_is_widebus_enabled() helper (Dmitry)
- Dropped mention of DPU in cover letter title
- Moved setting of dpu_enc->wide_bus_en to dpu_encoder_virt_atomic_enable()
- Link to v2: https://lore.kernel.org/r/20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com

Changes in v2:
- Rebased on top of "drm/msm/dpu: Re-introduce dpu core revision"
- Squashed all commits to avoid breaking feature if the series is only partially applied
- Moved DATABUS_WIDEN bit setting to dsi_ctr_enable() (Marijn)
- Have DPU check if wide bus is requested by output driver (Dmitry)
- Introduced bytes_per_pclk variable for dsi_timing_setup() hdisplay adjustment (Marijn)
- Link to v1: https://lore.kernel.org/r/20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com

---
Jessica Zhang (4):
      drm/msm/dpu: Move DPU encoder wide_bus_en setting
      drm/msm/dpu: Enable widebus for DSI INTF
      drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
      drm/msm/dsi: Enable widebus for DSI

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 16 +++++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |  5 ++++
 drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 30 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h                      |  6 ++++-
 9 files changed, 57 insertions(+), 10 deletions(-)
---
base-commit: e5046e719774f833d32e3e6064416bb792564c95
change-id: 20230525-add-widebus-support-f785546ee751

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

