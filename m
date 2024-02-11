Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E680C850C1A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 00:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6E910E7A2;
	Sun, 11 Feb 2024 23:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GNdNR5o1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAE610E7A2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 23:09:42 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-785d60ae6d5so20825885a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 15:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707692981; x=1708297781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhCKXGEt9TZ3Ak7K2jgNcJJQ6zAqQoIKdg3XOoh2cBc=;
 b=GNdNR5o1PE4tpFZ2u2K2D5bwT27l/ERE3s7+NlshTSWCiGYEpa4aWVvPBdhwG4s6q2
 2yXsJj7HnfBhLDj6kzX6j1/UMd3kDmXjtegRUptWR6NwuE0gta2BMfl3HoZEWxowtnfw
 AESC91JBwT5eAku1VBM80ThUbkCVnbhdgVh6HX9TkV9SGK+Zm8YkqrBZc6/ZNDFnageb
 e3KItn/Bjn0AJAGsVXLPtaPcY3IEgtt7CUKz4B34mzv7bAowxQoyKiuBYXCGIr/TU3pg
 vEAigN+y3560xN9BgDV9hYEkI+L5m+R4AoWR8y9apKwM9mwBKYhAvbEOnJIeVg6OQtdQ
 /LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707692981; x=1708297781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhCKXGEt9TZ3Ak7K2jgNcJJQ6zAqQoIKdg3XOoh2cBc=;
 b=wJ4GvM/TMA07PuVqKnVBLDkW1KCa8KMbrP6gBgrUUn9VR5V2yasgAnvvSUJHyuyuRr
 jj8qxIIrlR4akuB7qL/YML/Z4EX6fdN14s3c9+JxhefLN4y55JWFmb17VgI0IE5GUC/f
 fgFYG484dlvUCyIgTMAgCMGPq1Zj4nSaQTO734Vy4fZMiUq4qjYO5y4qFRsqU3VAbluj
 WEFNOlavvcbYRAvhH77zFCQHn+oyWhjkYltoEsMId/0/OK5jolT/4MbuBKSf+QdSGVs2
 BdCKgdNv4WTe/mhWmz5RS5DP+kbm2KkVto/Ju8VWzuihs4MlcLyn5sUoCtI2Jh87HYAr
 kovQ==
X-Gm-Message-State: AOJu0YxN4+vajjprwYpcaze0R5Go1dSkTCzRQ+uoHerSsPetelbtZOVP
 T1ebe9vzQJL21krp0V6AIN/X8pGshoNJOVT4q8ljFCtvriH0uiw9kxxRQhSVfBM=
X-Google-Smtp-Source: AGHT+IEVrTUKOVe7UOOJKP7QkP0pLNPWsCwxp6nzYTXnFQfMy0sRkqzLhG714QWKyRz1NPs5pVPzOA==
X-Received: by 2002:a05:620a:60df:b0:785:b9cf:c757 with SMTP id
 dy31-20020a05620a60df00b00785b9cfc757mr5621083qkb.36.1707692981261; 
 Sun, 11 Feb 2024 15:09:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOPHbzpPEM50aXzk4BjXx2OhfGWzMbZgGMfTA2eUWLV88KXgQHIguJzG+uN7yZN+jCSjQV0Os96HxfC6C55G5AvfPXNejM4GNCJFbZ1nnph8TXwF8tT0xdbouII7qkgUvdNc+1nj6UD9DeiEnMY50FBb3yV+FfaDRdliF8coDO2R7P7Ulont//43wj2mSOAk/Hlo9W1//n6lYPXQMYx81aM1QNn1X2OZR+dOa2RQsufXUxhdawyYlz/s7GbjMR6BnZZbv/CqHNAn1Tvp3uHmlh4gcKHz1hogLPJ2oT6983e8hxxEpOl1k93qhKK4UM4xQixLky8Afmt3C6/lO1SXsfYyFmP44nNdjHFpCtohyzoAvJOKhnaONxezjWmdsZmYv7XowxRYwzdcask/leYbTjT3enstMSMzTWFSPz+KiVp3bM7Eh/TakyyDNfxGIeRy43/2kC6L2HVAY6D05P5prTPhe3NvnkAc/ktlAh0sErOfwlYk8r2zx0noS2aWufyRpDpcjSjWIrQQV9S5DPS30HuM3GKg1AOKY3z5poS5tJZ5lcY/eGXdVFMnYth4oHWT3KTQSh6vNfStZxG+WwC4vAMAJrYdHIn8IarA+yltc+A6g6TPsTtxRIAfT6sJs+Oz4bcYEOMxznphGeW5dpDZYqoX1rbVF8l+n7p796s5NLnHxJxKWScV7dD5cHRI9t8jRe4YP4MSNRQ1DJ
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:c8c4:8542:9142:2184])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05620a103900b007855bec5da8sm1589773qkk.16.2024.02.11.15.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 15:09:40 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: marex@denx.de, aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
Date: Sun, 11 Feb 2024 17:09:30 -0600
Message-ID: <20240211230931.188194-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240211230931.188194-1-aford173@gmail.com>
References: <20240211230931.188194-1-aford173@gmail.com>
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

When using video sync pulses, the HFP, HBP, and HSA are divided between
the available lanes if there is more than one lane.  For certain
timings and lane configurations, the HFP may not be evenly divisible.
If the HFP is rounded down, it ends up being too small which can cause
some monitors to not sync properly. In these instances, adjust htotal
and hsync to round the HFP up, and recalculate the htotal.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No changes

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8476650c477c..52939211fe93 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
+	/*
+	 * When using video sync pulses, the HFP, HBP, and HSA are divided between
+	 * the available lanes if there is more than one lane.  For certain
+	 * timings and lane configurations, the HFP may not be evenly divisible.
+	 * If the HFP is rounded down, it ends up being too small which can cause
+	 * some monitors to not sync properly. In these instances, adjust htotal
+	 * and hsync to round the HFP up, and recalculate the htotal. Through trial
+	 * and error, it appears that the HBP and HSA do not appearto need the same
+	 * correction that HFP does.
+	 */
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {
+		int hfp = adjusted_mode->hsync_start - adjusted_mode->hdisplay;
+		int remainder = hfp % dsi->lanes;
+
+		if (remainder) {
+			adjusted_mode->hsync_start += remainder;
+			adjusted_mode->hsync_end   += remainder;
+			adjusted_mode->htotal      += remainder;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.43.0

