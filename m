Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD11870884
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 18:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBE01123D6;
	Mon,  4 Mar 2024 17:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VKiYI1E8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990071123D6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709574317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fvYPB4mVnCnJmx+wGFaBsbHFJyHxXWZZH+8erB8RAuQ=;
 b=VKiYI1E8N9PbiG0l6d89zCpfCJOdHlJpZyd3aTTfA4aWgjGx71/zoOCTFtFmo274DbR1h9
 kQSGVyGLAVSq+uWJrEw8ld1Q2Ie/Ro5LcNYgUKBtObKLxcQU7CIAdcldMKPJp3ByGhfkQP
 du4WfYopoG5PPOK8/nJdLXHSonzjmc4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-YK9fdshqOtKEU-LR4-TTXw-1; Mon, 04 Mar 2024 12:45:16 -0500
X-MC-Unique: YK9fdshqOtKEU-LR4-TTXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412db897ef8so8475665e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 09:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709574314; x=1710179114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fvYPB4mVnCnJmx+wGFaBsbHFJyHxXWZZH+8erB8RAuQ=;
 b=SBpIoBBcLO1hKnB65oQ+slLCbg2NZDp+kktxSt81Qv7XAXT+Prnpgy93smonqC48zF
 odLrnFGV7SmGmxJVrsO/Ev4SBZDqWE7w7VdB0lpjyTqzlgEC7dKkm4trRT0m5ynR6Zjc
 nSIsz1DdgRXUchnb0SNNXAmXxnk0AM+4GIYbusPVrtZh8DhfuOXfaFK6tZyupK9Nc9Fn
 trHQSnTazEUoC83STykSU+1e4SyKlepYYS4aWTIIoIuOnZ+WRPvgnwT809SMu/KSxGcW
 UZVhYmy5cjTeo8RyoyTONc1VoOrLN+8Z66/xkC+ZnRX6RuC4fJ0Qg02JftRfwVqBww9/
 oP/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDbJ2+pgcj6dsrBLtS9ugLArtnwJDAOaLLaa2qW9Wz7oZKpxlYw25D6LwBm3OCjdf7+Cmx1TaiW379w3Aw3Gy+zwvSbXk+z5FKy+6CESA1
X-Gm-Message-State: AOJu0YwMz9Sc0L60mPIZ27E/MEphhj880BdhLMOZJ6Z8JrdLRorXotQL
 Bu4/AzMpT+ycBkvu1JLfgzQoUAEC6c6bwhCSKZkdTpZxu/dymvz5wF1lyzpLeWaNdcekEN6/AqR
 CLjEviIYI0CWwO6n5l4nf74oGXHW20T+ox6PBiNADGDR6gnfInyd0I666+lZYRoMBL3X+KhT9Sw
 ==
X-Received: by 2002:adf:d052:0:b0:33d:61c7:9b2c with SMTP id
 v18-20020adfd052000000b0033d61c79b2cmr153211wrh.34.1709574314163; 
 Mon, 04 Mar 2024 09:45:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfSIScZUyUHr+intkv3X7lZCQsIDrLLSY2NfMGegPwvMGfJpkjJ/IHIgPw/s/cmx74Wojjag==
X-Received: by 2002:adf:d052:0:b0:33d:61c7:9b2c with SMTP id
 v18-20020adfd052000000b0033d61c79b2cmr153203wrh.34.1709574313795; 
 Mon, 04 Mar 2024 09:45:13 -0800 (PST)
Received: from toolbox.fritz.box ([2001:9e8:89b0:4c00:a0ac:17d3:a942:8863])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b0033e34982311sm4737615wrw.81.2024.03.04.09.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 09:45:13 -0800 (PST)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: 
Cc: Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/drm_connector: Document Colorspace property variants
Date: Mon,  4 Mar 2024 18:45:08 +0100
Message-ID: <20240304174512.145862-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

The initial idea of the Colorspace prop was that this maps 1:1 to
InfoFrames/SDP but KMS does not give user space enough information nor
control over the output format to figure out which variants can be used
for a given KMS commit. At the same time, properties like Broadcast RGB
expect full range quantization range being produced by user space from
the CRTC and drivers to convert to the range expected by the sink for
the chosen output format, mode, InfoFrames, etc.

This change documents the reality of the Colorspace property. The
Default variant unfortunately is very much driver specific and not
reflected by the EDID. The BT2020 variants are in active use by generic
compositors which have expectations from the driver about the
conversions it has to do when selecting certain output formats.

