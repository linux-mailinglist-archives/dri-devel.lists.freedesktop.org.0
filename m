Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F598585B3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F1310E224;
	Fri, 16 Feb 2024 18:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="q51jhPeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC5510E224
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 18:49:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-563ed3d221aso1433983a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1708109376; x=1708714176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROS/ncwbFNhmuPIcgtXb8XELHDQFjlWT/ShIrY6H6sM=;
 b=q51jhPeXDMF1VOY12JN+unWEp6qGBJofji8tguaRGXteahevVYJK6Lh00mieQPYhQ4
 PlYweNakSIkD30kzAO9RKRoU3tNRjO5T3OHD7G87H9QGifNVc2W5qeIuIpuRignuVTmV
 i7XXyqy9gj+FluSEVk4gMY86kxxGId56KBawPXTn8iepr6W7iSX7/hfAkgEfwX9rzXiw
 fP/1w8apGORD7IEuRUxJBRgLY8AhdUGdT3ARN9evmT33y+2V68FFip1y8KGAPdT6HZaa
 +Gj4pWx7AbR+J4VZnue7lKwaTMS2Z+7fUXnV7dNu0a469bjA8EdIB0y3tUkgkL4np+yS
 iHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708109376; x=1708714176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROS/ncwbFNhmuPIcgtXb8XELHDQFjlWT/ShIrY6H6sM=;
 b=cii+forYxqlbCZQB8LM5dvmtdRnTAhl29TCb0jV55y8m4ssg0tI05jHYJfe/vwlgIN
 vl/v3tg7EK6I7ZhAN1IuZwQnItSAWC86jm0/X9bvMX/nqYYUzcyS3POwW8hcu+1oLOL2
 K2ebOV+47AzXmj/XbdqtpyISmqcHsSxiQ3D6PVQNl3sdPkVAPThZDbQVSKjs5GxTpJlf
 u0XsZZ2dTCbcwUmRd+lqM20x0UGKvdQjdqtElCS1H7jcmaaESF6n9XQ3lblfrMwkmhEO
 iJ9xd+QqS9lX2W5hvlDxVOaf+Gf+U/mfWhmhAFDZ2CC4yZsg3FVQg3VmiSnVsWVW69S7
 EpnA==
X-Gm-Message-State: AOJu0YwrLV2vMeVbwYTdAbL59eiOtSBNM92Dof9OHHgedDqByzNgF1hf
 y4T0l19ehL/rxtoTb65esvPMnesPzjubGxXkXmFEeQwOfBFCg+ZOjVeAdP7qgD0lSIyfNg6dPj3
 7
X-Google-Smtp-Source: AGHT+IHphqnhr4tq9wks+tWwDvmDa4IfYo/SR42KjOUs9sKCni6cA60cOZKOwSbtwAa1fQVu2G450Q==
X-Received: by 2002:a17:906:c2d4:b0:a3c:8784:2731 with SMTP id
 ch20-20020a170906c2d400b00a3c87842731mr4916199ejb.31.1708109376689; 
 Fri, 16 Feb 2024 10:49:36 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([188.39.149.98])
 by smtp.googlemail.com with ESMTPSA id
 tj1-20020a170907c24100b00a3d1b3c5f1esm235108ejc.77.2024.02.16.10.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:49:36 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/3] drm/vc4: Add monochrome mode to the VEC.
Date: Fri, 16 Feb 2024 18:48:56 +0000
Message-Id: <20240216184857.245372-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VEC supports not producing colour bursts for monochrome output.
It also has an option for disabling the chroma input to remove
chroma from the signal.

Now that there is a DRM_MODE_TV_MODE_MONOCHROME defined, plumb
this in.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 268f18b10ee0..f9e134dd1e3b 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -234,6 +234,7 @@ enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_PAL_60,
 	VC4_VEC_TV_MODE_PAL_N,
 	VC4_VEC_TV_MODE_SECAM,
+	VC4_VEC_TV_MODE_MONOCHROME,
 };
 
 struct vc4_vec_tv_mode {
@@ -324,6 +325,22 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 		.custom_freq = 0x29c71c72,
 	},
+	{
+		/* 50Hz mono */
+		.mode = DRM_MODE_TV_MODE_MONOCHROME,
+		.expected_htotal = 864,
+		.config0 = VEC_CONFIG0_PAL_BDGHI_STD | VEC_CONFIG0_BURDIS |
+			   VEC_CONFIG0_CHRDIS,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
+	{
+		/* 60Hz mono */
+		.mode = DRM_MODE_TV_MODE_MONOCHROME,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_PAL_M_STD | VEC_CONFIG0_BURDIS |
+			   VEC_CONFIG0_CHRDIS,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
 };
 
 static inline const struct vc4_vec_tv_mode *
@@ -351,6 +368,7 @@ static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
 	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
 	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
 	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
+	{ VC4_VEC_TV_MODE_MONOCHROME, "Mono", },
 };
 
 static enum drm_connector_status
@@ -406,6 +424,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.mode = DRM_MODE_TV_MODE_SECAM;
 		break;
 
+	case VC4_VEC_TV_MODE_MONOCHROME:
+		state->tv.mode = DRM_MODE_TV_MODE_MONOCHROME;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -453,6 +475,9 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_SECAM;
 		break;
 
+	case DRM_MODE_TV_MODE_MONOCHROME:
+		return VC4_VEC_TV_MODE_MONOCHROME;
+
 	default:
 		return -EINVAL;
 	}
@@ -754,7 +779,8 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 					    BIT(DRM_MODE_TV_MODE_PAL) |
 					    BIT(DRM_MODE_TV_MODE_PAL_M) |
 					    BIT(DRM_MODE_TV_MODE_PAL_N) |
-					    BIT(DRM_MODE_TV_MODE_SECAM));
+					    BIT(DRM_MODE_TV_MODE_SECAM) |
+					    BIT(DRM_MODE_TV_MODE_MONOCHROME));
 	if (ret)
 		return ret;
 
-- 
2.25.1

