Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3919B5615
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 23:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA5010E0CE;
	Tue, 29 Oct 2024 22:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BjV1GcjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121710E6FA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:28:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f76a6f0dso5192415e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730233713; x=1730838513; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6L6eTyYBivQ5MAjtw7rdRd1Y9J6apGGXQdsuuygjqis=;
 b=BjV1GcjToLV8DMRgg2LLB7l/mJDAyxIvhfPJp9q9JRarncttbbKphFyu9y8uxk5+qy
 eR1ajatwTNPlZ98v4GGx9UHAYHM0/kF33vCtWljWjhM/s2CUKaepWZcxFAm9aEGVKCq3
 SAhIMlWfRqA1ytGW5FSPTlRB5zc0M5X7w+smY5xgD52H+NNmAZs7b9yFycspwM6857af
 BjVCuUPvqBREyxNRtZ479bCzax24rRHU+CV2JO1Uyt7Fbkhj6UNa/GPJW8t8P4dnwJ99
 fEa7gJdIfCXxaQ4dticbQlYMuNKmZ6tEivVrg6FlOX+NhvFn041QmnPJawvYQ/OULI/c
 5M4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233713; x=1730838513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6L6eTyYBivQ5MAjtw7rdRd1Y9J6apGGXQdsuuygjqis=;
 b=W0Na6Z5Zm6auDB9by2xpTgbFbpjgQYTLekATSm2U3y9vcWdH3ecanD7dR3rfvvsL3E
 lD1k6CYafNifpfpD1K2Qj/DL6npOWrgrgCjLDlLfcxlkyo4ZDxPuN2qpNACgWh5DteoH
 Xp+ggzYvbnfPx7cdGq4/8vNyMG+pjcayN5mF96EiD5av5z2xa053n0RtHSkVpQ/zfrNi
 eLNyTY0wUgqobKnGqxXcsrgiF8dW6SiVI03ilpoIOffO+xPYWvmqInilCQQ7t6mpbZFz
 RXfzOI1SmF2ynyixkNmDaaYBm90vkoKE9YLCUI5MniYexcl35/EuDqShqauQVG82+MDJ
 nTIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwb9hGmy6d1fz2k22QkK8N1BEh6p5y4sU3L0hVOHEPxr3nYVaOdfGXovwv89Vy920SiuSjnijU/RY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5CuBXk4PTJDYU80KSrYkvxAxF+OOufN5GA2eMeWpGaQ5niMd9
 9An7RVjhVT1C77gnva/H3le2mQT75hVPvVgR/JbmqZaQX94gu9o8T9kzTKDRWQpAMJ/X9Ir9jhy
 p
X-Google-Smtp-Source: AGHT+IGgnLNpPVIdbWV4iikuLNEbCMMT8fPXjEshiIqe4MTzJOwkYjfHUSeaTLvKoYCKm5mW8RceTg==
X-Received: by 2002:a05:6512:308d:b0:539:e7f8:7bf1 with SMTP id
 2adb3069b0e04-53b348b5130mr6464971e87.2.1730233711214; 
 Tue, 29 Oct 2024 13:28:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:28:24 +0200
Subject: [PATCH v2 1/3] drm/msm/dp: prefix all symbols with msm_dp_
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-msm-dp-rename-v2-1-13c5c03fad44@linaro.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
In-Reply-To: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=318116;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ImhCyCjeFZoZLaE7A9xc2xPJW6Ll9arMMcRwZzD0yb0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVsPbhrW4YzTFzqzor2iDAjC9aVOOzpkXUPF
 O1/izFKReeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1SukCACmL5ydlbr+evcrwtDffcZbOHdtpaoxUNrREl6pKXrcYUOfPt7zpmIbOr0J34VmFR+ZqKf
 II8kdCA224JFGnuI8iORW1A6Z3ezVVLnXxV9Hrgy09MN9G18cXqKXdBvP+JS+AlWpPefz2q7Y+H
 DykQXFu5erWHGAJ12ZW+64m/UzLS1mIBhDnrWut0TJu/mrQ3x7enMIJvnKEepe7SJo8wUMP27mO
 TkJX7pX7MjpzKx9WnzDZvXEvXjR6t/gNci20MK3M9FQdWLdDiAVPQK35iQooy2NeY9Gy8zkJy/b
 jVUhrDBKaOOHAGHhtad/a2GIuAw/a9HOox7W26UOWtS6Vaes
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Mailman-Approved-At: Tue, 29 Oct 2024 22:53:34 +0000
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

For historical reasons a lot of symbols in the MSM DisplayPort driver
used the generic dp_ prefix. Perform a mass-rename of those symbols to
use msm_dp prefix.

Basically this is a result of the following script:

sed drivers/gpu/drm/msm/dp/* -i -e 's/\<dp_/msm_dp_/g'
sed drivers/gpu/drm/msm/dp/* -i -e 's/"msm_dp_/"dp_/g'
sed drivers/gpu/drm/msm/dp/* -i -e 's/msm_\(dp_sdp_header\|dp_sdp\)\>/\1/g'

Yes, this also results in renaming of several struct fields in addition
to renaming the structs and functions, but I think the simple solution
is better than the more complex one.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 294 ++++++------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     | 148 +++---
 drivers/gpu/drm/msm/dp/dp_aux.h     |  18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 734 +++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 118 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 482 ++++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |  68 +--
 drivers/gpu/drm/msm/dp/dp_debug.h   |  10 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 866 ++++++++++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 108 ++---
 drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c    | 432 +++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.h    |  44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 254 +++++------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c   |  20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |   8 +-
 20 files changed, 1882 insertions(+), 1882 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index a599fc5d63c5..74e01a5dd419 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -17,281 +17,281 @@
 #include "dp_display.h"
 #include "dp_utils.h"
 
-struct dp_audio_private {
+struct msm_dp_audio_private {
 	struct platform_device *audio_pdev;
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
-	struct dp_catalog *catalog;
+	struct msm_dp_catalog *catalog;
 
 	u32 channels;
 
-	struct dp_audio dp_audio;
+	struct msm_dp_audio msm_dp_audio;
 };
 
-static u32 dp_audio_get_header(struct dp_catalog *catalog,
-		enum dp_catalog_audio_sdp_type sdp,
-		enum dp_catalog_audio_header_type header)
+static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
+		enum msm_dp_catalog_audio_sdp_type sdp,
+		enum msm_dp_catalog_audio_header_type header)
 {
-	return dp_catalog_audio_get_header(catalog, sdp, header);
+	return msm_dp_catalog_audio_get_header(catalog, sdp, header);
 }
 
-static void dp_audio_set_header(struct dp_catalog *catalog,
+static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
 		u32 data,
-		enum dp_catalog_audio_sdp_type sdp,
-		enum dp_catalog_audio_header_type header)
+		enum msm_dp_catalog_audio_sdp_type sdp,
+		enum msm_dp_catalog_audio_header_type header)
 {
-	dp_catalog_audio_set_header(catalog, sdp, header, data);
+	msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
 }
 
-static void dp_audio_stream_sdp(struct dp_audio_private *audio)
+static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 	u32 value, new_value;
 	u8 parity_byte;
 
 	/* Config header and parity byte 1 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x02;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
 
 	/* Config header and parity byte 2 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
 	new_value = value;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
 
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
 
 	/* Config header and parity byte 3 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = audio->channels - 1;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
 		value, parity_byte);
 
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
 }
 
-static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
+static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 	u32 value, new_value;
 	u8 parity_byte;
 
 	/* Config header and parity byte 1 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x1;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
 
 	/* Config header and parity byte 2 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x17;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
 
 	/* Config header and parity byte 3 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = (0x0 | (0x11 << 2));
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
 }
 
-static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
+static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 	u32 value, new_value;
 	u8 parity_byte;
 
 	/* Config header and parity byte 1 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x84;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
 
 	/* Config header and parity byte 2 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x1b;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
 
 	/* Config header and parity byte 3 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = (0x0 | (0x11 << 2));
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
 			new_value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
 }
 
-static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
+static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 	u32 value, new_value;
 	u8 parity_byte;
 
 	/* Config header and parity byte 1 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x05;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
 
 	/* Config header and parity byte 2 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x0F;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
 
 	/* Config header and parity byte 3 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = 0x0;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
 }
 
-static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
+static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 	u32 value, new_value;
 	u8 parity_byte;
 
 	/* Config header and parity byte 1 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x06;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
 
 	/* Config header and parity byte 2 */
-	value = dp_audio_get_header(catalog,
+	value = msm_dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x0F;
-	parity_byte = dp_utils_calculate_parity(new_value);
+	parity_byte = msm_dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
 			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
 			value, parity_byte);
-	dp_audio_set_header(catalog, value,
+	msm_dp_audio_set_header(catalog, value,
 		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
 }
 
-static void dp_audio_setup_sdp(struct dp_audio_private *audio)
+static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 {
-	dp_catalog_audio_config_sdp(audio->catalog);
+	msm_dp_catalog_audio_config_sdp(audio->catalog);
 
-	dp_audio_stream_sdp(audio);
-	dp_audio_timestamp_sdp(audio);
-	dp_audio_infoframe_sdp(audio);
-	dp_audio_copy_management_sdp(audio);
-	dp_audio_isrc_sdp(audio);
+	msm_dp_audio_stream_sdp(audio);
+	msm_dp_audio_timestamp_sdp(audio);
+	msm_dp_audio_infoframe_sdp(audio);
+	msm_dp_audio_copy_management_sdp(audio);
+	msm_dp_audio_isrc_sdp(audio);
 }
 
-static void dp_audio_setup_acr(struct dp_audio_private *audio)
+static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 {
 	u32 select = 0;
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 
-	switch (audio->dp_audio.bw_code) {
+	switch (audio->msm_dp_audio.bw_code) {
 	case DP_LINK_BW_1_62:
 		select = 0;
 		break;
@@ -310,15 +310,15 @@ static void dp_audio_setup_acr(struct dp_audio_private *audio)
 		break;
 	}
 
-	dp_catalog_audio_config_acr(catalog, select);
+	msm_dp_catalog_audio_config_acr(catalog, select);
 }
 
-static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
+static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 	u32 safe_to_exit_level = 0;
 
-	switch (audio->dp_audio.lane_count) {
+	switch (audio->msm_dp_audio.lane_count) {
 	case 1:
 		safe_to_exit_level = 14;
 		break;
@@ -336,49 +336,49 @@ static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
 		break;
 	}
 
-	dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
+	msm_dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
 }
 
-static void dp_audio_enable(struct dp_audio_private *audio, bool enable)
+static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
-	struct dp_catalog *catalog = audio->catalog;
+	struct msm_dp_catalog *catalog = audio->catalog;
 
-	dp_catalog_audio_enable(catalog, enable);
+	msm_dp_catalog_audio_enable(catalog, enable);
 }
 
-static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
+static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
 {
-	struct dp_audio *dp_audio;
-	struct msm_dp *dp_display;
+	struct msm_dp_audio *msm_dp_audio;
+	struct msm_dp *msm_dp_display;
 
 	if (!pdev) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-ENODEV);
 	}
 
-	dp_display = platform_get_drvdata(pdev);
-	if (!dp_display) {
+	msm_dp_display = platform_get_drvdata(pdev);
+	if (!msm_dp_display) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-ENODEV);
 	}
 
-	dp_audio = dp_display->dp_audio;
+	msm_dp_audio = msm_dp_display->msm_dp_audio;
 
-	if (!dp_audio) {
-		DRM_ERROR("invalid dp_audio data\n");
+	if (!msm_dp_audio) {
+		DRM_ERROR("invalid msm_dp_audio data\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	return container_of(dp_audio, struct dp_audio_private, dp_audio);
+	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 }
 
-static int dp_audio_hook_plugged_cb(struct device *dev, void *data,
+static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
 		hdmi_codec_plugged_cb fn,
 		struct device *codec_dev)
 {
 
 	struct platform_device *pdev;
-	struct msm_dp *dp_display;
+	struct msm_dp *msm_dp_display;
 
 	pdev = to_platform_device(dev);
 	if (!pdev) {
@@ -386,20 +386,20 @@ static int dp_audio_hook_plugged_cb(struct device *dev, void *data,
 		return -ENODEV;
 	}
 
-	dp_display = platform_get_drvdata(pdev);
-	if (!dp_display) {
+	msm_dp_display = platform_get_drvdata(pdev);
+	if (!msm_dp_display) {
 		pr_err("invalid input\n");
 		return -ENODEV;
 	}
 
-	return dp_display_set_plugged_cb(dp_display, fn, codec_dev);
+	return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
 }
 
-static int dp_audio_get_eld(struct device *dev,
+static int msm_dp_audio_get_eld(struct device *dev,
 	void *data, uint8_t *buf, size_t len)
 {
 	struct platform_device *pdev;
-	struct msm_dp *dp_display;
+	struct msm_dp *msm_dp_display;
 
 	pdev = to_platform_device(dev);
 
@@ -408,30 +408,30 @@ static int dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
-	dp_display = platform_get_drvdata(pdev);
-	if (!dp_display) {
+	msm_dp_display = platform_get_drvdata(pdev);
+	if (!msm_dp_display) {
 		DRM_ERROR("invalid input\n");
 		return -ENODEV;
 	}
 
-	memcpy(buf, dp_display->connector->eld,
-		min(sizeof(dp_display->connector->eld), len));
+	memcpy(buf, msm_dp_display->connector->eld,
+		min(sizeof(msm_dp_display->connector->eld), len));
 
 	return 0;
 }
 
-int dp_audio_hw_params(struct device *dev,
+int msm_dp_audio_hw_params(struct device *dev,
 	void *data,
 	struct hdmi_codec_daifmt *daifmt,
 	struct hdmi_codec_params *params)
 {
 	int rc = 0;
-	struct dp_audio_private *audio;
+	struct msm_dp_audio_private *audio;
 	struct platform_device *pdev;
-	struct msm_dp *dp_display;
+	struct msm_dp *msm_dp_display;
 
 	pdev = to_platform_device(dev);
-	dp_display = platform_get_drvdata(pdev);
+	msm_dp_display = platform_get_drvdata(pdev);
 
 	/*
 	 * there could be cases where sound card can be opened even
@@ -441,12 +441,12 @@ int dp_audio_hw_params(struct device *dev,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!dp_display->power_on) {
+	if (!msm_dp_display->power_on) {
 		rc = -EINVAL;
 		goto end;
 	}
 
-	audio = dp_audio_get_data(pdev);
+	audio = msm_dp_audio_get_data(pdev);
 	if (IS_ERR(audio)) {
 		rc = PTR_ERR(audio);
 		goto end;
@@ -454,26 +454,26 @@ int dp_audio_hw_params(struct device *dev,
 
 	audio->channels = params->channels;
 
-	dp_audio_setup_sdp(audio);
-	dp_audio_setup_acr(audio);
-	dp_audio_safe_to_exit_level(audio);
-	dp_audio_enable(audio, true);
-	dp_display_signal_audio_start(dp_display);
-	dp_display->audio_enabled = true;
+	msm_dp_audio_setup_sdp(audio);
+	msm_dp_audio_setup_acr(audio);
+	msm_dp_audio_safe_to_exit_level(audio);
+	msm_dp_audio_enable(audio, true);
+	msm_dp_display_signal_audio_start(msm_dp_display);
+	msm_dp_display->audio_enabled = true;
 
 end:
 	return rc;
 }
 
-static void dp_audio_shutdown(struct device *dev, void *data)
+static void msm_dp_audio_shutdown(struct device *dev, void *data)
 {
-	struct dp_audio_private *audio;
+	struct msm_dp_audio_private *audio;
 	struct platform_device *pdev;
-	struct msm_dp *dp_display;
+	struct msm_dp *msm_dp_display;
 
 	pdev = to_platform_device(dev);
-	dp_display = platform_get_drvdata(pdev);
-	audio = dp_audio_get_data(pdev);
+	msm_dp_display = platform_get_drvdata(pdev);
+	audio = msm_dp_audio_get_data(pdev);
 	if (IS_ERR(audio)) {
 		DRM_ERROR("failed to get audio data\n");
 		return;
@@ -487,32 +487,32 @@ static void dp_audio_shutdown(struct device *dev, void *data)
 	 * connected. is_connected cannot be used here as its set
 	 * to false earlier than this call
 	 */
-	if (!dp_display->audio_enabled)
+	if (!msm_dp_display->audio_enabled)
 		return;
 
-	dp_audio_enable(audio, false);
+	msm_dp_audio_enable(audio, false);
 	/* signal the dp display to safely shutdown clocks */
-	dp_display_signal_audio_complete(dp_display);
+	msm_dp_display_signal_audio_complete(msm_dp_display);
 }
 
-static const struct hdmi_codec_ops dp_audio_codec_ops = {
-	.hw_params = dp_audio_hw_params,
-	.audio_shutdown = dp_audio_shutdown,
-	.get_eld = dp_audio_get_eld,
-	.hook_plugged_cb = dp_audio_hook_plugged_cb,
+static const struct hdmi_codec_ops msm_dp_audio_codec_ops = {
+	.hw_params = msm_dp_audio_hw_params,
+	.audio_shutdown = msm_dp_audio_shutdown,
+	.get_eld = msm_dp_audio_get_eld,
+	.hook_plugged_cb = msm_dp_audio_hook_plugged_cb,
 };
 
 static struct hdmi_codec_pdata codec_data = {
-	.ops = &dp_audio_codec_ops,
+	.ops = &msm_dp_audio_codec_ops,
 	.max_i2s_channels = 8,
 	.i2s = 1,
 };
 
-void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio)
+void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio)
 {
-	struct dp_audio_private *audio_priv;
+	struct msm_dp_audio_private *audio_priv;
 
-	audio_priv = container_of(dp_audio, struct dp_audio_private, dp_audio);
+	audio_priv = container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 
 	if (audio_priv->audio_pdev) {
 		platform_device_unregister(audio_priv->audio_pdev);
@@ -520,13 +520,13 @@ void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio)
 	}
 }
 
-int dp_register_audio_driver(struct device *dev,
-		struct dp_audio *dp_audio)
+int msm_dp_register_audio_driver(struct device *dev,
+		struct msm_dp_audio *msm_dp_audio)
 {
-	struct dp_audio_private *audio_priv;
+	struct msm_dp_audio_private *audio_priv;
 
-	audio_priv = container_of(dp_audio,
-			struct dp_audio_private, dp_audio);
+	audio_priv = container_of(msm_dp_audio,
+			struct msm_dp_audio_private, msm_dp_audio);
 
 	audio_priv->audio_pdev = platform_device_register_data(dev,
 						HDMI_CODEC_DRV_NAME,
@@ -536,13 +536,13 @@ int dp_register_audio_driver(struct device *dev,
 	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
 }
 
-struct dp_audio *dp_audio_get(struct platform_device *pdev,
-			struct dp_panel *panel,
-			struct dp_catalog *catalog)
+struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
+			struct msm_dp_panel *panel,
+			struct msm_dp_catalog *catalog)
 {
 	int rc = 0;
-	struct dp_audio_private *audio;
-	struct dp_audio *dp_audio;
+	struct msm_dp_audio_private *audio;
+	struct msm_dp_audio *msm_dp_audio;
 
 	if (!pdev || !panel || !catalog) {
 		DRM_ERROR("invalid input\n");
@@ -559,23 +559,23 @@ struct dp_audio *dp_audio_get(struct platform_device *pdev,
 	audio->pdev = pdev;
 	audio->catalog = catalog;
 
-	dp_audio = &audio->dp_audio;
+	msm_dp_audio = &audio->msm_dp_audio;
 
-	dp_catalog_audio_init(catalog);
+	msm_dp_catalog_audio_init(catalog);
 
-	return dp_audio;
+	return msm_dp_audio;
 error:
 	return ERR_PTR(rc);
 }
 
-void dp_audio_put(struct dp_audio *dp_audio)
+void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio)
 {
-	struct dp_audio_private *audio;
+	struct msm_dp_audio_private *audio;
 
-	if (!dp_audio)
+	if (!msm_dp_audio)
 		return;
 
-	audio = container_of(dp_audio, struct dp_audio_private, dp_audio);
+	audio = container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 
 	devm_kfree(&audio->pdev->dev, audio);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index 4ab78880af82..1c9efaaa40e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -13,58 +13,58 @@
 #include <sound/hdmi-codec.h>
 
 /**
- * struct dp_audio
+ * struct msm_dp_audio
  * @lane_count: number of lanes configured in current session
  * @bw_code: link rate's bandwidth code for current session
  */
-struct dp_audio {
+struct msm_dp_audio {
 	u32 lane_count;
 	u32 bw_code;
 };
 
 /**
- * dp_audio_get()
+ * msm_dp_audio_get()
  *
  * Creates and instance of dp audio.
  *
  * @pdev: caller's platform device instance.
- * @panel: an instance of dp_panel module.
- * @catalog: an instance of dp_catalog module.
+ * @panel: an instance of msm_dp_panel module.
+ * @catalog: an instance of msm_dp_catalog module.
  *
  * Returns the error code in case of failure, otherwize
- * an instance of newly created dp_module.
+ * an instance of newly created msm_dp_module.
  */
-struct dp_audio *dp_audio_get(struct platform_device *pdev,
-			struct dp_panel *panel,
-			struct dp_catalog *catalog);
+struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
+			struct msm_dp_panel *panel,
+			struct msm_dp_catalog *catalog);
 
 /**
- * dp_register_audio_driver()
+ * msm_dp_register_audio_driver()
  *
  * Registers DP device with hdmi_codec interface.
  *
  * @dev: DP device instance.
- * @dp_audio: an instance of dp_audio module.
+ * @msm_dp_audio: an instance of msm_dp_audio module.
  *
  *
  * Returns the error code in case of failure, otherwise
  * zero on success.
  */
-int dp_register_audio_driver(struct device *dev,
-		struct dp_audio *dp_audio);
+int msm_dp_register_audio_driver(struct device *dev,
+		struct msm_dp_audio *msm_dp_audio);
 
-void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio);
+void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio);
 
 /**
- * dp_audio_put()
+ * msm_dp_audio_put()
  *
- * Cleans the dp_audio instance.
+ * Cleans the msm_dp_audio instance.
  *
- * @dp_audio: an instance of dp_audio.
+ * @msm_dp_audio: an instance of msm_dp_audio.
  */
-void dp_audio_put(struct dp_audio *dp_audio);
+void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
 
-int dp_audio_hw_params(struct device *dev,
+int msm_dp_audio_hw_params(struct device *dev,
 	void *data,
 	struct hdmi_codec_daifmt *daifmt,
 	struct hdmi_codec_params *params);
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 00dfafbebe0e..bc8d46abfc61 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -20,9 +20,9 @@ enum msm_dp_aux_err {
 	DP_AUX_ERR_PHY,
 };
 
-struct dp_aux_private {
+struct msm_dp_aux_private {
 	struct device *dev;
-	struct dp_catalog *catalog;
+	struct msm_dp_catalog *catalog;
 
 	struct phy *phy;
 
@@ -42,12 +42,12 @@ struct dp_aux_private {
 	u32 offset;
 	u32 segment;
 
-	struct drm_dp_aux dp_aux;
+	struct drm_dp_aux msm_dp_aux;
 };
 
 #define MAX_AUX_RETRIES			5
 
-static ssize_t dp_aux_write(struct dp_aux_private *aux,
+static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 			struct drm_dp_aux_msg *msg)
 {
 	u8 data[4];
@@ -88,11 +88,11 @@ static ssize_t dp_aux_write(struct dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		dp_catalog_aux_write_data(aux->catalog, reg);
+		msm_dp_catalog_aux_write_data(aux->catalog, reg);
 	}
 
-	dp_catalog_aux_clear_trans(aux->catalog, false);
-	dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	msm_dp_catalog_aux_clear_trans(aux->catalog, false);
+	msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
 
 	reg = 0; /* Transaction number == 1 */
 	if (!aux->native) { /* i2c */
@@ -106,12 +106,12 @@ static ssize_t dp_aux_write(struct dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	dp_catalog_aux_write_trans(aux->catalog, reg);
+	msm_dp_catalog_aux_write_trans(aux->catalog, reg);
 
 	return len;
 }
 
-static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
+static ssize_t msm_dp_aux_cmd_fifo_tx(struct msm_dp_aux_private *aux,
 			      struct drm_dp_aux_msg *msg)
 {
 	ssize_t ret;
@@ -119,7 +119,7 @@ static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
 
 	reinit_completion(&aux->comp);
 
-	ret = dp_aux_write(aux, msg);
+	ret = msm_dp_aux_write(aux, msg);
 	if (ret < 0)
 		return ret;
 
@@ -131,7 +131,7 @@ static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
 	return ret;
 }
 
-static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
+static ssize_t msm_dp_aux_cmd_fifo_rx(struct msm_dp_aux_private *aux,
 		struct drm_dp_aux_msg *msg)
 {
 	u32 data;
@@ -139,20 +139,20 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	u32 i, actual_i;
 	u32 len = msg->size;
 
-	dp_catalog_aux_clear_trans(aux->catalog, true);
+	msm_dp_catalog_aux_clear_trans(aux->catalog, true);
 
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	dp_catalog_aux_write_data(aux->catalog, data);
+	msm_dp_catalog_aux_write_data(aux->catalog, data);
 
 	dp = msg->buffer;
 
 	/* discard first byte */
-	data = dp_catalog_aux_read_data(aux->catalog);
+	data = msm_dp_catalog_aux_read_data(aux->catalog);
 
 	for (i = 0; i < len; i++) {
-		data = dp_catalog_aux_read_data(aux->catalog);
+		data = msm_dp_catalog_aux_read_data(aux->catalog);
 		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
@@ -163,7 +163,7 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	return i;
 }
 
-static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
+static void msm_dp_aux_update_offset_and_segment(struct msm_dp_aux_private *aux,
 					     struct drm_dp_aux_msg *input_msg)
 {
 	u32 edid_address = 0x50;
@@ -185,7 +185,7 @@ static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
 }
 
 /**
- * dp_aux_transfer_helper() - helper function for EDID read transactions
+ * msm_dp_aux_transfer_helper() - helper function for EDID read transactions
  *
  * @aux: DP AUX private structure
  * @input_msg: input message from DRM upstream APIs
@@ -196,7 +196,7 @@ static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
  * This helper function is used to fix EDID reads for non-compliant
  * sinks that do not handle the i2c middle-of-transaction flag correctly.
  */
-static void dp_aux_transfer_helper(struct dp_aux_private *aux,
+static void msm_dp_aux_transfer_helper(struct msm_dp_aux_private *aux,
 				   struct drm_dp_aux_msg *input_msg,
 				   bool send_seg)
 {
@@ -238,7 +238,7 @@ static void dp_aux_transfer_helper(struct dp_aux_private *aux,
 		helper_msg.address = segment_address;
 		helper_msg.buffer = &aux->segment;
 		helper_msg.size = 1;
-		dp_aux_cmd_fifo_tx(aux, &helper_msg);
+		msm_dp_aux_cmd_fifo_tx(aux, &helper_msg);
 	}
 
 	/*
@@ -252,7 +252,7 @@ static void dp_aux_transfer_helper(struct dp_aux_private *aux,
 	helper_msg.address = input_msg->address;
 	helper_msg.buffer = &aux->offset;
 	helper_msg.size = 1;
-	dp_aux_cmd_fifo_tx(aux, &helper_msg);
+	msm_dp_aux_cmd_fifo_tx(aux, &helper_msg);
 
 end:
 	aux->offset += message_size;
@@ -265,15 +265,15 @@ static void dp_aux_transfer_helper(struct dp_aux_private *aux,
  * It will call aux_reset() function to reset the AUX channel,
  * if the waiting is timeout.
  */
-static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
+static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 			       struct drm_dp_aux_msg *msg)
 {
 	ssize_t ret;
 	int const aux_cmd_native_max = 16;
 	int const aux_cmd_i2c_max = 128;
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
 
@@ -292,7 +292,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		return -EINVAL;
 	}
 
-	ret = pm_runtime_resume_and_get(dp_aux->dev);
+	ret = pm_runtime_resume_and_get(msm_dp_aux->dev);
 	if (ret)
 		return  ret;
 
@@ -313,8 +313,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		goto exit;
 	}
 
-	dp_aux_update_offset_and_segment(aux, msg);
-	dp_aux_transfer_helper(aux, msg, true);
+	msm_dp_aux_update_offset_and_segment(aux, msg);
+	msm_dp_aux_transfer_helper(aux, msg, true);
 
 	aux->read = msg->request & (DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
 	aux->cmd_busy = true;
@@ -327,7 +327,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		aux->no_send_stop = true;
 	}
 
-	ret = dp_aux_cmd_fifo_tx(aux, msg);
+	ret = msm_dp_aux_cmd_fifo_tx(aux, msg);
 	if (ret < 0) {
 		if (aux->native) {
 			aux->retry_cnt++;
@@ -335,14 +335,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
-		if (dp_catalog_link_is_connected(aux->catalog))
-			dp_catalog_aux_reset(aux->catalog);
+		if (msm_dp_catalog_link_is_connected(aux->catalog))
+			msm_dp_catalog_aux_reset(aux->catalog);
 	} else {
 		aux->retry_cnt = 0;
 		switch (aux->aux_error_num) {
 		case DP_AUX_ERR_NONE:
 			if (aux->read)
-				ret = dp_aux_cmd_fifo_rx(aux, msg);
+				ret = msm_dp_aux_cmd_fifo_rx(aux, msg);
 			msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
 			break;
 		case DP_AUX_ERR_DEFER:
@@ -364,24 +364,24 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 
 exit:
 	mutex_unlock(&aux->mutex);
-	pm_runtime_put_sync(dp_aux->dev);
+	pm_runtime_put_sync(msm_dp_aux->dev);
 
 	return ret;
 }
 
-irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 {
 	u32 isr;
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	if (!dp_aux) {
+	if (!msm_dp_aux) {
 		DRM_ERROR("invalid input\n");
 		return IRQ_NONE;
 	}
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
-	isr = dp_catalog_aux_get_irq(aux->catalog);
+	isr = msm_dp_catalog_aux_get_irq(aux->catalog);
 
 	/* no interrupts pending, return immediately */
 	if (!isr)
@@ -403,7 +403,7 @@ irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
-		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
 	} else if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
 	} else if (isr & DP_INTR_WRONG_ADDR) {
@@ -429,68 +429,68 @@ irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
 	return IRQ_HANDLED;
 }
 
-void dp_aux_enable_xfers(struct drm_dp_aux *dp_aux, bool enabled)
+void msm_dp_aux_enable_xfers(struct drm_dp_aux *msm_dp_aux, bool enabled)
 {
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 	aux->enable_xfers = enabled;
 }
 
-void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
+void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux)
 {
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	phy_calibrate(aux->phy);
-	dp_catalog_aux_reset(aux->catalog);
+	msm_dp_catalog_aux_reset(aux->catalog);
 }
 
-void dp_aux_init(struct drm_dp_aux *dp_aux)
+void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
 {
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	if (!dp_aux) {
+	if (!msm_dp_aux) {
 		DRM_ERROR("invalid input\n");
 		return;
 	}
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	mutex_lock(&aux->mutex);
 
-	dp_catalog_aux_enable(aux->catalog, true);
+	msm_dp_catalog_aux_enable(aux->catalog, true);
 	aux->retry_cnt = 0;
 	aux->initted = true;
 
 	mutex_unlock(&aux->mutex);
 }
 
-void dp_aux_deinit(struct drm_dp_aux *dp_aux)
+void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux)
 {
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	mutex_lock(&aux->mutex);
 
 	aux->initted = false;
-	dp_catalog_aux_enable(aux->catalog, false);
+	msm_dp_catalog_aux_enable(aux->catalog, false);
 
 	mutex_unlock(&aux->mutex);
 }
 
-int dp_aux_register(struct drm_dp_aux *dp_aux)
+int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux)
 {
 	int ret;
 
-	if (!dp_aux) {
+	if (!msm_dp_aux) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	ret = drm_dp_aux_register(dp_aux);
+	ret = drm_dp_aux_register(msm_dp_aux);
 	if (ret) {
 		DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
 				ret);
@@ -500,34 +500,34 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
 	return 0;
 }
 
-void dp_aux_unregister(struct drm_dp_aux *dp_aux)
+void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux)
 {
-	drm_dp_aux_unregister(dp_aux);
+	drm_dp_aux_unregister(msm_dp_aux);
 }
 
-static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
+static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 				 unsigned long wait_us)
 {
 	int ret;
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	ret = pm_runtime_resume_and_get(aux->dev);
 	if (ret)
 		return ret;
 
-	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
+	ret = msm_dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
 }
 
-struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
 			      struct phy *phy,
 			      bool is_edp)
 {
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
 	if (!catalog) {
 		DRM_ERROR("invalid input\n");
@@ -553,23 +553,23 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 	 * before registering AUX with the DRM device so that
 	 * msm eDP panel can be detected by generic_dep_panel_probe().
 	 */
-	aux->dp_aux.name = "dpu_dp_aux";
-	aux->dp_aux.dev = dev;
-	aux->dp_aux.transfer = dp_aux_transfer;
-	aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
-	drm_dp_aux_init(&aux->dp_aux);
+	aux->msm_dp_aux.name = "dpu_dp_aux";
+	aux->msm_dp_aux.dev = dev;
+	aux->msm_dp_aux.transfer = msm_dp_aux_transfer;
+	aux->msm_dp_aux.wait_hpd_asserted = msm_dp_wait_hpd_asserted;
+	drm_dp_aux_init(&aux->msm_dp_aux);
 
-	return &aux->dp_aux;
+	return &aux->msm_dp_aux;
 }
 
-void dp_aux_put(struct drm_dp_aux *dp_aux)
+void msm_dp_aux_put(struct drm_dp_aux *msm_dp_aux)
 {
-	struct dp_aux_private *aux;
+	struct msm_dp_aux_private *aux;
 
-	if (!dp_aux)
+	if (!msm_dp_aux)
 		return;
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	mutex_destroy(&aux->mutex);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 4f65e892a807..39c5b4c8596a 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -9,18 +9,18 @@
 #include "dp_catalog.h"
 #include <drm/display/drm_dp_helper.h>
 
-int dp_aux_register(struct drm_dp_aux *dp_aux);
-void dp_aux_unregister(struct drm_dp_aux *dp_aux);
-irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
-void dp_aux_enable_xfers(struct drm_dp_aux *dp_aux, bool enabled);
-void dp_aux_init(struct drm_dp_aux *dp_aux);
-void dp_aux_deinit(struct drm_dp_aux *dp_aux);
-void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
+int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_enable_xfers(struct drm_dp_aux *msm_dp_aux, bool enabled);
+void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux);
 
 struct phy;
-struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
 			      struct phy *phy,
 			      bool is_edp);
-void dp_aux_put(struct drm_dp_aux *aux);
+void msm_dp_aux_put(struct drm_dp_aux *aux);
 
 #endif /*__DP_AUX_H_*/
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6e55cbf69674..b4c8856fb25d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -75,18 +75,18 @@ struct dss_io_data {
 	struct dss_io_region p0;
 };
 
-struct dp_catalog_private {
+struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
 	struct dss_io_data io;
 	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
-	struct dp_catalog dp_catalog;
+	struct msm_dp_catalog msm_dp_catalog;
 };
 
-void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state)
+void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-			struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+			struct msm_dp_catalog_private, msm_dp_catalog);
 	struct dss_io_data *dss = &catalog->io;
 
 	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
@@ -95,12 +95,12 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
 }
 
-static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
 {
 	return readl_relaxed(catalog->io.aux.base + offset);
 }
 
-static inline void dp_write_aux(struct dp_catalog_private *catalog,
+static inline void msm_dp_write_aux(struct msm_dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
 	/*
@@ -110,12 +110,12 @@ static inline void dp_write_aux(struct dp_catalog_private *catalog,
 	writel(data, catalog->io.aux.base + offset);
 }
 
-static inline u32 dp_read_ahb(const struct dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog_private *catalog, u32 offset)
 {
 	return readl_relaxed(catalog->io.ahb.base + offset);
 }
 
-static inline void dp_write_ahb(struct dp_catalog_private *catalog,
+static inline void msm_dp_write_ahb(struct msm_dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
 	/*
@@ -125,7 +125,7 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 	writel(data, catalog->io.ahb.base + offset);
 }
 
-static inline void dp_write_p0(struct dp_catalog_private *catalog,
+static inline void msm_dp_write_p0(struct msm_dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
 	/*
@@ -135,7 +135,7 @@ static inline void dp_write_p0(struct dp_catalog_private *catalog,
 	writel(data, catalog->io.p0.base + offset);
 }
 
-static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
 			       u32 offset)
 {
 	/*
@@ -145,12 +145,12 @@ static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
 	return readl_relaxed(catalog->io.p0.base + offset);
 }
 
-static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
 {
 	return readl_relaxed(catalog->io.link.base + offset);
 }
 
-static inline void dp_write_link(struct dp_catalog_private *catalog,
+static inline void msm_dp_write_link(struct msm_dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
 	/*
@@ -161,64 +161,64 @@ static inline void dp_write_link(struct dp_catalog_private *catalog,
 }
 
 /* aux related catalog functions */
-u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	return dp_read_aux(catalog, REG_DP_AUX_DATA);
+	return msm_dp_read_aux(catalog, REG_DP_AUX_DATA);
 }
 
-int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog, u32 data)
+int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_write_aux(catalog, REG_DP_AUX_DATA, data);
+	msm_dp_write_aux(catalog, REG_DP_AUX_DATA, data);
 	return 0;
 }
 
-int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog, u32 data)
+int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+	msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
 	return 0;
 }
 
-int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read)
+int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read)
 {
 	u32 data;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	if (read) {
-		data = dp_read_aux(catalog, REG_DP_AUX_TRANS_CTRL);
+		data = msm_dp_read_aux(catalog, REG_DP_AUX_TRANS_CTRL);
 		data &= ~DP_AUX_TRANS_CTRL_GO;
-		dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+		msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
 	} else {
-		dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, 0);
+		msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, 0);
 	}
 	return 0;
 }
 
