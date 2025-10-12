Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE6BD0B4E
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF4C10E1B9;
	Sun, 12 Oct 2025 19:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HqbXwf5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4D510E1C2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:11 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso558567866b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297049; x=1760901849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=;
 b=HqbXwf5FyBgvU+aNj8p0oRrKR4dWTMVvTvLxg0nDMbv/ZrFRogwqVyNzrnHJ54VX9i
 uWqiT0YOuVmnjHSvXemx/W+0ZavU2TSd6q9iCpT2N9DpYV29RQeDh1JCqZBVrKmRFB75
 +OJ7asMKEE+SU1oePk015bD430jwfeWmOz52LNy8jN2Q/eiZCH6OrTMa7RHVofff0pnW
 SmqGfzYmX17vq9UstJOQcX4rAcBz04YWNlXvOLurkBHDqx+8SnAlI9pUD1wq6yGhEy84
 hqlypgI6Zhg9jXMv4r//gyQKzKDOBsBI7H5WzAgSY45Y9pr6bFcfgJ108kKpFe+eonO+
 fWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297049; x=1760901849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=;
 b=hQUB9L9CCSD1Wwth0XYEoGaD5OEL5lwoLybLCI6ymIZanr4+FMBk4Dzm0+vDGUIFeF
 zH0ErarteB+ZdX/b0ymj2hL1TdBJGlxRl0Vmp24VlVFYlbNWz07l8lM7K1zpdC8f2yyk
 2kwTT/K7wiz5MUh12RBhAq7qt4TAtByEmhC5jxbPRb1PJsfRz/La35SOC3hze4tMNcN6
 GVR0uMBd9WwQECnja7COZb1i35QSVlfJGG3WYtaY4Iu28gixhZp7Qs4H0XBOSZm9hbgN
 iE2HPt8EZecUAYOgIM0RGzl3CFjA9zWoL3SRzCJ5uwwfB8XRw4M7fwd4MH08BWpGPW1u
 1+nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm2CT3Bpd9jvbq64G5FNqPVcSocg2OnXRp1G4mfMhp0RZrTBOFt3xwNq6H/7VeUhIyetG3uD7A2Aw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIGpgWiTx0bLTg0DwiZQYxe1+sW0Vo2Nn+R5mUeTnxeYuO9XLm
 8X+upBQJ2WpmlMisnLqXoUCGeQwE10zwkkQYjG2WHF738RmgDKvzcWHW
X-Gm-Gg: ASbGnctWyN3vxVDNli2ELBG2eBTg0fPVwMyRJmbyUFnlL+TycMDb3RGwBFGYkP3hcwx
 Tld329W9Z5Nm9wyM3L9GoGKAEDu/E5GYLkZ/zZ6z1ax+CCrFutpvWtFe43pX0mZdZDp2nzCUAMH
 xwydVnezrNTHl/CHt+oQZghRTVGdgfFBLylEGBYegcP0MEoigTnd7pZg5UP7cvvTd3AP+0iZg5j
 e1ym5UxeDyysYROy9l4Bc3HQvO5gFXkjELBwkg1fT9sJ5XhoaYpoXa0Qknku6QwZCPfxzkjYfSf
 oIyLhpwilRNbgBssgc/lp+wX0qBvH8MSZ2zw7NqoOJ4haxXrF2yjmJGHtaOx96jacRl/rOwxQKM
 U6eGKET5TA9vwbCoihpgXNlEhe+pshT835LduufdfDq7u5OOfGBK6jTiVWAZA0LqXMBTOMOvxVq
 VDzdPNaJUR+vr92fAIduY3bNGg2U32iDo=
X-Google-Smtp-Source: AGHT+IFR0pZ/YrbCaB4kbdDAW62+ktVARq4KWPwTuGdcL/MYc6Uu9RhwoTSIe+WpqZdntWjE7guIfQ==
X-Received: by 2002:a17:906:1b47:b0:b4f:3c7d:ff5d with SMTP id
 a640c23a62f3a-b50abfcc8f1mr1504360166b.51.1760297049525; 
 Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 25/30] drm/sun4i: ui_scaler: drop sanity checks
Date: Sun, 12 Oct 2025 21:23:25 +0200
Message-ID: <20251012192330.6903-26-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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

They can't be triggered if mixer configuration is properly specified in
quirks. Additionally, number of VI channels won't be available in future
due to rework for DE33 support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 2fc54dc20307..c0947ccf675b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -132,9 +132,6 @@ void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
@@ -155,9 +152,6 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
-- 
2.51.0

