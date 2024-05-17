Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57B8C8CDB
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 21:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1010EF5B;
	Fri, 17 May 2024 19:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WWIWWlMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E368E10EF5B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 19:39:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-34d7b0dac54so322350f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715974779; x=1716579579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUzOmIQGxK6ydFQshiBfQGlmu9MnDcgDBCtLK/DC/PU=;
 b=WWIWWlMInbChpl9tvAyNJeTPCRtEK3TUnnN1zWM4RAz/A8kXOeZNQjIbN6MPCiX2VP
 +06lPOhnTJFYNSbmBDnLrBKSPdVihs4+Ye32EVMAxF6FxOlZUW8xSniWWZbQVGM0zveM
 qneVq2WbqbjKDsOB9AdihYOi4OUCF5kfhq1tBwXlxY2phjfsJutAzIgu8GKtBpSWcZao
 5yEktDy+h/4+JYkCkyjOp0mbBP7YX5kLAQ+I06UTBF81F8FKDTHqTc2O0jEeLHMBXG3e
 u+8I7cZnTqb5mF9lgFF8TWPbP7tlc3bISnGoa8T4Smy3s+qR80J2lWuHxeMbxGAcViNn
 dUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715974779; x=1716579579;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WUzOmIQGxK6ydFQshiBfQGlmu9MnDcgDBCtLK/DC/PU=;
 b=Ed5bOlXLcufSxjhbeBo9GtKrCE4oWYzUxuG+SsteLcfyaFnEjpNoROHUyK6/br1qcK
 EnIZN7YraBxjhLtqrog4sRcOgwwmp09q1beAnou+wcNBF9yLQ9d0RkLyLF1m/HZBXv3/
 zldMvVXZ7Yee8kywyb20+Pu9XNX5afi9dd2V37eqaI4Vc4ZTnSy5v8KcB0VdbaOG9gbw
 jIlVqRaJ2IfE/SXbH6XwGer9kTvCp54JOYNmb2g+DCzwIiCAwJ2sncDLTQjW5yFNzUwW
 BCychE22PQXxTheLiDkRF8vQkVNTFEbWdSfb0tvazdeYYiyojSDCVD6oXOpoCs6Yi6bT
 8zhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn6T5fJkPHIqqtkkQj9IdrGp12AD00V8wdpL4Yr6b81LZrlZySDPkDa394+4kS60lpqrzmyJGTXID2/yVFFyocBO4G8yoyLDTCuCjF1BMF
X-Gm-Message-State: AOJu0YxK9dC6OgkiXHqPdd8HZ5hPF1O0OH9yCskRIH6Lap0Tk3eCiwzt
 i+9Alr5U6T7a9nuIB4FNL2Vz5yJVlNl1CO0iKJ9qeYmbAJGwyEgftVVRx9mqz7c=
X-Google-Smtp-Source: AGHT+IFhShctHyp8EaDT1M5vh90xyK1Rl4BoMfuMGmFlgl4IyMT0z2z4s9u4Lc/iZXmU6IVZDQbEcw==
X-Received: by 2002:adf:f652:0:b0:34d:7bbb:8d73 with SMTP id
 ffacd0b85a97d-354b8deacd1mr80637f8f.2.1715974778795; 
 Fri, 17 May 2024 12:39:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a7748sm22436970f8f.49.2024.05.17.12.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 12:39:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
Subject: Re: [PATCH v2 0/7] drm/mipi-dsi: simplify MIPI DSI init/cleanup
 even more
Message-Id: <171597477767.956878.712053114259327285.b4-ty@linaro.org>
Date: Fri, 17 May 2024 21:39:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

Hi,

On Sun, 12 May 2024 02:00:17 +0300, Dmitry Baryshkov wrote:
> Follow the example of mipi_dsi_generic_write_multi(),
> mipi_dsi_dcs_write_buffer_multi(), mipi_dsi_generic_write_seq_multi()
> and mipi_dsi_dcs_write_seq_multi(). Define _multi variants for several
> other common MIPI DSI functions and use these functions in the panel
> code.
> 
> This series also includes a fix for the LG SW43408. If the proposed
> approach is declined, the fix will be submitted separately.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] drm/panel: lg-sw43408: add missing error handling
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/51f9183e4af8c7f00e81180cbb9ee4a98a0f0aa1
[2/7] drm/mipi-dsi: wrap more functions for streamline handling
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f79d6d28d8fe77b14beeaebe5393d9f294f8d09d
[3/7] drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91329f921283b995ac125a0c6e61be0c1399f66f
[4/7] drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/510ba36e86eeb3ca89326dd51da32806e1ede693
[5/7] drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0f43988fb9c1c0a0c2f5ccf2d1bdb914f6e4e79b
[6/7] drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/67ba7a82d99a8a8b4bcc1b8124b5640c63dd51bf
[7/7] drm/panel: lg-sw43408: use new streamlined MIPI DSI API
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/85cb9d603953d77de5cb311d229a79c439ff6bfb

-- 
Neil

