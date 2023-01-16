Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8666D1EF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4850210E506;
	Mon, 16 Jan 2023 22:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6230010E505
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 22:49:49 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id u8so14605488ilq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MGJUK5g8dDeQ+HJR3sGsE5BNHrCIL6SPSjE4dQtW9Y=;
 b=gc6M8ZC6ahhun4+JlZQIhukal+fUx7cqOHh0olLM5NsLfRnjG3OEieJb9B1lyjJgWK
 GVq4npMAs1Q8wo0t4E5HepqEAkpUC3Oe733fdoLudI11lOmkqduiiS0yE/HQFbJVKR+x
 uRATcfQUHSOmRxl8xd03nTLS+R8zp94Jdm360KGjn7c6nf6AUHWk4u/hdsJrnyJv4AFz
 gWsnuzWbIQh6+UwZi6fYtP+QgCftmsM+vIUEUsnzXnJ6+skuPsL0FVnxteXN8xu5JXQk
 t6ilXM4JSOOUZXqRDrs5lzrhNkOIlEoVuOI3Oo9ZX0pId8uYYrX3xcCuVTRMk656cIXw
 XXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/MGJUK5g8dDeQ+HJR3sGsE5BNHrCIL6SPSjE4dQtW9Y=;
 b=aaW1w2gH6uq8b9Ay9mR2NUnb9HFLtp8bF6Tn6992uHYRmEfKu5yRQZcVRcv5kmlLP6
 fPqbQLRFZVByRGUlQKwlt2ycBLC2i3pSq5JqT3jqfxD4Uw/39yxvixfQNaSSGoSEeA2F
 4NxS/Tewa7l+Nzuuway98z9QzTfHSuL1L6tcBpx8JEttJFFsEmJ08ih/oaPt5erzM9mb
 y/lpO+fA40NfgJHq9L9SHGqaozoxZNy+dhEJmukMGVFtTBZK/QyvehfUsd8fNiYHpvkF
 6ieuyP6BPH5UElIR0FuNaZygRvB+KH0iM/2YHfVc7IDxf09cJqkHbQH/klKeQY4k4mu6
 wtLQ==
X-Gm-Message-State: AFqh2kr0S9rndwZdFBF5vU5SZ0Z3FMvGSFK+K3J/+lVl8s1Dz7RccI/i
 xyCATLKqpIfd57wbmIEYQrw=
X-Google-Smtp-Source: AMrXdXs8oxmkQDWUm07RaWOjawBeUQxY6M5hpGYnuVElzAKBh0KZcn3FylL48c1AaIFjECdf9VkbJg==
X-Received: by 2002:a05:6e02:be5:b0:30f:1cc:d14b with SMTP id
 d5-20020a056e020be500b0030f01ccd14bmr1031528ilu.0.1673909388527; 
 Mon, 16 Jan 2023 14:49:48 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6be])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a92c506000000b00300d3c0e33dsm8860747ilg.4.2023.01.16.14.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:49:48 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 3/3] drm/panel: vtdr6130: Use 16-bit brightness function
Date: Mon, 16 Jan 2023 17:49:09 -0500
Message-Id: <20230116224909.23884-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116224909.23884-1-mailingradian@gmail.com>
References: <20230116224909.23884-1-mailingradian@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel communicates brightness in big endian. This is not a quirk of
the panels themselves, but rather, a part of the MIPI standard. Use the
new mipi_dsi_dcs_set_display_brightness_large() function that properly
handles 16-bit brightness instead of bypassing the brightness functions
entirely.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index f9a6abc1e121..1092075b31a5 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -243,12 +243,9 @@ static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	u16 brightness = backlight_get_brightness(bl);
-	/* Panel needs big-endian order of brightness value */
-	u8 payload[2] = { brightness >> 8, brightness & 0xff };
 	int ret;
 
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
-				 payload, sizeof(payload));
+	mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.0

