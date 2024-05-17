Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62508C8C55
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 20:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AE010EF55;
	Fri, 17 May 2024 18:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fwyeylmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834EA10EF55
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 18:48:39 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-43df732cb05so1894071cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715971718; x=1716576518;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK8N/h+/padUDmQYlb95tFDuLkFafMA6LNdNhI1W/Xw=;
 b=fwyeylmBhsWidG04IntgalKkyZNzNoD/Cwdcp0lvoq2JrRa2m6YaYvNnybHni+8w4G
 A4V/M6xu2o+oAEjlSJs8JPn/8RhCULO5O5PvsfrLONNmeoHrC62DWciHQLvzgZKPHd7h
 pjxz0U844FqCQ+aFt37FYGxsUfeAvT9Z06DNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715971718; x=1716576518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WK8N/h+/padUDmQYlb95tFDuLkFafMA6LNdNhI1W/Xw=;
 b=jiEGNQsiT94Fv2LCx/FWZKoiR8zwL0QsYoj1XcQYOtM/eHCDX3a/YqFghZkJ0s4fyR
 SQbdCEJeTnBFCCBnDALjnzyevZFT7sDdW0yOStZ8es2Qubdl/9YsMyBPNN3v7Q3kYVom
 ohwGzoSuC/V8coEviv7nEx49UW/HBDLLcwckIaNamPiYFu2Gm/u2TFW9Y94v1DjWQUSC
 9lYjER4N311yoqUy2vybCQUr+ce4UNAdtSrLcdLlcs5/7nPWCdiWyZED08cwb/XSXd8u
 cFwXY/6DG/7Ape2zWkO6xvGLVY2/XqcPwuySf0jFZ+U3bSAvZp7N3S6EGXkHSEoZ7w9n
 r5Hg==
X-Gm-Message-State: AOJu0YxpcQ1m5RmW2++iVhysiGcI9LiwoSOS2MHQBnq0EUsuvZsZND6y
 LPqgNy1pZhkHeBiQy28tRL5Q5PUCgscJClfaz6lLP/+sL9WdtW79EkxRtkmMlvLHJePGBw8X+5/
 opbw9clBUnNOfK7gwm1OKDDx9ZBv6KBx5ERXkhagAnku/+L1bo5WFwaAmuF6elpAzXxpMNOGkXS
 TC8XKh9Bj1ktLJJdZyh+S0MIcY5Ay4h1eTwfeLOPKKSdctHC9H4Q==
X-Google-Smtp-Source: AGHT+IEz/48wwE/X9agI5ibWTyO8KJJsIXiDc20mWs5K4Ouqkoa/kfoaR1iC9DkwboKy81xdQqLcVw==
X-Received: by 2002:a05:622a:1391:b0:43a:f7fb:9698 with SMTP id
 d75a77b69052e-43dfdd1b440mr240473401cf.41.1715971718097; 
 Fri, 17 May 2024 11:48:38 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df87da55bsm109515441cf.33.2024.05.17.11.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 11:48:36 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 1/4] drm/vmwgfx: Filter modes which exceed graphics memory
Date: Fri, 17 May 2024 13:48:08 -0500
Message-Id: <20240517184811.25807-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517184811.25807-1-ian.forbes@broadcom.com>
References: <20240517184811.25807-1-ian.forbes@broadcom.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 2041c4d48daa..a2b5527a249d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -43,7 +43,12 @@
 #define vmw_connector_to_stdu(x) \
 	container_of(x, struct vmw_screen_target_display_unit, base.connector)
 
-
+/**
+ * llvmpipe will align the width and height of its buffers to match its
+ * tile size. We need to keep this in mind when exposing modes to userspace
+ * so that this possible over-allocation will not exceed graphics memory.
+ */
+#define LLVM_PIPE_TILE_SIZE 64
 
 enum stdu_content_type {
 	SAME_AS_DISPLAY = 0,
@@ -829,7 +834,41 @@ static void vmw_stdu_connector_destroy(struct drm_connector *connector)
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
+	/* Align width and height to account for llvmpipe tile over-alignment */
+	u64 required_mem = ALIGN(mode->hdisplay, LLVM_PIPE_TILE_SIZE) *
+			   ALIGN(mode->vdisplay, LLVM_PIPE_TILE_SIZE) *
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
@@ -845,7 +884,7 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 static const struct
 drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
 	.get_modes = vmw_connector_get_modes,
-	.mode_valid = vmw_connector_mode_valid
+	.mode_valid = vmw_stdu_connector_mode_valid
 };
 
 
-- 
2.34.1

