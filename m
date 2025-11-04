Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B120CC328D4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBF110E65E;
	Tue,  4 Nov 2025 18:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="COeUizQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71E010E65D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4711810948aso41625995e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279833; x=1762884633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=;
 b=COeUizQZH3DGFqhboNJfUdym+Pp0Iv8TTj5ybnJLMyC9Chp7x2YD9E+abgGcUCJXSO
 C8/ROuio9Go85cBPYKNiW2gfH0uJA9Re7QUyeeM5y0Gq7WHjMXHVzHaUUnxWekd4CWkq
 pRSwJuBDgipLjgK2T6LoV1MKvsHUBVzWCOHOPEn2Kp/FmbZvjaLI1u+0bH6wTTlV8m8X
 HCwhYwWhpbt+sO7+QXLtFBCGmE98aSKgiZR9UDpOwpjVsRg+sGUaEbODxzfXYTOgiYy9
 uPOOzrcfPq65UVuIC8ZYapLRE7meb2HbA18j+5L1nB/wGJanv7RbSFqM6rHFzSzQMEhW
 vPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279833; x=1762884633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=;
 b=YvmmMfJwpmGDLICGLOxh0m0oRgP3SDc1EsH21gG5oUzi7h7uYrkPpbb8EJ09+VQKot
 diQF+9n/g3DSwqW5JJzez3pr3Dsksux02oY336Zd6PM8k+Y2b2GKpBSb7lsjOa1b+1qm
 LYtyZgvYcXSY1BZf2U8lbP6LCsekjjbC8/wgIm2UMmR2VPxv+zY/V/yRVaTPYlfmiVVk
 2IdgoWixOPO6WZ0JqE8zVujTMpMGfcyNUOK7JF5fET2L7ONqm2jUKNy4jgxCY1Npot+p
 Xa7BOA2hK8id2F/nevuT7UHxofBl2rFW0JYhGplndzwrVrvMkEwPGdHwh7Gi3vZeSyM5
 b1Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXittzzenMCas4uvFTNAuEnagh191I5Ppnu7NnGQut9wFPTAQMjelGfZpSEmgqDrJeqBTPrehHFozY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDFw15FwqNwNcvzVAdK47l+jrI8t333+5A/hcF9yPxrucUbXAj
 389S0Uk6RDmJUMVzByW5GK64hWaRFgi0XMWvyO05/1S29QJ8HcDkeALx
X-Gm-Gg: ASbGncvGRmGfTLZHwEsI+xZGAQ+IZ5ji/7ZlyTrV9C4nXCietQQ+RzHDrlUvBuVQUep
 9kpXnZbqwVj2a6ytWmgZvZP8vRo1ZBVaKN7z65OH0/kPx6ZbaU7i48y1WBskstkCPQkvnn19Z2B
 E5Cj9QNS/E6w1IqqIJOQbuokdZQ4IMo9uRQ1URl5NqIHMtfxzLdAKoqRk6zlwdk52q7zllKlvGS
 APKDuFYYhZ0qEazsVkkvsTRhfCSq1hi3NIcbGntsDTmMQyMCrCwxjv7PVSl1zfSXu47U6AU3MD7
 2m64lO1+xJJxDJ3se4y3Xv/24tmoS9XlhB5IQzldgV/QNB0QBFIsPmkqwfIGysaUuH0xIKiIx9O
 yUj2J08Gy+1+UVITV56MWpUhwIqel6NVcdtZaMIwJTaloj/VKwbUUgXyQ4qNEnYXJDU767SPLd0
 a1TX45vRWF+reyaLMQNQ==
X-Google-Smtp-Source: AGHT+IGAou+/VWjl/+havcgVpIaUje7S46iuTOTBDTJA+e9THTDoYyFzTPWTWOtjQVDGfLuUQylUOg==
X-Received: by 2002:a05:600c:1e1e:b0:476:6ef6:e28c with SMTP id
 5b1f17b1804b1-4775ce23c7amr2190455e9.38.1762279833261; 
 Tue, 04 Nov 2025 10:10:33 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:32 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 25/30] drm/sun4i: ui_scaler: drop sanity checks
Date: Tue,  4 Nov 2025 19:09:37 +0100
Message-ID: <20251104180942.61538-26-jernej.skrabec@gmail.com>
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

They can't be triggered if mixer configuration is properly specified in
quirks. Additionally, number of VI channels won't be available in future
due to rework for DE33 support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

