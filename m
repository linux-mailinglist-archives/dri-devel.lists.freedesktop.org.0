Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CD78BBDE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 02:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C9510E380;
	Tue, 29 Aug 2023 00:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAFF10E37B;
 Tue, 29 Aug 2023 00:06:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SNwYCk011844; Tue, 29 Aug 2023 00:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=tqXwULFxRspLVPyz8OqlKjaj0SxQnub82cujPfJJFyg=;
 b=DWpHoWmUkspiyaMttJ7ZRGB1FLLNInDsMrShBMPEsYh5ubOljhvYkFajtNHMykjUPckv
 l6JfZP/hs4pr26d4789Z2sMDF4q9uJI6e5W4kXhndZyxDYoNhLzGESFpVLpcnrah43F9
 gQ0RaVTmzN10nnfYEJ6p+8cJy9s4Riz0Y9BHnf7OjUMFeJsj2pXg75//mM348HfUKCoV
 AEfkDk6CCcp849uXXgtbynoAoRNeY+nGR4wjj8IJxKI2XHsaF+wlVYsHuD2xoD18KD64
 NpmOA3TQ5MV6ohFiKd/vjlhY7jH/vtpM8x3VNBAR59JZ1f+NZC3ol17/6kumushCQg0m dQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss2xb88ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 00:05:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37T05iU0032257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 00:05:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 28 Aug 2023 17:05:44 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 28 Aug 2023 17:05:09 -0700
Subject: [PATCH RFC v6 03/10] drm: Add solid fill pixel source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230828-solid-fill-v6-3-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
In-Reply-To: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693267542; l=2352;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=d1HAMryOYZGmbAmBQPrLDrt7wYZovl3VvwekSNlNp14=;
 b=Q7yATp5WQ92EOrlUGGc3v4ipl/THQwVX+/VAueyVfRk/+lqOqjcwSXi+hATyO4+TCYeZwAvc+
 bymonnxyv8SAGY50mPfb6MX7CYUSkktP40Dd29Dh00QRV0jJ5qW5+Nv
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: by-E3kVTJkPzhEc8rV2k7PYohwfsiZCW
X-Proofpoint-GUID: by-E3kVTJkPzhEc8rV2k7PYohwfsiZCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_19,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=880 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308280207
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

Add "SOLID_FILL" as a valid pixel source. If the pixel_source property is
set to "SOLID_FILL", it will display data from the drm_plane "solid_fill"
blob property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_blend.c | 10 +++++++++-
 include/drm/drm_plane.h     |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 273021cc21c8..1016a206ca0c 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -200,6 +200,9 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
+ *	"SOLID_FILL":
+ *		Solid fill color source set by the "solid_fill" property.
+ *
  * solid_fill:
  *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
  *	contains pixel data that drivers can use to fill a plane.
@@ -638,6 +641,7 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
 static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
+	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
 
 /**
@@ -662,6 +666,9 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
  * "FB":
  *	Framebuffer pixel source
  *
+ * "SOLID_FILL":
+ * 	Solid fill color pixel source
+ *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -671,7 +678,8 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
+						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE) |
+						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
 	int i;
 
 	/* FB is supported by default */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index a38e18bfb43e..49995c4be2ab 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -43,6 +43,7 @@ enum drm_scaling_filter {
 enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_NONE,
 	DRM_PLANE_PIXEL_SOURCE_FB,
+	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 

-- 
2.42.0

