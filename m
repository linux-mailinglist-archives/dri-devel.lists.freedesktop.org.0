Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9007672C0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D8110E72D;
	Fri, 28 Jul 2023 17:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FC810E223;
 Fri, 28 Jul 2023 17:03:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SAusns032214; Fri, 28 Jul 2023 17:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=KXSCYP7+Yz0IUZ6whXhB8v5lJ0gHuz9wF7Ctty3CriI=;
 b=IH80qlZlr9wvmcKTxtmLj13RToKUITpkFjYTY9DmuNT8ngEpX4f3aAdabzGkCDizjliI
 hvud6rf8O5YkLjTYVfdjMv/VlPbj3ytl4HV30A64+7arrcME3XlXKK0dr+GxXx5HmGDu
 yQ2Iyqc/pNDz6ZwqziaNr4Eb0nLVYOfCFjbtcCEOz0g/sCNilxX//83I2KG7Zw8d9dU+
 R4rTQkQOHKuHp3vf+q1Gjw5FtcOjEewyJiE2NESRUM0kLzUbS+MQzp4ZEZCSOJLu38GL
 xldnotqGNdsFiv4oryV6c5J5cJFBKUY5PqV43qKsmz/fBft168FrAtBjM8KXkaJBjXJO DA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s468r1h98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SH2qDF024668
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:52 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 10:02:52 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH RFC v5 00/10] Support for Solid Fill Planes
Date: Fri, 28 Jul 2023 10:02:09 -0700
Message-ID: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJH0w2QC/12OQWrDMBBFrxK0zoSRJSuQVSCQA3RbSpHlcT3Bl
 ltNatIG372yNiFd/vm8ef+uhBKTqMPmrhLNLDzFHOrtRoXexw8CbnNWFVYGLVqQaeAWOh4GwBq
 10/u6bYxTGWi8EDTJx9CvyCgjRLpd1+ozUce34nlVL+eTesvHnuU6pZ/innWpikajrYxF43bOO
 NDw9c3h/UIiv3nRcU0cwy5MY/ky2wf5b+BsAaGzFDB4v7dV+wwvy/IH1t34QAABAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690563772; l=6201;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=H9cIRZeTj9IsMtHbA9nnGLoH5yolqXk4MaGPavlu1Y4=;
 b=eDe7EU48c7R/rK4DJ05+I5BhVNTs2JlisV1j5uNdLADDfDFhBlkh+jzGO7CsY8enJFd5opYv3
 LOy8k0y87FGBOyPXsBztg/E3ERI58w10VYO+Cw0PonuIxjYvcIMyEOz
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cqLEe51r3KVyAMP42s2u0gj0GRQB0t9V
X-Proofpoint-ORIG-GUID: cqLEe51r3KVyAMP42s2u0gj0GRQB0t9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280154
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers support hardware that have optimizations for solid fill
planes. This series aims to expose these capabilities to userspace as
some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
hardware composer HAL) that can be set by apps like the Android Gears
app.

In order to expose this capability to userspace, this series will:

- Introduce solid_fill and pixel_source properties to allow userspace to
  toggle between FB and solid fill sources
- Loosen NULL FB checks within the DRM atomic commit callstack to allow
  for NULL FB when solid fill is enabled.
- Add NULL FB checks in methods where FB was previously assumed to be
  non-NULL
- Have MSM DPU driver use drm_plane_state.solid_fill instead of
  dpu_plane_state.color_fill

Note: The solid fill planes feature depends on both the solid_fill *and*
pixel_source properties.

To use this feature, userspace can set the solid_fill property to a blob
containing the appropriate version number and solid fill color (in
RGB323232 format) and and setting the pixel_source property to
DRM_PLANE_PIXEL_SOURCE_COLOR. This will disable memory fetch and the
resulting plane will display the color specified by the solid_fill blob.

Currently, there's only one version of the solid_fill blob property.
However if other drivers want to support a similar feature, but require
more than just the solid fill color, they can extend this feature by
creating additional versions of the drm_solid_fill struct.

This 2 property approach was chosen because passing in a special 1x1 FB
with the necessary color information would have unecessary overhead that
does not reflect the behavior of the solid fill feature. In addition,
assigning the solid fill blob to FB_ID would require loosening some core
drm_property checks that might cause unwanted side effects elsewhere.