-int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
+int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_read_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+	msm_dp_read_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
 	return 0;
 }
 
 /**
- * dp_catalog_aux_reset() - reset AUX controller
+ * msm_dp_catalog_aux_reset() - reset AUX controller
  *
- * @dp_catalog: DP catalog structure
+ * @msm_dp_catalog: DP catalog structure
  *
  * return: void
  *
@@ -227,47 +227,47 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
  * NOTE: reset AUX controller will also clear any pending HPD related interrupts
  * 
  */
-void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 aux_ctrl;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	aux_ctrl = dp_read_aux(catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(catalog, REG_DP_AUX_CTRL);
 
 	aux_ctrl |= DP_AUX_CTRL_RESET;
-	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
+void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
 {
 	u32 aux_ctrl;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	aux_ctrl = dp_read_aux(catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(catalog, REG_DP_AUX_CTRL);
 
 	if (enable) {
-		dp_write_aux(catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-		dp_write_aux(catalog, REG_DP_AUX_LIMITS, 0xffff);
+		msm_dp_write_aux(catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+		msm_dp_write_aux(catalog, REG_DP_AUX_LIMITS, 0xffff);
 		aux_ctrl |= DP_AUX_CTRL_ENABLE;
 	} else {
 		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
 	}
 
-	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
 					      unsigned long wait_us)
 {
 	u32 state;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	/* poll for hpd connected status every 2ms and timeout after wait_us */
 	return readl_poll_timeout(catalog->io.aux.base +
@@ -294,10 +294,10 @@ static void dump_regs(void __iomem *base, int len)
 	}
 }
 
-void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_dump_regs(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 	struct dss_io_data *io = &catalog->io;
 
 	pr_info("AHB regs\n");
@@ -313,17 +313,17 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 	dump_regs(io->p0.base, io->p0.len);
 }
 
-u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS);
+	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS);
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	dp_write_ahb(catalog, REG_DP_INTR_STATUS, intr_ack |
+	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, intr_ack |
 			DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
@@ -331,40 +331,40 @@ u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
 }
 
 /* controller related catalog functions */
-void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
-				u32 dp_tu, u32 valid_boundary,
+void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
+				u32 msm_dp_tu, u32 valid_boundary,
 				u32 valid_boundary2)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_write_link(catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	dp_write_link(catalog, REG_DP_TU, dp_tu);
-	dp_write_link(catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
+	msm_dp_write_link(catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(catalog, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
-void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state)
+void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_write_link(catalog, REG_DP_STATE_CTRL, state);
+	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, state);
 }
 
-void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 cfg)
+void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 cfg)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
 
-	dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
+	msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
 }
 
-void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
 	u32 ln_mapping;
 
@@ -373,71 +373,71 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
 	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
 	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
 
-	dp_write_link(catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+	msm_dp_write_link(catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
 }
 
-void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
 	u32 val;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	val = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
 	if (enable)
 		val |= DP_MAINLINK_CTRL_ENABLE;
 	else
 		val &= ~DP_MAINLINK_CTRL_ENABLE;
 
-	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
 }
 
-void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
 	u32 mainlink_ctrl;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	drm_dbg_dp(catalog->drm_dev, "enable=%d\n", enable);
 	if (enable) {
 		/*
 		 * To make sure link reg writes happens before other operation,
-		 * dp_write_link() function uses writel()
+		 * msm_dp_write_link() function uses writel()
 		 */
-		mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
 		mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
 						DP_MAINLINK_CTRL_ENABLE);
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
 					DP_MAINLINK_FB_BOUNDARY_SEL);
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	} else {
-		mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	}
 }
 
-void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 					u32 colorimetry_cfg,
 					u32 test_bits_depth)
 {
 	u32 misc_val;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	misc_val = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -447,27 +447,27 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
 }
 
-void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 mainlink_ctrl, hw_revision;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = dp_catalog_hw_revision(dp_catalog);
+	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
 	if (hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
 
-	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
-void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 					u32 rate, u32 stream_rate_khz,
 					bool is_ycbcr_420)
 {
@@ -478,8 +478,8 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 	u32 const link_rate_hbr3 = 810000;
 	unsigned long den, num;
 
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	if (rate == link_rate_hbr3)
 		pixel_div = 6;
@@ -522,22 +522,22 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 		nvid *= 3;
 
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
-	dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
-int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
+int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
 					u32 state_bit)
 {
 	int bit, ret;
 	u32 data;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	bit = BIT(state_bit - 1);
 	drm_dbg_dp(catalog->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
-	dp_catalog_ctrl_state_ctrl(dp_catalog, bit);
+	msm_dp_catalog_ctrl_state_ctrl(msm_dp_catalog, bit);
 
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
@@ -554,25 +554,25 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
 }
 
 /**
- * dp_catalog_hw_revision() - retrieve DP hw revision
+ * msm_dp_catalog_hw_revision() - retrieve DP hw revision
  *
- * @dp_catalog: DP catalog structure
+ * @msm_dp_catalog: DP catalog structure
  *
  * Return: DP controller hw revision
  *
  */
-u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
 {
-	const struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
+	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 /**
- * dp_catalog_ctrl_reset() - reset DP controller
+ * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
- * @dp_catalog: DP catalog structure
+ * @msm_dp_catalog: DP catalog structure
  *
  * return: void
  *
@@ -581,28 +581,28 @@ u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
  * NOTE: reset DP controller will also clear any pending HPD related interrupts
  * 
  */
-void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 sw_reset;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	sw_reset = dp_read_ahb(catalog, REG_DP_SW_RESET);
+	sw_reset = msm_dp_read_ahb(catalog, REG_DP_SW_RESET);
 
 	sw_reset |= DP_SW_RESET;
-	dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	sw_reset &= ~DP_SW_RESET;
-	dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
 }
 
-bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
+bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 data;
 	int ret;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	/* Poll for mainlink ready status */
 	ret = readl_poll_timeout(catalog->io.link.base +
@@ -617,96 +617,96 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
 	return true;
 }
 
-void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	if (enable) {
-		dp_write_ahb(catalog, REG_DP_INTR_STATUS,
+		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS,
 				DP_INTERRUPT_STATUS1_MASK);
-		dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
 				DP_INTERRUPT_STATUS2_MASK);
 	} else {
-		dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
-		dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
+		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
+		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
 	}
 }
 
-void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
 			u32 intr_mask, bool en)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	u32 config = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+	u32 config = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
 
 	config = (en ? config | intr_mask : config & ~intr_mask);
 
 	drm_dbg_dp(catalog->drm_dev, "intr_mask=%#x config=%#x\n",
 					intr_mask, config);
-	dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
 				config & DP_DP_HPD_INT_MASK);
 }
 
-void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 reftimer = msm_dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
 
 	/* Configure REFTIMER and enable it */
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
-	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+	msm_dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
 	/* Enable HPD */
-	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+	msm_dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
-void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 reftimer = msm_dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
 
 	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+	msm_dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
-	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
+	msm_dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
 }
 
-static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
+static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog_private *catalog)
 {
 	/* trigger sdp */
-	dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
 }
 
-void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 config;
 
 	/* enable PSR1 function */
-	config = dp_read_link(catalog, REG_PSR_CONFIG);
+	config = msm_dp_read_link(catalog, REG_PSR_CONFIG);
 	config |= PSR1_SUPPORTED;
-	dp_write_link(catalog, REG_PSR_CONFIG, config);
+	msm_dp_write_link(catalog, REG_PSR_CONFIG, config);
 
-	dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-	dp_catalog_enable_sdp(catalog);
+	msm_dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	msm_dp_catalog_enable_sdp(catalog);
 }
 
-void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter)
+void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-			struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+			struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 cmd;
 
-	cmd = dp_read_link(catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(catalog, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 
@@ -715,17 +715,17 @@ void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter)
 	else
 		cmd |= PSR_EXIT;
 
-	dp_catalog_enable_sdp(catalog);
-	dp_write_link(catalog, REG_PSR_CMD, cmd);
+	msm_dp_catalog_enable_sdp(catalog);
+	msm_dp_write_link(catalog, REG_PSR_CMD, cmd);
 }
 
-u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 status;
 
-	status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	status = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
 	drm_dbg_dp(catalog->drm_dev, "aux status: %#x\n", status);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
@@ -733,16 +733,16 @@ u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
 	return status;
 }
 
-u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	int isr, mask;
 
-	isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
-	dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
+	isr = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
 				 (isr & DP_DP_HPD_INT_MASK));
-	mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+	mask = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
 
 	/*
 	 * We only want to return interrupts that are unmasked to the caller.
@@ -754,115 +754,115 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
 	return isr & (mask | ~DP_DP_HPD_INT_MASK);
 }
 
-u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
+	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
 	intr_ack = (intr & DP_INTERRUPT_STATUS4)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
+	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
 
 	return intr;
 }
 
-int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
+int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS2);
+	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS2);
 	intr &= ~DP_INTERRUPT_STATUS2_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS2)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
 			intr_ack | DP_INTERRUPT_STATUS2_MASK);
 
 	return intr;
 }
 
-void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_write_ahb(catalog, REG_DP_PHY_CTRL,
+	msm_dp_write_ahb(catalog, REG_DP_PHY_CTRL,
 			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
-	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
+	msm_dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
-void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 			u32 pattern)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 value = 0x0;
 
 	/* Make sure to clear the current pattern before starting a new one */
-	dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
+	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
 
 	drm_dbg_dp(catalog->drm_dev, "pattern: %#x\n", pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
-		dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
 		break;
 	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
 		value &= ~(1 << 16);
-		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
-		dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
 		break;
 	case DP_PHY_TEST_PATTERN_PRBS7:
-		dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_PRBS7);
 		break;
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
-		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
 				0x3E0F83E0);
 		/* 00001111100000111110000011111000 */
-		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
 				0x0F83E0F8);
 		/* 1111100000111110 */
-		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 				0x0000F83E);
 		break;
 	case DP_PHY_TEST_PATTERN_CP2520:
-		value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
 
 		value = DP_HBR2_ERM_PATTERN;
-		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 				value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
-		dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 		value |= DP_MAINLINK_CTRL_ENABLE;
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
 		break;
 	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
 				DP_MAINLINK_CTRL_ENABLE);
-		dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
 		break;
 	default:
@@ -872,94 +872,94 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 	}
 }
 
-u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
+u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	return dp_read_link(catalog, REG_DP_MAINLINK_READY);
+	return msm_dp_read_link(catalog, REG_DP_MAINLINK_READY);
 }
 
 /* panel related catalog functions */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 dp_active)
+int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
+				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 reg;
 
-	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
-	dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_active);
+	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
 
-	if (dp_catalog->wide_bus_en)
+	if (msm_dp_catalog->wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
 		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
 
 
-	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", dp_catalog->wide_bus_en, reg);
+	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
 
-	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
-static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp)
+static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 header[2];
 	u32 val;
 	int i;
 
-	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
+	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
-	dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
 	}
 }
 
-static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
+static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 hw_revision;
 
-	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	hw_revision = dp_catalog_hw_revision(dp_catalog);
+	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
 	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
-		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
-		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
 }
 
-void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp)
+void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 cfg, cfg2, misc;
 
-	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
 
 	cfg |= GEN0_SDP_EN;
-	dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
 
-	dp_catalog_panel_send_vsc_sdp(dp_catalog, vsc_sdp);
+	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
 
 	/* indicates presence of VSC (BIT(6) of MISC1) */
 	misc |= DP_MISC1_VSC_SDP;
@@ -967,27 +967,27 @@ void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sd
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
 
-	dp_catalog_panel_update_sdp(dp_catalog);
+	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
 
-void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 cfg, cfg2, misc;
 
-	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
 
 	cfg &= ~GEN0_SDP_EN;
-	dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -995,16 +995,16 @@ void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
 
-	dp_catalog_panel_update_sdp(dp_catalog);
+	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
 
-void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 hsync_period, vsync_period;
 	u32 display_v_start, display_v_end;
 	u32 hsync_start_x, hsync_end_x;
@@ -1036,49 +1036,49 @@ void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0x0);
-	dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
 }
 
-void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
-static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
+static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
 	void __iomem *base;
@@ -1090,21 +1090,21 @@ static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *l
 	return base;
 }
 
-static int dp_catalog_get_io(struct dp_catalog_private *catalog)
+static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 {
 	struct platform_device *pdev = to_platform_device(catalog->dev);
 	struct dss_io_data *dss = &catalog->io;
 
-	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
+	dss->ahb.base = msm_dp_ioremap(pdev, 0, &dss->ahb.len);
 	if (IS_ERR(dss->ahb.base))
 		return PTR_ERR(dss->ahb.base);
 
-	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
+	dss->aux.base = msm_dp_ioremap(pdev, 1, &dss->aux.len);
 	if (IS_ERR(dss->aux.base)) {
 		/*
 		 * The initial binding had a single reg, but in order to
 		 * support variation in the sub-region sizes this was split.
-		 * dp_ioremap() will fail with -EINVAL here if only a single
+		 * msm_dp_ioremap() will fail with -EINVAL here if only a single
 		 * reg is specified, so fill in the sub-region offsets and
 		 * lengths based on this single region.
 		 */
@@ -1126,13 +1126,13 @@ static int dp_catalog_get_io(struct dp_catalog_private *catalog)
 			return PTR_ERR(dss->aux.base);
 		}
 	} else {
-		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
+		dss->link.base = msm_dp_ioremap(pdev, 2, &dss->link.len);
 		if (IS_ERR(dss->link.base)) {
 			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
 			return PTR_ERR(dss->link.base);
 		}
 
-		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
+		dss->p0.base = msm_dp_ioremap(pdev, 3, &dss->p0.len);
 		if (IS_ERR(dss->p0.base)) {
 			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
 			return PTR_ERR(dss->p0.base);
@@ -1142,9 +1142,9 @@ static int dp_catalog_get_io(struct dp_catalog_private *catalog)
 	return 0;
 }
 
-struct dp_catalog *dp_catalog_get(struct device *dev)
+struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	int ret;
 
 	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
@@ -1153,78 +1153,78 @@ struct dp_catalog *dp_catalog_get(struct device *dev)
 
 	catalog->dev = dev;
 
-	ret = dp_catalog_get_io(catalog);
+	ret = msm_dp_catalog_get_io(catalog);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return &catalog->dp_catalog;
+	return &catalog->msm_dp_catalog;
 }
 
-u32 dp_catalog_audio_get_header(struct dp_catalog *dp_catalog,
-				enum dp_catalog_audio_sdp_type sdp,
-				enum dp_catalog_audio_header_type header)
+u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
+				enum msm_dp_catalog_audio_sdp_type sdp,
+				enum msm_dp_catalog_audio_header_type header)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
 	sdp_map = catalog->audio_map;
 
-	return dp_read_link(catalog, sdp_map[sdp][header]);
+	return msm_dp_read_link(catalog, sdp_map[sdp][header]);
 }
 
-void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog,
-				 enum dp_catalog_audio_sdp_type sdp,
-				 enum dp_catalog_audio_header_type header,
+void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
+				 enum msm_dp_catalog_audio_sdp_type sdp,
+				 enum msm_dp_catalog_audio_header_type header,
 				 u32 data)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
 
