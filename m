Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626439CF110
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC3110E2D8;
	Fri, 15 Nov 2024 16:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="gs2tIp8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0C810E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 16:07:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso1138248a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 08:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1731686874; x=1732291674;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CycAJx3idmdsvb2oboF200n+heMzv/tQjcKECgs/uw=;
 b=gs2tIp8Z4rgKaXVorgvLQcBfYxqRpOBWnzPdAq1kfHewl74FeIak2C6cuwvyzJDck/
 QB/HHkyAuzolJIwHgV8UJBjEAx0Hv4ruQo4YPP182QnpWPnU/RHpGM/uVqM3Oh50fGqF
 I6QRpx7bFwGsnodY3nUWdrGXrR+xmfWnRZaMUbzyYKJ/fRh4hrF3v4k5iM6hyiJwPtGj
 TEdV1wFVOw07fj+trrFTk1UViQxscomXZSJYkoC2xVzizUIJ83kLjL/4Nl4SmpkWovCH
 nnTLuCVl92+zAd3lalZa/myXxygbKtqsLbq8eSiqcsfmbUkaeOu6XlpOX4loNYmyAeaE
 pu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686874; x=1732291674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CycAJx3idmdsvb2oboF200n+heMzv/tQjcKECgs/uw=;
 b=P6w2N6SRR3v0ApcM59TAn4SmFhE4xMD7R25qVM6wKZteUAWVlZviwIkM5mICql/xVb
 BmOw3DNF2XB7ejk0Z7/Rdl8NPmaoTwFuRW55u06WXhRt2jKZ/lSGdo0Fm7AnWmtzMZbZ
 p6hhu7u2/YHaD1D2yn1RJMiepRAVdjEoRORPJ+d3kHnjazyDjGyUW6LNRHoVCTxaSHOI
 ZHgJbhcvE8Eb9qv7fG1iO0nqrBRZljEtw00sRnYlOL0uUWXcSp5gpoZrPwdkV/bW89wj
 31G1YrJYWBF6IKMtQtsguJ6Ekwa4WIF5FCeJi2yfUtlVUbwQOh/VD6OOFJQ/cW+APzj5
 gcHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPUJLfe9+j5BkSwbaSvXZwYx1pmWUy4xnW8LC+bGT5vaf1pp3GyTC+7jAioEebfsuUH1ql4uAHods=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9fGOLF6ExmmcTiUQLWdkNFqLyi+69n/wH5XrKZvkZUhjwkk8+
 AeJfj9KEpC2eItI1CCSX3aFXc2Fubbjbw9N0T7OaiozDrxAd+2ushoVrd4WFSY8=
X-Google-Smtp-Source: AGHT+IH2U0OnUfhXO3qxZuHhXGmKJ4U2QgdglEBHh3If9IMSL3DAHUNYch3+DhBSltB9S39eUaStfg==
X-Received: by 2002:a05:6402:50d3:b0:5cf:707f:a123 with SMTP id
 4fb4d7f45d1cf-5cf8fc1406bmr2607951a12.5.1731686873609; 
 Fri, 15 Nov 2024 08:07:53 -0800 (PST)
Received: from fedora.. ([91.90.172.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e00172dsm194948266b.120.2024.11.15.08.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:07:53 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Daniel Semkowicz <dse@thaumatec.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/bridge: tc358775: Remove burst mode support
Date: Fri, 15 Nov 2024 17:06:32 +0100
Message-ID: <20241115160641.74074-2-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115160641.74074-1-dse@thaumatec.com>
References: <20241115160641.74074-1-dse@thaumatec.com>
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

Current tc358775 bridge driver implementation assumes that DSI clock
is used as a source for LVDS pixel clock. Moreover, clock divider
PCLKDIV has a hard-coded value. This means that driver expects DSI
clock to always match a panel pixel clock. With such assumption, LVDS
pixel clock is configured to be (DSI pixel clock / 3) for single link.
This is true for DSI non-burst video modes. In burst mode, DSI host
is allowed to set transmission rate higher than pixel clock to allow
shorter data bursts. When the transmission rate is higher than expected
by the bridge, LVDS output timings are still configured for the lower
frequency, but the output is clocked with the higher one. In most cases,
bad LVDS timings cause incorrect panel operation.

Remove support for burst mode, so the non-burst mode is used by DSI
host by default. Burst mode is supported by the bridge itself,
but requires proper implementation in the driver to operate correctly
in all scenarios.

Fixes: a4ed72e85c46 ("drm/bridge: tc358775: Add burst and low-power modes")
Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---

 drivers/gpu/drm/bridge/tc358775.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 0b4efaca6d682..7496681c7b883 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -632,8 +632,7 @@ static int tc_attach_host(struct tc_data *tc)
 
 	dsi->lanes = tc->num_dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
 
 	/*
 	 * The hs_rate and lp_rate are data rate values. The HS mode is
-- 
2.47.0

