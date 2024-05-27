Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652578D0257
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 15:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21310ECB4;
	Mon, 27 May 2024 13:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I9G8+k01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2DB10EB73
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 13:58:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4377FCE0F97;
 Mon, 27 May 2024 13:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636A9C2BBFC;
 Mon, 27 May 2024 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716818313;
 bh=sYS5+n6ti3SenQa49tm4bqlTuOZg4jHrSUyiizUUoAM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I9G8+k01SfK5/SDQ0dsSZfYTz/aBsAfQ5i8wwxoeBs+KBqdAAPaKBgwxmqyPzWUz3
 JVzZVHe8xZg3l43xHIbBB709Hp+51muysfbIVu7+64Ytx+VWiiM8SvvSwzYKhnznC7
 Tc0eF3oTU3RNpi0cGQrkE3/WSf4HbbnjjnFeBPF9H5o+B2JdA3ppqwYxP18JymGFf4
 ObF+4ale1SUf6uYOS4TbWvFWBtvhnXjI69MrdI36+qhJ48UmumCYKmpjDQOQ1//Ril
 8Pj+9BMjg3qsamCmpu6WlF+5TIssPs3YJlfbmX7mi8l8n6wqZHi6UNDvu4w0LnhUUA
 /m7ihdit19D4Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:57:58 +0200
Subject: [PATCH v15 09/29] drm/display: hdmi: Add HDMI compute clock helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3575; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sYS5+n6ti3SenQa49tm4bqlTuOZg4jHrSUyiizUUoAM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhE5OlGY5tfujwfSMnz6r+nWVnS29s+j/1molvLe/p8
 Lf7HE8xd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJTD7F2HDT2VqsJGSDRdDF
 bUU63V5xJ6I6jvsZaXO++PhexHdjgOyF24eO3+pff3Zx517NxVfrtzE2TFCre/fDa2oYy9OjDG2
 3Wufzr3jA9ZVzeudiLtNOn4eu03rUZ6g/meeZP/X15a+RvxPXAAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

A lot of HDMI drivers have some variation of the formula to calculate
the TMDS character rate from a mode, but few of them actually take all
parameters into account.

Let's create a helper to provide that rate taking all parameters into
account.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 61 +++++++++++++++++++++++++++++++
 include/drm/display/drm_hdmi_helper.h     |  4 ++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index faf5e9efa7d3..74dd4d01dd9b 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -193,5 +193,66 @@ void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
 	}
 
 	frame->itc = conn_state->content_type != DRM_MODE_CONTENT_TYPE_NO_DATA;
 }
 EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
+
+/**
+ * drm_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
+ * @mode: Display mode to compute the clock for
+ * @bpc: Bits per character
+ * @fmt: Output Pixel Format used
+ *
+ * Returns the TMDS Character Rate for a given mode, bpc count and output format.
+ *
+ * RETURNS:
+ * The TMDS Character Rate, in Hertz, or 0 on error.
+ */
+unsigned long long
+drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+			    unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	unsigned long long clock = mode->clock * 1000ULL;
+	unsigned int vic = drm_match_cea_mode(mode);
+
+	/*
+	 * CTA-861-G Spec, section 5.4 - Color Coding and Quantization
+	 * mandates that VIC 1 always uses 8 bpc.
+	 */
+	if (vic == 1 && bpc != 8)
+		return 0;
+
+	if (fmt == HDMI_COLORSPACE_YUV422) {
+		/*
+		 * HDMI 1.0 Spec, section 6.5 - Pixel Encoding states that
+		 * YUV422 sends 24 bits over three channels, with Cb and Cr
+		 * components being sent on odd and even pixels, respectively.
+		 *
+		 * If fewer than 12 bpc are sent, data are left justified.
+		 */
+		if (bpc > 12)
+			return 0;
+
+		/*
+		 * HDMI 1.0 Spec, section 6.5 - Pixel Encoding
+		 * specifies that YUV422 sends two 12-bits components over
+		 * three TMDS channels per pixel clock, which is equivalent to
+		 * three 8-bits components over three channels used by RGB as
+		 * far as the clock rate goes.
+		 */
+		bpc = 8;
+	}
+
+	/*
+	 * HDMI 2.0 Spec, Section 7.1 - YCbCr 4:2:0 Pixel Encoding
+	 * specifies that YUV420 encoding is carried at a TMDS Character Rate
+	 * equal to half the pixel clock rate.
+	 */
+	if (fmt == HDMI_COLORSPACE_YUV420)
+		clock = clock / 2;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
+}
+EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
index 76d234826e22..57e3b18c15ec 100644
--- a/include/drm/display/drm_hdmi_helper.h
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -22,6 +22,10 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 				    const struct drm_connector_state *conn_state);
 
 void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
 					 const struct drm_connector_state *conn_state);
 
+unsigned long long
+drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+			    unsigned int bpc, enum hdmi_colorspace fmt);
+
 #endif

-- 
2.45.0

