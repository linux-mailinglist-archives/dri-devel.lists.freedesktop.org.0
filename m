Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82988A9C56A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3225710E941;
	Fri, 25 Apr 2025 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M/4SrkvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EDC10E93E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576912;
 bh=HGa8+bjFltIfOaUKN86AmAq+woa6Ou50vsQGwWC6IE8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=M/4SrkvXq6Mv4KimbCvMXc8+9O6v10f9cp32FJPHVLOmdfSX4UngwHW1bb2OYqt5F
 bAyRnwl87lov3Ts/jQecBh4uyYBHl46O89eQKEVvwsVnrupuRF7kqJW6Iy9effkzYH
 9xLg0avcllaENJwggYK6NjwtVbO7D7wyuR1YjWuksumaug25MwkXs9gqNl22Hg9KkW
 9oL61CazzxCNC36l2oVmf4YJagbfde5V1bVjahglO8pwLLT0G8zb2JmmfqShHSNSaC
 vegRXGRpthA2qvtgLw0AoBpWKDkRO2itcax3lYeQgxmD/K8w5rqfatuhKaSOHRRfU5
 07bBSvPIQbqVw==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BA56717E3626;
 Fri, 25 Apr 2025 12:28:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:08 +0300
Subject: [PATCH v4 17/23] drm/tests: hdmi: Provide EDID supporting 4K@30Hz
 with YUV420 only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-17-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Create a test EDID advertising the following capabilities:

Max resolution:
- 1920x1080@60Hz with RGB, YUV444, YUV422
- 3840x2160@30Hz with YUV420 only

Max BPC:         16 for all modes
Max TMDS clock:  200 MHz

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_kunit_edid.h | 118 +++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
index 6358397a5d7ab0bcdea1c824fc9fd382560f4b0e..027d8aa5bccd0ee101fbe7e147f0e418581e9c3d 100644
--- a/drivers/gpu/drm/tests/drm_kunit_edid.h
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -583,4 +583,122 @@ static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
 	0x00, 0x00, 0x00, 0x8c
 };
 
+/*
+ * Max resolution:
+ * - 1920x1080@60Hz with RGB, YUV444, YUV422
+ * - 3840x2160@30Hz with YUV420 only
+ * Max BPC:         16 for all modes
+ * Max TMDS clock:  200 MHz
+ *
+ * edid-decode (hex):
+ *
+ * 00 ff ff ff ff ff ff 00 31 d8 34 00 00 00 00 00
+ * ff 23 01 03 80 60 36 78 0f ee 91 a3 54 4c 99 26
+ * 0f 50 54 20 00 00 01 01 01 01 01 01 01 01 01 01
+ * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
+ * 45 00 c0 1c 32 00 00 1e 00 00 00 fc 00 54 65 73
+ * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 18
+ * 55 18 5e 11 00 0a 20 20 20 20 20 20 00 00 00 10
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 bb
+ *
+ * 02 03 29 31 42 90 5f 6c 03 0c 00 10 00 78 28 20
+ * 00 00 01 03 6d d8 5d c4 01 28 80 07 00 00 00 00
+ * 00 00 e3 0f 00 00 e2 0e 5f 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ca
+ *
+ * ----------------
+ *
+ * Block 0, Base EDID:
+ *   EDID Structure Version & Revision: 1.3
+ *   Vendor & Product Identification:
+ *     Manufacturer: LNX
+ *     Model: 52
+ *     Model year: 2025
+ *   Basic Display Parameters & Features:
+ *     Digital display
+ *     Maximum image size: 96 cm x 54 cm
+ *     Gamma: 2.20
+ *     RGB color display
+ *     Default (sRGB) color space is primary color space
+ *     First detailed timing is the preferred timing
+ *     Supports GTF timings within operating range
+ *   Color Characteristics:
+ *     Red  : 0.6396, 0.3300
+ *     Green: 0.2998, 0.5996
+ *     Blue : 0.1503, 0.0595
+ *     White: 0.3125, 0.3291
+ *   Established Timings I & II:
+ *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *   Standard Timings: none
+ *   Detailed Timing Descriptors:
+ *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (960 mm x 540 mm)
+ *                  Hfront   88 Hsync  44 Hback  148 Hpol P
+ *                  Vfront    4 Vsync   5 Vback   36 Vpol P
+ *     Display Product Name: 'Test EDID'
+ *     Display Range Limits:
+ *       Monitor ranges (GTF): 24-85 Hz V, 24-94 kHz H, max dotclock 170 MHz
+ *     Dummy Descriptor:
+ *   Extension blocks: 1
+ * Checksum: 0xbb
+ *
+ * ----------------
+ *
+ * Block 1, CTA-861 Extension Block:
+ *   Revision: 3
+ *   Supports YCbCr 4:4:4
+ *   Supports YCbCr 4:2:2
+ *   Native detailed modes: 1
+ *   Video Data Block:
+ *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (native)
+ *     VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *     Source physical address: 1.0.0.0
+ *     DC_48bit
+ *     DC_36bit
+ *     DC_30bit
+ *     DC_Y444
+ *     Maximum TMDS clock: 200 MHz
+ *     Extended HDMI video details:
+ *   Vendor-Specific Data Block (HDMI Forum), OUI C4-5D-D8:
+ *     Version: 1
+ *     Maximum TMDS Character Rate: 200 MHz
+ *     SCDC Present
+ *     Supports 16-bits/component Deep Color 4:2:0 Pixel Encoding
+ *     Supports 12-bits/component Deep Color 4:2:0 Pixel Encoding
+ *     Supports 10-bits/component Deep Color 4:2:0 Pixel Encoding
+ *   YCbCr 4:2:0 Capability Map Data Block:
+ *     Empty Capability Map
+ *   YCbCr 4:2:0 Video Data Block:
+ *     VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ * Checksum: 0xca
+ */
+static const unsigned char test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz[] = {
+	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x34, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0xff, 0x23, 0x01, 0x03, 0x80, 0x60, 0x36, 0x78,
+	0x0f, 0xee, 0x91, 0xa3, 0x54, 0x4c, 0x99, 0x26, 0x0f, 0x50, 0x54, 0x20,
+	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
+	0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0xc0, 0x1c, 0x32, 0x00, 0x00, 0x1e,
+	0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
+	0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x18,
+	0x55, 0x18, 0x5e, 0x11, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xbb, 0x02, 0x03, 0x29, 0x31,
+	0x42, 0x90, 0x5f, 0x6c, 0x03, 0x0c, 0x00, 0x10, 0x00, 0x78, 0x28, 0x20,
+	0x00, 0x00, 0x01, 0x03, 0x6d, 0xd8, 0x5d, 0xc4, 0x01, 0x28, 0x80, 0x07,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0x0f, 0x00, 0x00, 0xe2, 0x0e,
+	0x5f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0xca
+};
+
 #endif // DRM_KUNIT_EDID_H_

-- 
2.49.0

