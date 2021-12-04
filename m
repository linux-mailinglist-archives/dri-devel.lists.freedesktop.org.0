Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2F469394
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03C07A35C;
	Mon,  6 Dec 2021 10:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1FF6E8A0;
 Sat,  4 Dec 2021 10:55:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu18so12973624lfb.0;
 Sat, 04 Dec 2021 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C0d0CUW1B7x3fzQqz6q8k32dtwb0GdQ9fNSXToABtcU=;
 b=qpphbWrfpXnlbiEVlqmUTcigeUTFRQk5OfwQa4Ljt0drpgNZXGtP/7wYUQvB+P5wWo
 5OCIs84DZfeAm+D2tn+ER42zog8GCcuiMVv8vsHlaJor7SWsKcirDBGxW+7Nq8+0+nMc
 FHKRnvdXJpAk8bow2fW7Q3o8xUX/TLvfBzPKI7p6rDn4F89plBLoYXZa3PpFpfr6Pq/f
 IzfVIghLys9BlstnmC8Ku4Gy4QIXDDioPkKXtxzKMuMFS/VJ02U+ddaw0FBmKRY85TTQ
 2n7v9qziFq3ltljQQdm6S5HqmMT3rMoVOAz66h1rZDsrS9jEOUhY7cEjTOtJSjxanfrL
 bCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C0d0CUW1B7x3fzQqz6q8k32dtwb0GdQ9fNSXToABtcU=;
 b=2kl5CBsYdHss24qxe3DxqfQkWmOYStXBqRMwCY1/CT2FPyM0dfQNWS4lbGwCuCPaA/
 t2cZTzzyjwdMm2D/pxQQAJSiF3Sqk9yfp0tpnDY/K8TAoTjG0E0SeC6BLLzZsXCD2Okk
 +WZEzl9McUWMFK5/xQ8WlhFVcbjMxyjzRCx8pwp9YLrfJdHIUgJLqMl2/DZieOkkz3OR
 CqfNcfEy8euf8ZMSCmN1h/2ZhbEH3xNyiWU94Kwm93OeI6hdAeQ01FtNHeJWInZgZwTv
 Y7W3ZTB5Z2iINlzJ03KJDMgCaaZbud2YQXOz8grxaI3q+zdx2YiTc9MCB/s2EYIYYeg7
 5FlA==
X-Gm-Message-State: AOAM5305/Uo5NkHmopS9wTQRVCy5MuJJPo1RyZh4kEph2FevVxlfviUs
 izCBrJe/wessXvHwKDueVSx1kaWjwlttmA==
X-Google-Smtp-Source: ABdhPJwpksWaueUjfxQN8EXKZ8uyMOdB4TxPhlVFPayupsVJ63romup+0geZhDZmninOVvoeqbkCTw==
X-Received: by 2002:a19:5e59:: with SMTP id z25mr23826496lfi.686.1638615341727; 
 Sat, 04 Dec 2021 02:55:41 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:41 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/9] drm/i915/gvt: Constify formats
Date: Sat,  4 Dec 2021 11:55:25 +0100
Message-Id: <20211204105527.15741-8-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are never modified, so make them const to allow the compiler to
put them in read-only memory. WHile at it, make the description const
char* since it is never modified.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/fb_decoder.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index 11a8baba6822..3c8736ae8fed 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -40,12 +40,12 @@
 
 #define PRIMARY_FORMAT_NUM	16
 struct pixel_format {
-	int	drm_format;	/* Pixel format in DRM definition */
-	int	bpp;		/* Bits per pixel, 0 indicates invalid */
-	char	*desc;		/* The description */
+	int		drm_format;	/* Pixel format in DRM definition */
+	int		bpp;		/* Bits per pixel, 0 indicates invalid */
+	const char	*desc;		/* The description */
 };
 
-static struct pixel_format bdw_pixel_formats[] = {
+static const struct pixel_format bdw_pixel_formats[] = {
 	{DRM_FORMAT_C8, 8, "8-bit Indexed"},
 	{DRM_FORMAT_RGB565, 16, "16-bit BGRX (5:6:5 MSB-R:G:B)"},
 	{DRM_FORMAT_XRGB8888, 32, "32-bit BGRX (8:8:8:8 MSB-X:R:G:B)"},
@@ -58,7 +58,7 @@ static struct pixel_format bdw_pixel_formats[] = {
 	{0, 0, NULL},
 };
 
-static struct pixel_format skl_pixel_formats[] = {
+static const struct pixel_format skl_pixel_formats[] = {
 	{DRM_FORMAT_YUYV, 16, "16-bit packed YUYV (8:8:8:8 MSB-V:Y2:U:Y1)"},
 	{DRM_FORMAT_UYVY, 16, "16-bit packed UYVY (8:8:8:8 MSB-Y2:V:Y1:U)"},
 	{DRM_FORMAT_YVYU, 16, "16-bit packed YVYU (8:8:8:8 MSB-U:Y2:V:Y1)"},
@@ -278,14 +278,14 @@ int intel_vgpu_decode_primary_plane(struct intel_vgpu *vgpu,
 
 #define CURSOR_FORMAT_NUM	(1 << 6)
 struct cursor_mode_format {
-	int	drm_format;	/* Pixel format in DRM definition */
-	u8	bpp;		/* Bits per pixel; 0 indicates invalid */
-	u32	width;		/* In pixel */
-	u32	height;		/* In lines */
-	char	*desc;		/* The description */
+	int		drm_format;	/* Pixel format in DRM definition */
+	u8		bpp;		/* Bits per pixel; 0 indicates invalid */
+	u32		width;		/* In pixel */
+	u32		height;		/* In lines */
+	const char	*desc;		/* The description */
 };
 
-static struct cursor_mode_format cursor_pixel_formats[] = {
+static const struct cursor_mode_format cursor_pixel_formats[] = {
 	{DRM_FORMAT_ARGB8888, 32, 128, 128, "128x128 32bpp ARGB"},
 	{DRM_FORMAT_ARGB8888, 32, 256, 256, "256x256 32bpp ARGB"},
 	{DRM_FORMAT_ARGB8888, 32, 64, 64, "64x64 32bpp ARGB"},
@@ -391,7 +391,7 @@ int intel_vgpu_decode_cursor_plane(struct intel_vgpu *vgpu,
 
 #define SPRITE_FORMAT_NUM	(1 << 3)
 
-static struct pixel_format sprite_pixel_formats[SPRITE_FORMAT_NUM] = {
+static const struct pixel_format sprite_pixel_formats[SPRITE_FORMAT_NUM] = {
 	[0x0] = {DRM_FORMAT_YUV422, 16, "YUV 16-bit 4:2:2 packed"},
 	[0x1] = {DRM_FORMAT_XRGB2101010, 32, "RGB 32-bit 2:10:10:10"},
 	[0x2] = {DRM_FORMAT_XRGB8888, 32, "RGB 32-bit 8:8:8:8"},
-- 
2.34.1