Everything else is also marked as undefined. Coming up with valid
behavior that makes it usable from user space and consistent with other
KMS properties for those variants is left as an exercise for whoever
wants to use them.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++---------
 include/drm/drm_connector.h     |  8 ----
 2 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..1c4ce7f90a76 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2147,24 +2147,55 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  * DOC: standard connector properties
  *
  * Colorspace:
- *     This property helps select a suitable colorspace based on the sink
- *     capability. Modern sink devices support wider gamut like BT2020.
- *     This helps switch to BT2020 mode if the BT2020 encoded video stream
- *     is being played by the user, same for any other colorspace. Thereby
- *     giving a good visual experience to users.
- *
- *     The expectation from userspace is that it should parse the EDID
- *     and get supported colorspaces. Use this property and switch to the
- *     one supported. Sink supported colorspaces should be retrieved by
- *     userspace from EDID and driver will not explicitly expose them.
- *
- *     Basically the expectation from userspace is:
- *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
- *        colorspace
- *      - Set this new property to let the sink know what it
- *        converted the CRTC output to.
- *      - This property is just to inform sink what colorspace
- *        source is trying to drive.
+ *	This property selects the colorimetry and transfer characteristics user
+ *	space configured the CRTC to produce.
+ *	The transfer characteristics might get overwritten by the
+ *	HDR_OUTPUT_METADATA property.
+ *	The quantization range is always full (see the Broadcast RGB property).
+ *
+ *	The driver is expected to send the right metadata to the sink which can
+ *	depend on the property value, the output mode and the output format.
+ *	It's also responsible for converting to the output format, taking into
+ *	account YCbCr conversion and quantization range.
+ *
+ *	For historical reasons this property exposes a number of variants which
+ *	result in undefined behavior.
+ *
+ *	Default:
+ *		The behavior is driver-specific.
+ *	BT2020_RGB:
+ *	BT2020_YCC:
+ *		User space configures the state such that the CRTC produces RGB
+ *		content with Rec. ITU-R BT.2020 colorimetry, Rec. ITU-R BT.2020
+ *		(Table 4, RGB) transfer characteristics and full quantization
+ *		range.
+ *		User space can use the HDR_OUTPUT_METADATA property to set the
+ *		transfer characteristics to PQ (Rec. ITU-R BT.2100 Table 4) or
+ *		HLG (Rec. ITU-R BT.2100 Table 5) in which case, user space
+ *		configures the CRTC to produce content with the respective
+ *		transfer characteristics.
+ *		Drivers can configure the sink to use an RGB format, tell the
+ *		sink to expect Rec. ITU-R BT.2020 R'G'B' colorimetry and convert
+ *		to the appropriate quantization range.
+ *		Drivers can configure the sink to use a YCbCr format, tell the
+ *		sink to expect Rec. ITU-R BT.2020 Y'C'BC'R colorimetry, convert
+ *		to YCbCr using the Rec. ITU-R BT.2020 non-constant luminance
+ *		conversion matrix and convert to the appropriate quantization
+ *		range.
+ *	SMPTE_170M_YCC:
+ *	BT709_YCC:
+ *	XVYCC_601:
+ *	XVYCC_709:
+ *	SYCC_601:
+ *	opYCC_601:
+ *	opRGB:
+ *	BT2020_CYCC:
+ *	DCI-P3_RGB_D65:
+ *	DCI-P3_RGB_Theater:
+ *	RGB_WIDE_FIXED:
+ *	RGB_WIDE_FLOAT:
+ *	BT601_YCC:
+ *		The behavior is undefined.
  *
  * Because between HDMI and DP have different colorspaces,
  * drm_mode_create_hdmi_colorspace_property() is used for HDMI connector and
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..02c42b01a3a7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -437,14 +437,6 @@ enum drm_privacy_screen_status {
  *
  * DP definitions come from the DP v2.0 spec
  * HDMI definitions come from the CTA-861-H spec
- *
- * A note on YCC and RGB variants:
- *
- * Since userspace is not aware of the encoding on the wire
- * (RGB or YCbCr), drivers are free to pick the appropriate
- * variant, regardless of what userspace selects. E.g., if
- * BT2020_RGB is selected by userspace a driver will pick
- * BT2020_YCC if the encoding on the wire is YUV444 or YUV420.
   *
  * @DRM_MODE_COLORIMETRY_DEFAULT:
  *   Driver specific behavior.
-- 
2.44.0

