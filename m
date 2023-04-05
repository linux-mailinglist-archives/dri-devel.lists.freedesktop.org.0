Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488546D718A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6432A10E814;
	Wed,  5 Apr 2023 00:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA08D10E81A;
 Wed,  5 Apr 2023 00:42:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3350EmtH007094; Wed, 5 Apr 2023 00:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=VglG9Xzs3qlJK3DbpbP1aUx/4Z3hlBBchAa57oBhcEg=;
 b=YKGOoAgC5ffYHnle/vij8xORCythWRQKQqNvNSNPt9202SkTz3gB8yoOAvtaPekVQWhS
 jkaTAxcJufW0dL5/CZs2rJTniIaN+TS5xZc9hK0WsSY8SvQ4+7Ca/FZu3zYzL/gbVSJw
 rCC65Rdup3CraRu8Raf5VvkiRf22Kf87mvi6eIM7I+cl7SeGlj7cNgbqXkuxj48DyHz7
 BeKobDk3fHnCtBsGRXeFiautyOHTZmSA8jOtBnYhROAADmgmCi0H7vpxCUtnRkrJCtzp
 L9MtIxHjmrfBW+c60BvpTZY4RnIQFROr5qyQxXAi/nEQI372Eg3IoHxCgaD+HAc/tG7d 6A== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prnusheue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 00:42:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3350gQRQ013239
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 00:42:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 17:42:26 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 0/6] Introduce MSM-specific DSC helpers
Date: Tue, 4 Apr 2023 17:41:23 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPDLGQC/4XOsY7CMAwG4FdBmfEpjWlLmJCQGBgZ73RD4jg0E
 m0hgYoT6rtfygYnHeNv+f/su0gcAyexmt1F5CGk0Hc5LOYzQY3pDgzB5SyUVChRaYieoE0tuET
 Q8PHEEfSyMLpk562TIhetSQw2mo6aqbr7fC3st5tp7xTZh9vj+Nd3zk1Ilz7+PH4Zimn679mhA
 AkeeVFrX2pbufX5Gih09EF9KyZwUO8RlRGkAoldiZVVfxF8j2BGKssknaprs8RnZBzHXzZjGR1
 oAQAA
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680655346; l=3182;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=j0rUCOoRBHCFlwyXdTstTvzChQ3jB619BraNq661xhM=;
 b=MSOzeLSBVM0ZX5uo5k6DH5Qn8dpr1Kog0xx3UWQ2oM5gd1ggv78z7+kPY7NC8kcRtYRhp00I0
 kU4KUnPnDjVDgF3kQSL9cHnyOZzPoiNMg/4w22L+mQ3iqTJHcOKNHa0
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: I2KQ_egoENuFLgo3V8k3hHMmUGBVuS_h
X-Proofpoint-ORIG-GUID: I2KQ_egoENuFLgo3V8k3hHMmUGBVuS_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_14,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050004
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some overlap in calculations for MSM-specific DSC variables
between DP and DSI. In addition, the calculations for initial_scale_value
and det_thresh_flatness that are defined within the DSC 1.2 specifications,
but aren't yet included in drm_dsc_helper.c.

This series moves these calculations to a shared msm_dsc_helper.c file and
defines drm_dsc_helper methods for initial_scale_value and
det_thresh_flatness.

Note: For now, the MSM specific helper methods are only called for the DSI
path, but will called for DP once DSC 1.2 support for DP has been added.

Depends on: "drm/i915: move DSC RC tables to drm_dsc_helper.c" [1]

[1] https://patchwork.freedesktop.org/series/114472/

---
Changes in v4:
- Changed msm_dsc_get_uncompressed_pclk_per_intf to msm_dsc_get_pclk_per_intf
- Moved pclk_per_intf calculation for dsi_timing_setup to `if
  (msm_host->dsc)` block
- Link to v3: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com

Changes in v3:
- Cleaned up unused parameters
- Reworded some calculations for clarity
- Changed get_bytes_per_soft_slice() to a public method
- Added comment documentation to MSM DSC helpers
- Changed msm_dsc_get_eol_byte_num() to *_get_bytes_per_intf()
- Split dsi_timing_setup() hdisplay calculation to a separate patch
- Dropped 78c8b81d57d8 ("drm/display/dsc: Add flatness and initial scale
  value calculations") patch as it was absorbed in Dmitry's DSC series [1]
- Link to v2: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com

Changes in v2:
- Changed det_thresh_flatness to flatness_det_thresh
- Moved msm_dsc_helper files to msm/ directory
- Fixed type mismatch issues in MSM DSC helpers
- Dropped MSM_DSC_SLICE_PER_PKT macro
- Removed get_comp_ratio() helper
- Style changes to improve readability
- Use drm_dsc_get_bpp_int() instead of DSC_BPP macro
- Picked up Fixes tags for patches 3/5 and 4/5
- Picked up Reviewed-by for patch 4/5
- Split eol_byte_num and pkt_per_line calculation into a separate patch
- Moved pclk_per_line calculation into `if (dsc)` block in
  dsi_timing_setup()
- Link to v1: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com

---
Jessica Zhang (6):
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      drm/msm/dsi: Fix calculations pkt_per_line

 drivers/gpu/drm/msm/Makefile               |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  9 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 21 ++++++---
 drivers/gpu/drm/msm/msm_dsc_helper.c       | 47 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h       | 70 ++++++++++++++++++++++++++++++
 5 files changed, 140 insertions(+), 8 deletions(-)
---
base-commit: 56777fc93a145afcf71b92ba4281250f59ba6d9b
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

