Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F36D2826
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 20:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53010E40D;
	Fri, 31 Mar 2023 18:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94310E3CE;
 Fri, 31 Mar 2023 18:49:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V9WBq4014151; Fri, 31 Mar 2023 18:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=gKUtHdsMecjbx0OXVg4iNMpOjL09/vDrJuKflJbaNMw=;
 b=Giq8gZLdHHHzwFu0JHJ5/K/8lxXuGh5j7RnhX1rKkdWi64vPS4u1drlbhZyGYwcM81+6
 h0wQTdXQZWpySQz829bripTNcWQS5mO8kVrD7jGJr5TbqgqYPI1Hl+w6GrA8yGNp5hLW
 vpU+UMy8rv9LU7PJ16bAWV1KoNyw0CtEi6eNOxIItyJNxcVFbxj3EzZzdfUstlNGErzs
 KyxatOH6vz035Iu/daH3p50CHUhO9S90gk2CbA+7qOCSwNl+dtLaFLKVqoFO5BU0OATa
 Drg6JAuf1Uvnx+xpQ8VQ5W9FZwlj2U1cKjbfZ5yJ0wXkYJvlHPhWs7nt7fed0bQJG2FT vw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pnvynsudb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 18:49:41 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32VInfJP010558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 18:49:41 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 11:49:40 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH RFC v2 0/6] Introduce MSM-specific DSC helpers
Date: Fri, 31 Mar 2023 11:49:15 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACsrJ2QC/32OvQ6CMBSFX4V09ppSRK2TiYmDo6OGgba39iZSs
 FWiIby7hdHB8fx8OWdgEQNhZLtsYAF7itT6JMQiY9rV/oZAJmkmuCh4ISQEq6GJDZioweG9wwB
 ym9eyRGOV4SyBqo4IKtReuwk9XX6B8/Ew9bqAlt7z+JVNXpVMR/HZhs98qM/n6N92nwMHW+BqI
 20p1drsHy/S5PVStw2rxnH8AkHwVLbjAAAA
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680288580; l=2402;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=PdNXQWKbJMrGkD4LanFK6d2pIla3Xr9Lse5qflYPrrw=;
 b=RL1Z9K4mSXYYZG3I5IvewAuTUtBwmLmSihkFcTtR3J9GyMBaTI8YAwCaiN6nU2axqscpDeoM0
 U6l7CFn2YJMDofFzqRLYIkpGF9awcnWg9Z8eox6OJ0aYVGwbyaqEJfZ
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nvtJqMYk_S9CnRtCdDb2TkfsQQyi1loY
X-Proofpoint-ORIG-GUID: nvtJqMYk_S9CnRtCdDb2TkfsQQyi1loY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310151
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

There are some overlap in calculations for MSM-specific DSC variables between DP and DSI. In addition, the calculations for initial_scale_value and det_thresh_flatness that are defined within the DSC 1.2 specifications, but aren't yet included in drm_dsc_helper.c.

This series moves these calculations to a shared msm_dsc_helper.c file and defines drm_dsc_helper methods for initial_scale_value and det_thresh_flatness.

Note: For now, the MSM specific helper methods are only called for the DSI path, but will called for DP once DSC 1.2 support for DP has been added.

Depends on: "drm/i915: move DSC RC tables to drm_dsc_helper.c" [1]

[1] https://patchwork.freedesktop.org/series/114472/

---
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
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: Fix calculations for eol_byte_num and pkt_per_line

 drivers/gpu/drm/msm/Makefile               |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 10 ++++--
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 21 ++++++++----
 drivers/gpu/drm/msm/msm_dsc_helper.c       | 53 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h       | 42 +++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h       | 11 +++++++
 6 files changed, 129 insertions(+), 9 deletions(-)
---
base-commit: 56777fc93a145afcf71b92ba4281250f59ba6d9b
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