-	if (!dp_catalog)
+	if (!msm_dp_catalog)
 		return;
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
 	sdp_map = catalog->audio_map;
 
-	dp_write_link(catalog, sdp_map[sdp][header], data);
+	msm_dp_write_link(catalog, sdp_map[sdp][header], data);
 }
 
-void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog, u32 select)
+void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 acr_ctrl;
 
-	if (!dp_catalog)
+	if (!msm_dp_catalog)
 		return;
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
 	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
 
 	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
 					select, acr_ctrl);
 
-	dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
-void dp_catalog_audio_enable(struct dp_catalog *dp_catalog, bool enable)
+void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 audio_ctrl;
 
-	if (!dp_catalog)
+	if (!msm_dp_catalog)
 		return;
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	audio_ctrl = dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
+	audio_ctrl = msm_dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
 		audio_ctrl |= BIT(0);
@@ -1233,24 +1233,24 @@ void dp_catalog_audio_enable(struct dp_catalog *dp_catalog, bool enable)
 
 	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	dp_write_link(catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
 	/* make sure audio engine is disabled */
 	wmb();
 }
 
-void dp_catalog_audio_config_sdp(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 sdp_cfg = 0;
 	u32 sdp_cfg2 = 0;
 
-	if (!dp_catalog)
+	if (!msm_dp_catalog)
 		return;
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	sdp_cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	sdp_cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
 	/* AUDIO_TIMESTAMP_SDP_EN */
 	sdp_cfg |= BIT(1);
 	/* AUDIO_STREAM_SDP_EN */
@@ -1264,9 +1264,9 @@ void dp_catalog_audio_config_sdp(struct dp_catalog *dp_catalog)
 
 	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
 
-	dp_write_link(catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, sdp_cfg);
 
-	sdp_cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	sdp_cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
 	/* IFRM_REGSRC -> Do not use reg values */
 	sdp_cfg2 &= ~BIT(0);
 	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
@@ -1274,12 +1274,12 @@ void dp_catalog_audio_config_sdp(struct dp_catalog *dp_catalog)
 
 	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
 
-	dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
-void dp_catalog_audio_init(struct dp_catalog *dp_catalog)
+void msm_dp_catalog_audio_init(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 
 	static u32 sdp_map[][DP_AUDIO_SDP_HEADER_MAX] = {
 		{
@@ -1309,27 +1309,27 @@ void dp_catalog_audio_init(struct dp_catalog *dp_catalog)
 		},
 	};
 
-	if (!dp_catalog)
+	if (!msm_dp_catalog)
 		return;
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
 	catalog->audio_map = sdp_map;
 }
 
-void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog, u32 safe_to_exit_level)
+void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
 {
-	struct dp_catalog_private *catalog;
+	struct msm_dp_catalog_private *catalog;
 	u32 mainlink_levels;
 
-	if (!dp_catalog)
+	if (!msm_dp_catalog)
 		return;
 
-	catalog = container_of(dp_catalog,
-		struct dp_catalog_private, dp_catalog);
+	catalog = container_of(msm_dp_catalog,
+		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels = msm_dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
 
@@ -1337,5 +1337,5 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog, u32 safe_to_exit_
 			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
 			 mainlink_levels, safe_to_exit_level);
 
-	dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+	msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 4679d50b8c73..e932b17eecbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -31,7 +31,7 @@
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
-enum dp_catalog_audio_sdp_type {
+enum msm_dp_catalog_audio_sdp_type {
 	DP_AUDIO_SDP_STREAM,
 	DP_AUDIO_SDP_TIMESTAMP,
 	DP_AUDIO_SDP_INFOFRAME,
@@ -40,89 +40,89 @@ enum dp_catalog_audio_sdp_type {
 	DP_AUDIO_SDP_MAX,
 };
 
-enum dp_catalog_audio_header_type {
+enum msm_dp_catalog_audio_header_type {
 	DP_AUDIO_SDP_HEADER_1,
 	DP_AUDIO_SDP_HEADER_2,
 	DP_AUDIO_SDP_HEADER_3,
 	DP_AUDIO_SDP_HEADER_MAX,
 };
 
-struct dp_catalog {
+struct msm_dp_catalog {
 	bool wide_bus_en;
 };
 
 /* Debug module */
-void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
+void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
 /* AUX APIs */
-u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog, u32 data);
-int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog, u32 data);
-int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
-int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
-void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
-void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog);
+int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data);
+int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data);
+int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read);
+int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
+int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
 					      unsigned long wait_us);
-u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
+u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
-void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
-void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
-void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
-void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
+void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state);
+void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 config);
+void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog, bool enable);
+void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
+void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32 cc, u32 tb);
+void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
-int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
-u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
-bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
+int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
+u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
+bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
+void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
 			u32 intr_mask, bool en);
-void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
-u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
-u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
-int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
-u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
-				u32 dp_tu, u32 valid_boundary,
+void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter);
+u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
+u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog);
+int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
+u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
+				u32 msm_dp_tu, u32 valid_boundary,
 				u32 valid_boundary2);
-void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
+void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 				u32 pattern);
-u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
+u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Panel APIs */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 dp_active);
-void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp);
-void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
-void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
-void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
+int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
+				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
+void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
+void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_dump_regs(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
-void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
+void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
-struct dp_catalog *dp_catalog_get(struct device *dev);
+struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
-u32 dp_catalog_audio_get_header(struct dp_catalog *dp_catalog,
-				enum dp_catalog_audio_sdp_type sdp,
-				enum dp_catalog_audio_header_type header);
-void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog,
-				 enum dp_catalog_audio_sdp_type sdp,
-				 enum dp_catalog_audio_header_type header,
+u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
+				enum msm_dp_catalog_audio_sdp_type sdp,
+				enum msm_dp_catalog_audio_header_type header);
+void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
+				 enum msm_dp_catalog_audio_sdp_type sdp,
+				 enum msm_dp_catalog_audio_header_type header,
 				 u32 data);
-void dp_catalog_audio_config_acr(struct dp_catalog *catalog, u32 select);
-void dp_catalog_audio_enable(struct dp_catalog *catalog, bool enable);
-void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
-void dp_catalog_audio_init(struct dp_catalog *catalog);
-void dp_catalog_audio_sfe_level(struct dp_catalog *catalog, u32 safe_to_exit_level);
+void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
+void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
+void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
+void msm_dp_catalog_audio_init(struct msm_dp_catalog *catalog);
+void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index f342fc5ae41e..bc2ca8133b79 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -40,7 +40,7 @@ enum {
 	DP_TRAINING_2,
 };
 
-struct dp_tu_calc_input {
+struct msm_dp_tu_calc_input {
 	u64 lclk;        /* 162, 270, 540 and 810 */
 	u64 pclk_khz;    /* in KHz */
 	u64 hactive;     /* active h-width */
@@ -55,7 +55,7 @@ struct dp_tu_calc_input {
 	int num_of_dsc_slices; /* number of slices per line */
 };
 
-struct dp_vc_tu_mapping_table {
+struct msm_dp_vc_tu_mapping_table {
 	u32 vic;
 	u8 lanes;
 	u8 lrate; /* DP_LINK_RATE -> 162(6), 270(10), 540(20), 810 (30) */
@@ -69,14 +69,14 @@ struct dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
-struct dp_ctrl_private {
-	struct dp_ctrl dp_ctrl;
+struct msm_dp_ctrl_private {
+	struct msm_dp_ctrl msm_dp_ctrl;
 	struct drm_device *drm_dev;
 	struct device *dev;
 	struct drm_dp_aux *aux;
-	struct dp_panel *panel;
-	struct dp_link *link;
-	struct dp_catalog *catalog;
+	struct msm_dp_panel *panel;
+	struct msm_dp_link *link;
+	struct msm_dp_catalog *catalog;
 
 	struct phy *phy;
 
@@ -99,8 +99,8 @@ struct dp_ctrl_private {
 	bool stream_clks_on;
 };
 
-static int dp_aux_link_configure(struct drm_dp_aux *aux,
-					struct dp_link_info *link)
+static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
+					struct msm_dp_link_info *link)
 {
 	u8 values[2];
 	int err;
@@ -118,14 +118,14 @@ static int dp_aux_link_configure(struct drm_dp_aux *aux,
 	return 0;
 }
 
-void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	reinit_completion(&ctrl->idle_comp);
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -134,7 +134,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 config = 0, tbd;
 	const u8 *dpcd = ctrl->panel->dpcd;
@@ -142,15 +142,15 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
 
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->dp_mode.bpp);
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+			ctrl->panel->msm_dp_mode.bpp);
 
 	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
 
@@ -170,24 +170,24 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	if (ctrl->panel->psr_cap.version)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
-	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
+	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
 }
 
-static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 cc, tb;
 
-	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
-	dp_catalog_setup_peripheral_flush(ctrl->catalog);
+	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
 
-	dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl(ctrl);
 
-	tb = dp_link_get_test_bits_depth(ctrl->link,
-		ctrl->panel->dp_mode.bpp);
-	cc = dp_link_get_colorimetry_config(ctrl->link);
-	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
-	dp_panel_timing_cfg(ctrl->panel);
+	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
+		ctrl->panel->msm_dp_mode.bpp);
+	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
+	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
+	msm_dp_panel_timing_cfg(ctrl->panel);
 }
 
 /*
@@ -310,7 +310,7 @@ static int _tu_param_compare(s64 a, s64 b)
 	}
 }
 
-static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
+static void msm_dp_panel_update_tu_timings(struct msm_dp_tu_calc_input *in,
 					struct tu_algo_data *tu)
 {
 	int nlanes = in->nlanes;
@@ -622,9 +622,9 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	}
 }
 
-static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
-				struct dp_tu_calc_input *in,
-				struct dp_vc_tu_mapping_table *tu_table)
+static void _dp_ctrl_calc_tu(struct msm_dp_ctrl_private *ctrl,
+				struct msm_dp_tu_calc_input *in,
+				struct msm_dp_vc_tu_mapping_table *tu_table)
 {
 	struct tu_algo_data *tu;
 	int compare_result_1, compare_result_2;
@@ -645,7 +645,7 @@ static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
 	if (!tu)
 		return;
 
-	dp_panel_update_tu_timings(in, tu);
+	msm_dp_panel_update_tu_timings(in, tu);
 
 	tu->err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
 
@@ -956,21 +956,21 @@ static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
 	kfree(tu);
 }
 
-static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
-		struct dp_vc_tu_mapping_table *tu_table)
+static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
+		struct msm_dp_vc_tu_mapping_table *tu_table)
 {
-	struct dp_tu_calc_input in;
+	struct msm_dp_tu_calc_input in;
 	struct drm_display_mode *drm_mode;
 
-	drm_mode = &ctrl->panel->dp_mode.drm_mode;
+	drm_mode = &ctrl->panel->msm_dp_mode.drm_mode;
 
 	in.lclk = ctrl->link->link_params.rate / 1000;
 	in.pclk_khz = drm_mode->clock;
 	in.hactive = drm_mode->hdisplay;
 	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
 	in.nlanes = ctrl->link->link_params.num_lanes;
-	in.bpp = ctrl->panel->dp_mode.bpp;
-	in.pixel_enc = ctrl->panel->dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
+	in.bpp = ctrl->panel->msm_dp_mode.bpp;
+	in.pixel_enc = ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
 	in.dsc_en = 0;
 	in.async_en = 0;
 	in.fec_en = 0;
@@ -980,16 +980,16 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
 	_dp_ctrl_calc_tu(ctrl, &in, tu_table);
 }
 
-static void dp_ctrl_setup_tr_unit(struct dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
 {
-	u32 dp_tu = 0x0;
+	u32 msm_dp_tu = 0x0;
 	u32 valid_boundary = 0x0;
 	u32 valid_boundary2 = 0x0;
-	struct dp_vc_tu_mapping_table tu_calc_table;
+	struct msm_dp_vc_tu_mapping_table tu_calc_table;
 
-	dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
+	msm_dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
 
-	dp_tu |= tu_calc_table.tu_size_minus1;
+	msm_dp_tu |= tu_calc_table.tu_size_minus1;
 	valid_boundary |= tu_calc_table.valid_boundary_link;
 	valid_boundary |= (tu_calc_table.delay_start_link << 16);
 
@@ -1001,13 +1001,13 @@ static void dp_ctrl_setup_tr_unit(struct dp_ctrl_private *ctrl)
 		valid_boundary2 |= BIT(0);
 
 	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
-			dp_tu, valid_boundary, valid_boundary2);
+			msm_dp_tu, valid_boundary, valid_boundary2);
 
-	dp_catalog_ctrl_update_transfer_unit(ctrl->catalog,
-				dp_tu, valid_boundary, valid_boundary2);
+	msm_dp_catalog_ctrl_update_transfer_unit(ctrl->catalog,
+				msm_dp_tu, valid_boundary, valid_boundary2);
 }
 
-static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 
@@ -1019,7 +1019,7 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
+static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
 			     u8 v_level, u8 p_level)
 {
 	union phy_configure_opts *phy_opts = &ctrl->phy_opts;
@@ -1034,9 +1034,9 @@ static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
 	return 0;
 }
 
-static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 {
-	struct dp_link *link = ctrl->link;
+	struct msm_dp_link *link = ctrl->link;
 	int ret = 0, lane, lane_cnt;
 	u8 buf[4];
 	u32 max_level_reached = 0;
@@ -1046,7 +1046,7 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	drm_dbg_dp(ctrl->drm_dev,
 		"voltage level: %d emphasis level: %d\n",
 			voltage_swing_level, pre_emphasis_level);
-	ret = dp_ctrl_set_vx_px(ctrl,
+	ret = msm_dp_ctrl_set_vx_px(ctrl,
 		voltage_swing_level, pre_emphasis_level);
 
 	if (ret)
@@ -1083,7 +1083,7 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
+static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 		u8 pattern)
 {
 	u8 buf;
@@ -1100,7 +1100,7 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
 	return ret == 1;
 }
 
-static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
+static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
 				    u8 *link_status)
 {
 	int ret = 0, len;
@@ -1114,24 +1114,24 @@ static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
 	return ret;
 }
 
-static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
+static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int const maximum_retries = 4;
 
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_1;
 
-	ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, 1);
+	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, 1);
 	if (ret)
 		return ret;
-	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
+	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
 		DP_LINK_SCRAMBLING_DISABLE);
 
-	ret = dp_ctrl_update_vx_px(ctrl);
+	ret = msm_dp_ctrl_update_vx_px(ctrl);
 	if (ret)
 		return ret;
 
@@ -1140,7 +1140,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 	for (tries = 0; tries < maximum_retries; tries++) {
 		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = dp_ctrl_read_link_status(ctrl, link_status);
+		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
 			return ret;
 
@@ -1160,8 +1160,8 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 			old_v_level = ctrl->link->phy_params.v_level;
 		}
 
-		dp_link_adjust_levels(ctrl->link, link_status);
-		ret = dp_ctrl_update_vx_px(ctrl);
+		msm_dp_link_adjust_levels(ctrl->link, link_status);
+		ret = msm_dp_ctrl_update_vx_px(ctrl);
 		if (ret)
 			return ret;
 	}
@@ -1170,7 +1170,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }
 
-static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 
@@ -1198,7 +1198,7 @@ static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int dp_ctrl_link_lane_down_shift(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
 {
 
 	if (ctrl->link->link_params.num_lanes == 1)
@@ -1213,13 +1213,13 @@ static int dp_ctrl_link_lane_down_shift(struct dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
 {
-	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
+	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
 	drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 }
 
-static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
+static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int tries = 0, ret = 0;
@@ -1228,7 +1228,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_2;
 
@@ -1243,16 +1243,16 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 		state_ctrl_bit = 2;
 	}
 
-	ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
+	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
 	if (ret)
 		return ret;
 
-	dp_ctrl_train_pattern_set(ctrl, pattern);
+	msm_dp_ctrl_train_pattern_set(ctrl, pattern);
 
 	for (tries = 0; tries <= maximum_retries; tries++) {
 		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = dp_ctrl_read_link_status(ctrl, link_status);
+		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
 			return ret;
 
@@ -1261,8 +1261,8 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 			return 0;
 		}
 
-		dp_link_adjust_levels(ctrl->link, link_status);
-		ret = dp_ctrl_update_vx_px(ctrl);
+		msm_dp_link_adjust_levels(ctrl->link, link_status);
+		ret = msm_dp_ctrl_update_vx_px(ctrl);
 		if (ret)
 			return ret;
 
@@ -1271,24 +1271,24 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }
 
-static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
+static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int ret = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
 	u8 assr;
-	struct dp_link_info link_info = {0};
+	struct msm_dp_link_info link_info = {0};
 
-	dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
-	dp_link_reset_phy_params_vx_px(ctrl->link);
+	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
 
-	dp_aux_link_configure(ctrl->aux, &link_info);
+	msm_dp_aux_link_configure(ctrl->aux, &link_info);
 
 	if (drm_dp_max_downspread(dpcd))
 		encoding[0] |= DP_SPREAD_AMP_0_5;
@@ -1302,7 +1302,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 				&assr, 1);
 	}
 
-	ret = dp_ctrl_link_train_1(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
 		goto end;
@@ -1311,7 +1311,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	/* print success info as this is a result of user initiated action */
 	drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
 
-	ret = dp_ctrl_link_train_2(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
 		goto end;
@@ -1321,17 +1321,17 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
 
 end:
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	return ret;
 }
 
-static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
+static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int ret = 0;
 
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return ret;
@@ -1342,17 +1342,17 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	 * a link training pattern, we have to first do soft reset.
 	 */
 
-	ret = dp_ctrl_link_train(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train(ctrl, training_step);
 
 	return ret;
 }
 
-int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl)
+int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	int ret = 0;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->core_clks_on) {
 		drm_dbg_dp(ctrl->drm_dev, "core clks already enabled\n");
@@ -1374,11 +1374,11 @@ int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl)
 	return 0;
 }
 
-void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	clk_bulk_disable_unprepare(ctrl->num_core_clks, ctrl->core_clks);
 
@@ -1391,12 +1391,12 @@ void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl)
 		   ctrl->core_clks_on ? "on" : "off");
 }
 
-static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
+static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	int ret = 0;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->link_clks_on) {
 		drm_dbg_dp(ctrl->drm_dev, "links clks already enabled\n");
@@ -1406,7 +1406,7 @@ static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
 	if (!ctrl->core_clks_on) {
 		drm_dbg_dp(ctrl->drm_dev, "Enable core clks before link clks\n");
 
-		dp_ctrl_core_clk_enable(dp_ctrl);
+		msm_dp_ctrl_core_clk_enable(msm_dp_ctrl);
 	}
 
 	ret = clk_bulk_prepare_enable(ctrl->num_link_clks, ctrl->link_clks);
@@ -1424,11 +1424,11 @@ static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
 	return 0;
 }
 
-static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
+static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	clk_bulk_disable_unprepare(ctrl->num_link_clks, ctrl->link_clks);
 
@@ -1441,7 +1441,7 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
 		   ctrl->core_clks_on ? "on" : "off");
 }
 
-static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 	struct phy *phy = ctrl->phy;
@@ -1455,7 +1455,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
-	ret = dp_ctrl_link_clk_enable(&ctrl->dp_ctrl);
+	ret = msm_dp_ctrl_link_clk_enable(&ctrl->msm_dp_ctrl);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
@@ -1464,13 +1464,13 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
+void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_catalog_ctrl_reset(ctrl->catalog);
 
 	/*
 	 * all dp controller programmable registers will not
@@ -1478,28 +1478,28 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
 	 * therefore interrupt mask bits have to be updated
 	 * to enable/disable interrupts
 	 */
-	dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
+	msm_dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
 }
 
-void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	u8 cfg;
-	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
-			struct dp_ctrl_private, dp_ctrl);
+	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
+			struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (!ctrl->panel->psr_cap.version)
 		return;
 
-	dp_catalog_ctrl_config_psr(ctrl->catalog);
+	msm_dp_catalog_ctrl_config_psr(ctrl->catalog);
 
 	cfg = DP_PSR_ENABLE;
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
 }
 
-void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 {
-	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
-			struct dp_ctrl_private, dp_ctrl);
+	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
+			struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (!ctrl->panel->psr_cap.version)
 		return;
@@ -1516,64 +1516,64 @@ void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
 	 */
 	if (enter) {
 		reinit_completion(&ctrl->psr_op_comp);
-		dp_catalog_ctrl_set_psr(ctrl->catalog, true);
+		msm_dp_catalog_ctrl_set_psr(ctrl->catalog, true);
 
 		if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
 			PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
 			DRM_ERROR("PSR_ENTRY timedout\n");
-			dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+			msm_dp_catalog_ctrl_set_psr(ctrl->catalog, false);
 			return;
 		}
 
-		dp_ctrl_push_idle(dp_ctrl);
-		dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+		msm_dp_ctrl_push_idle(msm_dp_ctrl);
+		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
-		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
+		msm_dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
 	} else {
-		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
+		msm_dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
 
-		dp_catalog_ctrl_set_psr(ctrl->catalog, false);
-		dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
-		dp_ctrl_wait4video_ready(ctrl);
-		dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+		msm_dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+		msm_dp_ctrl_wait4video_ready(ctrl);
+		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 	}
 }
 
-void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	msm_dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
 
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
 }
 
-void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	msm_dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
 }
 
-static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 {
 	struct phy *phy = ctrl->phy;
 	int ret = 0;
 
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	phy_configure(phy, &ctrl->phy_opts);
 	/*
@@ -1583,13 +1583,13 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	 */
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 
-	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
-	ret = dp_ctrl_enable_mainlink_clocks(ctrl);
+	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (ret) {
 		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
 		return ret;
@@ -1598,18 +1598,18 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 {
 	struct phy *phy;
 
 	phy = ctrl->phy;
 
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_catalog_ctrl_reset(ctrl->catalog);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
 
@@ -1622,30 +1622,30 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
 
-	dp_ctrl_push_idle(&ctrl->dp_ctrl);
+	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
-	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
+	ret = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 	if (ret)
 		goto end;
 
-	dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl);
 
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
-	ret = dp_ctrl_wait4video_ready(ctrl);
+	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
 }
 
-static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
+static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 {
 	bool success = false;
 	u32 pattern_sent = 0x0;
@@ -1653,17 +1653,17 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "request: 0x%x\n", pattern_requested);
 
-	if (dp_ctrl_set_vx_px(ctrl,
+	if (msm_dp_ctrl_set_vx_px(ctrl,
 			ctrl->link->phy_params.v_level,
 			ctrl->link->phy_params.p_level)) {
 		DRM_ERROR("Failed to set v/p levels\n");
 		return false;
 	}
-	dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
-	dp_ctrl_update_vx_px(ctrl);
-	dp_link_send_test_response(ctrl->link);
+	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
+	msm_dp_ctrl_update_vx_px(ctrl);
+	msm_dp_link_send_test_response(ctrl->link);
 
-	pattern_sent = dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
+	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
 
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
@@ -1697,7 +1697,7 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 	return success;
 }
 
-static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret;
 	unsigned long pixel_rate;
@@ -1713,15 +1713,15 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	dp_ctrl_off(&ctrl->dp_ctrl);
+	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
 
-	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
 	}
 
-	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
 	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
@@ -1739,49 +1739,49 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 		ctrl->stream_clks_on = true;
 	}
 
-	dp_ctrl_send_phy_test_pattern(ctrl);
+	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
 	return 0;
 }
 
-void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	u32 sink_request = 0x0;
 
