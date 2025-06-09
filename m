Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B88AD2A05
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B6F10E43A;
	Mon,  9 Jun 2025 22:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d1vcmpZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9685210E23B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-453066fad06so14531525e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509808; x=1750114608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZQW/XKkta3bmAbPorVL6FUoDrPjZvxMvODfSXJnGtg=;
 b=d1vcmpZGjJO9jkQ8wfNiad3w5AvEthDA3X/x7xH0F7dcb5PmreKAamfp8GCWDOheT/
 URO5fFsjeDtDXmHWnpAKsVsRL5NDHUu3GGUAejY1Nx2WP/0OK6/DGZTimICt/STYwIM4
 kVJgGcowEk4qgaq8GN+37ac6cqzlYxlzs4qebGcElKCQBHn7g1Uq2SAzAjXyNqFBJ7yk
 /25zuq/vNQatCupuNp8UWI1kCunkT3BYsTkIwWcEIVVpZ8Vxs4H8guvmx1smCoIUHACD
 XtYBJVfLjKiiQEXbflG+tEzUMHOvcm3JidWCuunwKzcRvZdLMpbudw0xJoY9yBCKjHyh
 k5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509808; x=1750114608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZQW/XKkta3bmAbPorVL6FUoDrPjZvxMvODfSXJnGtg=;
 b=wR7/BUqFnv5A+3tnSdGiNpNzjYbcP2MGNEDkAgvlewoQc8BzBD8Ua+9cOUDGGjunSu
 OY5kAPo7E5GLYIdTq+CcObImcFzEEc31C39IqSv6dnDCB1rMbfqh9PIyaaZHuUf72gZo
 ICYFD1nPmK8RxBchr599gMQC7EuyQDC5ch/m40W0khOYhwVDeR6xZzd808AualeORcdT
 NX+B0HcUwmhRzJ4dzjn+w2TV2QjmWALobHhZ95+MqRKwpxYMqphd0s2Ec8PUvKhYkrQA
 HKCI6aAKDRaWM5QS8ykcBD/pY/CJwVg3unZMhPDiQqlW4ewTMh9dTVs1fkIL1AmC8be6
 hZTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa6w8WtKvytiL0Sk0xQMyI4WRgABz8OJbFBBsyywPbjssvZBxuEZG8Ru9spMfuPchw1XOZtjCYIR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOpyxxlwyJHD6TML9aevVRVmXHWi+C1bwlXH5XF58/plCbgl0N
 My4ZTbXb7KECCuYm28seusDKrSH8RZS4/ZY1FlVyyn3xjxg1b++C/fIz
X-Gm-Gg: ASbGncsV1NIgwCXSgUhn+dqZG7jfjXJAzVzqVOegIKRiNzKahne3KK9PyX4/gq5LNhU
 Ms7YyzMJGcBXE4b5PTgD9etFdQWjH2LkKhgjV+6jC+tfcnX9LnhAYAc9WkSf1xp8oiYvFPbLHpI
 CR0F0zqdLtuDGCuTTQn+czoUSIIVAjPSdZQ/15TGKv25upP/EFgj15E8LTlefXWlRm7/nZVFrjC
 lOnUq3u9JBuff3FoWZBIKzJgVB6NfhAJAaU/xoctf4Ixq077lSVfjwfAeKQhxWNi46nGVO9Ech7
 vwrUxF9q/cDc5wygw631Bx95gDdSGAu4ZlpPY2c0V1D+FPFSyotECsEY23MVw5CwWB+SlEKf/b3
 5dW6Jl/6XVboVT2DcHgk=
X-Google-Smtp-Source: AGHT+IE5rBdcJzn29HX+ahTiwa9/e7buXyaINtikVbd58weuZQI2RLRHqqzyG8t/4l+Pwt5XB0hIwg==
X-Received: by 2002:a05:6000:40d9:b0:3a4:ed10:c14 with SMTP id
 ffacd0b85a97d-3a53189b44amr11940449f8f.14.1749509807998; 
 Mon, 09 Jun 2025 15:56:47 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 2/9] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Date: Mon,  9 Jun 2025 23:56:23 +0100
Message-ID: <20250609225630.502888-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = mode->clock * bpp / dsi->lanes;

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Updated commit message
- Dropped parentheses around the calculation
- Added reviewed tag from Laurent

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 70f36258db63..7fa5bb2a62b6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -288,10 +288,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = mode->clock * bpp / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0

