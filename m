Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0365CA27D5
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4BE10E84D;
	Thu,  4 Dec 2025 06:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k5/FerjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017E10E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:17:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so90635166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764829034; x=1765433834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
 b=k5/FerjTcAZ0UvcJ1YnsAS5alVPxgcuEL7GvDmQfCtgJCAuqkb9fKsNGFTnYtDHYDw
 9GUUQcEWgsM2QFQvlpdYarViZeiM3zrwKLa2hkd64TdahrDMKahJBoNJ1P9F9qM4Lvxg
 zIZjUPmcUNhA+0AKHg/PaggOne4rEy7+gTEi6e13cRbQbCZ4VogxHEtbDdiwiJKQd3YP
 LJ2TS+v83aWTg9UpYdPe+5shM0t+nxJpTQj6+9wdfya82eFO6rif1nrgZRmGSgQo9Ovt
 Ilb6s1zxKNi3Tmc4N9+oRhljGt15piB80r1CsVQvPoxH+f7jRYzlrnJ/9QOj34dm6DL7
 qnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764829034; x=1765433834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
 b=HdRt+0M/uEE62/WKxA8OoROV1Xj30tNq8RndzCBR5RIHCxds+JBg1zPzedrxdzBl4d
 hobfRsoKuhyIhITkWdtTUM2xRD0VBdGG2J+4sUbVHb6RlWWJ5oQeZmahvLYG6nOAsg10
 6l2JB5JdaXtInWpGI0xiXty/mahPgb4BuNn1RFh+mU6mcX4+nYzWEbX/HQY6+wHXXtGU
 MbJ9+EZ76BZz2APp+oMSAdLjjHzsEP6BYcoGw1nAEEhEHAncuPM+086/1bZWbKrd+ezA
 qtZJD2BlzHnrCP6xsqesfbFN6w8jo4f2drAQ8fcBhjma1P2jI9ENJMi66hryUrrGwcU1
 Sqgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQJmj7X06ZJzHE2ZW9de42VquzPvv+8kT5PgcAtvh+1itCz7BhDxv1sE0yIEyoMgno1uvAqBYb7fU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzpf15JogLeFx/u6XlAZxGBgJ1dPFcFG+dyF2bPJjTleafided
 G4uoOJ4XG1lYqY9ln10yUtIdk/Jf20EYJQxTUQ9dNMTHg6rDBfCaAKbq
X-Gm-Gg: ASbGncuwfdQjN2ipV3/VGQfUivV+dTaZuISKBSmI7Kv6+UrfjZZFX8zXVo+/pnibd3k
 ZdMPvHO+B0lGH4i45l8r+VHRdvxpsqZubQc1+W5EfeNsYo6vc//669Ln1fGrkVpMWHoP574KqBI
 FvDwXRgx33ynHr5J11MUhTbo2QeA4cQ9noDDDzzWai4ERjEsWgFzM8ClnkrQORNXYEvD7G6BnNt
 xMccGByyWqkTnVv0VNlDClNM5u45i1TsIWjum9LAc8MatKhxT0lotALpoHVAVjR7BD5dEdALMO0
 3sxz4ZV4Nd9WJcdgsMpyeRfVnhiFc/GGe0NphSIGQGF78q0jFq4ZxjOLR61kbuv/7eC/ExBsIf5
 uOKPBgvJgG0FQuwFdKPxg774PKBahuEOvwMq2SG6R+drsWPanfVU8d1BbDwpNcWwbFmyLtbwaC5
 w=
X-Google-Smtp-Source: AGHT+IG7eLUO/lnnllbPhbV5xWFj7aQXNW+5SwKDRXXpuxxlU1Kc0BYcXWXlKX7dj/KXGoOhGhU6rw==
X-Received: by 2002:a17:907:1b05:b0:b72:d9f1:75e5 with SMTP id
 a640c23a62f3a-b79dbe8d527mr523744066b.20.1764829033747; 
 Wed, 03 Dec 2025 22:17:13 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:17:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function to
 the top of encoder enable
Date: Thu,  4 Dec 2025 08:17:01 +0200
Message-ID: <20251204061703.5579-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
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

The tegra_dsi_prepare function performs hardware setup and should be
called before any register readings or there will be a risk of device
hangup on register access. To avoid this situation, tegra_dsi_prepare must
be called at the beginning of tegra_dsi_encoder_enable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 278bf2c85524..8e80c7efe8b4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	err = tegra_dsi_prepare(dsi);
+	if (err < 0) {
+		dev_err(dsi->dev, "failed to prepare: %d\n", err);
+		return;
+	}
+
 	/* If the bootloader enabled DSI it needs to be disabled
 	 * in order for the panel initialization commands to be
 	 * properly sent.
@@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (value & DSI_POWER_CONTROL_ENABLE)
 		tegra_dsi_disable(dsi);
 
-	err = tegra_dsi_prepare(dsi);
-	if (err < 0) {
-		dev_err(dsi->dev, "failed to prepare: %d\n", err);
-		return;
-	}
-
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.48.1