-	if (!dp_ctrl) {
+	if (!msm_dp_ctrl) {
 		DRM_ERROR("invalid input\n");
 		return;
 	}
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	sink_request = ctrl->link->sink_request;
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
-		if (dp_ctrl_process_phy_test_request(ctrl)) {
+		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
 			DRM_ERROR("process phy_test_req failed\n");
 			return;
 		}
 	}
 
 	if (sink_request & DP_LINK_STATUS_UPDATED) {
-		if (dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
 	}
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
-		dp_link_send_test_response(ctrl->link);
-		if (dp_ctrl_link_maintenance(ctrl)) {
+		msm_dp_link_send_test_response(ctrl->link);
+		if (msm_dp_ctrl_link_maintenance(ctrl)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
 	}
 }
 
-static bool dp_ctrl_clock_recovery_any_ok(
+static bool msm_dp_ctrl_clock_recovery_any_ok(
 			const u8 link_status[DP_LINK_STATUS_SIZE],
 			int lane_count)
 {
@@ -1800,20 +1800,20 @@ static bool dp_ctrl_clock_recovery_any_ok(
 	return drm_dp_clock_recovery_ok(link_status, reduced_cnt);
 }
 
-static bool dp_ctrl_channel_eq_ok(struct dp_ctrl_private *ctrl)
+static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 {
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int num_lanes = ctrl->link->link_params.num_lanes;
 
-	dp_ctrl_read_link_status(ctrl, link_status);
+	msm_dp_ctrl_read_link_status(ctrl, link_status);
 
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	int rc = 0;
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	u32 rate;
 	int link_train_max_retries = 5;
 	u32 const phy_cts_pixel_clk_khz = 148500;
@@ -1821,15 +1821,15 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	unsigned int training_step;
 	unsigned long pixel_rate;
 
-	if (!dp_ctrl)
+	if (!msm_dp_ctrl)
 		return -EINVAL;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	rate = ctrl->panel->link_info.rate;
-	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
 
-	dp_ctrl_core_clk_enable(&ctrl->dp_ctrl);
+	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev,
@@ -1840,7 +1840,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
 			ctrl->panel->link_info.num_lanes;
-		if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+		if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
 
@@ -1848,32 +1848,32 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
 		pixel_rate);
 
-	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
+	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
 		return rc;
 
 	while (--link_train_max_retries) {
 		training_step = DP_TRAINING_NONE;
-		rc = dp_ctrl_setup_main_link(ctrl, &training_step);
+		rc = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			dp_ctrl_read_link_status(ctrl, link_status);
+			msm_dp_ctrl_read_link_status(ctrl, link_status);
 
-			rc = dp_ctrl_link_rate_down_shift(ctrl);
+			rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
-				if (dp_ctrl_clock_recovery_any_ok(link_status,
+				if (msm_dp_ctrl_clock_recovery_any_ok(link_status,
 					ctrl->link->link_params.num_lanes)) {
 					/*
 					 * some lanes are ready,
 					 * reduce lane number
 					 */
-					rc = dp_ctrl_link_lane_down_shift(ctrl);
+					rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
 					if (rc < 0) { /* lane == 1 already */
 						/* end with failure */
 						break;
@@ -1885,16 +1885,16 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed */
-			if (!dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			dp_ctrl_read_link_status(ctrl, link_status);
+			msm_dp_ctrl_read_link_status(ctrl, link_status);
 
 			if (!drm_dp_clock_recovery_ok(link_status,
 					ctrl->link->link_params.num_lanes))
-				rc = dp_ctrl_link_rate_down_shift(ctrl);
+				rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			else
-				rc = dp_ctrl_link_lane_down_shift(ctrl);
+				rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
 
 			if (rc < 0) {
 				/* end with failure */
@@ -1902,10 +1902,10 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			dp_ctrl_clear_training_pattern(ctrl);
+			msm_dp_ctrl_clear_training_pattern(ctrl);
 		}
 
-		rc = dp_ctrl_reinitialize_mainlink(ctrl);
+		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n", rc);
 			break;
@@ -1926,38 +1926,38 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		dp_ctrl_clear_training_pattern(ctrl);
+		msm_dp_ctrl_clear_training_pattern(ctrl);
 
-		dp_ctrl_deinitialize_mainlink(ctrl);
+		msm_dp_ctrl_deinitialize_mainlink(ctrl);
 		rc = -ECONNRESET;
 	}
 
 	return rc;
 }
 
-static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
 {
 	int training_step = DP_TRAINING_NONE;
 
-	return dp_ctrl_setup_main_link(ctrl, &training_step);
+	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	unsigned long pixel_rate;
 	unsigned long pixel_rate_orig;
 
-	if (!dp_ctrl)
+	if (!msm_dp_ctrl)
 		return -EINVAL;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
 
-	if (dp_ctrl->wide_bus_en || ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
@@ -1969,7 +1969,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
-		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
+		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
 			goto end;
@@ -1993,11 +1993,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 		ctrl->stream_clks_on = true;
 	}
 
-	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
-		dp_ctrl_link_retrain(ctrl);
+	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
+		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
-	dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl);
 
 	/*
 	 * Set up transfer unit values and set controller state to send
@@ -2005,22 +2005,22 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
-	dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl);
 
-	dp_catalog_ctrl_config_msa(ctrl->catalog,
+	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->dp_mode.out_fmt_is_yuv_420);
+		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	dp_ctrl_setup_tr_unit(ctrl);
+	msm_dp_ctrl_setup_tr_unit(ctrl);
 
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
-	ret = dp_ctrl_wait4video_ready(ctrl);
+	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
 
-	mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
+	mainlink_ready = msm_dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
@@ -2028,20 +2028,20 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 	return ret;
 }
 
-void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
 
 	/* set dongle to D3 (power off) mode */
-	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
+	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2049,7 +2049,7 @@ void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
 
@@ -2061,17 +2061,17 @@ void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
 		phy, phy->init_count, phy->power_count);
@@ -2082,19 +2082,19 @@ void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 		phy, phy->init_count, phy->power_count);
 }
 
-void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
 
-	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_catalog_ctrl_reset(ctrl->catalog);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2102,26 +2102,26 @@ void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
 }
 
-irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	u32 isr;
 	irqreturn_t ret = IRQ_NONE;
 
-	if (!dp_ctrl)
+	if (!msm_dp_ctrl)
 		return IRQ_NONE;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->panel->psr_cap.version) {
-		isr = dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+		isr = msm_dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
 
 		if (isr)
 			complete(&ctrl->psr_op_comp);
@@ -2136,7 +2136,7 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
 	}
 
-	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
+	isr = msm_dp_catalog_ctrl_get_interrupt(ctrl->catalog);
 
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
@@ -2164,13 +2164,13 @@ static const char *ctrl_clks[] = {
 	"ctrl_link_iface",
 };
 
-static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
+static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	struct device *dev;
 	int i, rc;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	dev = ctrl->dev;
 
 	ctrl->num_core_clks = ARRAY_SIZE(core_clks);
@@ -2204,12 +2204,12 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 	return 0;
 }
 
-struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
-			struct dp_panel *panel,	struct drm_dp_aux *aux,
-			struct dp_catalog *catalog,
+struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
+			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
+			struct msm_dp_catalog *catalog,
 			struct phy *phy)
 {
-	struct dp_ctrl_private *ctrl;
+	struct msm_dp_ctrl_private *ctrl;
 	int ret;
 
 	if (!dev || !panel || !aux ||
@@ -2228,7 +2228,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	if (ret) {
 		dev_err(dev, "invalid DP OPP table in device tree\n");
 		/* caller do PTR_ERR(opp_table) */
-		return (struct dp_ctrl *)ERR_PTR(ret);
+		return (struct msm_dp_ctrl *)ERR_PTR(ret);
 	}
 
 	/* OPP table is optional */
@@ -2248,11 +2248,11 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	ctrl->dev      = dev;
 	ctrl->phy      = phy;
 
-	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
+	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
 		dev_err(dev, "failed to init clocks\n");
 		return ERR_PTR(ret);
 	}
 
-	return &ctrl->dp_ctrl;
+	return &ctrl->msm_dp_ctrl;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index ffcbd9a25748..b7abfedbf574 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -11,34 +11,34 @@
 #include "dp_link.h"
 #include "dp_catalog.h"
 
-struct dp_ctrl {
+struct msm_dp_ctrl {
 	bool wide_bus_en;
 };
 
 struct phy;
 
-int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
-void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_off(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
-irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
-struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
-			struct dp_panel *panel,	struct drm_dp_aux *aux,
-			struct dp_catalog *catalog,
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
+void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
+struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
+			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
+			struct msm_dp_catalog *catalog,
 			struct phy *phy);
 
-void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
-void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
+void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
+void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 
-void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
-void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
 
-int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl);
+int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index b8611f6d2296..22fd946ee201 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -17,15 +17,15 @@
 
 #define DEBUG_NAME "msm_dp"
 
-struct dp_debug_private {
-	struct dp_link *link;
-	struct dp_panel *panel;
+struct msm_dp_debug_private {
+	struct msm_dp_link *link;
+	struct msm_dp_panel *panel;
 	struct drm_connector *connector;
 };
 
-static int dp_debug_show(struct seq_file *seq, void *p)
+static int msm_dp_debug_show(struct seq_file *seq, void *p)
 {
-	struct dp_debug_private *debug = seq->private;
+	struct msm_dp_debug_private *debug = seq->private;
 	u64 lclk = 0;
 	u32 link_params_rate;
 	const struct drm_display_mode *drm_mode;
@@ -33,7 +33,7 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 	if (!debug)
 		return -ENODEV;
 
-	drm_mode = &debug->panel->dp_mode.drm_mode;
+	drm_mode = &debug->panel->msm_dp_mode.drm_mode;
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
@@ -55,8 +55,8 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 			drm_mode->hsync_end - drm_mode->hsync_start,
 			drm_mode->vsync_end - drm_mode->vsync_start);
 	seq_printf(seq, "\t\tactive_low = %dx%d\n",
-			debug->panel->dp_mode.h_active_low,
-			debug->panel->dp_mode.v_active_low);
+			debug->panel->msm_dp_mode.h_active_low,
+			debug->panel->msm_dp_mode.v_active_low);
 	seq_printf(seq, "\t\th_skew = %d\n",
 			drm_mode->hskew);
 	seq_printf(seq, "\t\trefresh rate = %d\n",
@@ -64,7 +64,7 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 	seq_printf(seq, "\t\tpixel clock khz = %d\n",
 			drm_mode->clock);
 	seq_printf(seq, "\t\tbpp = %d\n",
-			debug->panel->dp_mode.bpp);
+			debug->panel->msm_dp_mode.bpp);
 
 	/* Link Information */
 	seq_printf(seq, "\tdp_link:\n\t\ttest_requested = %d\n",
@@ -83,11 +83,11 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(dp_debug);
+DEFINE_SHOW_ATTRIBUTE(msm_dp_debug);
 
-static int dp_test_data_show(struct seq_file *m, void *data)
+static int msm_dp_test_data_show(struct seq_file *m, void *data)
 {
-	const struct dp_debug_private *debug = m->private;
+	const struct msm_dp_debug_private *debug = m->private;
 	const struct drm_connector *connector = debug->connector;
 	u32 bpc;
 
@@ -98,18 +98,18 @@ static int dp_test_data_show(struct seq_file *m, void *data)
 		seq_printf(m, "vdisplay: %d\n",
 				debug->link->test_video.test_v_height);
 		seq_printf(m, "bpc: %u\n",
-				dp_link_bit_depth_to_bpp(bpc) / 3);
+				msm_dp_link_bit_depth_to_bpp(bpc) / 3);
 	} else {
 		seq_puts(m, "0");
 	}
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(dp_test_data);
+DEFINE_SHOW_ATTRIBUTE(msm_dp_test_data);
 
-static int dp_test_type_show(struct seq_file *m, void *data)
+static int msm_dp_test_type_show(struct seq_file *m, void *data)
 {
-	const struct dp_debug_private *debug = m->private;
+	const struct msm_dp_debug_private *debug = m->private;
 	const struct drm_connector *connector = debug->connector;
 
 	if (connector->status == connector_status_connected)
@@ -119,15 +119,15 @@ static int dp_test_type_show(struct seq_file *m, void *data)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(dp_test_type);
+DEFINE_SHOW_ATTRIBUTE(msm_dp_test_type);
 
-static ssize_t dp_test_active_write(struct file *file,
+static ssize_t msm_dp_test_active_write(struct file *file,
 		const char __user *ubuf,
 		size_t len, loff_t *offp)
 {
 	char *input_buffer;
 	int status = 0;
-	const struct dp_debug_private *debug;
+	const struct msm_dp_debug_private *debug;
 	const struct drm_connector *connector;
 	int val = 0;
 
@@ -164,9 +164,9 @@ static ssize_t dp_test_active_write(struct file *file,
 	return len;
 }
 
-static int dp_test_active_show(struct seq_file *m, void *data)
+static int msm_dp_test_active_show(struct seq_file *m, void *data)
 {
-	struct dp_debug_private *debug = m->private;
+	struct msm_dp_debug_private *debug = m->private;
 	struct drm_connector *connector = debug->connector;
 
 	if (connector->status == connector_status_connected) {
@@ -181,28 +181,28 @@ static int dp_test_active_show(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int dp_test_active_open(struct inode *inode,
+static int msm_dp_test_active_open(struct inode *inode,
 		struct file *file)
 {
-	return single_open(file, dp_test_active_show,
+	return single_open(file, msm_dp_test_active_show,
 			inode->i_private);
 }
 
 static const struct file_operations test_active_fops = {
 	.owner = THIS_MODULE,
-	.open = dp_test_active_open,
+	.open = msm_dp_test_active_open,
 	.read = seq_read,
 	.llseek = seq_lseek,
 	.release = single_release,
-	.write = dp_test_active_write
+	.write = msm_dp_test_active_write
 };
 
-int dp_debug_init(struct device *dev, struct dp_panel *panel,
-		  struct dp_link *link,
+int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
+		  struct msm_dp_link *link,
 		  struct drm_connector *connector,
 		  struct dentry *root, bool is_edp)
 {
-	struct dp_debug_private *debug;
+	struct msm_dp_debug_private *debug;
 
 	if (!dev || !panel || !link) {
 		DRM_ERROR("invalid input\n");
@@ -217,20 +217,20 @@ int dp_debug_init(struct device *dev, struct dp_panel *panel,
 	debug->panel = panel;
 
 	debugfs_create_file("dp_debug", 0444, root,
-			debug, &dp_debug_fops);
+			debug, &msm_dp_debug_fops);
 
 	if (!is_edp) {
-		debugfs_create_file("msm_dp_test_active", 0444,
+		debugfs_create_file("dp_test_active", 0444,
 				    root,
 				    debug, &test_active_fops);
 
-		debugfs_create_file("msm_dp_test_data", 0444,
+		debugfs_create_file("dp_test_data", 0444,
 				    root,
-				    debug, &dp_test_data_fops);
+				    debug, &msm_dp_test_data_fops);
 
-		debugfs_create_file("msm_dp_test_type", 0444,
+		debugfs_create_file("dp_test_type", 0444,
 				    root,
-				    debug, &dp_test_type_fops);
+				    debug, &msm_dp_test_type_fops);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 7e1aa892fc09..6dc0ff4f0f65 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -12,7 +12,7 @@
 #if defined(CONFIG_DEBUG_FS)
 
 /**
- * dp_debug_get() - configure and get the DisplayPlot debug module data
+ * msm_dp_debug_get() - configure and get the DisplayPlot debug module data
  *
  * @dev: device instance of the caller
  * @panel: instance of panel module
@@ -25,8 +25,8 @@
  * This function sets up the debug module and provides a way
  * for debugfs input to be communicated with existing modules
  */
-int dp_debug_init(struct device *dev, struct dp_panel *panel,
-		  struct dp_link *link,
+int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
+		  struct msm_dp_link *link,
 		  struct drm_connector *connector,
 		  struct dentry *root,
 		  bool is_edp);
@@ -34,8 +34,8 @@ int dp_debug_init(struct device *dev, struct dp_panel *panel,
 #else
 
 static inline
-int dp_debug_init(struct device *dev, struct dp_panel *panel,
-		  struct dp_link *link,
+int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
+		  struct msm_dp_link *link,
 		  struct drm_connector *connector,
 		  struct dentry *root,
 		  bool is_edp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f01980b0888a..5cc349f672c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -67,13 +67,13 @@ enum {
 
 #define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
 
-struct dp_event {
+struct msm_dp_event {
 	u32 event_id;
 	u32 data;
 	u32 delay;
 };
 
-struct dp_display_private {
+struct msm_dp_display_private {
 	int irq;
 
 	unsigned int id;
@@ -85,14 +85,14 @@ struct dp_display_private {
 
 	struct drm_device *drm_dev;
 
-	struct dp_catalog *catalog;
+	struct msm_dp_catalog *catalog;
 	struct drm_dp_aux *aux;
-	struct dp_link    *link;
-	struct dp_panel   *panel;
-	struct dp_ctrl    *ctrl;
+	struct msm_dp_link    *link;
+	struct msm_dp_panel   *panel;
+	struct msm_dp_ctrl    *ctrl;
 
-	struct dp_display_mode dp_mode;
-	struct msm_dp dp_display;
+	struct msm_dp_display_mode msm_dp_mode;
+	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
 	struct completion audio_comp;
@@ -104,12 +104,12 @@ struct dp_display_private {
 	u32 event_pndx;
 	u32 event_gndx;
 	struct task_struct *ev_tsk;
-	struct dp_event event_list[DP_EVENT_Q_MAX];
+	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
 	bool wide_bus_supported;
 
-	struct dp_audio *audio;
+	struct msm_dp_audio *audio;
 };
 
 struct msm_dp_desc {
@@ -169,7 +169,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 	{}
 };
 
-static const struct of_device_id dp_dt_match[] = {
+static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -185,55 +185,55 @@ static const struct of_device_id dp_dt_match[] = {
 	{}
 };
 
-static struct dp_display_private *dev_get_dp_display_private(struct device *dev)
+static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
 
-	return container_of(dp, struct dp_display_private, dp_display);
+	return container_of(dp, struct msm_dp_display_private, msm_dp_display);
 }
 
-static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
+static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
 						u32 data, u32 delay)
 {
 	unsigned long flag;
-	struct dp_event *todo;
+	struct msm_dp_event *todo;
 	int pndx;
 
-	spin_lock_irqsave(&dp_priv->event_lock, flag);
-	pndx = dp_priv->event_pndx + 1;
+	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
+	pndx = msm_dp_priv->event_pndx + 1;
 	pndx %= DP_EVENT_Q_MAX;
-	if (pndx == dp_priv->event_gndx) {
+	if (pndx == msm_dp_priv->event_gndx) {
 		pr_err("event_q is full: pndx=%d gndx=%d\n",
-			dp_priv->event_pndx, dp_priv->event_gndx);
-		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+			msm_dp_priv->event_pndx, msm_dp_priv->event_gndx);
+		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 		return -EPERM;
 	}
-	todo = &dp_priv->event_list[dp_priv->event_pndx++];
-	dp_priv->event_pndx %= DP_EVENT_Q_MAX;
+	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
+	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
 	todo->data = data;
 	todo->delay = delay;
-	wake_up(&dp_priv->event_q);
-	spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+	wake_up(&msm_dp_priv->event_q);
+	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 
 	return 0;
 }
 
-static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
+static int msm_dp_del_event(struct msm_dp_display_private *msm_dp_priv, u32 event)
 {
 	unsigned long flag;
-	struct dp_event *todo;
+	struct msm_dp_event *todo;
 	u32	gndx;
 
-	spin_lock_irqsave(&dp_priv->event_lock, flag);
-	if (dp_priv->event_pndx == dp_priv->event_gndx) {
-		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
+	if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
+		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 		return -ENOENT;
 	}
 
-	gndx = dp_priv->event_gndx;
-	while (dp_priv->event_pndx != gndx) {
-		todo = &dp_priv->event_list[gndx];
+	gndx = msm_dp_priv->event_gndx;
+	while (msm_dp_priv->event_pndx != gndx) {
+		todo = &msm_dp_priv->event_list[gndx];
 		if (todo->event_id == event) {
 			todo->event_id = EV_NO_EVENT;	/* deleted */
 			todo->delay = 0;
@@ -241,60 +241,60 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
 		gndx++;
 		gndx %= DP_EVENT_Q_MAX;
 	}
-	spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 
 	return 0;
 }
 
-void dp_display_signal_audio_start(struct msm_dp *dp_display)
+void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	reinit_completion(&dp->audio_comp);
 }
 
-void dp_display_signal_audio_complete(struct msm_dp *dp_display)
+void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	complete_all(&dp->audio_comp);
 }
 
-static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
+static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv);
 
-static int dp_display_bind(struct device *dev, struct device *master,
+static int msm_dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
 	int rc = 0;
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct drm_device *drm = priv->dev;
 
-	dp->dp_display.drm_dev = drm;
-	priv->dp[dp->id] = &dp->dp_display;
+	dp->msm_dp_display.drm_dev = drm;
+	priv->dp[dp->id] = &dp->msm_dp_display;
 
 
 
 	dp->drm_dev = drm;
 	dp->aux->drm_dev = drm;
-	rc = dp_aux_register(dp->aux);
+	rc = msm_dp_aux_register(dp->aux);
 	if (rc) {
 		DRM_ERROR("DRM DP AUX register failed\n");
 		goto end;
 	}
 
 
-	rc = dp_register_audio_driver(dev, dp->audio);
+	rc = msm_dp_register_audio_driver(dev, dp->audio);
 	if (rc) {
 		DRM_ERROR("Audio registration Dp failed\n");
 		goto end;
 	}
 
-	rc = dp_hpd_event_thread_start(dp);
+	rc = msm_dp_hpd_event_thread_start(dp);
 	if (rc) {
 		DRM_ERROR("Event thread create failed\n");
 		goto end;
@@ -305,44 +305,44 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	return rc;
 }
 
-static void dp_display_unbind(struct device *dev, struct device *master,
+static void msm_dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	kthread_stop(dp->ev_tsk);
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	dp_unregister_audio_driver(dev, dp->audio);
-	dp_aux_unregister(dp->aux);
+	msm_dp_unregister_audio_driver(dev, dp->audio);
+	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
 	priv->dp[dp->id] = NULL;
 }
 
-static const struct component_ops dp_display_comp_ops = {
-	.bind = dp_display_bind,
-	.unbind = dp_display_unbind,
+static const struct component_ops msm_dp_display_comp_ops = {
+	.bind = msm_dp_display_bind,
+	.unbind = msm_dp_display_unbind,
 };
 
-static void dp_display_send_hpd_event(struct msm_dp *dp_display)
+static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 	struct drm_connector *connector;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	connector = dp->dp_display.connector;
+	connector = dp->msm_dp_display.connector;
 	drm_helper_hpd_irq_event(connector->dev);
 }
 
-static int dp_display_send_hpd_notification(struct dp_display_private *dp,
+static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
-	if ((hpd && dp->dp_display.link_ready) ||
-			(!hpd && !dp->dp_display.link_ready)) {
+	if ((hpd && dp->msm_dp_display.link_ready) ||
+			(!hpd && !dp->msm_dp_display.link_ready)) {
 		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
 				(hpd ? "on" : "off"));
 		return 0;
@@ -351,139 +351,139 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
 		dp->panel->video_test = false;
-		if (!dp->dp_display.is_edp)
-			drm_dp_set_subconnector_property(dp->dp_display.connector,
+		if (!dp->msm_dp_display.is_edp)
+			drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
 							 connector_status_disconnected,
 							 dp->panel->dpcd,
 							 dp->panel->downstream_ports);
 	}
 
-	dp->dp_display.link_ready = hpd;
+	dp->msm_dp_display.link_ready = hpd;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
-			dp->dp_display.connector_type, hpd);
-	dp_display_send_hpd_event(&dp->dp_display);
+			dp->msm_dp_display.connector_type, hpd);
+	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
 
 	return 0;
 }
 
-static int dp_display_process_hpd_high(struct dp_display_private *dp)
+static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
-	struct drm_connector *connector = dp->dp_display.connector;
+	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
-	rc = dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;
 
-	dp_link_process_request(dp->link);
+	msm_dp_link_process_request(dp->link);
 
-	if (!dp->dp_display.is_edp)
+	if (!dp->msm_dp_display.is_edp)
 		drm_dp_set_subconnector_property(connector,
 						 connector_status_connected,
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
-	dp->dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
+	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	dp_panel_handle_sink_request(dp->panel);
+	msm_dp_panel_handle_sink_request(dp->panel);
 
 	/*
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
 	 */
-	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
-	dp_link_reset_phy_params_vx_px(dp->link);
-	rc = dp_ctrl_on_link(dp->ctrl);
+	msm_dp_link_reset_phy_params_vx_px(dp->link);
+	rc = msm_dp_ctrl_on_link(dp->ctrl);
 	if (rc) {
 		DRM_ERROR("failed to complete DP link training\n");
 		goto end;
 	}
 
-	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
 end:
 	return rc;
 }
 
-static void dp_display_host_phy_init(struct dp_display_private *dp)
+static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
+		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
 	if (!dp->phy_initialized) {
-		dp_ctrl_phy_init(dp->ctrl);
+		msm_dp_ctrl_phy_init(dp->ctrl);
 		dp->phy_initialized = true;
 	}
 }
 
-static void dp_display_host_phy_exit(struct dp_display_private *dp)
+static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
+		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
 	if (dp->phy_initialized) {
-		dp_ctrl_phy_exit(dp->ctrl);
+		msm_dp_ctrl_phy_exit(dp->ctrl);
 		dp->phy_initialized = false;
 	}
 }
 
-static void dp_display_host_init(struct dp_display_private *dp)
+static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
+		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_ctrl_core_clk_enable(dp->ctrl);
-	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
-	dp_aux_init(dp->aux);
+	msm_dp_ctrl_core_clk_enable(dp->ctrl);
+	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
+	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
 
-static void dp_display_host_deinit(struct dp_display_private *dp)
+static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
+		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
-	dp_aux_deinit(dp->aux);
-	dp_ctrl_core_clk_disable(dp->ctrl);
+	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
+	msm_dp_aux_deinit(dp->aux);
+	msm_dp_ctrl_core_clk_disable(dp->ctrl);
 	dp->core_initialized = false;
 }
 
-static int dp_display_usbpd_configure_cb(struct device *dev)
+static int msm_dp_display_usbpd_configure_cb(struct device *dev)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	dp_display_host_phy_init(dp);
+	msm_dp_display_host_phy_init(dp);
 
-	return dp_display_process_hpd_high(dp);
+	return msm_dp_display_process_hpd_high(dp);
 }
 
-static int dp_display_notify_disconnect(struct device *dev)
+static int msm_dp_display_notify_disconnect(struct device *dev)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
 	return 0;
 }
 
-static void dp_display_handle_video_request(struct dp_display_private *dp)
+static void msm_dp_display_handle_video_request(struct msm_dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
 		dp->panel->video_test = true;
-		dp_link_send_test_response(dp->link);
+		msm_dp_link_send_test_response(dp->link);
 	}
 }
 
-static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
+static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 
@@ -491,12 +491,12 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
 			dp->hpd_state = ST_MAINLINK_READY;
-			rc = dp_display_process_hpd_high(dp);
+			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
 				dp->hpd_state = ST_DISCONNECTED;
 		}
@@ -505,7 +505,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
 	return rc;
 }
 
-static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
+static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 {
 	u32 sink_request = dp->link->sink_request;
 
@@ -519,48 +519,48 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 		}
 	}
 
-	dp_ctrl_handle_sink_request(dp->ctrl);
+	msm_dp_ctrl_handle_sink_request(dp->ctrl);
 
 	if (sink_request & DP_TEST_LINK_VIDEO_PATTERN)
-		dp_display_handle_video_request(dp);
+		msm_dp_display_handle_video_request(dp);
 
 	return 0;
 }
 
-static int dp_display_usbpd_attention_cb(struct device *dev)
+static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 {
 	int rc = 0;
 	u32 sink_request;
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	/* check for any test request issued by sink */
-	rc = dp_link_process_request(dp->link);
+	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
 		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
 					dp->hpd_state, sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = dp_display_handle_port_status_changed(dp);
+			rc = msm_dp_display_handle_port_status_changed(dp);
 		else
-			rc = dp_display_handle_irq_hpd(dp);
+			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
 	return rc;
 }
 
-static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 {
 	u32 state;
 	int ret;
-	struct platform_device *pdev = dp->dp_display.pdev;
+	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	dp_aux_enable_xfers(dp->aux, true);
+	msm_dp_aux_enable_xfers(dp->aux, true);
 
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->dp_display.connector_type, state);
+			dp->msm_dp_display.connector_type, state);
 
 	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
@@ -574,7 +574,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -586,7 +586,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return ret;
 	}
 
-	ret = dp_display_usbpd_configure_cb(&pdev->dev);
+	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
 		pm_runtime_put_sync(&pdev->dev);
@@ -595,60 +595,60 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->dp_display.connector_type, state);
+			dp->msm_dp_display.connector_type, state);
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
 	return 0;
 };
 
-static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
+static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 		bool plugged)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 
-	dp = container_of(dp_display,
-			struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display,
+			struct msm_dp_display_private, msm_dp_display);
 
 	/* notify audio subsystem only if sink supports audio */
-	if (dp_display->plugged_cb && dp_display->codec_dev &&
+	if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
 			dp->audio_supported)
-		dp_display->plugged_cb(dp_display->codec_dev, plugged);
+		msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
 }
 
-static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 {
 	u32 state;
-	struct platform_device *pdev = dp->dp_display.pdev;
+	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	dp_aux_enable_xfers(dp->aux, false);
+	msm_dp_aux_enable_xfers(dp->aux, false);
 
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
 
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->dp_display.connector_type, state);
+			dp->msm_dp_display.connector_type, state);
 
 	/* unplugged, no more irq_hpd handle */
