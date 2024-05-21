Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F5E8CB3D1
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318B610E1CE;
	Tue, 21 May 2024 18:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="STZIQ2eW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171CF10ED8C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:47:34 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3c99e6b8b1fso2863008b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716317254; x=1716922054;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vp+K1TVMHDOLLoj51PiChvU7JPsn1elpoH4wGnkUKKc=;
 b=STZIQ2eWvBT1sGnwTwAK1UNkrNzrCUHHC+K3SIOGTmf5wvjpkZhYJWryuMV/4bvdYx
 ubgiUYj/+pjk1pGskLAkTVidTeS5aJUH5qGbXcxzdsmRT3AXUBtSCH01Ls1YVjXa6iI5
 qZzTdwMElwQlPC/LFBVYyuY9Urs+lycNiGgMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716317254; x=1716922054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vp+K1TVMHDOLLoj51PiChvU7JPsn1elpoH4wGnkUKKc=;
 b=sToRAfIG9sPrvQQzTZiC2LXz2eRhyriX1Z4xH1t4FAuz2DkkMPeFfJ8xG03Yd0AV1j
 1O8zLeNBfPcWagRF144zAvn6cBYOx5nZHpBhKPGd/kScdYDxHwJA7dKozJ7jbz+pJYMt
 XvLRaUIkzbTp1+Di9MheTZEMEugJAFRTpns1qzy/hA7DvoCqRDTZITkjW12PvUw/pBFh
 1ORrU27JQ7Tagcmgw+0yqFULXxBc/widcx7FafOnrBiLSZTyrdXJ2+BRUtMp/lVEgxi+
 pDOyvc1FmhfFeWiIdMWR/9r5Nxqro8Xif3bp1CpKWIC9OoClknx6laniyaTvGbeI1Rx3
 ESvw==
X-Gm-Message-State: AOJu0YzexZBf0Q8aYbSz7HO3ezRqKeLXPQ+YCTqjYR6A2LsDFBsaRsMK
 lpZQTNV3C+gHeNNzuhXUmWrsOmWVgD6rNPp5rSzuZHrqL9bnS2356PUEZeMmYyVrszRbQSDyxM5
 rCrIfQ8sBRTETumP25c3uBBBjXSju7RxlyLmyhZGjEJ3BMBUiooyZzNb5HtPIHuzDARUEkov69K
 bfbrr5lw55OQoM8UaGeP3nqY2HcmCjKPUp8obRXl+6vKI01YVcIA==
X-Google-Smtp-Source: AGHT+IGDhuohGWRKzOaruZjnlvjqjwH6fvRuRSjjCzlFOeisd9UwufipBeQ1f7zoNe8lVFT7oFe6Zg==
X-Received: by 2002:a05:6808:a89:b0:3c9:9268:9ee8 with SMTP id
 5614622812f47-3c9970539e4mr38932791b6e.18.1716317253689; 
 Tue, 21 May 2024 11:47:33 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf27584asm1315895785a.10.2024.05.21.11.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 11:47:33 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v3 1/4] drm/vmwgfx: Filter modes which exceed graphics memory
Date: Tue, 21 May 2024 13:47:17 -0500
Message-Id: <20240521184720.767-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521184720.767-1-ian.forbes@broadcom.com>
References: <20240521184720.767-1-ian.forbes@broadcom.com>
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

SVGA requires individual surfaces to fit within graphics memory
(max_mob_pages) which means that modes with a final buffer size that would
exceed graphics memory must be pruned otherwise creation will fail.

Additionally llvmpipe requires its buffer height and width to be a multiple
of its tile size which is 64. As a result we have to anticipate that
llvmpipe will round up the mode size passed to it by the compositor when
it creates buffers and filter modes where this rounding exceeds graphics
memory.

This fixes an issue where VMs with low graphics memory (< 64MiB) configured
with high resolution mode boot to a black screen because surface creation
fails.

Fixes: d947d1b71deb ("drm/vmwgfx: Add and connect connector helper function")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 45 ++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 2041c4d48daa..52e8ec3b2357 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -43,7 +43,14 @@
 #define vmw_connector_to_stdu(x) \
 	container_of(x, struct vmw_screen_target_display_unit, base.connector)
 
-
+/*
+ * Some renderers such as llvmpipe will align the width and height of their
+ * buffers to match their tile size. We need to keep this in mind when exposing
+ * modes to userspace so that this possible over-allocation will not exceed
+ * graphics memory. 64x64 pixels seems to be a reasonable upper bound for the
+ * tile size of current renderers.
+ */
+#define GPU_TILE_SIZE 64
 
 enum stdu_content_type {
 	SAME_AS_DISPLAY = 0,
@@ -829,7 +836,41 @@ static void vmw_stdu_connector_destroy(struct drm_connector *connector)
 	vmw_stdu_destroy(vmw_connector_to_stdu(connector));
 }
 
+static enum drm_mode_status
+vmw_stdu_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	enum drm_mode_status ret;
+	struct drm_device *dev = connector->dev;
+	struct vmw_private *dev_priv = vmw_priv(dev);
+	u64 assumed_cpp = dev_priv->assume_16bpp ? 2 : 4;
+	/* Align width and height to account for GPU tile over-alignment */
+	u64 required_mem = ALIGN(mode->hdisplay, GPU_TILE_SIZE) *
+			   ALIGN(mode->vdisplay, GPU_TILE_SIZE) *
+			   assumed_cpp;
+	required_mem = ALIGN(required_mem, PAGE_SIZE);
+
+	ret = drm_mode_validate_size(mode, dev_priv->stdu_max_width,
+				     dev_priv->stdu_max_height);
+	if (ret != MODE_OK)
+		return ret;
 
+	ret = drm_mode_validate_size(mode, dev_priv->texture_max_width,
+				     dev_priv->texture_max_height);
+	if (ret != MODE_OK)
+		return ret;
+
+	if (required_mem > dev_priv->max_primary_mem)
+		return MODE_MEM;
+
+	if (required_mem > dev_priv->max_mob_pages * PAGE_SIZE)
+		return MODE_MEM;
+
+	if (required_mem > dev_priv->max_mob_size)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
 
 static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
@@ -845,7 +886,7 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 static const struct
 drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
 	.get_modes = vmw_connector_get_modes,
-	.mode_valid = vmw_connector_mode_valid
+	.mode_valid = vmw_stdu_connector_mode_valid
 };
 
 
-- 
2.34.1

