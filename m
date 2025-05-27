Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01DAC4E5C
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0210E4C3;
	Tue, 27 May 2025 12:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EFJ/TVyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDBD10E4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347887;
 bh=V8rTl9ii8sCL9VzDqwU9C3Ust3q3I9zLhb7qtia09Sk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EFJ/TVyM8H/ViO+gnxF/M8OgAN0dx0CFAS/dAVNXa7v/vJQVeqUrgi5k8yzCmp47/
 daucDwbi097rQJL1E8J4b05JgkId7MidV0v9n5OEFJfD4agobPiXjFOAN2NTfqK4vy
 G/+73W42dpiprrpuqDbqeSMW/I28EWnaubP60huM78XvPAhPAsLpdE7cyPTKaAgl5A
 MnInmC+lbojUtH3Xv3JTwtfCvUVCQdJwEMtK82+jNGpwfB1i+SQHyxK4JJDXSXxSAm
 cA3eunW85FYt9FP7xVRksB8NFAQT0mUEyJsoZvEED5+zxncYxhHTEEsoX++52pwBXa
 FB1056264bXmw==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BDF4117E09FA;
 Tue, 27 May 2025 14:11:26 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:14 +0300
Subject: [PATCH v5 06/19] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-6-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
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

Try to make use of YUV420 when computing the best output format and
RGB cannot be supported for any of the available color depths.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a9733a2e1b632e02f535c5ece64762f8ed9e4af2..2c641add743466841cb2e777a07633dc5686ccd8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -649,12 +649,22 @@ hdmi_compute_config(const struct drm_connector *connector,
 				       8, connector->max_bpc);
 	int ret;
 
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      HDMI_COLORSPACE_RGB);
+	if (ret) {
+		if (connector->ycbcr_420_allowed) {
+			ret = hdmi_compute_format_bpc(connector, conn_state,
+						      mode, max_bpc,
+						      HDMI_COLORSPACE_YUV420);
+			if (ret)
+				drm_dbg_kms(connector->dev,
+					    "YUV420 output format doesn't work.\n");
+		} else {
+			drm_dbg_kms(connector->dev,
+				    "YUV420 output format not allowed for connector.\n");
+			ret = -EINVAL;
+		}
+	}
 
 	return ret;
 }

-- 
2.49.0

