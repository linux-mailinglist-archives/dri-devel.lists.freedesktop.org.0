Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3494FC28D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB1610EB68;
	Mon, 11 Apr 2022 16:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1776210E5B3;
 Mon, 11 Apr 2022 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649695040; x=1681231040;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=rwjRuGuepy//YjLHoAmcCpL2t0bvxioBp/CwXdYeLTU=;
 b=Szbp7bd2pZQfGibAoDGM3alq2dEEnBaqi/dk2qytzeOOieWk2yjob28q
 wohJh971rFI9eNeg0jmPdXtTYemgJjWJWjPlnbndavYg1Xsr87C+PWfzu
 CTcGSu4yzKwK9ZeNQ1/PIPVx2TzdSwUX4bqU3c2HQ5yMA5rP40EdJfxBA g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 11 Apr 2022 09:37:20 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Apr 2022 09:37:18 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Apr 2022 22:07:04 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 7B1E042C5; Mon, 11 Apr 2022 22:07:03 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v8 1/2] drm/msm/disp/dpu1: add inline function to validate
 format support
Date: Mon, 11 Apr 2022 22:07:00 +0530
Message-Id: <1649695021-19132-2-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649695021-19132-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1649695021-19132-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check if the dpu format is supported or not using dpu_find_format.

Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 418f5ae..84b8b32 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -21,6 +21,28 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 #define dpu_get_dpu_format(f) dpu_get_dpu_format_ext(f, 0)
 
 /**
+ * dpu_find_format - validate if the pixel format is supported
+ * @format:		dpu format
+ * @supported_formats:	supported formats by dpu HW
+ * @num_formatss:	total number of formats
+ *
+ * Return: false if not valid format, true on success
+ */
+static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
+					size_t num_formats)
+{
+	int i;
+
+	for (i = 0; i < num_formats; i++) {
+		/* check for valid formats supported */
+		if (format == supported_formats[i])
+			return true;
+	}
+
+	return false;
+}
+
+/**
  * dpu_get_msm_format - get an dpu_format by its msm_format base
  *                     callback function registers with the msm_kms layer
  * @kms:             kms driver
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6565682..3216cda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1411,13 +1411,9 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED) {
-		int i;
-		for (i = 0; i < ARRAY_SIZE(qcom_compressed_supported_formats); i++) {
-			if (format == qcom_compressed_supported_formats[i])
-				return true;
-		}
-	}
+	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+		return dpu_find_format(format, qcom_compressed_supported_formats,
+				ARRAY_SIZE(qcom_compressed_supported_formats));
 
 	return false;
 }
-- 
2.7.4

