Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C10AF1626
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 14:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5B10E2EF;
	Wed,  2 Jul 2025 12:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GgAFnDh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F6C10E2EF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 12:55:15 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2e9a38d2a3aso4378942fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460914; x=1752065714; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NmMXignAcgy9m6Sf/k76zsomjXcz7tyoG6UG//CdDIU=;
 b=GgAFnDh8GWqRCzoUBTlER11wk6LXCjxlgCkxTXnFxKK+hDtBjZCKCL9qBwri0GDD7q
 HemZVHVZx1+R/1I53XGd07pwu02PHUW0Oca+Nos1n0CR/UQHgquIeW2NVgcJ75ONOAvx
 4KifaEeesk1Ww66J0e0INdUUxgC4A/61q+XfVMOTbXLGfjkOty3s/87KJwyToW/Sayir
 o81Dw2yLW8L1hGURyy0mBd8gnsyq6TZrV/W5dIaCD3X0JbL9uxGc0/z6+f0giyOEV4Kt
 NN0wuttsru6MUHeSKTHR9AcegT9fmwHJd5mBY0yRI8GmQNhRdgsiMyfVYvcqOZTiS3/p
 wChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460914; x=1752065714;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NmMXignAcgy9m6Sf/k76zsomjXcz7tyoG6UG//CdDIU=;
 b=Rh7WnTlkx3MWCsqIgJ0mma/4+Puw6ChGeZdVPG9wNfXQurnOxPgoDCa5XyEnDqeU8h
 JKpF6T4OzlMqc2JlTKs6KnIIs6Y5z+pWs5GOtRjEfIofPNfVEwAmxnrS8AOsWjhde6sv
 JAkxZyGaYHRf8qlSrgwwpgRzmaE7jVKGqAQP2aj8Nq/v/tDJpcFcn01gcemskEHoiFhU
 4suLCXzgMVPYnNxAxrL+IsIi8wLF2p+LFDVXs0FHuvfyg0S3xZIWybUsWh4wHB6vSW9o
 R6Bm43HBCHDEeDdyGK7Ycg1cxpMaOAWXT6UCP2pdym66hEEgedQFIGxQS6p8MGFqIbXA
 xOwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvII0RDtLs3qW4d55oqkVDW6k3bkOE2yOBWxRv7QO9LxSIXu6hq/pg93haHXkdHMTM4s7oREVdRv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcJygdF5atQZ6BJ7Z1dqKFsvniXozvQvmZ+dAhhJ1eOLas8e2X
 VBHa6xThJblErHjTjo+xWIQhz9UxUDbvWzkstBO8qBdUDKOR9F5K9m72Y6J6KjcHW5Y=
X-Gm-Gg: ASbGnctNBBpT7YWLS0EpTsJzYaZ40wIvEj+nA6ATsnuYM1vBVbignh4DcTygkF+SxD8
 foQFlKMprP0ZacMA9Rqh3cftr5aYN1uqqmYWY4qu6DmkVS9oZch/S2raU3JKgSttAMucL8X6T1R
 oj9Kae7gHPD3l52rVqTEVhwZLK45e+JrCk/XfJvBA4+t6McSNYhm3NssFazHlxwXjBzYBw4JFqv
 8KrjgYf1JcV6Hf87N57Bzz3SIPVay0ufmIW8h78IDJWR8WkX5ROzWVnTR5CsvsHhyaapZSH7rXi
 nsfMBAHVQGauYqzgNkkt7vL7osDOxEzbPknV52NcDeSE7UcLq4FJsc1eVkTJmDHAb6rdjgZ3gH4
 ZpbWz
X-Google-Smtp-Source: AGHT+IGcYN9rPOHHdQ7PsgYM3Fqg0wPgCuGzQFBF1b+DB5bmZT4Xud99Stxy6A9dj5LlWMYjIyWJnw==
X-Received: by 2002:a05:6870:3d92:b0:2c2:cd87:7521 with SMTP id
 586e51a60fabf-2f58890100cmr1816505fac.4.1751460914344; 
 Wed, 02 Jul 2025 05:55:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:93a7:d85e:d088:8154])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2efd5145967sm3792144fac.49.2025.07.02.05.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:55:13 -0700 (PDT)
Date: Wed, 2 Jul 2025 07:55:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/dp: Clean up white space in
 drm_edp_backlight_probe_state()
Message-ID: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This code needs to be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index db7896c7edb8..1c3920297906 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4245,14 +4245,14 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 					    "%s: Failed to read backlight level: %d\n",
 					    aux->name, ret);
 				return ret;
-		}
+			}
 
-		/*
-		 * Incase luminance is set we want to send the value back in nits but since
-		 * DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we need to divide
-		 * by 1000.
-		 */
-		return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
+			/*
+			 * Incase luminance is set we want to send the value back in nits but
+			 * since DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we
+			 * need to divide by 1000.
+			 */
+			return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
 		} else {
 			ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
 						    buf, size);
-- 
2.47.2