-	dp_del_event(dp, EV_IRQ_HPD_INT);
+	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
 	if (state == ST_DISCONNECTED) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
-			dp_display_host_phy_exit(dp);
+			msm_dp_display_host_phy_exit(dp);
 		}
-		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
+		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_MAINLINK_READY) {
-		dp_ctrl_off_link(dp->ctrl);
-		dp_display_host_phy_exit(dp);
+		msm_dp_ctrl_off_link(dp->ctrl);
+		msm_dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
-		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
+		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 		pm_runtime_put_sync(&pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -658,7 +658,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
+	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
 	if (state == ST_DISPLAY_OFF) {
 		dp->hpd_state = ST_DISCONNECTED;
@@ -667,10 +667,10 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* signal the disconnect event early to ensure proper teardown */
-	dp_display_handle_plugged_change(&dp->dp_display, false);
+	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->dp_display.connector_type, state);
+			dp->msm_dp_display.connector_type, state);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -678,7 +678,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
 	u32 state;
 
@@ -687,7 +687,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->dp_display.connector_type, state);
+			dp->msm_dp_display.connector_type, state);
 
 	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
@@ -696,33 +696,33 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
 
-	dp_display_usbpd_attention_cb(&dp->dp_display.pdev->dev);
+	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->dp_display.connector_type, state);
+			dp->msm_dp_display.connector_type, state);
 
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
 }
 
-static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
+static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
-	dp_audio_put(dp->audio);
-	dp_panel_put(dp->panel);
-	dp_aux_put(dp->aux);
+	msm_dp_audio_put(dp->audio);
+	msm_dp_panel_put(dp->panel);
+	msm_dp_aux_put(dp->aux);
 }
 
-static int dp_init_sub_modules(struct dp_display_private *dp)
+static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
-	struct device *dev = &dp->dp_display.pdev->dev;
-	struct dp_panel_in panel_in = {
+	struct device *dev = &dp->msm_dp_display.pdev->dev;
+	struct msm_dp_panel_in panel_in = {
 		.dev = dev,
 	};
 	struct phy *phy;
@@ -732,14 +732,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		return PTR_ERR(phy);
 
 	rc = phy_set_mode_ext(phy, PHY_MODE_DP,
-			      dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
+			      dp->msm_dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
 	if (rc) {
 		DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
 		dp->catalog = NULL;
 		goto error;
 	}
 
-	dp->catalog = dp_catalog_get(dev);
+	dp->catalog = msm_dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
 		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
@@ -747,9 +747,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog,
+	dp->aux = msm_dp_aux_get(dev, dp->catalog,
 			     phy,
-			     dp->dp_display.is_edp);
+			     dp->msm_dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
@@ -757,7 +757,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->link = dp_link_get(dev, dp->aux);
+	dp->link = msm_dp_link_get(dev, dp->aux);
 	if (IS_ERR(dp->link)) {
 		rc = PTR_ERR(dp->link);
 		DRM_ERROR("failed to initialize link, rc = %d\n", rc);
@@ -769,7 +769,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	panel_in.catalog = dp->catalog;
 	panel_in.link = dp->link;
 
-	dp->panel = dp_panel_get(&panel_in);
+	dp->panel = msm_dp_panel_get(&panel_in);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -777,7 +777,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
+	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
 			       dp->catalog,
 			       phy);
 	if (IS_ERR(dp->ctrl)) {
@@ -787,7 +787,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = dp_audio_get(dp->dp_display.pdev, dp->panel, dp->catalog);
+	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->panel, dp->catalog);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
@@ -798,51 +798,51 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	return rc;
 
 error_ctrl:
-	dp_panel_put(dp->panel);
+	msm_dp_panel_put(dp->panel);
 error_link:
-	dp_aux_put(dp->aux);
+	msm_dp_aux_put(dp->aux);
 error:
 	return rc;
 }
 
-static int dp_display_set_mode(struct msm_dp *dp_display,
-			       struct dp_display_mode *mode)
+static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
+			       struct msm_dp_display_mode *mode)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
-	dp->panel->dp_mode.bpp = mode->bpp;
-	dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
-	dp_panel_init_panel_info(dp->panel);
+	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
+	dp->panel->msm_dp_mode.bpp = mode->bpp;
+	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
+	msm_dp_panel_init_panel_info(dp->panel);
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, bool force_link_train)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
 {
 	int rc = 0;
-	struct msm_dp *dp_display = &dp->dp_display;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (dp_display->power_on) {
+	if (msm_dp_display->power_on) {
 		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
 		return 0;
 	}
 
-	rc = dp_ctrl_on_stream(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
 	if (!rc)
-		dp_display->power_on = true;
+		msm_dp_display->power_on = true;
 
 	return rc;
 }
 
-static int dp_display_post_enable(struct msm_dp *dp_display)
+static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 	u32 rate;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rate = dp->link->link_params.rate;
 
@@ -852,85 +852,85 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	}
 
 	/* signal the connect event late to synchronize video and display */
-	dp_display_handle_plugged_change(dp_display, true);
+	msm_dp_display_handle_plugged_change(msm_dp_display, true);
 
-	if (dp_display->psr_supported)
-		dp_ctrl_config_psr(dp->ctrl);
+	if (msm_dp_display->psr_supported)
+		msm_dp_ctrl_config_psr(dp->ctrl);
 
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 {
-	struct msm_dp *dp_display = &dp->dp_display;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!dp_display->power_on)
+	if (!msm_dp_display->power_on)
 		return 0;
 
 	/* wait only if audio was enabled */
-	if (dp_display->audio_enabled) {
+	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
-		dp_display_handle_plugged_change(dp_display, false);
+		msm_dp_display_handle_plugged_change(msm_dp_display, false);
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
 			DRM_ERROR("audio comp timeout\n");
 	}
 
-	dp_display->audio_enabled = false;
+	msm_dp_display->audio_enabled = false;
 
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		dp_ctrl_off_link_stream(dp->ctrl);
+		msm_dp_ctrl_off_link_stream(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		dp_ctrl_off(dp->ctrl);
-		dp_display_host_phy_exit(dp);
+		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_display_host_phy_exit(dp);
 	}
 
-	dp_display->power_on = false;
+	msm_dp_display->power_on = false;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
 }
 
-int dp_display_set_plugged_cb(struct msm_dp *dp_display,
+int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev)
 {
 	bool plugged;
 
-	dp_display->plugged_cb = fn;
-	dp_display->codec_dev = codec_dev;
-	plugged = dp_display->link_ready;
-	dp_display_handle_plugged_change(dp_display, plugged);
+	msm_dp_display->plugged_cb = fn;
+	msm_dp_display->codec_dev = codec_dev;
+	plugged = msm_dp_display->link_ready;
+	msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
 
 	return 0;
 }
 
 /**
- * dp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
+enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
-	struct dp_display_private *dp_display;
-	struct dp_link_info *link_info;
+	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
 	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
@@ -940,18 +940,18 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_CLOCK_HIGH;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
-	link_info = &dp_display->panel->link_info;
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	link_info = &msm_dp_display->panel->link_info;
 
 	if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
-	    dp_display->panel->vsc_sdp_supported)
+	    msm_dp_display->panel->vsc_sdp_supported)
 		mode_pclk_khz /= 2;
 
 	mode_bpp = dp->connector->display_info.bpc * num_components;
 	if (!mode_bpp)
 		mode_bpp = default_bpp;
 
-	mode_bpp = dp_panel_get_mode_bpp(dp_display->panel,
+	mode_bpp = msm_dp_panel_get_mode_bpp(msm_dp_display->panel,
 			mode_bpp, mode_pclk_khz);
 
 	mode_rate_khz = mode_pclk_khz * mode_bpp;
@@ -963,50 +963,50 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-int dp_display_get_modes(struct msm_dp *dp)
+int msm_dp_display_get_modes(struct msm_dp *dp)
 {
-	struct dp_display_private *dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
 		return 0;
 	}
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return dp_panel_get_modes(dp_display->panel,
+	return msm_dp_panel_get_modes(msm_dp_display->panel,
 		dp->connector);
 }
 
-bool dp_display_check_video_test(struct msm_dp *dp)
+bool msm_dp_display_check_video_test(struct msm_dp *dp)
 {
-	struct dp_display_private *dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return dp_display->panel->video_test;
+	return msm_dp_display->panel->video_test;
 }
 
-int dp_display_get_test_bpp(struct msm_dp *dp)
+int msm_dp_display_get_test_bpp(struct msm_dp *dp)
 {
-	struct dp_display_private *dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
 		return 0;
 	}
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return dp_link_bit_depth_to_bpp(
-		dp_display->link->test_video.test_bit_depth);
+	return msm_dp_link_bit_depth_to_bpp(
+		msm_dp_display->link->test_video.test_bit_depth);
 }
 
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 {
-	struct dp_display_private *dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	/*
 	 * if we are reading registers we need the link clocks to be on
@@ -1015,65 +1015,65 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * power_on status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	mutex_lock(&dp_display->event_mutex);
+	mutex_lock(&msm_dp_display->event_mutex);
 
 	if (!dp->power_on) {
-		mutex_unlock(&dp_display->event_mutex);
+		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	dp_catalog_snapshot(dp_display->catalog, disp_state);
+	msm_dp_catalog_snapshot(msm_dp_display->catalog, disp_state);
 
-	mutex_unlock(&dp_display->event_mutex);
+	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
-void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
+void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 
-	if (!dp_display) {
+	if (!msm_dp_display) {
 		DRM_ERROR("invalid params\n");
 		return;
 	}
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-	dp_ctrl_set_psr(dp->ctrl, enter);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	msm_dp_ctrl_set_psr(dp->ctrl, enter);
 }
 
 static int hpd_event_thread(void *data)
 {
-	struct dp_display_private *dp_priv;
+	struct msm_dp_display_private *msm_dp_priv;
 	unsigned long flag;
-	struct dp_event *todo;
+	struct msm_dp_event *todo;
 	int timeout_mode = 0;
 
-	dp_priv = (struct dp_display_private *)data;
+	msm_dp_priv = (struct msm_dp_display_private *)data;
 
 	while (1) {
 		if (timeout_mode) {
-			wait_event_timeout(dp_priv->event_q,
-				(dp_priv->event_pndx == dp_priv->event_gndx) ||
+			wait_event_timeout(msm_dp_priv->event_q,
+				(msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) ||
 					kthread_should_stop(), EVENT_TIMEOUT);
 		} else {
-			wait_event_interruptible(dp_priv->event_q,
-				(dp_priv->event_pndx != dp_priv->event_gndx) ||
+			wait_event_interruptible(msm_dp_priv->event_q,
+				(msm_dp_priv->event_pndx != msm_dp_priv->event_gndx) ||
 					kthread_should_stop());
 		}
 
 		if (kthread_should_stop())
 			break;
 
-		spin_lock_irqsave(&dp_priv->event_lock, flag);
-		todo = &dp_priv->event_list[dp_priv->event_gndx];
+		spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
+		todo = &msm_dp_priv->event_list[msm_dp_priv->event_gndx];
 		if (todo->delay) {
-			struct dp_event *todo_next;
+			struct msm_dp_event *todo_next;
 
-			dp_priv->event_gndx++;
-			dp_priv->event_gndx %= DP_EVENT_Q_MAX;
+			msm_dp_priv->event_gndx++;
+			msm_dp_priv->event_gndx %= DP_EVENT_Q_MAX;
 
 			/* re enter delay event into q */
-			todo_next = &dp_priv->event_list[dp_priv->event_pndx++];
-			dp_priv->event_pndx %= DP_EVENT_Q_MAX;
+			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
+			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
 			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
@@ -1084,33 +1084,33 @@ static int hpd_event_thread(void *data)
 
 			/* switch to timeout mode */
 			timeout_mode = 1;
-			spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+			spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 			continue;
 		}
 
 		/* timeout with no events in q */
-		if (dp_priv->event_pndx == dp_priv->event_gndx) {
-			spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+		if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
+			spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 			continue;
 		}
 
-		dp_priv->event_gndx++;
-		dp_priv->event_gndx %= DP_EVENT_Q_MAX;
+		msm_dp_priv->event_gndx++;
+		msm_dp_priv->event_gndx %= DP_EVENT_Q_MAX;
 		timeout_mode = 0;
-		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			dp_hpd_plug_handle(dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			dp_hpd_unplug_handle(dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
 			break;
 		case EV_IRQ_HPD_INT:
-			dp_irq_hpd_handle(dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
 		case EV_USER_NOTIFICATION:
-			dp_display_send_hpd_notification(dp_priv,
+			msm_dp_display_send_hpd_notification(msm_dp_priv,
 						todo->data);
 			break;
 		default:
@@ -1121,22 +1121,22 @@ static int hpd_event_thread(void *data)
 	return 0;
 }
 
-static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
+static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv)
 {
 	/* set event q to empty */
-	dp_priv->event_gndx = 0;
-	dp_priv->event_pndx = 0;
+	msm_dp_priv->event_gndx = 0;
+	msm_dp_priv->event_pndx = 0;
 
-	dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
-	if (IS_ERR(dp_priv->ev_tsk))
-		return PTR_ERR(dp_priv->ev_tsk);
+	msm_dp_priv->ev_tsk = kthread_run(hpd_event_thread, msm_dp_priv, "dp_hpd_handler");
+	if (IS_ERR(msm_dp_priv->ev_tsk))
+		return PTR_ERR(msm_dp_priv->ev_tsk);
 
 	return 0;
 }
 
-static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
+static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
-	struct dp_display_private *dp = dev_id;
+	struct msm_dp_display_private *dp = dev_id;
 	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
 
@@ -1145,43 +1145,43 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
+	hpd_isr_status = msm_dp_catalog_hpd_get_intr_status(dp->catalog);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
-			dp->dp_display.connector_type, hpd_isr_status);
+			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
 
 		ret = IRQ_HANDLED;
 	}
 
 	/* DP controller isr */
-	ret |= dp_ctrl_isr(dp->ctrl);
+	ret |= msm_dp_ctrl_isr(dp->ctrl);
 
 	/* DP aux isr */
-	ret |= dp_aux_isr(dp->aux);
+	ret |= msm_dp_aux_isr(dp->aux);
 
 	return ret;
 }
 
-static int dp_display_request_irq(struct dp_display_private *dp)
+static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
-	struct platform_device *pdev = dp->dp_display.pdev;
+	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
 	dp->irq = platform_get_irq(pdev, 0);
 	if (dp->irq < 0) {
@@ -1189,7 +1189,7 @@ static int dp_display_request_irq(struct dp_display_private *dp)
 		return dp->irq;
 	}
 
-	rc = devm_request_irq(&pdev->dev, dp->irq, dp_display_irq_handler,
+	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
 			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
 			      "dp_display_isr", dp);
 
@@ -1202,7 +1202,7 @@ static int dp_display_request_irq(struct dp_display_private *dp)
 	return 0;
 }
 
-static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
+static const struct msm_dp_desc *msm_dp_display_get_desc(struct platform_device *pdev)
 {
 	const struct msm_dp_desc *descs = of_device_get_match_data(&pdev->dev);
 	struct resource *res;
@@ -1221,7 +1221,7 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_display_probe_tail(struct device *dev)
+static int msm_dp_display_probe_tail(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
 	int ret;
@@ -1241,19 +1241,19 @@ static int dp_display_probe_tail(struct device *dev)
 			return ret;
 	}
 
-	ret = component_add(dev, &dp_display_comp_ops);
+	ret = component_add(dev, &msm_dp_display_comp_ops);
 	if (ret)
 		DRM_ERROR("component add failed, rc=%d\n", ret);
 
 	return ret;
 }
 
-static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+static int msm_dp_auxbus_done_probe(struct drm_dp_aux *aux)
 {
-	return dp_display_probe_tail(aux->dev);
+	return msm_dp_display_probe_tail(aux->dev);
 }
 
-static int dp_display_get_connector_type(struct platform_device *pdev,
+static int msm_dp_display_get_connector_type(struct platform_device *pdev,
 					 const struct msm_dp_desc *desc)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -1272,10 +1272,10 @@ static int dp_display_get_connector_type(struct platform_device *pdev,
 	return connector_type;
 }
 
-static int dp_display_probe(struct platform_device *pdev)
+static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 	const struct msm_dp_desc *desc;
 
 	if (!pdev || !pdev->dev.of_node) {
@@ -1287,18 +1287,18 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	desc = dp_display_get_desc(pdev);
+	desc = msm_dp_display_get_desc(pdev);
 	if (!desc)
 		return -EINVAL;
 
-	dp->dp_display.pdev = pdev;
+	dp->msm_dp_display.pdev = pdev;
 	dp->id = desc->id;
-	dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
+	dp->msm_dp_display.connector_type = msm_dp_display_get_connector_type(pdev, desc);
 	dp->wide_bus_supported = desc->wide_bus_supported;
-	dp->dp_display.is_edp =
-		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
+	dp->msm_dp_display.is_edp =
+		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
-	rc = dp_init_sub_modules(dp);
+	rc = msm_dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");
 		return -EPROBE_DEFER;
@@ -1310,28 +1310,28 @@ static int dp_display_probe(struct platform_device *pdev)
 	spin_lock_init(&dp->event_lock);
 
 	/* Store DP audio handle inside DP display */
-	dp->dp_display.dp_audio = dp->audio;
+	dp->msm_dp_display.msm_dp_audio = dp->audio;
 
 	init_completion(&dp->audio_comp);
 
-	platform_set_drvdata(pdev, &dp->dp_display);
+	platform_set_drvdata(pdev, &dp->msm_dp_display);
 
 	rc = devm_pm_runtime_enable(&pdev->dev);
 	if (rc)
 		goto err;
 
-	rc = dp_display_request_irq(dp);
+	rc = msm_dp_display_request_irq(dp);
 	if (rc)
 		goto err;
 
-	if (dp->dp_display.is_edp) {
-		rc = devm_of_dp_aux_populate_bus(dp->aux, dp_auxbus_done_probe);
+	if (dp->msm_dp_display.is_edp) {
+		rc = devm_of_dp_aux_populate_bus(dp->aux, msm_dp_auxbus_done_probe);
 		if (rc) {
 			DRM_ERROR("eDP auxbus population failed, rc=%d\n", rc);
 			goto err;
 		}
 	} else {
-		rc = dp_display_probe_tail(&pdev->dev);
+		rc = msm_dp_display_probe_tail(&pdev->dev);
 		if (rc)
 			goto err;
 	}
@@ -1339,70 +1339,70 @@ static int dp_display_probe(struct platform_device *pdev)
 	return rc;
 
 err:
-	dp_display_deinit_sub_modules(dp);
+	msm_dp_display_deinit_sub_modules(dp);
 	return rc;
 }
 
-static void dp_display_remove(struct platform_device *pdev)
+static void msm_dp_display_remove(struct platform_device *pdev)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
-	component_del(&pdev->dev, &dp_display_comp_ops);
-	dp_display_deinit_sub_modules(dp);
+	component_del(&pdev->dev, &msm_dp_display_comp_ops);
+	msm_dp_display_deinit_sub_modules(dp);
 	platform_set_drvdata(pdev, NULL);
 }
 
-static int dp_pm_runtime_suspend(struct device *dev)
+static int msm_dp_pm_runtime_suspend(struct device *dev)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	disable_irq(dp->irq);
 
-	if (dp->dp_display.is_edp) {
-		dp_display_host_phy_exit(dp);
-		dp_catalog_ctrl_hpd_disable(dp->catalog);
+	if (dp->msm_dp_display.is_edp) {
+		msm_dp_display_host_phy_exit(dp);
+		msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
 	}
-	dp_display_host_deinit(dp);
+	msm_dp_display_host_deinit(dp);
 
 	return 0;
 }
 
-static int dp_pm_runtime_resume(struct device *dev)
+static int msm_dp_pm_runtime_resume(struct device *dev)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	/*
 	 * for eDP, host cotroller, HPD block and PHY are enabled here
 	 * but with HPD irq disabled
 	 *
 	 * for DP, only host controller is enabled here.
-	 * HPD block is enabled at dp_bridge_hpd_enable()
+	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
 	 * PHY will be enabled at plugin handler later
 	 */
-	dp_display_host_init(dp);
-	if (dp->dp_display.is_edp) {
-		dp_catalog_ctrl_hpd_enable(dp->catalog);
-		dp_display_host_phy_init(dp);
+	msm_dp_display_host_init(dp);
+	if (dp->msm_dp_display.is_edp) {
+		msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
+		msm_dp_display_host_phy_init(dp);
 	}
 
 	enable_irq(dp->irq);
 	return 0;
 }
 
-static const struct dev_pm_ops dp_pm_ops = {
-	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
+static const struct dev_pm_ops msm_dp_pm_ops = {
+	SET_RUNTIME_PM_OPS(msm_dp_pm_runtime_suspend, msm_dp_pm_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
 
-static struct platform_driver dp_display_driver = {
-	.probe  = dp_display_probe,
-	.remove_new = dp_display_remove,
+static struct platform_driver msm_dp_display_driver = {
+	.probe  = msm_dp_display_probe,
+	.remove_new = msm_dp_display_remove,
 	.driver = {
 		.name = "msm-dp-display",
-		.of_match_table = dp_dt_match,
+		.of_match_table = msm_dp_dt_match,
 		.suppress_bind_attrs = true,
-		.pm = &dp_pm_ops,
+		.pm = &msm_dp_pm_ops,
 	},
 };
 
@@ -1410,7 +1410,7 @@ int __init msm_dp_register(void)
 {
 	int ret;
 
-	ret = platform_driver_register(&dp_display_driver);
+	ret = platform_driver_register(&msm_dp_display_driver);
 	if (ret)
 		DRM_ERROR("Dp display driver register failed");
 
@@ -1419,294 +1419,294 @@ int __init msm_dp_register(void)
 
 void __exit msm_dp_unregister(void)
 {
-	platform_driver_unregister(&dp_display_driver);
+	platform_driver_unregister(&msm_dp_display_driver);
 }
 
-bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+bool msm_dp_is_yuv_420_enabled(const struct msm_dp *msm_dp_display,
 			       const struct drm_display_mode *mode)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 	const struct drm_display_info *info;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-	info = &dp_display->connector->display_info;
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	info = &msm_dp_display->connector->display_info;
 
 	return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
 }
 
-bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
 			       const struct drm_display_mode *mode)
 {
-	return msm_dp_is_yuv_420_enabled(dp_display, mode);
+	return msm_dp_is_yuv_420_enabled(msm_dp_display, mode);
 }
 
-bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
+bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->dp_mode.out_fmt_is_yuv_420)
+	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
 }
 
-void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, bool is_edp)
+void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *root, bool is_edp)
 {
-	struct dp_display_private *dp;
+	struct msm_dp_display_private *dp;
 	struct device *dev;
 	int rc;
 
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-	dev = &dp->dp_display.pdev->dev;
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	dev = &dp->msm_dp_display.pdev->dev;
 
-	rc = dp_debug_init(dev, dp->panel, dp->link, dp->dp_display.connector, root, is_edp);
+	rc = msm_dp_debug_init(dev, dp->panel, dp->link, dp->msm_dp_display.connector, root, is_edp);
 	if (rc)
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
 }
 
-int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
+int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder, bool yuv_supported)
 {
-	struct dp_display_private *dp_priv;
+	struct msm_dp_display_private *msm_dp_priv;
 	int ret;
 
-	dp_display->drm_dev = dev;
+	msm_dp_display->drm_dev = dev;
 
-	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
+	msm_dp_priv = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	ret = dp_bridge_init(dp_display, dev, encoder, yuv_supported);
+	ret = msm_dp_bridge_init(msm_dp_display, dev, encoder, yuv_supported);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp bridge: %d\n", ret);
 		return ret;
 	}
 
-	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
-	if (IS_ERR(dp_display->connector)) {
-		ret = PTR_ERR(dp_display->connector);
+	msm_dp_display->connector = msm_dp_drm_connector_init(msm_dp_display, encoder);
+	if (IS_ERR(msm_dp_display->connector)) {
+		ret = PTR_ERR(msm_dp_display->connector);
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp connector: %d\n", ret);
-		dp_display->connector = NULL;
+		msm_dp_display->connector = NULL;
 		return ret;
 	}
 
-	dp_priv->panel->connector = dp_display->connector;
+	msm_dp_priv->panel->connector = msm_dp_display->connector;
 
 	return 0;
 }
 
-void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 			     struct drm_bridge_state *old_bridge_state)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = dp_bridge->dp_display;
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
-	struct dp_display_private *dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 	u32 state;
 	bool force_link_train = false;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
-	if (!dp_display->dp_mode.drm_mode.clock) {
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
 		DRM_ERROR("invalid params\n");
 		return;
 	}
 
 	if (dp->is_edp)
-		dp_hpd_plug_handle(dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display, 0);
 
-	mutex_lock(&dp_display->event_mutex);
+	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&dp_display->event_mutex);
+		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	state = dp_display->hpd_state;
+	state = msm_dp_display->hpd_state;
 	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
-		mutex_unlock(&dp_display->event_mutex);
+		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
+	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		mutex_unlock(&dp_display->event_mutex);
+		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	state =  dp_display->hpd_state;
+	state =  msm_dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF) {
-		dp_display_host_phy_init(dp_display);
+		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
 
-	dp_display_enable(dp_display, force_link_train);
+	msm_dp_display_enable(msm_dp_display, force_link_train);
 
-	rc = dp_display_post_enable(dp);
+	rc = msm_dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display);
+		msm_dp_display_disable(msm_dp_display);
 	}
 
 	/* completed connection */
-	dp_display->hpd_state = ST_CONNECTED;
+	msm_dp_display->hpd_state = ST_CONNECTED;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
-	mutex_unlock(&dp_display->event_mutex);
+	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
-void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 			      struct drm_bridge_state *old_bridge_state)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = dp_bridge->dp_display;
-	struct dp_display_private *dp_display;
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	dp_ctrl_push_idle(dp_display->ctrl);
+	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
-void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *old_bridge_state)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = dp_bridge->dp_display;
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	u32 state;
-	struct dp_display_private *dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		dp_hpd_unplug_handle(dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
 
-	mutex_lock(&dp_display->event_mutex);
+	mutex_lock(&msm_dp_display->event_mutex);
 
-	state = dp_display->hpd_state;
+	state = msm_dp_display->hpd_state;
 	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED)
 		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
 			   dp->connector_type, state);
 
-	dp_display_disable(dp_display);
+	msm_dp_display_disable(msm_dp_display);
 
