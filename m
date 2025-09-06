Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E33B46DAC
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5904E10E373;
	Sat,  6 Sep 2025 13:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JFE/otUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57E210E373
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:17:18 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-560880bb751so3116668e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757164637; x=1757769437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
 b=JFE/otUK9sWvMHcPC0pDfm2QTkfvgzmQ0ZRlzWE6NG4LnjwXl79WY+Nu5xJbuhabv4
 wl/fA1nD5dKOUNJFqSxxdF7o4HbvDS+BLaGTRSw2ied4prrYA+mCuELhbvRuiklNRBJQ
 VlNPKPa7xRpnrc4lEjIOx1jlUWdfE3xMDNpTSLH7V2ag+QVHMWFlbbUEyLW+BT1ab1Rr
 bt/6dBQy48WuTTSWZvwlVRq4AKXnI8JIY/CV+ETk9GJxKeF1QerPYYFTiGaxWa0inXO2
 bE+rnKvj2gSA6QuMFjtHLXsq+ST6/YfUNUnee9b1Q2FiKfqH6rAaBlKcHzdYRD0g7Fb4
 bLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757164637; x=1757769437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
 b=aeLDWQvwd1/8gUWD+B1aEkprF1LGrpxMr+oKKqrkyFrzwhkmGdpWJ6Jb+tojeAs0CJ
 Bzi0sfAzNE+IxpVmLW9ZDezwzDOSBAIlT5IqVb2fUj1nfrhii0VcnwgE+wVJbWYbouPW
 Cx/QeQKzrD3w4bMG4vUyqS2fNuCzHnPOavBMi62/3lGZkTg20Sy9LZfI/UUjBLkE2FCu
 NnTZ/LdMvEvOh8p42Ge/WtI2cN12DYQxYsy9Pv2kBvpSKrM9503HSkP4X+/GKZtAwybz
 6D4azJXpzi5CM3w2cdaQ/Wntv7VPZ0b3SzsgJeSAr/ltu1UAmqNM9inTXte8e38LThqb
 e19Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ivg1Hr8oNNvEKwztc2hGGgztdlvf6BsyOhT9gVl3dqohbetN6uZd+xKohoB0s6okVfcJY8i75bU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza/yJpWTLUByZRzEC0icbeE8/czfgrOVupU+PvHRF8ff+1R6Nf
 xLaIdqOf0WgDD5fpqdIXRZr2lsE8fjwtXfbYZcX3A0mlWTqwwUj6CCTG
X-Gm-Gg: ASbGncvzEcJpR/NCPmrJgJiiPCQI/3k8YXS157DQfw9mK+6Lw+NERxHIopdKNGz/v50
 cxtpTFsCnJVSOytC8MR4CB4GR2BYnz0fSMb9/fjr3RzWLJ6wmt4+o3SpJcUuNAtPasCj7sUh//t
 LLrW0a7zI3Rdr/rHu2MjpUmZgTrstLSs77LZbwwI+9jPyW/mXoHq7+PhF6N7VBLyVZyeGWRd9OY
 Fs1S16VsbKG6KI4q0OLZR1m/l1e2X4IL0muv2ozBoQPSFx9BtNlPdmwGmexTvScG4nbxANyEAE3
 U4vPUGiHgJkV9jDwOeLix+Mw/hK4syaBBi3xiH0j96tz2aKHkOlFYY25p1bxZnT6O1VA8o2YZZS
 tpaIkLi67g9rtmQ==
X-Google-Smtp-Source: AGHT+IHaBWtUTN4oNt10o28YH9lKMsefOT21qBqek24oDY599RFNNoiDQYJiZcamp5R2jY4qvM95jw==
X-Received: by 2002:a05:6512:6404:b0:55f:44b8:1ed5 with SMTP id
 2adb3069b0e04-56262e1b19emr508168e87.39.1757164636617; 
 Sat, 06 Sep 2025 06:17:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:17:16 -0700 (PDT)
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
Subject: [PATCH v2 2/4] gpu/drm: tegra: dsi: move prepare function at the top
 of encoder enable
Date: Sat,  6 Sep 2025 16:16:53 +0300
Message-ID: <20250906131655.239340-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
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

