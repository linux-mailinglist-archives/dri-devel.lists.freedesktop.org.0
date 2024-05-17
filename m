Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E28C8DC4
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD9610E12E;
	Fri, 17 May 2024 21:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="D2QwmvNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A810E036
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:40 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1ee12baa01cso24315315ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981860; x=1716586660;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6V1DTOaoA4qH0IIompQM1ktLyB9pQcF5OQ8P3nV8rs=;
 b=D2QwmvNnnehNJgFZRP5qkPdab4wmose19Hp22sryIiC7+pnadETpvPfOURQ5lxMxkG
 TuIifn53PdXLWk4zZ5XWgnSDqQaOp9Sl5laOq6wQhQ9sDg5+fVqtYOtItV2FUwQTR9QO
 F9CUlK5qu6T3J4zpFSpeEpUUtlBS7sGrLFPm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981860; x=1716586660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6V1DTOaoA4qH0IIompQM1ktLyB9pQcF5OQ8P3nV8rs=;
 b=UnjWX230e28vxoAqxesFpIBEHjLG7Nw8/8S1KmaFTh9b32PgFRVQesG7GbeaNryG7u
 93BZUiLPs8mYtVnfLgGbJ3GVJWlsL37yo8DQtgmdV6Tk/O2mipv6K084vWqcxZ04gHOK
 Q68UT9QDSy6HhDpn2qrbFhdt3Sw2Xgb2QNJJrYRULC06YWnUlGOEIyhk/1pv4/3jZFZm
 RYsD6Jx1JThvPAqVtqT2L8/6917UKdhpP/Ym91kjwbxzY0KOzqk6AdWo/1/KWpFsooBs
 5UC1z96RB3dkCgNnDxxenz1DwB3DgHr5V3G4RE7uW5EjMH8gvitJChAQqTpK452pAnNA
 FN6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw879Hcc+9ZWhvow9N5/sU5X3YoMigyCi59FdpcKwFxpB6ryxw4gXc+hHDy70hY0QK8nlrLa7ylAWkQaC9egYj7hAVjza8iSt7ch1CYWVk
X-Gm-Message-State: AOJu0YzHalrq31qPvI0gVx12hHC0l1N0avqdRjjXZDwKYpSjLQvli76v
 R2MhXafnzrw8H4NjBnxLx+LWAalGYOvZeGOdAk8pO77hn/YjMX8aBSIk8wM9eQ==
X-Google-Smtp-Source: AGHT+IHm5RdVFjZ89P0T1AzZMKaNsfexwf2EZJjaYa/Kewivy7mYMercZQ/c+BtdjQ/LoSpevWMT2w==
X-Received: by 2002:a05:6a00:3996:b0:6ec:ceb4:49b8 with SMTP id
 d2e1a72fcca58-6f4e01ba036mr25987075b3a.0.1715981860345; 
 Fri, 17 May 2024 14:37:40 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:39 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Shuijing Li <shuijing.li@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xinlei Lee <xinlei.lee@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] drm/panel: boe-tv101wum-nl6: Check for errors on the NOP
 in prepare()
Date: Fri, 17 May 2024 14:36:38 -0700
Message-ID: <20240517143643.3.Ibffbaa5b4999ac0e55f43bf353144433b099d727@changeid>
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
checking it in boe_panel_prepare(). Add a check. This is highly
unlikely to matter in practice. If the NOP failed then likely later
MIPI commands would fail too.

Found by code inspection.

Fixes: 812562b8d881 ("drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 028625d2d37d..f7beace455c3 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1456,7 +1456,11 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	usleep_range(10000, 11000);
 
 	if (boe->desc->lp11_before_reset) {
-		mipi_dsi_dcs_nop(boe->dsi);
+		ret = mipi_dsi_dcs_nop(boe->dsi);
+		if (ret < 0) {
+			dev_err(&boe->dsi->dev, "Failed to send NOP: %d\n", ret);
+			goto poweroff;
+		}
 		usleep_range(1000, 2000);
 	}
 	gpiod_set_value(boe->enable_gpio, 1);
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

