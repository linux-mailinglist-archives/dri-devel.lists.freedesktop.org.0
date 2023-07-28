Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02547672C9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401A810E745;
	Fri, 28 Jul 2023 17:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3A210E73A;
 Fri, 28 Jul 2023 17:03:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SDRqLS011889; Fri, 28 Jul 2023 17:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=ZtzRqiWwQ2QEFTZrUftP48EdZkW9RUK/6jur8E/RCvQ=;
 b=VCd3csS5HKKkEWEWIV6/xliG/c9S1+R7X2bH13s1tMBKSH3zp99t1YyKdlKwqOw5P7D1
 yD6CoBy6/iIhF2tDpDTPbB3lweXT1PjnoEcuTg6GcojsTRdmlRY3/OI2kY/sLZBpnf0K
 X4hID5ZMtS/0puFNHMb9xKaMRnXw2uxN5/2HO7f+mAaSh9bB6ESYXS/FYF7oq38h9AHE
 70NDfQ3PzhocqvVaF5eeXpPceKcYmOajZJCdgjX5py7zGlWPPrNoQddX4K+00Eyhz/Oe
 s52ZNMogERzcjF/Q+Ed8/8aw9LcWN69SKhvo3aOBcPyDdGUbB4mgSeXaz54C/Ubpf0TN xg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3k7u43br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:55 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SH2sPC024416
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:54 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 10:02:53 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 28 Jul 2023 10:02:14 -0700
Subject: [PATCH RFC v5 05/10] drm/atomic: Add solid fill data to plane
 state dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230728-solid-fill-v5-5-053dbefa909c@quicinc.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690563772; l=2610;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=HIKdNUBnN+m+9TgC3MtRr0c654XkaH+1T9NuzH+3zmI=;
 b=axx4KzUEysYhBQWGzC7wcpvU0QSXWgwR0vZohdtxsgraqUArhwle8+XPyRpa1MjG88dGlbOYH
 m2o1LlUkGabDqOIVT5UJrEOr2bJ/9TSjBBYOUfb8jB2iGfO/YmSWoS7
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: J5j699B_Yfvdz95HVwbgQDdKvpG1tXED
X-Proofpoint-ORIG-GUID: J5j699B_Yfvdz95HVwbgQDdKvpG1tXED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=706
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307280154
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

Add solid_fill property data to the atomic plane state dump.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c |  4 ++++
 drivers/gpu/drm/drm_plane.c  | 10 ++++++++++
 include/drm/drm_plane.h      |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c38014abc590..1ee7d08041bc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -717,6 +717,10 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
+	drm_printf(p, "\tsolid_fill=%u\n",
+			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
+	if (state->solid_fill_blob)
+		drm_plane_solid_fill_print_info(p, 2, state);
 	drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
 	drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
 	drm_printf(p, "\trotation=%x\n", state->rotation);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 4188b3491625..009d3ebd9b39 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1494,11 +1494,21 @@ const char *drm_plane_get_pixel_source_name(enum drm_plane_pixel_source pixel_so
 		return "NONE";
 	case DRM_PLANE_PIXEL_SOURCE_FB:
 		return "fb";
+	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
+		return "solid_fill";
 	default:
 		return "";
 	}
 }
 
+void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
+				     const struct drm_plane_state *state)
+{
+	drm_printf_indent(p, indent, "r=0x%x\n", state->solid_fill.r);
+	drm_printf_indent(p, indent, "g=0x%x\n", state->solid_fill.g);
+	drm_printf_indent(p, indent, "b=0x%x\n", state->solid_fill.b);
+}
+
 /**
  * drm_plane_get_damage_clips - Returns damage clips.
  * @state: Plane state.
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 234fee3d5a95..303f01f0588c 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1000,6 +1000,9 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
 struct drm_mode_rect *
 drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
+void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
+				     const struct drm_plane_state *state);
+
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
 

-- 
2.41.0

