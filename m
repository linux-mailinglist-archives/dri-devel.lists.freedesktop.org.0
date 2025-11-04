Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B4C3288F
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E58910E316;
	Tue,  4 Nov 2025 18:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gVnb3crK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6F210E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso75722635e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279809; x=1762884609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=;
 b=gVnb3crKjrfcLRe+E0xb7sOpsExEFluHGrEy3lFaWnZF9GTeQcSMtVWEmcCqwDlSm1
 pVwZ+rDvLKHQYOij+LEbAfY80RfRGZRWRGn+tBY2PsvEimSLt+2OazKOJyRxkLCQYIUm
 5WhBiK5nmyAloDdT2Z7m70jCw9nt/B54kh9g8/Ma+0XXLDBpL4CCuZJJihR3tAoNxp3z
 qhNjQcpyjiXFit2zFa/rdzda1H0DgAVslPk6dnd0BM9pRfrVjsBxTjXWMvaEf4rBjaEK
 S6f2j4Egnwf2KgiCS6N13IQ8/ePYFcyrCJ9rSV35B+/eKsiModdV3tHMz1gL3U5IAHL+
 66BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279809; x=1762884609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=;
 b=vVgIov2dYtDXlU33K0f4iEs1Q5hkJpPBMpE31mqYHcAjU3//xa6lGjCEg6cDI4a+IJ
 lgaJ78dP2HTQ3YFI0v98hG4Cyn+grjngUNJjKNFvxG7Os2zPcTa3mQlkIxsB3Q2wfnPF
 yCl0J7vKzAS1U0tBDuk5mx09Tm6z22hHUWQAdA5oatGRZNYHDbMcHlUzBpdoI7fbvShB
 ta6mBjFwYbob4ujDNKi5xGW1e87AnXT0dsmy/3stg6oClOb9wOGpGp2KpMKBt6VPJlnT
 PkKppgvjTAVjn2W0Dq6uOTwoA930a2NBakJp5KTeQahwE3ul375+r4pHLEhfU7aS3UBn
 HgTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaso/bfkQTyEYjmKR7OUXaSxC75/TbY1xaD4auVsQS/J6KpVom0hcNSEMaOt5oTR4QEDqgxtfstgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8xXT+h29e1oe19VUqssVd0jVv9MMn+FB2nBfugPB9gAzT3Jeq
 QIDSWo1YPWRXC2h3L1azTtWlnMxEiMuQhi+27D0Llamhev+U0Iq11xyI
X-Gm-Gg: ASbGncuCT5+YEfB2NvaeoQ0p/qGX6H5aoalfnxUqXjNofSn5prIJDrhIj4Ph8HXQcWG
 JJPLemkmKLFT7K/SxWQbB9wRrbwHcBifRZyb7KvgcF6PyIZxPrOE7cLHnm+6aM5X58y2WJ20kAR
 MZ5CVc+1Fvn7+Ju2d+GoqdofyCyONUw/7DKpmulXhjDU6Sy0SLMqO7t6ucqIIgdoJroxv9NziXW
 Ka67ZbdWUJuKcdfRKL6Z6xs+DoYU63zQJ76OGi7lvqbF/VKlbV57CsYCIxsaAxnfi12zVTekUhy
 Uk8R+R0L9wsnqzawS93nwel0W4RW1kEva0bZoqB2+1P2sLgL54wciRfdurDxNM1LXcAYYgR0eyQ
 JwhcabFU0FMftfVFzuSZ0TTs036+ydYG/wNO9SofKsTBBvfsHE3tXzVUWrqVM0/5r6UFkC/g3PM
 k1s/pPn6jSVVyLxcLHAw==
X-Google-Smtp-Source: AGHT+IEJHAiuBYWEtNzJWv6C7uhRnDsBy6FovSk1I1qNjU8+nmp3MeD3eeYgDnF9LcKCHm1OTcNSBg==
X-Received: by 2002:a05:600c:530d:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-4775cdc5874mr2504965e9.14.1762279809223; 
 Tue, 04 Nov 2025 10:10:09 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:08 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 06/30] drm/sun4i: layers: Make atomic commit functions void
Date: Tue,  4 Nov 2025 19:09:18 +0100
Message-ID: <20251104180942.61538-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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

Functions called by atomic_commit callback should not fail. None of them
actually returns error, so make them void.

No functional change.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 20 +++++++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 +++++++-------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index fce7b265c5d8..8baa1d0b53bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -46,9 +46,9 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 			   mask, val);
 }
 
-static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
@@ -124,12 +124,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
@@ -144,12 +142,10 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -184,8 +180,6 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
 		     lower_32_bits(dma_addr));
-
-	return 0;
 }
 
 static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index c80bdece5ffc..dae6f83cea6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,9 +48,9 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
@@ -191,8 +191,6 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -211,8 +209,8 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
@@ -246,12 +244,10 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
-
-	return 0;
 }
 
-static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -305,8 +301,6 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 								 overlay, i),
 			     lower_32_bits(dma_addr));
 	}
-
-	return 0;
 }
 
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
-- 
2.51.2

