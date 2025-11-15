Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1BC606C9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5F010E2A6;
	Sat, 15 Nov 2025 14:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XCap5YtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B3110E2A3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:17 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so5098992a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216056; x=1763820856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
 b=XCap5YtZtzIkHNW4lUeG95dWAOsRjBz6z8j00gLXyonXPxr+KzANvLjWaGY2AIbJ5X
 PNh3nAY5kXokuw+bMvUpZmrsu1U05uLmERmo09skxOyrPunC6jU5+SBGRVtCi3MQ6YmF
 FFWNUXsXOHhlUGwvevFjabThZtwRJEicpvwGdAcXZTQiPPHP3McqaKTygA7lX2dbxTEF
 duPDQXMuIH4GfNsfIuY1cTUFWizSrrhkUaRz2woEJx/d5QQykxJUdV4u8Zm+7luX2bR0
 p27u9RaKASirfKzsHijtoe3mv5tJVpCk+hX6OkaNzpIq0xsoqkuBMd1WyxeeV2roscax
 zPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216056; x=1763820856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
 b=i2bmmEguzIrljUHMivk0WNaccpYJbft6GmNbgB4MjUhC4nkdt1CDf0VMiXQBjr9PKG
 l6wnD622gYtRKfLPqSYwCokgOkhoC8fWF0f1EgW8FhWCcokdrP7wfe8Wo0fzZ77/e8Bc
 uwBAI/IIy1t9LxsMDaNWsRf2IKqJnUVKeG2BEiEC+JvibtYEciscI93WfDuK0I35JE96
 eRdCxqVKy+ZmhMdA8OXCvwZnvvUoyP2WXRDY9HsmwU/nWNodpiTyz/Dm1TgYWpsGd9q3
 zoRC+XlX1NMSCI9fPjiR9qIJjugqIsucgHZ+5kfTqdmzI2U91GOsTlqXbI7u+5PtFk1k
 btGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP8lvhDPoIoFhhK1gOC8XJqKbOu1nQ/ItNH5C51W+mSx6nLNZXU237aZHxjtJ2xuzwckmPG1V2AhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2/Mxf4Y+xg1QK//CVIaGKW3RhDrAfJkSo0hWZ13HcBzWfpeRG
 9Zoqdwfb0QS5dKcfM7ve9UHK1B4Fvu74MBU8nksc9dgAbQH/hntcr4ok
X-Gm-Gg: ASbGncvjbQT2eBnz1GhSH9lTnqLpKLiQBibbJ5guGCeU/n/1QqjDQdfjJu0osRFtDPq
 6fRJJIUjfnZoG8GcyfsSeO6CxlLLgiU/8jafyjOtWe5s67UViydYdlJAWuLf66wChQOjt86um0w
 XmIeCxTptnNA4mcDApOQ+pH6YjfD8wpLvN3IkKP2TPrbYcjoGELU0eLqkIURl+AlKiA0jGHLQC0
 rPIaB2z2kzP0XZSSVxOO1Vm3gGlpC1PJnV005tQ5v+Kk62rP9ViE3lPQAiYfRvdSSH2KPJPqsYp
 G64Uwtuw8nL+kixDW5NnAIPppB60mkw5luDw2CHAjuboUE3P5dHe6QZAIekvrKNd3QllxMZCpXt
 nZkOduoXDq/4oFeq1qrQL9s+SN4qajZgPhObFFITZUxdk7KIcHDtJnHYTKSwkVe39zEcCp3CRr1
 f4r7dp3DQtTa7KKk5p4cC6gjTQT3alUvdr11VpMJVKdsj3eQ==
X-Google-Smtp-Source: AGHT+IFh8CjX1reglk+d9qFWiwVdzTnZZrgC6zCnkQGkRjSeca5TyFvpwvWCslriMZOQG7eYdwduUg==
X-Received: by 2002:a17:907:7f05:b0:b73:880a:fdb7 with SMTP id
 a640c23a62f3a-b73880b0177mr94905066b.35.1763216055478; 
 Sat, 15 Nov 2025 06:14:15 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:15 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:13:42 +0100
Message-ID: <20251115141347.13087-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
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

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 40008c38003d..baa240c4bb82 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -403,6 +403,37 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+/*
+ * TODO: DE33 VI planes naturally support YUV formats but
+ * driver needs improvements in order to support them.
+ */
+static const u32 sun8i_vi_layer_de33_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -432,7 +463,10 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->regs = regs;
 	layer->cfg = cfg;
 
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		formats = sun8i_vi_layer_de33_formats;
+		format_count = ARRAY_SIZE(sun8i_vi_layer_de33_formats);
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
-- 
2.51.2

