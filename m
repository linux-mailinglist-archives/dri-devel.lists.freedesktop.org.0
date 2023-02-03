Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D8688CE1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 03:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33810E700;
	Fri,  3 Feb 2023 02:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AF010E700
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 02:07:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id bg26so2889912wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 18:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cjUnx4x5mlPFG//GaXPZVIo0syw4My60NKu5onSFotE=;
 b=bcm3aJ2U4uNSZn1Xq44bN/UfqYkB2p/L0H3YUn3zOv7VzJ71D66cVE5oNLb6JnegpK
 xbxRZ0utia13PbDnTQBjEqDvhggs9bqHpxw/vEeZ3f1P5N0YL0o0DDpNtnCeBvFE07S/
 xaQVXYSjbHSS4yvgPG/23R1b4Te0/wExJRa3JJBE4R24eEpTRNU5VS5jdCd9T8HYqzpW
 tSFS71DEcmHeaeQUv9hSx4zpK8WtMTqsTYqV893zrTN0ut4iisIo+r1DqlOADmp9XZ9T
 XSt94Wv8kwrUgGwGreTrNlnkuskpAp84/0JyeyItd86RB2IkFw6xuA74wV8+ZUXqzzKc
 xciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cjUnx4x5mlPFG//GaXPZVIo0syw4My60NKu5onSFotE=;
 b=kBkkN+lrO7vc5bF/eQ5QUiKklR0NfXOruuII8T5fj72DfBm/hOaJh4IuYyaYONJ9gV
 r99QuUgBFr/5tFvzL7bcEHfxR40qNXE+oKM8x5SKZxOAQ3QLUubrPqZ9JdXXCWW/KTz2
 tRDHyWZ6ao8viyq7hXyY0K9KHYW9TvN5fCnsMErxchL5Hd7RD+z6EaBt+l06qMIjSU7Q
 4GHDLnFttx9yH7AAHfMJYmLF6++t7TBfvyPWIkqzyCRYu3TiNhB70P4qFhKfLTAl0juG
 h0rHpHxvyt1uRd8Jwxpu6M4GISvEOZ1gNVOt1eo81/AarEXWfRnmixO79IabEyJsFORJ
 xz5Q==
X-Gm-Message-State: AO0yUKUhsJ1h41mPYzir2Y8lnQpMpuKl0GAVJA59N6XO/juq9mbQ9xMW
 Cb9ei4tgQuE9ii6xhYAIqRBjIzXY+Ff2Ylbpj+w=
X-Google-Smtp-Source: AK7set8b/VBHTheGEa4fJf5wqglUijSnXyYcuC3BlzpWNGlEzW4lWBtxJ61BywZz1zaVeeTb35mbkQ==
X-Received: by 2002:a05:600c:3d8a:b0:3dd:af7a:53ed with SMTP id
 bi10-20020a05600c3d8a00b003ddaf7a53edmr8309238wmb.11.1675390074481; 
 Thu, 02 Feb 2023 18:07:54 -0800 (PST)
Received: from localhost.localdomain
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003de77597f16sm1297327wmo.21.2023.02.02.18.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 18:07:53 -0800 (PST)
From: Joshua Ashton <joshua@froggi.es>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Fri,  3 Feb 2023 02:07:42 +0000
Message-Id: <20230203020744.30745-1-joshua@froggi.es>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harry Wentland <harry.wentland@amd.com>

This allows us to use strongly typed arguments.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 include/drm/display/drm_dp.h |  2 +-
 include/drm/drm_connector.h  | 48 ++++++++++++++++++------------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index ed10e6b6f99d..28899a03245c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1623,7 +1623,7 @@ enum dp_pixelformat {
  *
  * This enum is used to indicate DP VSC SDP Colorimetry formats.
  * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
- * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
+ * DB18] and a name of enum member follows &enum drm_colorimetry definition.
  *
  * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
  *                          ITU-R BT.601 colorimetry format
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4d830fc55a3d..edef65388c29 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -371,29 +371,29 @@ enum drm_privacy_screen_status {
  * a colorspace property which will be created and exposed to
  * userspace.
  */
-
-/* For Default case, driver will set the colorspace */
-#define DRM_MODE_COLORIMETRY_DEFAULT			0
-/* CEA 861 Normal Colorimetry options */
-#define DRM_MODE_COLORIMETRY_NO_DATA			0
-#define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
-#define DRM_MODE_COLORIMETRY_BT709_YCC			2
-/* CEA 861 Extended Colorimetry Options */
-#define DRM_MODE_COLORIMETRY_XVYCC_601			3
-#define DRM_MODE_COLORIMETRY_XVYCC_709			4
-#define DRM_MODE_COLORIMETRY_SYCC_601			5
-#define DRM_MODE_COLORIMETRY_OPYCC_601			6
-#define DRM_MODE_COLORIMETRY_OPRGB			7
-#define DRM_MODE_COLORIMETRY_BT2020_CYCC		8
-#define DRM_MODE_COLORIMETRY_BT2020_RGB			9
-#define DRM_MODE_COLORIMETRY_BT2020_YCC			10
-/* Additional Colorimetry extension added as part of CTA 861.G */
-#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65		11
-#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER		12
-/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
-#define DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED		13
-#define DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT		14
-#define DRM_MODE_COLORIMETRY_BT601_YCC			15
+enum drm_colorspace {
+	/* For Default case, driver will set the colorspace */
+	DRM_MODE_COLORIMETRY_DEFAULT,
+	/* CEA 861 Normal Colorimetry options */
+	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC,
+	DRM_MODE_COLORIMETRY_BT709_YCC,
+	/* CEA 861 Extended Colorimetry Options */
+	DRM_MODE_COLORIMETRY_XVYCC_601,
+	DRM_MODE_COLORIMETRY_XVYCC_709,
+	DRM_MODE_COLORIMETRY_SYCC_601,
+	DRM_MODE_COLORIMETRY_OPYCC_601,
+	DRM_MODE_COLORIMETRY_OPRGB,
+	DRM_MODE_COLORIMETRY_BT2020_CYCC,
+	DRM_MODE_COLORIMETRY_BT2020_RGB,
+	DRM_MODE_COLORIMETRY_BT2020_YCC,
+	/* Additional Colorimetry extension added as part of CTA 861.G */
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
+	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
+	DRM_MODE_COLORIMETRY_BT601_YCC,
+};
 
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
@@ -826,7 +826,7 @@ struct drm_connector_state {
 	 * colorspace change on Sink. This is most commonly used to switch
 	 * to wider color gamuts like BT2020.
 	 */
-	u32 colorspace;
+	enum drm_colorspace colorspace;
 
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
-- 
2.39.1