-	state =  dp_display->hpd_state;
+	state =  msm_dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-		dp_display->hpd_state = ST_DISCONNECTED;
+		msm_dp_display->hpd_state = ST_DISCONNECTED;
 	} else {
-		dp_display->hpd_state = ST_DISPLAY_OFF;
+		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);
-	mutex_unlock(&dp_display->event_mutex);
+	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
-void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = dp_bridge->dp_display;
-	struct dp_display_private *dp_display;
-	struct dp_panel *dp_panel;
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_panel *msm_dp_panel;
 
-	dp_display = container_of(dp, struct dp_display_private, dp_display);
-	dp_panel = dp_display->panel;
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	msm_dp_panel = msm_dp_display->panel;
 
-	memset(&dp_display->dp_mode, 0x0, sizeof(struct dp_display_mode));
+	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
 
-	if (dp_display_check_video_test(dp))
-		dp_display->dp_mode.bpp = dp_display_get_test_bpp(dp);
+	if (msm_dp_display_check_video_test(dp))
+		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
 	else /* Default num_components per pixel = 3 */
-		dp_display->dp_mode.bpp = dp->connector->display_info.bpc * 3;
+		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
 
-	if (!dp_display->dp_mode.bpp)
-		dp_display->dp_mode.bpp = 24; /* Default bpp */
+	if (!msm_dp_display->msm_dp_mode.bpp)
+		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
 
-	drm_mode_copy(&dp_display->dp_mode.drm_mode, adjusted_mode);
+	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
 
-	dp_display->dp_mode.v_active_low =
-		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_display->msm_dp_mode.v_active_low =
+		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
 
-	dp_display->dp_mode.h_active_low =
-		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_display->msm_dp_mode.h_active_low =
+		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 
-	dp_display->dp_mode.out_fmt_is_yuv_420 =
+	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
 		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
-		dp_panel->vsc_sdp_supported;
+		msm_dp_panel->vsc_sdp_supported;
 
 	/* populate wide_bus_support to different layers */
-	dp_display->ctrl->wide_bus_en =
-		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
-	dp_display->catalog->wide_bus_en =
-		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
+	msm_dp_display->ctrl->wide_bus_en =
+		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
+	msm_dp_display->catalog->wide_bus_en =
+		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
 }
 
-void dp_bridge_hpd_enable(struct drm_bridge *bridge)
+void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	/*
 	 * this is for external DP with hpd irq enabled case,
-	 * step-1: dp_pm_runtime_resume() enable dp host only
+	 * step-1: msm_dp_pm_runtime_resume() enable dp host only
 	 * step-2: enable hdp block and have hpd irq enabled here
 	 * step-3: waiting for plugin irq while phy is not initialized
 	 * step-4: DP PHY is initialized at plugin handler before link training
 	 *
 	 */
 	mutex_lock(&dp->event_mutex);
-	if (pm_runtime_resume_and_get(&dp_display->pdev->dev)) {
+	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to resume power\n");
 		mutex_unlock(&dp->event_mutex);
 		return;
 	}
 
-	dp_catalog_ctrl_hpd_enable(dp->catalog);
+	msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
 
 	/* enable HDP interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
+	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
 
-	dp_display->internal_hpd = true;
+	msm_dp_display->internal_hpd = true;
 	mutex_unlock(&dp->event_mutex);
 }
 
-void dp_bridge_hpd_disable(struct drm_bridge *bridge)
+void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	mutex_lock(&dp->event_mutex);
 	/* disable HDP interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
-	dp_catalog_ctrl_hpd_disable(dp->catalog);
+	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
+	msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
 
-	dp_display->internal_hpd = false;
+	msm_dp_display->internal_hpd = false;
 
-	pm_runtime_put_sync(&dp_display->pdev->dev);
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 	mutex_unlock(&dp->event_mutex);
 }
 
-void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			  enum drm_connector_status status)
 {
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (dp_display->internal_hpd)
+	if (msm_dp_display->internal_hpd)
 		return;
 
-	if (!dp_display->link_ready && status == connector_status_connected)
-		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
-	else if (dp_display->link_ready && status == connector_status_disconnected)
-		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+	if (!msm_dp_display->link_ready && status == connector_status_connected)
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index ec7fa67e0569..ecbc2d92f546 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -27,18 +27,18 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
-	struct dp_audio *dp_audio;
+	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
 
-int dp_display_set_plugged_cb(struct msm_dp *dp_display,
+int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
-int dp_display_get_modes(struct msm_dp *dp_display);
-bool dp_display_check_video_test(struct msm_dp *dp_display);
-int dp_display_get_test_bpp(struct msm_dp *dp_display);
-void dp_display_signal_audio_start(struct msm_dp *dp_display);
-void dp_display_signal_audio_complete(struct msm_dp *dp_display);
-void dp_display_set_psr(struct msm_dp *dp, bool enter);
-void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *dentry, bool is_edp);
+int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
+bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
+int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
+void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
+void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
+void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
+void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 7eb1621f9e7f..6a0840266c0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -14,15 +14,15 @@
 #include "dp_drm.h"
 
 /**
- * dp_bridge_detect - callback to determine if connector is connected
+ * msm_dp_bridge_detect - callback to determine if connector is connected
  * @bridge: Pointer to drm bridge structure
  * Returns: Bridge's 'is connected' status
  */
-static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 {
 	struct msm_dp *dp;
 
-	dp = to_dp_bridge(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
 		(dp->link_ready) ? "true" : "false");
@@ -31,14 +31,14 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
 					connector_status_disconnected;
 }
 
-static int dp_bridge_atomic_check(struct drm_bridge *bridge,
+static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state)
 {
 	struct msm_dp *dp;
 
-	dp = to_dp_bridge(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
 		(dp->link_ready) ? "true" : "false");
@@ -62,12 +62,12 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 
 /**
- * dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
+ * msm_dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
  * @bridge: Poiner to drm bridge
  * @connector: Pointer to drm connector structure
  * Returns: Number of modes added
  */
-static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
+static int msm_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	int rc = 0;
 	struct msm_dp *dp;
@@ -75,11 +75,11 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	if (!connector)
 		return 0;
 
-	dp = to_dp_bridge(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	/* pluggable case assumes EDID is read when HPD */
 	if (dp->link_ready) {
-		rc = dp_display_get_modes(dp);
+		rc = msm_dp_display_get_modes(dp);
 		if (rc <= 0) {
 			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
 			return rc;
@@ -90,29 +90,29 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	return rc;
 }
 
-static void dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
 {
-	struct msm_dp *dp = to_dp_bridge(bridge)->dp_display;
+	struct msm_dp *dp = to_dp_bridge(bridge)->msm_dp_display;
 
-	dp_display_debugfs_init(dp, root, false);
+	msm_dp_display_debugfs_init(dp, root, false);
 }
 
-static const struct drm_bridge_funcs dp_bridge_ops = {
+static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset           = drm_atomic_helper_bridge_reset,
-	.atomic_enable          = dp_bridge_atomic_enable,
-	.atomic_disable         = dp_bridge_atomic_disable,
-	.atomic_post_disable    = dp_bridge_atomic_post_disable,
-	.mode_set     = dp_bridge_mode_set,
-	.mode_valid   = dp_bridge_mode_valid,
-	.get_modes    = dp_bridge_get_modes,
-	.detect       = dp_bridge_detect,
-	.atomic_check = dp_bridge_atomic_check,
-	.hpd_enable   = dp_bridge_hpd_enable,
-	.hpd_disable  = dp_bridge_hpd_disable,
-	.hpd_notify   = dp_bridge_hpd_notify,
-	.debugfs_init = dp_bridge_debugfs_init,
+	.atomic_enable          = msm_dp_bridge_atomic_enable,
+	.atomic_disable         = msm_dp_bridge_atomic_disable,
+	.atomic_post_disable    = msm_dp_bridge_atomic_post_disable,
+	.mode_set     = msm_dp_bridge_mode_set,
+	.mode_valid   = msm_dp_bridge_mode_valid,
+	.get_modes    = msm_dp_bridge_get_modes,
+	.detect       = msm_dp_bridge_detect,
+	.atomic_check = msm_dp_bridge_atomic_check,
+	.hpd_enable   = msm_dp_bridge_hpd_enable,
+	.hpd_disable  = msm_dp_bridge_hpd_disable,
+	.hpd_notify   = msm_dp_bridge_hpd_notify,
+	.debugfs_init = msm_dp_bridge_debugfs_init,
 };
 
 static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
@@ -120,7 +120,7 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
 {
-	struct msm_dp *dp = to_dp_bridge(drm_bridge)->dp_display;
+	struct msm_dp *dp = to_dp_bridge(drm_bridge)->msm_dp_display;
 
 	if (WARN_ON(!conn_state))
 		return -ENODEV;
@@ -142,8 +142,8 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = dp_bridge->dp_display;
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 
 	/*
 	 * Check the old state of the crtc to determine if the panel
@@ -159,11 +159,11 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
 
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
-		dp_display_set_psr(dp, false);
+		msm_dp_display_set_psr(dp, false);
 		return;
 	}
 
-	dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
+	msm_dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
 }
 
 static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -172,8 +172,8 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
-	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = dp_bridge->dp_display;
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 
 	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state,
 						   drm_bridge->encoder);
@@ -200,15 +200,15 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	 * when display disable occurs while the sink is in psr state.
 	 */
 	if (new_crtc_state->self_refresh_active) {
-		dp_display_set_psr(dp, true);
+		msm_dp_display_set_psr(dp, true);
 		return;
 	} else if (old_crtc_state->self_refresh_active) {
-		dp_display_set_psr(dp, false);
+		msm_dp_display_set_psr(dp, false);
 		return;
 	}
 
 out:
-	dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
+	msm_dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
 }
 
 static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
@@ -233,7 +233,7 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (new_crtc_state->self_refresh_active)
 		return;
 
-	dp_bridge_atomic_post_disable(drm_bridge, old_bridge_state);
+	msm_dp_bridge_atomic_post_disable(drm_bridge, old_bridge_state);
 }
 
 /**
@@ -250,7 +250,7 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
@@ -270,16 +270,16 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 
 static void edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
 {
-	struct msm_dp *dp = to_dp_bridge(bridge)->dp_display;
+	struct msm_dp *dp = to_dp_bridge(bridge)->msm_dp_display;
 
-	dp_display_debugfs_init(dp, root, true);
+	msm_dp_display_debugfs_init(dp, root, true);
 }
 
 static const struct drm_bridge_funcs edp_bridge_ops = {
 	.atomic_enable = edp_bridge_atomic_enable,
 	.atomic_disable = edp_bridge_atomic_disable,
 	.atomic_post_disable = edp_bridge_atomic_post_disable,
-	.mode_set = dp_bridge_mode_set,
+	.mode_set = msm_dp_bridge_mode_set,
 	.mode_valid = edp_bridge_mode_valid,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -288,22 +288,22 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
 	.debugfs_init = edp_bridge_debugfs_init,
 };
 
-int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder, bool yuv_supported)
 {
 	int rc;
-	struct msm_dp_bridge *dp_bridge;
+	struct msm_dp_bridge *msm_dp_bridge;
 	struct drm_bridge *bridge;
 
-	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
-	if (!dp_bridge)
+	msm_dp_bridge = devm_kzalloc(dev->dev, sizeof(*msm_dp_bridge), GFP_KERNEL);
+	if (!msm_dp_bridge)
 		return -ENOMEM;
 
-	dp_bridge->dp_display = dp_display;
+	msm_dp_bridge->msm_dp_display = msm_dp_display;
 
-	bridge = &dp_bridge->bridge;
-	bridge->funcs = dp_display->is_edp ? &edp_bridge_ops : &dp_bridge_ops;
-	bridge->type = dp_display->connector_type;
+	bridge = &msm_dp_bridge->bridge;
+	bridge->funcs = msm_dp_display->is_edp ? &edp_bridge_ops : &msm_dp_bridge_ops;
+	bridge->type = msm_dp_display->connector_type;
 	bridge->ycbcr_420_allowed = yuv_supported;
 
 	/*
@@ -317,7 +317,7 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 	 *   allows the panel driver to properly power itself on to read the
 	 *   modes.
 	 */
-	if (!dp_display->is_edp) {
+	if (!msm_dp_display->is_edp) {
 		bridge->ops =
 			DRM_BRIDGE_OP_DETECT |
 			DRM_BRIDGE_OP_HPD |
@@ -338,9 +338,9 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 		return rc;
 	}
 
-	if (dp_display->next_bridge) {
+	if (msm_dp_display->next_bridge) {
 		rc = drm_bridge_attach(encoder,
-					dp_display->next_bridge, bridge,
+					msm_dp_display->next_bridge, bridge,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
@@ -352,16 +352,16 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 }
 
 /* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
+struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 					    struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = NULL;
 
-	connector = drm_bridge_connector_init(dp_display->drm_dev, encoder);
+	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
 	if (IS_ERR(connector))
 		return connector;
 
-	if (!dp_display->is_edp)
+	if (!msm_dp_display->is_edp)
 		drm_connector_attach_dp_subconnector_property(connector);
 
 	drm_connector_attach_encoder(connector, encoder);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index ae632fcc407c..8eae2f74839f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -14,32 +14,32 @@
 
 struct msm_dp_bridge {
 	struct drm_bridge bridge;
-	struct msm_dp *dp_display;
+	struct msm_dp *msm_dp_display;
 };
 
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
+struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 					    struct drm_encoder *encoder);
-int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
-void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 			     struct drm_bridge_state *old_bridge_state);
-void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 			      struct drm_bridge_state *old_bridge_state);
-void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *old_bridge_state);
-enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
+enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
-void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
-void dp_bridge_hpd_enable(struct drm_bridge *bridge);
-void dp_bridge_hpd_disable(struct drm_bridge *bridge);
-void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
+void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
+void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			  enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index d8967615d84d..1a1fbb2d7d4f 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -28,25 +28,25 @@ enum audio_pattern_type {
 	AUDIO_TEST_PATTERN_SAWTOOTH		= 0x01,
 };
 
-struct dp_link_request {
+struct msm_dp_link_request {
 	u32 test_requested;
 	u32 test_link_rate;
 	u32 test_lane_count;
 };
 
-struct dp_link_private {
+struct msm_dp_link_private {
 	u32 prev_sink_count;
 	struct drm_device *drm_dev;
 	struct drm_dp_aux *aux;
-	struct dp_link dp_link;
+	struct msm_dp_link msm_dp_link;
 
-	struct dp_link_request request;
+	struct msm_dp_link_request request;
 	struct mutex psm_mutex;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 };
 
-static int dp_aux_link_power_up(struct drm_dp_aux *aux,
-					struct dp_link_info *link)
+static int msm_dp_aux_link_power_up(struct drm_dp_aux *aux,
+					struct msm_dp_link_info *link)
 {
 	u8 value;
 	ssize_t len;
@@ -73,8 +73,8 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
 	return 0;
 }
 
-static int dp_aux_link_power_down(struct drm_dp_aux *aux,
-					struct dp_link_info *link)
+static int msm_dp_aux_link_power_down(struct drm_dp_aux *aux,
+					struct msm_dp_link_info *link)
 {
 	u8 value;
 	int err;
@@ -96,7 +96,7 @@ static int dp_aux_link_power_down(struct drm_dp_aux *aux,
 	return 0;
 }
 
-static int dp_link_get_period(struct dp_link_private *link, int const addr)
+static int msm_dp_link_get_period(struct msm_dp_link_private *link, int const addr)
 {
 	int ret = 0;
 	u8 data;
@@ -122,19 +122,19 @@ static int dp_link_get_period(struct dp_link_private *link, int const addr)
 	return ret;
 }
 
-static int dp_link_parse_audio_channel_period(struct dp_link_private *link)
+static int msm_dp_link_parse_audio_channel_period(struct msm_dp_link_private *link)
 {
 	int ret = 0;
-	struct dp_link_test_audio *req = &link->dp_link.test_audio;
+	struct msm_dp_link_test_audio *req = &link->msm_dp_link.test_audio;
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH1);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH1);
 	if (ret == -EINVAL)
 		goto exit;
 
 	req->test_audio_period_ch_1 = ret;
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_1 = 0x%x\n", ret);
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH2);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH2);
 	if (ret == -EINVAL)
 		goto exit;
 
@@ -142,42 +142,42 @@ static int dp_link_parse_audio_channel_period(struct dp_link_private *link)
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_2 = 0x%x\n", ret);
 
 	/* TEST_AUDIO_PERIOD_CH_3 (Byte 0x275) */
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH3);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH3);
 	if (ret == -EINVAL)
 		goto exit;
 
 	req->test_audio_period_ch_3 = ret;
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_3 = 0x%x\n", ret);
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH4);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH4);
 	if (ret == -EINVAL)
 		goto exit;
 
 	req->test_audio_period_ch_4 = ret;
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_4 = 0x%x\n", ret);
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH5);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH5);
 	if (ret == -EINVAL)
 		goto exit;
 
 	req->test_audio_period_ch_5 = ret;
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_5 = 0x%x\n", ret);
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH6);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH6);
 	if (ret == -EINVAL)
 		goto exit;
 
 	req->test_audio_period_ch_6 = ret;
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_6 = 0x%x\n", ret);
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH7);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH7);
 	if (ret == -EINVAL)
 		goto exit;
 
 	req->test_audio_period_ch_7 = ret;
 	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_7 = 0x%x\n", ret);
 
-	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH8);
+	ret = msm_dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH8);
 	if (ret == -EINVAL)
 		goto exit;
 
@@ -187,7 +187,7 @@ static int dp_link_parse_audio_channel_period(struct dp_link_private *link)
 	return ret;
 }
 
-static int dp_link_parse_audio_pattern_type(struct dp_link_private *link)
+static int msm_dp_link_parse_audio_pattern_type(struct msm_dp_link_private *link)
 {
 	int ret = 0;
 	u8 data;
@@ -208,13 +208,13 @@ static int dp_link_parse_audio_pattern_type(struct dp_link_private *link)
 		goto exit;
 	}
 
-	link->dp_link.test_audio.test_audio_pattern_type = data;
+	link->msm_dp_link.test_audio.test_audio_pattern_type = data;
 	drm_dbg_dp(link->drm_dev, "audio pattern type = 0x%x\n", data);
 exit:
 	return ret;
 }
 
-static int dp_link_parse_audio_mode(struct dp_link_private *link)
+static int msm_dp_link_parse_audio_mode(struct msm_dp_link_private *link)
 {
 	int ret = 0;
 	u8 data;
@@ -248,8 +248,8 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
 		goto exit;
 	}
 
-	link->dp_link.test_audio.test_audio_sampling_rate = sampling_rate;
-	link->dp_link.test_audio.test_audio_channel_count = channel_count;
+	link->msm_dp_link.test_audio.test_audio_sampling_rate = sampling_rate;
+	link->msm_dp_link.test_audio.test_audio_channel_count = channel_count;
 	drm_dbg_dp(link->drm_dev,
 			"sampling_rate = 0x%x, channel_count = 0x%x\n",
 			sampling_rate, channel_count);
@@ -257,25 +257,25 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
 	return ret;
 }
 
-static int dp_link_parse_audio_pattern_params(struct dp_link_private *link)
+static int msm_dp_link_parse_audio_pattern_params(struct msm_dp_link_private *link)
 {
 	int ret = 0;
 
-	ret = dp_link_parse_audio_mode(link);
+	ret = msm_dp_link_parse_audio_mode(link);
 	if (ret)
 		goto exit;
 
-	ret = dp_link_parse_audio_pattern_type(link);
+	ret = msm_dp_link_parse_audio_pattern_type(link);
 	if (ret)
 		goto exit;
 
-	ret = dp_link_parse_audio_channel_period(link);
+	ret = msm_dp_link_parse_audio_channel_period(link);
 
 exit:
 	return ret;
 }
 
