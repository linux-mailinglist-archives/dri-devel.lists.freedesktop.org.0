Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D78C8DC5
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16010E0CD;
	Fri, 17 May 2024 21:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bBNzsGz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4509210E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:49 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6f4603237e0so480325b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981869; x=1716586669;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We3AVE4aBq1trFIRy44WPUFQ73H18cpHtn0h/NL3Rck=;
 b=bBNzsGz7m6HFZbRsJInC2YYEsH91U9HR1oTk/fePwJx1YLem1kJLD7/UzyI9nzCGlG
 9SeLIEBf/20z2m5Grv2jvu7QsCc5IdYnKjdP6U/Ly8IbrpbjAAnBGNjm0hg6AJpTf1ZL
 NOX0xDt/1S7s7E/j5kvoZBhKGnubg4F4Kx5xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981869; x=1716586669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=We3AVE4aBq1trFIRy44WPUFQ73H18cpHtn0h/NL3Rck=;
 b=l3j90iO1Tw/JevucRpHOUkhZx7+46a2j/Jnzdxe+FLhJ5NM2fdfvqrlnt5cY3edSuQ
 MCcXaPJSDA2blQ/avtYshlD/4AWPBN7tOX7Z529QIuifqSIIxZBKTpUrFUDrKWOBPTzt
 fMxGYfu/Zfwz5ek1heyz6ychvmriWMd16/1mAOqRwhUqWL8sR1rHTBccjTsencktC13w
 Qn32z/D0nLAZvL9o9Z3CETyDiNdWtfBCxQ0ZjQ0gpo/y2axBKLryZj8+Uw/nDUUJbLeR
 1q/ISBhF0URE/TpSlRQjKFgAd4wCInDCHRJooNYMwAuMeSPc2oNl8E6b5jrSCLBOW6Gh
 0QKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1COOTZ8Abh1eVw44QBBvSR0b8YCCmajpdtUjkZWABpIR30NpLlu4yFpoLYIh2TnBWlwX1y74LJCmMJPZbK53XEiKO0CrLeVGi4xafa9vT
X-Gm-Message-State: AOJu0YyDcqIcKcvTap33UAwS+MtJeK192uMnsEarsa4WOUGlW3IDRzsZ
 pFo8xr/xF9pEwbhnCgFwzS1kTy8a0o48o1O4/xYzH2NkjlH0guaeXV4kgkTIBg==
X-Google-Smtp-Source: AGHT+IGUAJ0geG1QhMmA+VAZ/fh/fy6SVd3BRKxWlKL+B9mtqySrLgU3R4/FIsipR79u5pNyrBi07w==
X-Received: by 2002:a05:6a00:3b05:b0:6f4:463f:af87 with SMTP id
 d2e1a72fcca58-6f69fbe02bfmr353213b3a.10.1715981868854; 
 Fri, 17 May 2024 14:37:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] drm/panel: himax-hx83102: Check for errors on the NOP in
 prepare()
Date: Fri, 17 May 2024 14:36:42 -0700
Message-ID: <20240517143643.7.I3fae28745bf2cacd8dac04d7a06daea50e233f46@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
References: <20240517213712.3135166-1-dianders@chromium.org>
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

The mipi_dsi_dcs_nop() function returns an error but we weren't
checking it in hx83102_prepare(). Add a check. This is highly unlikely
to matter in practice. If the NOP failed then likely later MIPI
commands would fail too.

Found by code inspection.

Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-himax-hx83102.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 4ac7f9d8b232..1ba623e41924 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -547,7 +547,11 @@ static int hx83102_prepare(struct drm_panel *panel)
 
 	usleep_range(10000, 11000);
 
-	mipi_dsi_dcs_nop(ctx->dsi);
+	ret = mipi_dsi_dcs_nop(ctx->dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to send NOP: %d\n", ret);
+		goto poweroff;
+	}
 	usleep_range(1000, 2000);
 
 	gpiod_set_value(ctx->enable_gpio, 1);
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