---
Changes in v5:
- Added support for PIXEL_SOURCE_NONE (Sebastian)
- Added WARN_ON() in drm_plane_has_visible_data() if pixel_source isn't
  set (Dmitry)
- Added debugfs support for both properties (Dmitry)
- Corrected u32 to u8 conversion (Pekka)
- Moved drm_solid_fill_info struct and related documentation to
  include/uapi (Pekka)
- Changed drm_solid_fill_info.version to __u32 for data alignment (Pekka)
- Added more detailed UAPI and kernel documentation (Pekka)
- Reordered patch series so that the pixel_source property is introduced
  before solid_fill (Dmitry)
- Fixed inconsistent ABGR8888/RGBA8888 format declaration (Pekka)
- Reset pixel_source to FB in drm_mode_setplane() (Dmitry)
- Rename supported_sources to extra_sources (Dmitry)
- Only destroy old solid_fill blob state if new state is valid (Pekka)
- Link to v4: https://lore.kernel.org/r/20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com

Changes in v4:
- Rebased onto latest kernel
- Reworded cover letter for clarity (Dmitry)
- Reworded commit messages for clarity
- Split existing changes into smaller commits
- Added pixel_source enum property (Dmitry, Pekka, Ville)
- Updated drm-kms comment docs with pixel_source and solid_fill
  properties (Dmitry)
- Inlined drm_atomic_convert_solid_fill_info() (Dmitry)
- Passed in plane state alpha value to _dpu_plane_color_fill_pipe()
- Link to v3: https://lore.kernel.org/r/20230104234036.636-1-quic_jesszhan@quicinc.com

Changes in v3:
- Fixed some logic errors in atomic checks (Dmitry)
- Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
  methods (Dmitry)
- Fixed typo in drm_solid_fill struct documentation
- Created drm_plane_has_visible_data() helper and corrected CRTC and FB
  NULL-check logic (Dmitry)
- Merged `if (fb)` blocks in drm_atomic_plane_check() and abstracted
  them into helper method (Dmitry)
- Inverted `if (solid_fill_enabled) else if (fb)` check order (Dmitry)
- Fixed indentation (Dmitry)

Changes in v2:
- Dropped SOLID_FILL_FORMAT property (Simon)
- Switched to implementing solid_fill property as a blob (Simon, Dmitry)
- Added drm_solid_fill and drm_solid_fill_info structs (Simon)
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Removed DPU_PLANE_COLOR_FILL_FLAG
- Fixed whitespace and indentation issues (Dmitry)
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Fixed dropped 'const' warning
- Added helper to convert color fill to BGR888 (Rob)
- Fixed indentation issue (Dmitry)
- Added support for solid fill on planes of varying sizes

---
Jessica Zhang (10):
      drm: Introduce pixel_source DRM plane property
      drm: Introduce solid fill DRM plane property
      drm: Add solid fill pixel source
      drm/atomic: Add pixel source to plane state dump
      drm/atomic: Add solid fill data to plane state dump
      drm/atomic: Move framebuffer checks to helper
      drm/atomic: Loosen FB atomic checks
      drm/msm/dpu: Allow NULL FBs in atomic commit
      drm/msm/dpu: Use DRM solid_fill property
      drm/msm/dpu: Add solid fill and pixel source properties

 drivers/gpu/drm/drm_atomic.c              | 147 +++++++++++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c       |  34 ++++---
 drivers/gpu/drm/drm_atomic_state_helper.c |  10 ++
 drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++++
 drivers/gpu/drm/drm_blend.c               | 123 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   2 +
 drivers/gpu/drm/drm_plane.c               |  41 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  67 +++++++++-----
 include/drm/drm_atomic_helper.h           |   4 +-
 include/drm/drm_blend.h                   |   3 +
 include/drm/drm_plane.h                   |  89 ++++++++++++++++++
 include/uapi/drm/drm_mode.h               |  24 +++++
 13 files changed, 508 insertions(+), 104 deletions(-)
---
base-commit: eab616ad7f56cafc8af85e9774816f0901e1efa2
change-id: 20230404-solid-fill-05016175db36

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