-static bool dp_link_is_video_pattern_valid(u32 pattern)
+static bool msm_dp_link_is_video_pattern_valid(u32 pattern)
 {
 	switch (pattern) {
 	case DP_NO_TEST_PATTERN:
@@ -289,12 +289,12 @@ static bool dp_link_is_video_pattern_valid(u32 pattern)
 }
 
 /**
- * dp_link_is_bit_depth_valid() - validates the bit depth requested
+ * msm_dp_link_is_bit_depth_valid() - validates the bit depth requested
  * @tbd: bit depth requested by the sink
  *
  * Returns true if the requested bit depth is supported.
  */
-static bool dp_link_is_bit_depth_valid(u32 tbd)
+static bool msm_dp_link_is_bit_depth_valid(u32 tbd)
 {
 	/* DP_TEST_VIDEO_PATTERN_NONE is treated as invalid */
 	switch (tbd) {
@@ -307,7 +307,7 @@ static bool dp_link_is_bit_depth_valid(u32 tbd)
 	}
 }
 
-static int dp_link_parse_timing_params1(struct dp_link_private *link,
+static int msm_dp_link_parse_timing_params1(struct msm_dp_link_private *link,
 					int addr, int len, u32 *val)
 {
 	u8 bp[2];
@@ -328,7 +328,7 @@ static int dp_link_parse_timing_params1(struct dp_link_private *link,
 	return 0;
 }
 
-static int dp_link_parse_timing_params2(struct dp_link_private *link,
+static int msm_dp_link_parse_timing_params2(struct msm_dp_link_private *link,
 					int addr, int len,
 					u32 *val1, u32 *val2)
 {
@@ -351,7 +351,7 @@ static int dp_link_parse_timing_params2(struct dp_link_private *link,
 	return 0;
 }
 
-static int dp_link_parse_timing_params3(struct dp_link_private *link,
+static int msm_dp_link_parse_timing_params3(struct msm_dp_link_private *link,
 					int addr, u32 *val)
 {
 	u8 bp;
@@ -369,13 +369,13 @@ static int dp_link_parse_timing_params3(struct dp_link_private *link,
 }
 
 /**
- * dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
+ * msm_dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
  * @link: Display Port Driver data
  *
  * Returns 0 if it successfully parses the video link pattern and the link
  * bit depth requested by the sink and, and if the values parsed are valid.
  */
-static int dp_link_parse_video_pattern_params(struct dp_link_private *link)
+static int msm_dp_link_parse_video_pattern_params(struct msm_dp_link_private *link)
 {
 	int ret = 0;
 	ssize_t rlen;
@@ -388,13 +388,13 @@ static int dp_link_parse_video_pattern_params(struct dp_link_private *link)
 		return rlen;
 	}
 
-	if (!dp_link_is_video_pattern_valid(bp)) {
+	if (!msm_dp_link_is_video_pattern_valid(bp)) {
 		DRM_ERROR("invalid link video pattern = 0x%x\n", bp);
 		ret = -EINVAL;
 		return ret;
 	}
 
-	link->dp_link.test_video.test_video_pattern = bp;
+	link->msm_dp_link.test_video.test_video_pattern = bp;
 
 	/* Read the requested color bit depth and dynamic range (Byte 0x232) */
 	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_MISC0, &bp);
@@ -404,88 +404,88 @@ static int dp_link_parse_video_pattern_params(struct dp_link_private *link)
 	}
 
 	/* Dynamic Range */
-	link->dp_link.test_video.test_dyn_range =
+	link->msm_dp_link.test_video.test_dyn_range =
 			(bp & DP_TEST_DYNAMIC_RANGE_CEA);
 
 	/* Color bit depth */
 	bp &= DP_TEST_BIT_DEPTH_MASK;
-	if (!dp_link_is_bit_depth_valid(bp)) {
+	if (!msm_dp_link_is_bit_depth_valid(bp)) {
 		DRM_ERROR("invalid link bit depth = 0x%x\n", bp);
 		ret = -EINVAL;
 		return ret;
 	}
 
-	link->dp_link.test_video.test_bit_depth = bp;
+	link->msm_dp_link.test_video.test_bit_depth = bp;
 
 	/* resolution timing params */
-	ret = dp_link_parse_timing_params1(link, DP_TEST_H_TOTAL_HI, 2,
-			&link->dp_link.test_video.test_h_total);
+	ret = msm_dp_link_parse_timing_params1(link, DP_TEST_H_TOTAL_HI, 2,
+			&link->msm_dp_link.test_video.test_h_total);
 	if (ret) {
 		DRM_ERROR("failed to parse test_htotal(DP_TEST_H_TOTAL_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params1(link, DP_TEST_V_TOTAL_HI, 2,
-			&link->dp_link.test_video.test_v_total);
+	ret = msm_dp_link_parse_timing_params1(link, DP_TEST_V_TOTAL_HI, 2,
+			&link->msm_dp_link.test_video.test_v_total);
 	if (ret) {
 		DRM_ERROR("failed to parse test_v_total(DP_TEST_V_TOTAL_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params1(link, DP_TEST_H_START_HI, 2,
-			&link->dp_link.test_video.test_h_start);
+	ret = msm_dp_link_parse_timing_params1(link, DP_TEST_H_START_HI, 2,
+			&link->msm_dp_link.test_video.test_h_start);
 	if (ret) {
 		DRM_ERROR("failed to parse test_h_start(DP_TEST_H_START_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params1(link, DP_TEST_V_START_HI, 2,
-			&link->dp_link.test_video.test_v_start);
+	ret = msm_dp_link_parse_timing_params1(link, DP_TEST_V_START_HI, 2,
+			&link->msm_dp_link.test_video.test_v_start);
 	if (ret) {
 		DRM_ERROR("failed to parse test_v_start(DP_TEST_V_START_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params2(link, DP_TEST_HSYNC_HI, 2,
-			&link->dp_link.test_video.test_hsync_pol,
-			&link->dp_link.test_video.test_hsync_width);
+	ret = msm_dp_link_parse_timing_params2(link, DP_TEST_HSYNC_HI, 2,
+			&link->msm_dp_link.test_video.test_hsync_pol,
+			&link->msm_dp_link.test_video.test_hsync_width);
 	if (ret) {
 		DRM_ERROR("failed to parse (DP_TEST_HSYNC_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params2(link, DP_TEST_VSYNC_HI, 2,
-			&link->dp_link.test_video.test_vsync_pol,
-			&link->dp_link.test_video.test_vsync_width);
+	ret = msm_dp_link_parse_timing_params2(link, DP_TEST_VSYNC_HI, 2,
+			&link->msm_dp_link.test_video.test_vsync_pol,
+			&link->msm_dp_link.test_video.test_vsync_width);
 	if (ret) {
 		DRM_ERROR("failed to parse (DP_TEST_VSYNC_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params1(link, DP_TEST_H_WIDTH_HI, 2,
-			&link->dp_link.test_video.test_h_width);
+	ret = msm_dp_link_parse_timing_params1(link, DP_TEST_H_WIDTH_HI, 2,
+			&link->msm_dp_link.test_video.test_h_width);
 	if (ret) {
 		DRM_ERROR("failed to parse test_h_width(DP_TEST_H_WIDTH_HI)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params1(link, DP_TEST_V_HEIGHT_HI, 2,
-			&link->dp_link.test_video.test_v_height);
+	ret = msm_dp_link_parse_timing_params1(link, DP_TEST_V_HEIGHT_HI, 2,
+			&link->msm_dp_link.test_video.test_v_height);
 	if (ret) {
 		DRM_ERROR("failed to parse test_v_height\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params3(link, DP_TEST_MISC1,
-		&link->dp_link.test_video.test_rr_d);
-	link->dp_link.test_video.test_rr_d &= DP_TEST_REFRESH_DENOMINATOR;
+	ret = msm_dp_link_parse_timing_params3(link, DP_TEST_MISC1,
+		&link->msm_dp_link.test_video.test_rr_d);
+	link->msm_dp_link.test_video.test_rr_d &= DP_TEST_REFRESH_DENOMINATOR;
 	if (ret) {
 		DRM_ERROR("failed to parse test_rr_d (DP_TEST_MISC1)\n");
 		return ret;
 	}
 
-	ret = dp_link_parse_timing_params3(link, DP_TEST_REFRESH_RATE_NUMERATOR,
-		&link->dp_link.test_video.test_rr_n);
+	ret = msm_dp_link_parse_timing_params3(link, DP_TEST_REFRESH_RATE_NUMERATOR,
+		&link->msm_dp_link.test_video.test_rr_n);
 	if (ret) {
 		DRM_ERROR("failed to parse test_rr_n\n");
 		return ret;
@@ -505,34 +505,34 @@ static int dp_link_parse_video_pattern_params(struct dp_link_private *link)
 		"TEST_V_HEIGHT = %d\n"
 		"TEST_REFRESH_DENOMINATOR = %d\n"
 		 "TEST_REFRESH_NUMERATOR = %d\n",
-		link->dp_link.test_video.test_video_pattern,
-		link->dp_link.test_video.test_dyn_range,
-		link->dp_link.test_video.test_bit_depth,
-		link->dp_link.test_video.test_h_total,
-		link->dp_link.test_video.test_v_total,
-		link->dp_link.test_video.test_h_start,
-		link->dp_link.test_video.test_v_start,
-		link->dp_link.test_video.test_hsync_pol,
-		link->dp_link.test_video.test_hsync_width,
-		link->dp_link.test_video.test_vsync_pol,
-		link->dp_link.test_video.test_vsync_width,
-		link->dp_link.test_video.test_h_width,
-		link->dp_link.test_video.test_v_height,
-		link->dp_link.test_video.test_rr_d,
-		link->dp_link.test_video.test_rr_n);
+		link->msm_dp_link.test_video.test_video_pattern,
+		link->msm_dp_link.test_video.test_dyn_range,
+		link->msm_dp_link.test_video.test_bit_depth,
+		link->msm_dp_link.test_video.test_h_total,
+		link->msm_dp_link.test_video.test_v_total,
+		link->msm_dp_link.test_video.test_h_start,
+		link->msm_dp_link.test_video.test_v_start,
+		link->msm_dp_link.test_video.test_hsync_pol,
+		link->msm_dp_link.test_video.test_hsync_width,
+		link->msm_dp_link.test_video.test_vsync_pol,
+		link->msm_dp_link.test_video.test_vsync_width,
+		link->msm_dp_link.test_video.test_h_width,
+		link->msm_dp_link.test_video.test_v_height,
+		link->msm_dp_link.test_video.test_rr_d,
+		link->msm_dp_link.test_video.test_rr_n);
 
 	return ret;
 }
 
 /**
- * dp_link_parse_link_training_params() - parses link training parameters from
+ * msm_dp_link_parse_link_training_params() - parses link training parameters from
  * DPCD
  * @link: Display Port Driver data
  *
  * Returns 0 if it successfully parses the link rate (Byte 0x219) and lane
  * count (Byte 0x220), and if these values parse are valid.
  */
-static int dp_link_parse_link_training_params(struct dp_link_private *link)
+static int msm_dp_link_parse_link_training_params(struct msm_dp_link_private *link)
 {
 	u8 bp;
 	ssize_t rlen;
@@ -571,13 +571,13 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
 }
 
 /**
- * dp_link_parse_phy_test_params() - parses the phy link parameters
+ * msm_dp_link_parse_phy_test_params() - parses the phy link parameters
  * @link: Display Port Driver data
  *
  * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
  * requested.
  */
-static int dp_link_parse_phy_test_params(struct dp_link_private *link)
+static int msm_dp_link_parse_phy_test_params(struct msm_dp_link_private *link)
 {
 	u8 data;
 	ssize_t rlen;
@@ -589,7 +589,7 @@ static int dp_link_parse_phy_test_params(struct dp_link_private *link)
 		return rlen;
 	}
 
-	link->dp_link.phy_params.phy_test_pattern_sel = data & 0x07;
+	link->msm_dp_link.phy_params.phy_test_pattern_sel = data & 0x07;
 
 	drm_dbg_dp(link->drm_dev, "phy_test_pattern_sel = 0x%x\n", data);
 
@@ -608,12 +608,12 @@ static int dp_link_parse_phy_test_params(struct dp_link_private *link)
 }
 
 /**
- * dp_link_is_video_audio_test_requested() - checks for audio/video link request
+ * msm_dp_link_is_video_audio_test_requested() - checks for audio/video link request
  * @link: link requested by the sink
  *
  * Returns true if the requested link is a permitted audio/video link.
  */
-static bool dp_link_is_video_audio_test_requested(u32 link)
+static bool msm_dp_link_is_video_audio_test_requested(u32 link)
 {
 	u8 video_audio_test = (DP_TEST_LINK_VIDEO_PATTERN |
 				DP_TEST_LINK_AUDIO_PATTERN |
@@ -624,13 +624,13 @@ static bool dp_link_is_video_audio_test_requested(u32 link)
 }
 
 /**
- * dp_link_parse_request() - parses link request parameters from sink
+ * msm_dp_link_parse_request() - parses link request parameters from sink
  * @link: Display Port Driver data
  *
  * Parses the DPCD to check if an automated link is requested (Byte 0x201),
  * and what type of link automation is being requested (Byte 0x218).
  */
-static int dp_link_parse_request(struct dp_link_private *link)
+static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 {
 	int ret = 0;
 	u8 data;
@@ -672,27 +672,27 @@ static int dp_link_parse_request(struct dp_link_private *link)
 	drm_dbg_dp(link->drm_dev, "Test:(0x%x) requested\n", data);
 	link->request.test_requested = data;
 	if (link->request.test_requested == DP_TEST_LINK_PHY_TEST_PATTERN) {
-		ret = dp_link_parse_phy_test_params(link);
+		ret = msm_dp_link_parse_phy_test_params(link);
 		if (ret)
 			goto end;
-		ret = dp_link_parse_link_training_params(link);
+		ret = msm_dp_link_parse_link_training_params(link);
 		if (ret)
 			goto end;
 	}
 
 	if (link->request.test_requested == DP_TEST_LINK_TRAINING) {
-		ret = dp_link_parse_link_training_params(link);
+		ret = msm_dp_link_parse_link_training_params(link);
 		if (ret)
 			goto end;
 	}
 
-	if (dp_link_is_video_audio_test_requested(
+	if (msm_dp_link_is_video_audio_test_requested(
 			link->request.test_requested)) {
-		ret = dp_link_parse_video_pattern_params(link);
+		ret = msm_dp_link_parse_video_pattern_params(link);
 		if (ret)
 			goto end;
 
-		ret = dp_link_parse_audio_pattern_params(link);
+		ret = msm_dp_link_parse_audio_pattern_params(link);
 	}
 end:
 	/*
@@ -700,29 +700,29 @@ static int dp_link_parse_request(struct dp_link_private *link)
 	 * a DP_TEST_NAK.
 	 */
 	if (ret) {
-		link->dp_link.test_response = DP_TEST_NAK;
+		link->msm_dp_link.test_response = DP_TEST_NAK;
 	} else {
 		if (link->request.test_requested != DP_TEST_LINK_EDID_READ)
-			link->dp_link.test_response = DP_TEST_ACK;
+			link->msm_dp_link.test_response = DP_TEST_ACK;
 		else
-			link->dp_link.test_response =
+			link->msm_dp_link.test_response =
 				DP_TEST_EDID_CHECKSUM_WRITE;
 	}
 
 	return ret;
 }
 
-static int dp_link_parse_sink_status_field(struct dp_link_private *link)
+static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 {
 	int len;
 
-	link->prev_sink_count = link->dp_link.sink_count;
+	link->prev_sink_count = link->msm_dp_link.sink_count;
 	len = drm_dp_read_sink_count(link->aux);
 	if (len < 0) {
 		DRM_ERROR("DP parse sink count failed\n");
 		return len;
 	}
-	link->dp_link.sink_count = len;
+	link->msm_dp_link.sink_count = len;
 
 	len = drm_dp_dpcd_read_link_status(link->aux,
 		link->link_status);
@@ -731,11 +731,11 @@ static int dp_link_parse_sink_status_field(struct dp_link_private *link)
 		return len;
 	}
 
-	return dp_link_parse_request(link);
+	return msm_dp_link_parse_request(link);
 }
 
 /**
- * dp_link_process_link_training_request() - processes new training requests
+ * msm_dp_link_process_link_training_request() - processes new training requests
  * @link: Display Port link data
  *
  * This function will handle new link training requests that are initiated by
@@ -745,7 +745,7 @@ static int dp_link_parse_sink_status_field(struct dp_link_private *link)
  * The function will return 0 if a link training request has been processed,
  * otherwise it will return -EINVAL.
  */
-static int dp_link_process_link_training_request(struct dp_link_private *link)
+static int msm_dp_link_process_link_training_request(struct msm_dp_link_private *link)
 {
 	if (link->request.test_requested != DP_TEST_LINK_TRAINING)
 		return -EINVAL;
@@ -756,49 +756,49 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
 			link->request.test_link_rate,
 			link->request.test_lane_count);
 
-	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
-	link->dp_link.link_params.rate =
+	link->msm_dp_link.link_params.num_lanes = link->request.test_lane_count;
+	link->msm_dp_link.link_params.rate =
 		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
 
 	return 0;
 }
 
-bool dp_link_send_test_response(struct dp_link *dp_link)
+bool msm_dp_link_send_test_response(struct msm_dp_link *msm_dp_link)
 {
-	struct dp_link_private *link = NULL;
+	struct msm_dp_link_private *link = NULL;
 	int ret = 0;
 
-	if (!dp_link) {
+	if (!msm_dp_link) {
 		DRM_ERROR("invalid input\n");
 		return false;
 	}
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
 	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_RESPONSE,
-			dp_link->test_response);
+			msm_dp_link->test_response);
 
 	return ret == 1;
 }
 
-int dp_link_psm_config(struct dp_link *dp_link,
-			      struct dp_link_info *link_info, bool enable)
+int msm_dp_link_psm_config(struct msm_dp_link *msm_dp_link,
+			      struct msm_dp_link_info *link_info, bool enable)
 {
-	struct dp_link_private *link = NULL;
+	struct msm_dp_link_private *link = NULL;
 	int ret = 0;
 
-	if (!dp_link) {
+	if (!msm_dp_link) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
 	}
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
 	mutex_lock(&link->psm_mutex);
 	if (enable)
-		ret = dp_aux_link_power_down(link->aux, link_info);
+		ret = msm_dp_aux_link_power_down(link->aux, link_info);
 	else
-		ret = dp_aux_link_power_up(link->aux, link_info);
+		ret = msm_dp_aux_link_power_up(link->aux, link_info);
 
 	if (ret)
 		DRM_ERROR("Failed to %s low power mode\n", enable ?
@@ -808,24 +808,24 @@ int dp_link_psm_config(struct dp_link *dp_link,
 	return ret;
 }
 
-bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
+bool msm_dp_link_send_edid_checksum(struct msm_dp_link *msm_dp_link, u8 checksum)
 {
-	struct dp_link_private *link = NULL;
+	struct msm_dp_link_private *link = NULL;
 	int ret = 0;
 
-	if (!dp_link) {
+	if (!msm_dp_link) {
 		DRM_ERROR("invalid input\n");
 		return false;
 	}
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
 	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_EDID_CHECKSUM,
 						checksum);
 	return ret == 1;
 }
 
-static void dp_link_parse_vx_px(struct dp_link_private *link)
+static void msm_dp_link_parse_vx_px(struct msm_dp_link_private *link)
 {
 	drm_dbg_dp(link->drm_dev, "vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
 		drm_dp_get_adjust_request_voltage(link->link_status, 0),
@@ -845,31 +845,31 @@ static void dp_link_parse_vx_px(struct dp_link_private *link)
 	 */
 	drm_dbg_dp(link->drm_dev,
 			 "Current: v_level = 0x%x, p_level = 0x%x\n",
-			link->dp_link.phy_params.v_level,
-			link->dp_link.phy_params.p_level);
-	link->dp_link.phy_params.v_level =
+			link->msm_dp_link.phy_params.v_level,
+			link->msm_dp_link.phy_params.p_level);
+	link->msm_dp_link.phy_params.v_level =
 		drm_dp_get_adjust_request_voltage(link->link_status, 0);
-	link->dp_link.phy_params.p_level =
+	link->msm_dp_link.phy_params.p_level =
 		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 0);
 
-	link->dp_link.phy_params.p_level >>= DP_TRAIN_PRE_EMPHASIS_SHIFT;
+	link->msm_dp_link.phy_params.p_level >>= DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
 	drm_dbg_dp(link->drm_dev,
 			"Requested: v_level = 0x%x, p_level = 0x%x\n",
-			link->dp_link.phy_params.v_level,
-			link->dp_link.phy_params.p_level);
+			link->msm_dp_link.phy_params.v_level,
+			link->msm_dp_link.phy_params.p_level);
 }
 
 /**
- * dp_link_process_phy_test_pattern_request() - process new phy link requests
+ * msm_dp_link_process_phy_test_pattern_request() - process new phy link requests
  * @link: Display Port Driver data
  *
  * This function will handle new phy link pattern requests that are initiated
  * by the sink. The function will return 0 if a phy link pattern has been
  * processed, otherwise it will return -EINVAL.
  */
-static int dp_link_process_phy_test_pattern_request(
-		struct dp_link_private *link)
+static int msm_dp_link_process_phy_test_pattern_request(
+		struct msm_dp_link_private *link)
 {
 	if (!(link->request.test_requested & DP_TEST_LINK_PHY_TEST_PATTERN)) {
 		drm_dbg_dp(link->drm_dev, "no phy test\n");
@@ -886,24 +886,24 @@ static int dp_link_process_phy_test_pattern_request(
 
 	drm_dbg_dp(link->drm_dev,
 			"Current: rate = 0x%x, lane count = 0x%x\n",
-			link->dp_link.link_params.rate,
-			link->dp_link.link_params.num_lanes);
+			link->msm_dp_link.link_params.rate,
+			link->msm_dp_link.link_params.num_lanes);
 
 	drm_dbg_dp(link->drm_dev,
 			"Requested: rate = 0x%x, lane count = 0x%x\n",
 			link->request.test_link_rate,
 			link->request.test_lane_count);
 
-	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
-	link->dp_link.link_params.rate =
+	link->msm_dp_link.link_params.num_lanes = link->request.test_lane_count;
+	link->msm_dp_link.link_params.rate =
 		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
 
-	dp_link_parse_vx_px(link);
+	msm_dp_link_parse_vx_px(link);
 
 	return 0;
 }
 
-static bool dp_link_read_psr_error_status(struct dp_link_private *link)
+static bool msm_dp_link_read_psr_error_status(struct msm_dp_link_private *link)
 {
 	u8 status;
 
@@ -921,7 +921,7 @@ static bool dp_link_read_psr_error_status(struct dp_link_private *link)
 	return true;
 }
 
-static bool dp_link_psr_capability_changed(struct dp_link_private *link)
+static bool msm_dp_link_psr_capability_changed(struct msm_dp_link_private *link)
 {
 	u8 status;
 
@@ -941,7 +941,7 @@ static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
 }
 
 /**
- * dp_link_process_link_status_update() - processes link status updates
+ * msm_dp_link_process_link_status_update() - processes link status updates
  * @link: Display Port link module data
  *
  * This function will check for changes in the link status, e.g. clock
@@ -951,13 +951,13 @@ static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
  * The function will return 0 if the a link status update has been processed,
  * otherwise it will return -EINVAL.
  */
-static int dp_link_process_link_status_update(struct dp_link_private *link)
+static int msm_dp_link_process_link_status_update(struct msm_dp_link_private *link)
 {
 	bool channel_eq_done = drm_dp_channel_eq_ok(link->link_status,
-			link->dp_link.link_params.num_lanes);
+			link->msm_dp_link.link_params.num_lanes);
 
 	bool clock_recovery_done = drm_dp_clock_recovery_ok(link->link_status,
-			link->dp_link.link_params.num_lanes);
+			link->msm_dp_link.link_params.num_lanes);
 
 	drm_dbg_dp(link->drm_dev,
 		       "channel_eq_done = %d, clock_recovery_done = %d\n",
@@ -970,7 +970,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
 }
 
 /**
- * dp_link_process_ds_port_status_change() - process port status changes
+ * msm_dp_link_process_ds_port_status_change() - process port status changes
  * @link: Display Port Driver data
  *
  * This function will handle downstream port updates that are initiated by
@@ -980,122 +980,122 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
  * The function will return 0 if a downstream port update has been
  * processed, otherwise it will return -EINVAL.
  */
-static int dp_link_process_ds_port_status_change(struct dp_link_private *link)
+static int msm_dp_link_process_ds_port_status_change(struct msm_dp_link_private *link)
 {
 	if (get_link_status(link->link_status, DP_LANE_ALIGN_STATUS_UPDATED) &
 					DP_DOWNSTREAM_PORT_STATUS_CHANGED)
 		goto reset;
 
-	if (link->prev_sink_count == link->dp_link.sink_count)
+	if (link->prev_sink_count == link->msm_dp_link.sink_count)
 		return -EINVAL;
 
 reset:
 	/* reset prev_sink_count */
-	link->prev_sink_count = link->dp_link.sink_count;
+	link->prev_sink_count = link->msm_dp_link.sink_count;
 
 	return 0;
 }
 
-static bool dp_link_is_video_pattern_requested(struct dp_link_private *link)
+static bool msm_dp_link_is_video_pattern_requested(struct msm_dp_link_private *link)
 {
 	return (link->request.test_requested & DP_TEST_LINK_VIDEO_PATTERN)
 		&& !(link->request.test_requested &
 		DP_TEST_LINK_AUDIO_DISABLED_VIDEO);
 }
 
-static bool dp_link_is_audio_pattern_requested(struct dp_link_private *link)
+static bool msm_dp_link_is_audio_pattern_requested(struct msm_dp_link_private *link)
 {
 	return (link->request.test_requested & DP_TEST_LINK_AUDIO_PATTERN);
 }
 
-static void dp_link_reset_data(struct dp_link_private *link)
+static void msm_dp_link_reset_data(struct msm_dp_link_private *link)
 {
-	link->request = (const struct dp_link_request){ 0 };
-	link->dp_link.test_video = (const struct dp_link_test_video){ 0 };
-	link->dp_link.test_video.test_bit_depth = DP_TEST_BIT_DEPTH_UNKNOWN;
-	link->dp_link.test_audio = (const struct dp_link_test_audio){ 0 };
-	link->dp_link.phy_params.phy_test_pattern_sel = 0;
-	link->dp_link.sink_request = 0;
-	link->dp_link.test_response = 0;
+	link->request = (const struct msm_dp_link_request){ 0 };
+	link->msm_dp_link.test_video = (const struct msm_dp_link_test_video){ 0 };
+	link->msm_dp_link.test_video.test_bit_depth = DP_TEST_BIT_DEPTH_UNKNOWN;
+	link->msm_dp_link.test_audio = (const struct msm_dp_link_test_audio){ 0 };
+	link->msm_dp_link.phy_params.phy_test_pattern_sel = 0;
+	link->msm_dp_link.sink_request = 0;
+	link->msm_dp_link.test_response = 0;
 }
 
 /**
- * dp_link_process_request() - handle HPD IRQ transition to HIGH
- * @dp_link: pointer to link module data
+ * msm_dp_link_process_request() - handle HPD IRQ transition to HIGH
+ * @msm_dp_link: pointer to link module data
  *
  * This function will handle the HPD IRQ state transitions from LOW to HIGH
  * (including cases when there are back to back HPD IRQ HIGH) indicating
  * the start of a new link training request or sink status update.
  */
-int dp_link_process_request(struct dp_link *dp_link)
+int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link)
 {
 	int ret = 0;
-	struct dp_link_private *link;
+	struct msm_dp_link_private *link;
 
-	if (!dp_link) {
+	if (!msm_dp_link) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
-	dp_link_reset_data(link);
+	msm_dp_link_reset_data(link);
 
-	ret = dp_link_parse_sink_status_field(link);
+	ret = msm_dp_link_parse_sink_status_field(link);
 	if (ret)
 		return ret;
 
 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
-		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-	} else if (!dp_link_process_ds_port_status_change(link)) {
-		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-	} else if (!dp_link_process_link_training_request(link)) {
-		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-	} else if (!dp_link_process_phy_test_pattern_request(link)) {
-		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-	} else if (dp_link_read_psr_error_status(link)) {
+		msm_dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
+	} else if (!msm_dp_link_process_ds_port_status_change(link)) {
+		msm_dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
+	} else if (!msm_dp_link_process_link_training_request(link)) {
+		msm_dp_link->sink_request |= DP_TEST_LINK_TRAINING;
+	} else if (!msm_dp_link_process_phy_test_pattern_request(link)) {
+		msm_dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
+	} else if (msm_dp_link_read_psr_error_status(link)) {
 		DRM_ERROR("PSR IRQ_HPD received\n");
-	} else if (dp_link_psr_capability_changed(link)) {
+	} else if (msm_dp_link_psr_capability_changed(link)) {
 		drm_dbg_dp(link->drm_dev, "PSR Capability changed\n");
 	} else {
-		ret = dp_link_process_link_status_update(link);
+		ret = msm_dp_link_process_link_status_update(link);
 		if (!ret) {
-			dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
+			msm_dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
 		} else {
-			if (dp_link_is_video_pattern_requested(link)) {
+			if (msm_dp_link_is_video_pattern_requested(link)) {
 				ret = 0;
-				dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
+				msm_dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
 			}
-			if (dp_link_is_audio_pattern_requested(link)) {
-				dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
+			if (msm_dp_link_is_audio_pattern_requested(link)) {
+				msm_dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
 				ret = -EINVAL;
 			}
 		}
 	}
 
 	drm_dbg_dp(link->drm_dev, "sink request=%#x\n",
-				dp_link->sink_request);
+				msm_dp_link->sink_request);
 	return ret;
 }
 
-int dp_link_get_colorimetry_config(struct dp_link *dp_link)
+int msm_dp_link_get_colorimetry_config(struct msm_dp_link *msm_dp_link)
 {
 	u32 cc = DP_MISC0_COLORIMERY_CFG_LEGACY_RGB;
-	struct dp_link_private *link;
+	struct msm_dp_link_private *link;
 
-	if (!dp_link) {
+	if (!msm_dp_link) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
 	/*
 	 * Unless a video pattern CTS test is ongoing, use RGB_VESA
 	 * Only RGB_VESA and RGB_CEA supported for now
 	 */
-	if (dp_link_is_video_pattern_requested(link)) {
-		if (link->dp_link.test_video.test_dyn_range &
+	if (msm_dp_link_is_video_pattern_requested(link)) {
+		if (link->msm_dp_link.test_video.test_dyn_range &
 					DP_TEST_DYNAMIC_RANGE_CEA)
 			cc = DP_MISC0_COLORIMERY_CFG_CEA_RGB;
 	}
@@ -1103,22 +1103,22 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 	return cc;
 }
 
-int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
+int msm_dp_link_adjust_levels(struct msm_dp_link *msm_dp_link, u8 *link_status)
 {
 	int i;
 	u8 max_p_level;
 	int v_max = 0, p_max = 0;
-	struct dp_link_private *link;
+	struct msm_dp_link_private *link;
 
-	if (!dp_link) {
+	if (!msm_dp_link) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
 	/* use the max level across lanes */
-	for (i = 0; i < dp_link->link_params.num_lanes; i++) {
+	for (i = 0; i < msm_dp_link->link_params.num_lanes; i++) {
 		u8 data_v = drm_dp_get_adjust_request_voltage(link_status, i);
 		u8 data_p = drm_dp_get_adjust_request_pre_emphasis(link_status,
 									 i);
@@ -1131,56 +1131,56 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
 			p_max = data_p;
 	}
 
-	dp_link->phy_params.v_level = v_max >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
-	dp_link->phy_params.p_level = p_max >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
+	msm_dp_link->phy_params.v_level = v_max >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
+	msm_dp_link->phy_params.p_level = p_max >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
 	/**
 	 * Adjust the voltage swing and pre-emphasis level combination to within
 	 * the allowable range.
 	 */
-	if (dp_link->phy_params.v_level > DP_TRAIN_LEVEL_MAX) {
+	if (msm_dp_link->phy_params.v_level > DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested vSwingLevel=%d, change to %d\n",
-			dp_link->phy_params.v_level,
+			msm_dp_link->phy_params.v_level,
 			DP_TRAIN_LEVEL_MAX);
-		dp_link->phy_params.v_level = DP_TRAIN_LEVEL_MAX;
+		msm_dp_link->phy_params.v_level = DP_TRAIN_LEVEL_MAX;
 	}
 
-	if (dp_link->phy_params.p_level > DP_TRAIN_LEVEL_MAX) {
+	if (msm_dp_link->phy_params.p_level > DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested preEmphasisLevel=%d, change to %d\n",
-			dp_link->phy_params.p_level,
+			msm_dp_link->phy_params.p_level,
 			DP_TRAIN_LEVEL_MAX);
-		dp_link->phy_params.p_level = DP_TRAIN_LEVEL_MAX;
+		msm_dp_link->phy_params.p_level = DP_TRAIN_LEVEL_MAX;
 	}
 
-	max_p_level = DP_TRAIN_LEVEL_MAX - dp_link->phy_params.v_level;
-	if (dp_link->phy_params.p_level > max_p_level) {
+	max_p_level = DP_TRAIN_LEVEL_MAX - msm_dp_link->phy_params.v_level;
+	if (msm_dp_link->phy_params.p_level > max_p_level) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested preEmphasisLevel=%d, change to %d\n",
-			dp_link->phy_params.p_level,
+			msm_dp_link->phy_params.p_level,
 			max_p_level);
-		dp_link->phy_params.p_level = max_p_level;
+		msm_dp_link->phy_params.p_level = max_p_level;
 	}
 
 	drm_dbg_dp(link->drm_dev, "adjusted: v_level=%d, p_level=%d\n",
-		dp_link->phy_params.v_level, dp_link->phy_params.p_level);
+		msm_dp_link->phy_params.v_level, msm_dp_link->phy_params.p_level);
 
 	return 0;
 }
 
-void dp_link_reset_phy_params_vx_px(struct dp_link *dp_link)
+void msm_dp_link_reset_phy_params_vx_px(struct msm_dp_link *msm_dp_link)
 {
-	dp_link->phy_params.v_level = 0;
-	dp_link->phy_params.p_level = 0;
+	msm_dp_link->phy_params.v_level = 0;
+	msm_dp_link->phy_params.p_level = 0;
 }
 
-u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp)
+u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp)
 {
 	u32 tbd;
-	struct dp_link_private *link;
+	struct msm_dp_link_private *link;
 
-	link = container_of(dp_link, struct dp_link_private, dp_link);
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 
 	/*
 	 * Few simplistic rules and assumptions made here:
@@ -1209,10 +1209,10 @@ u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp)
 	return tbd;
 }
 
-struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux)
+struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 {
-	struct dp_link_private *link;
-	struct dp_link *dp_link;
+	struct msm_dp_link_private *link;
+	struct msm_dp_link *msm_dp_link;
 
 	if (!dev || !aux) {
 		DRM_ERROR("invalid input\n");
@@ -1226,7 +1226,7 @@ struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 	link->aux   = aux;
 
 	mutex_init(&link->psm_mutex);
-	dp_link = &link->dp_link;
+	msm_dp_link = &link->msm_dp_link;
 
-	return dp_link;
+	return msm_dp_link;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 5846337bb56f..8db5d5698a97 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -12,7 +12,7 @@
 #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
 
-struct dp_link_info {
+struct msm_dp_link_info {
 	unsigned char revision;
 	unsigned int rate;
 	unsigned int num_lanes;
@@ -21,7 +21,7 @@ struct dp_link_info {
 
 #define DP_TRAIN_LEVEL_MAX	3
 
-struct dp_link_test_video {
+struct msm_dp_link_test_video {
 	u32 test_video_pattern;
 	u32 test_bit_depth;
 	u32 test_dyn_range;
@@ -39,7 +39,7 @@ struct dp_link_test_video {
 	u32 test_rr_n;
 };
 
-struct dp_link_test_audio {
+struct msm_dp_link_test_audio {
 	u32 test_audio_sampling_rate;
 	u32 test_audio_channel_count;
 	u32 test_audio_pattern_type;
@@ -53,21 +53,21 @@ struct dp_link_test_audio {
 	u32 test_audio_period_ch_8;
 };
 
-struct dp_link_phy_params {
+struct msm_dp_link_phy_params {
 	u32 phy_test_pattern_sel;
 	u8 v_level;
 	u8 p_level;
 };
 
-struct dp_link {
+struct msm_dp_link {
 	u32 sink_request;
 	u32 test_response;
 
 	u8 sink_count;
-	struct dp_link_test_video test_video;
-	struct dp_link_test_audio test_audio;
-	struct dp_link_phy_params phy_params;
-	struct dp_link_info link_params;
+	struct msm_dp_link_test_video test_video;
+	struct msm_dp_link_test_audio test_audio;
+	struct msm_dp_link_phy_params phy_params;
+	struct msm_dp_link_info link_params;
 };
 
 /**
@@ -78,7 +78,7 @@ struct dp_link {
  * git bit depth value. This function assumes that bit depth has
  * already been validated.
  */
-static inline u32 dp_link_bit_depth_to_bpp(u32 tbd)
+static inline u32 msm_dp_link_bit_depth_to_bpp(u32 tbd)
 {
 	/*
 	 * Few simplistic rules and assumptions made here:
@@ -99,22 +99,22 @@ static inline u32 dp_link_bit_depth_to_bpp(u32 tbd)
 	}
 }
 
-void dp_link_reset_phy_params_vx_px(struct dp_link *dp_link);
-u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp);
-int dp_link_process_request(struct dp_link *dp_link);
-int dp_link_get_colorimetry_config(struct dp_link *dp_link);
-int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status);
-bool dp_link_send_test_response(struct dp_link *dp_link);
-int dp_link_psm_config(struct dp_link *dp_link,
-		struct dp_link_info *link_info, bool enable);
-bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum);
+void msm_dp_link_reset_phy_params_vx_px(struct msm_dp_link *msm_dp_link);
+u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp);
+int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link);
+int msm_dp_link_get_colorimetry_config(struct msm_dp_link *msm_dp_link);
+int msm_dp_link_adjust_levels(struct msm_dp_link *msm_dp_link, u8 *link_status);
+bool msm_dp_link_send_test_response(struct msm_dp_link *msm_dp_link);
+int msm_dp_link_psm_config(struct msm_dp_link *msm_dp_link,
+		struct msm_dp_link_info *link_info, bool enable);
+bool msm_dp_link_send_edid_checksum(struct msm_dp_link *msm_dp_link, u8 checksum);
 
 /**
- * dp_link_get() - get the functionalities of dp test module
+ * msm_dp_link_get() - get the functionalities of dp test module
  *
  *
- * return: a pointer to dp_link struct
+ * return: a pointer to msm_dp_link struct
  */
-struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux);
+struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux);
 
 #endif /* _DP_LINK_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 6ff6c9ef351f..5d7eaa31bf31 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -14,52 +14,52 @@
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
-struct dp_panel_private {
+struct msm_dp_panel_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct dp_panel dp_panel;
+	struct msm_dp_panel msm_dp_panel;
 	struct drm_dp_aux *aux;
-	struct dp_link *link;
-	struct dp_catalog *catalog;
+	struct msm_dp_link *link;
+	struct msm_dp_catalog *catalog;
 	bool panel_on;
 };
 
-static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
+static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 {
 	ssize_t rlen;
-	struct dp_panel *dp_panel;
+	struct msm_dp_panel *msm_dp_panel;
 
-	dp_panel = &panel->dp_panel;
+	msm_dp_panel = &panel->msm_dp_panel;
 
 	/* edp sink */
-	if (dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
+	if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
 		rlen = drm_dp_dpcd_read(panel->aux, DP_PSR_SUPPORT,
-				&dp_panel->psr_cap, sizeof(dp_panel->psr_cap));
-		if (rlen == sizeof(dp_panel->psr_cap)) {
+				&msm_dp_panel->psr_cap, sizeof(msm_dp_panel->psr_cap));
+		if (rlen == sizeof(msm_dp_panel->psr_cap)) {
 			drm_dbg_dp(panel->drm_dev,
 				"psr version: 0x%x, psr_cap: 0x%x\n",
-				dp_panel->psr_cap.version,
-				dp_panel->psr_cap.capabilities);
+				msm_dp_panel->psr_cap.version,
+				msm_dp_panel->psr_cap.capabilities);
 		} else
 			DRM_ERROR("failed to read psr info, rlen=%zd\n", rlen);
 	}
 }
 
-static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
+static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 {
 	int rc;
-	struct dp_panel_private *panel;
-	struct dp_link_info *link_info;
+	struct msm_dp_panel_private *panel;
+	struct msm_dp_link_info *link_info;
 	u8 *dpcd, major, minor;
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
-	dpcd = dp_panel->dpcd;
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	dpcd = msm_dp_panel->dpcd;
 	rc = drm_dp_read_dpcd_caps(panel->aux, dpcd);
 	if (rc)
 		return rc;
 
-	dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
-	link_info = &dp_panel->link_info;
+	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
+	link_info = &msm_dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
@@ -68,12 +68,12 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
 
 	/* Limit data lanes from data-lanes of endpoint property of dtsi */
-	if (link_info->num_lanes > dp_panel->max_dp_lanes)
-		link_info->num_lanes = dp_panel->max_dp_lanes;
+	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
+		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
 
 	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > dp_panel->max_dp_link_rate)
-		link_info->rate = dp_panel->max_dp_link_rate;
+	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
+		link_info->rate = msm_dp_panel->max_dp_link_rate;
 
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
@@ -82,21 +82,21 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (drm_dp_enhanced_frame_cap(dpcd))
 		link_info->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
-	dp_panel_read_psr_cap(panel);
+	msm_dp_panel_read_psr_cap(panel);
 
 	return rc;
 }
 
-static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
+static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
-	const struct dp_link_info *link_info;
+	const struct msm_dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
 	u32 bpp, data_rate_khz;
 
 	bpp = min(mode_edid_bpp, max_supported_bpp);
 
-	link_info = &dp_panel->link_info;
+	link_info = &msm_dp_panel->link_info;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
 	do {
@@ -108,39 +108,39 @@ static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 	return min_supported_bpp;
 }
 
-int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
+int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	struct drm_connector *connector)
 {
 	int rc, bw_code;
 	int count;
-	struct dp_panel_private *panel;
+	struct msm_dp_panel_private *panel;
 
-	if (!dp_panel || !connector) {
+	if (!msm_dp_panel || !connector) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
-		dp_panel->max_dp_lanes, dp_panel->max_dp_link_rate);
+		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
 
-	rc = dp_panel_read_dpcd(dp_panel);
+	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
 		return rc;
 	}
 
-	bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
+	bw_code = drm_dp_link_rate_to_bw_code(msm_dp_panel->link_info.rate);
 	if (!is_link_rate_valid(bw_code) ||
-			!is_lane_count_valid(dp_panel->link_info.num_lanes) ||
-			(bw_code > dp_panel->max_bw_code)) {
-		DRM_ERROR("Illegal link rate=%d lane=%d\n", dp_panel->link_info.rate,
-				dp_panel->link_info.num_lanes);
+			!is_lane_count_valid(msm_dp_panel->link_info.num_lanes) ||
+			(bw_code > msm_dp_panel->max_bw_code)) {
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", msm_dp_panel->link_info.rate,
+				msm_dp_panel->link_info.num_lanes);
 		return -EINVAL;
 	}
 
-	if (drm_dp_is_branch(dp_panel->dpcd)) {
+	if (drm_dp_is_branch(msm_dp_panel->dpcd)) {
 		count = drm_dp_read_sink_count(panel->aux);
 		if (!count) {
 			panel->link->sink_count = 0;
@@ -148,21 +148,21 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		}
 	}
 
-	rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
-					 dp_panel->downstream_ports);
+	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
+					 msm_dp_panel->downstream_ports);
 	if (rc)
 		return rc;
 
-	drm_edid_free(dp_panel->drm_edid);
+	drm_edid_free(msm_dp_panel->drm_edid);
 
-	dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
+	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
 
-	drm_edid_connector_update(connector, dp_panel->drm_edid);
+	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
 
-	if (!dp_panel->drm_edid) {
+	if (!msm_dp_panel->drm_edid) {
 		DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
-		if (!dp_catalog_link_is_connected(panel->catalog)) {
+		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
 			rc = -ETIMEDOUT;
 			goto end;
 		}
@@ -172,87 +172,87 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	return rc;
 }
 
-u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
+u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
-	struct dp_panel_private *panel;
+	struct msm_dp_panel_private *panel;
 	u32 bpp;
 
-	if (!dp_panel || !mode_edid_bpp || !mode_pclk_khz) {
+	if (!msm_dp_panel || !mode_edid_bpp || !mode_pclk_khz) {
 		DRM_ERROR("invalid input\n");
 		return 0;
 	}
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	if (dp_panel->video_test)
-		bpp = dp_link_bit_depth_to_bpp(
+	if (msm_dp_panel->video_test)
+		bpp = msm_dp_link_bit_depth_to_bpp(
 				panel->link->test_video.test_bit_depth);
 	else
-		bpp = dp_panel_get_supported_bpp(dp_panel, mode_edid_bpp,
+		bpp = msm_dp_panel_get_supported_bpp(msm_dp_panel, mode_edid_bpp,
 				mode_pclk_khz);
 
 	return bpp;
 }
 
-int dp_panel_get_modes(struct dp_panel *dp_panel,
+int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 	struct drm_connector *connector)
 {
-	if (!dp_panel) {
+	if (!msm_dp_panel) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	if (dp_panel->drm_edid)
+	if (msm_dp_panel->drm_edid)
 		return drm_edid_connector_add_modes(connector);
 
 	return 0;
 }
 
-static u8 dp_panel_get_edid_checksum(const struct edid *edid)
+static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
 
 	return edid->checksum;
 }
 
-void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 {
-	struct dp_panel_private *panel;
+	struct msm_dp_panel_private *panel;
 
-	if (!dp_panel) {
+	if (!msm_dp_panel) {
 		DRM_ERROR("invalid input\n");
 		return;
 	}
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
 		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
+		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
 		u8 checksum;
 
 		if (edid)
-			checksum = dp_panel_get_edid_checksum(edid);
+			checksum = msm_dp_panel_get_edid_checksum(edid);
 		else
-			checksum = dp_panel->connector->real_edid_checksum;
+			checksum = msm_dp_panel->connector->real_edid_checksum;
 
-		dp_link_send_edid_checksum(panel->link, checksum);
-		dp_link_send_test_response(panel->link);
+		msm_dp_link_send_edid_checksum(panel->link, checksum);
+		msm_dp_link_send_test_response(panel->link);
 	}
 }
 
-void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
+void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 {
-	struct dp_catalog *catalog;
-	struct dp_panel_private *panel;
+	struct msm_dp_catalog *catalog;
+	struct msm_dp_panel_private *panel;
 
-	if (!dp_panel) {
+	if (!msm_dp_panel) {
 		DRM_ERROR("invalid input\n");
 		return;
 	}
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
 
 	if (!panel->panel_on) {
@@ -262,31 +262,31 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
 	}
 
 	if (!enable) {
-		dp_catalog_panel_tpg_disable(catalog);
+		msm_dp_catalog_panel_tpg_disable(catalog);
 		return;
 	}
 
 	drm_dbg_dp(panel->drm_dev, "calling catalog tpg_enable\n");
-	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
+	msm_dp_catalog_panel_tpg_enable(catalog, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
 }
 
-static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
+static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 {
-	struct dp_catalog *catalog;
-	struct dp_panel_private *panel;
-	struct dp_display_mode *dp_mode;
+	struct msm_dp_catalog *catalog;
+	struct msm_dp_panel_private *panel;
+	struct msm_dp_display_mode *msm_dp_mode;
 	struct drm_dp_vsc_sdp vsc_sdp_data;
 	struct dp_sdp vsc_sdp;
 	ssize_t len;
 
-	if (!dp_panel) {
+	if (!msm_dp_panel) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
-	dp_mode = &dp_panel->dp_mode;
+	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
 
 	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
 
@@ -300,7 +300,7 @@ static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
 	vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
 
 	/* VSC SDP Payload for DB17 */
-	vsc_sdp_data.bpc = dp_mode->bpp / 3;
+	vsc_sdp_data.bpc = msm_dp_mode->bpp / 3;
 	vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
 
 	/* VSC SDP Payload for DB18 */
@@ -312,36 +312,36 @@ static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
 		return len;
 	}
 
-	dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
+	msm_dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
 
 	return 0;
 }
 
-void dp_panel_dump_regs(struct dp_panel *dp_panel)
+void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel)
 {
-	struct dp_catalog *catalog;
-	struct dp_panel_private *panel;
+	struct msm_dp_catalog *catalog;
+	struct msm_dp_panel_private *panel;
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
 
-	dp_catalog_dump_regs(catalog);
+	msm_dp_catalog_dump_regs(catalog);
 }
 
-int dp_panel_timing_cfg(struct dp_panel *dp_panel)
+int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 {
 	u32 data, total_ver, total_hor;
-	struct dp_catalog *catalog;
-	struct dp_panel_private *panel;
+	struct msm_dp_catalog *catalog;
+	struct msm_dp_panel_private *panel;
 	struct drm_display_mode *drm_mode;
 	u32 width_blanking;
 	u32 sync_start;
-	u32 dp_active;
+	u32 msm_dp_active;
 	u32 total;
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
-	drm_mode = &panel->dp_panel.dp_mode.drm_mode;
+	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
 
 	drm_dbg_dp(panel->drm_dev, "width=%d hporch= %d %d %d\n",
 		drm_mode->hdisplay, drm_mode->htotal - drm_mode->hsync_end,
@@ -371,9 +371,9 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 
 	data = drm_mode->vsync_end - drm_mode->vsync_start;
 	data <<= 16;
-	data |= (panel->dp_panel.dp_mode.v_active_low << 31);
+	data |= (panel->msm_dp_panel.msm_dp_mode.v_active_low << 31);
 	data |= drm_mode->hsync_end - drm_mode->hsync_start;
-	data |= (panel->dp_panel.dp_mode.h_active_low << 15);
+	data |= (panel->msm_dp_panel.msm_dp_mode.h_active_low << 15);
 
 	width_blanking = data;
 
@@ -381,26 +381,26 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	data <<= 16;
 	data |= drm_mode->hdisplay;
 
-	dp_active = data;
+	msm_dp_active = data;
 
-	dp_catalog_panel_timing_cfg(catalog, total, sync_start, width_blanking, dp_active);
+	msm_dp_catalog_panel_timing_cfg(catalog, total, sync_start, width_blanking, msm_dp_active);
 
-	if (dp_panel->dp_mode.out_fmt_is_yuv_420)
-		dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
 
 	panel->panel_on = true;
 
 	return 0;
 }
 
-int dp_panel_init_panel_info(struct dp_panel *dp_panel)
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_display_mode *drm_mode;
-	struct dp_panel_private *panel;
+	struct msm_dp_panel_private *panel;
 
-	drm_mode = &dp_panel->dp_mode.drm_mode;
+	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
 	/*
 	 * print resolution info as this is a result
@@ -421,18 +421,18 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 			drm_mode->vsync_end - drm_mode->vsync_start);
 	drm_dbg_dp(panel->drm_dev, "pixel clock (KHz)=(%d)\n",
 				drm_mode->clock);
-	drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
+	drm_dbg_dp(panel->drm_dev, "bpp = %d\n", msm_dp_panel->msm_dp_mode.bpp);
 
-	dp_panel->dp_mode.bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
-						      dp_panel->dp_mode.drm_mode.clock);
+	msm_dp_panel->msm_dp_mode.bpp = msm_dp_panel_get_mode_bpp(msm_dp_panel, msm_dp_panel->msm_dp_mode.bpp,
+						      msm_dp_panel->msm_dp_mode.drm_mode.clock);
 
 	drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
-				dp_panel->dp_mode.bpp);
+				msm_dp_panel->msm_dp_mode.bpp);
 
 	return 0;
 }
 
-static u32 dp_panel_link_frequencies(struct device_node *of_node)
+static u32 msm_dp_panel_link_frequencies(struct device_node *of_node)
 {
 	struct device_node *endpoint;
 	u64 frequency = 0;
@@ -456,17 +456,17 @@ static u32 dp_panel_link_frequencies(struct device_node *of_node)
 	return frequency;
 }
 
-static int dp_panel_parse_dt(struct dp_panel *dp_panel)
+static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 {
-	struct dp_panel_private *panel;
+	struct msm_dp_panel_private *panel;
 	struct device_node *of_node;
 	int cnt;
 
-	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	of_node = panel->dev->of_node;
 
 	/*
-	 * data-lanes is the property of dp_out endpoint
+	 * data-lanes is the property of msm_dp_out endpoint
 	 */
 	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
 	if (cnt < 0) {
@@ -475,21 +475,21 @@ static int dp_panel_parse_dt(struct dp_panel *dp_panel)
 	}
 
 	if (cnt > 0)
-		dp_panel->max_dp_lanes = cnt;
+		msm_dp_panel->max_dp_lanes = cnt;
 	else
-		dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+		msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
 
-	dp_panel->max_dp_link_rate = dp_panel_link_frequencies(of_node);
-	if (!dp_panel->max_dp_link_rate)
-		dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
+	msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
+	if (!msm_dp_panel->max_dp_link_rate)
+		msm_dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
 
 	return 0;
 }
 
-struct dp_panel *dp_panel_get(struct dp_panel_in *in)
+struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
 {
-	struct dp_panel_private *panel;
-	struct dp_panel *dp_panel;
+	struct msm_dp_panel_private *panel;
+	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
 	if (!in->dev || !in->catalog || !in->aux || !in->link) {
@@ -506,20 +506,20 @@ struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 	panel->catalog = in->catalog;
 	panel->link = in->link;
 
-	dp_panel = &panel->dp_panel;
-	dp_panel->max_bw_code = DP_LINK_BW_8_1;
+	msm_dp_panel = &panel->msm_dp_panel;
+	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
 
-	ret = dp_panel_parse_dt(dp_panel);
+	ret = msm_dp_panel_parse_dt(msm_dp_panel);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return dp_panel;
+	return msm_dp_panel;
 }
 
-void dp_panel_put(struct dp_panel *dp_panel)
+void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
 {
-	if (!dp_panel)
+	if (!msm_dp_panel)
 		return;
 
-	drm_edid_free(dp_panel->drm_edid);
+	drm_edid_free(msm_dp_panel->drm_edid);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 6722e3923fa5..0e944db3adf2 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -13,7 +13,7 @@
 
 struct edid;
 
-struct dp_display_mode {
+struct msm_dp_display_mode {
 	struct drm_display_mode drm_mode;
 	u32 bpp;
 	u32 h_active_low;
@@ -21,28 +21,28 @@ struct dp_display_mode {
 	bool out_fmt_is_yuv_420;
 };
 
-struct dp_panel_in {
+struct msm_dp_panel_in {
 	struct device *dev;
 	struct drm_dp_aux *aux;
-	struct dp_link *link;
-	struct dp_catalog *catalog;
+	struct msm_dp_link *link;
+	struct msm_dp_catalog *catalog;
 };
 
-struct dp_panel_psr {
+struct msm_dp_panel_psr {
 	u8 version;
 	u8 capabilities;
 };
 
-struct dp_panel {
+struct msm_dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
-	struct dp_link_info link_info;
+	struct msm_dp_link_info link_info;
 	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
-	struct dp_display_mode dp_mode;
-	struct dp_panel_psr psr_cap;
+	struct msm_dp_display_mode msm_dp_mode;
+	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
 	bool vsc_sdp_supported;
 
@@ -52,18 +52,18 @@ struct dp_panel {
 	u32 max_bw_code;
 };
 
-int dp_panel_init_panel_info(struct dp_panel *dp_panel);
-int dp_panel_deinit(struct dp_panel *dp_panel);
-int dp_panel_timing_cfg(struct dp_panel *dp_panel);
-void dp_panel_dump_regs(struct dp_panel *dp_panel);
-int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
-u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
+u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-int dp_panel_get_modes(struct dp_panel *dp_panel,
+int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
-void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
-void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 /**
  * is_link_rate_valid() - validates the link rate
@@ -80,7 +80,7 @@ static inline bool is_link_rate_valid(u32 bw_code)
 }
 
 /**
- * dp_link_is_lane_count_valid() - validates the lane count
+ * msm_dp_link_is_lane_count_valid() - validates the lane count
  * @lane_count: lane count requested by the sink
  *
  * Returns true if the requested lane count is supported.
@@ -92,6 +92,6 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct dp_panel *dp_panel_get(struct dp_panel_in *in);
-void dp_panel_put(struct dp_panel *dp_panel);
+struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index da9207caf72d..2a40f07fe2d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -9,7 +9,7 @@
 
 #define DP_SDP_HEADER_SIZE		8
 
-u8 dp_utils_get_g0_value(u8 data)
+u8 msm_dp_utils_get_g0_value(u8 data)
 {
 	u8 c[4];
 	u8 g[4];
@@ -30,7 +30,7 @@ u8 dp_utils_get_g0_value(u8 data)
 	return ret_data;
 }
 
-u8 dp_utils_get_g1_value(u8 data)
+u8 msm_dp_utils_get_g1_value(u8 data)
 {
 	u8 c[4];
 	u8 g[4];
@@ -51,7 +51,7 @@ u8 dp_utils_get_g1_value(u8 data)
 	return ret_data;
 }
 
-u8 dp_utils_calculate_parity(u32 data)
+u8 msm_dp_utils_calculate_parity(u32 data)
 {
 	u8 x0 = 0;
 	u8 x1 = 0;
@@ -65,8 +65,8 @@ u8 dp_utils_calculate_parity(u32 data)
 		iData = (data >> i * 4) & 0xF;
 
 		ci = iData ^ x1;
-		x1 = x0 ^ dp_utils_get_g1_value(ci);
-		x0 = dp_utils_get_g0_value(ci);
+		x1 = x0 ^ msm_dp_utils_get_g1_value(ci);
+		x0 = msm_dp_utils_get_g0_value(ci);
 	}
 
 	parity_byte = x1 | (x0 << 4);
@@ -74,7 +74,7 @@ u8 dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
+ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
 {
 	size_t length;
 
@@ -83,14 +83,14 @@ ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_b
 		return -ENOSPC;
 
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
-		FIELD_PREP(PARITY_0_MASK, dp_utils_calculate_parity(sdp_header->HB0)) |
+		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
 		FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
-		FIELD_PREP(PARITY_1_MASK, dp_utils_calculate_parity(sdp_header->HB1));
+		FIELD_PREP(PARITY_1_MASK, msm_dp_utils_calculate_parity(sdp_header->HB1));
 
 	header_buff[1] = FIELD_PREP(HEADER_2_MASK, sdp_header->HB2) |
-		FIELD_PREP(PARITY_2_MASK, dp_utils_calculate_parity(sdp_header->HB2)) |
+		FIELD_PREP(PARITY_2_MASK, msm_dp_utils_calculate_parity(sdp_header->HB2)) |
 		FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
-		FIELD_PREP(PARITY_3_MASK, dp_utils_calculate_parity(sdp_header->HB3));
+		FIELD_PREP(PARITY_3_MASK, msm_dp_utils_calculate_parity(sdp_header->HB3));
 
 	return length;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 7c056d9798dc..88d53157f5b5 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -28,9 +28,9 @@
 #define HEADER_3_MASK	    GENMASK(23, 16)
 #define PARITY_3_MASK	    GENMASK(31, 24)
 
-u8 dp_utils_get_g0_value(u8 data);
-u8 dp_utils_get_g1_value(u8 data);
-u8 dp_utils_calculate_parity(u32 data);
-ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
+u8 msm_dp_utils_get_g0_value(u8 data);
+u8 msm_dp_utils_get_g1_value(u8 data);
+u8 msm_dp_utils_calculate_parity(u32 data);
+ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.39.5

