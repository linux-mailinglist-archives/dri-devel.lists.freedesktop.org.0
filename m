Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3706A81651
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5310E73C;
	Tue,  8 Apr 2025 20:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGQMs2+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DB510E73C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so4854998f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142975; x=1744747775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5BjfSn9N6RQVpYgp6fQpeVrb0usOOkYUcuyyG0yCbaw=;
 b=lGQMs2+CV2CO0Bnbm8gzqn5Slal7hljN03WVgrENae4c3B6/bvVKcbaRnR9yv21s9+
 WsfHsgGY5in8wy+6niJOVRPrA8wH9xYqYEE2U75n7728UN9h//A24bn8tgfg214fFayI
 5t7xsScbxqPjLGWF0qNOX3i13CILnDI9Av+NdfvBzfFSNLxGYjh68YAohzhI662A3kKN
 0IjJQAuNvpCYT2/Q0HM5Xl1QM4Q1QI0r7t66CloNTtqZjxIwDidnAEU3kA6mhgymSEc8
 ouH0GG1BOuOg/8xXj8g6HxRq9jN6mPz/2ch2C6fU2G9CCnyCWmVDc+Xy5/o5dI3dRvNo
 2C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142975; x=1744747775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5BjfSn9N6RQVpYgp6fQpeVrb0usOOkYUcuyyG0yCbaw=;
 b=iuB3U+FgX7k5JNUZYuiZt4yMTtLOPwd6LDJGUjlNm8IW+gtgGkKWkeYUytpTnsUv6Q
 kuxCtuM0LLuwbld8PaQj/z4eSTpkDjpb0rNYSkm3RLcMyujCDfLt4m/UQ1eFER4Fj8Ro
 x9FIzMqeV7lsRpJlV/plv9PDvzTUEWX98FsHuFl0i75vBCgP+2nx6ClPQy7YejAf4i7N
 BUVLb3MXhJ5pQmf4laf3JozM7tO44WJ7mt+MAbvTN7stw164oyY0TVMwGljLqWRSjrMZ
 b/OZ6HJok+oDUPQeNr6H+wJO2hQAdySitaSTMJi+yCHWvro86LrA4sUUiqQrdP2YSwzi
 irSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURP2WmNiBq9IRV893I9P/jac7z1IofLw/Pw4UxYT2qUsYXSegrGQOnmdnib+FrUU1eDad94aW54N4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7AyqfTZaqMq1gE7b9eNbTbFX/A+gBhEbcpZZKruf+HM/pfn6c
 AwacL/cly6I3yszj8hKLry3MJXLa/wmpPH5pVSR7cG3GNupG2tF3
X-Gm-Gg: ASbGnctSgDi3Tk2adMVFOAdLsovcCdkpwg8LUncTTS3B8zD5VV7yNJQwFD0QtmSXqpt
 0590TIdBgYYAiVaO03lAr8HmvSu/Kq2z+FB1ZS4WXvShibl+Fgqpmlo/OxVjAyHX4IPh2QBkDmF
 NTp9HRzHonv2HPMibM3TEvmngVQtWZsv832lcImjyQnnarB2I2AFROZuwT00uryBQIqZ75PO+Y8
 KTi2xnI1yqTOGMXOqOgFZcuBdg+rfbsSjkav2PLYyfruXwW329lGpXx0/CQTmNyfBiKrLIerqq7
 DHtsYwREZiZDO6YVqgZbAX0ARmEHIoalL6sBCw5Z5bMHDPy0NCQ8K0MCAY9tUllkgvJr
X-Google-Smtp-Source: AGHT+IE/Px9q/kAEOD2BPdHS4hzgkycMZH57pyQsRNhrFngDQ0eqtEF3I1QiINBxonjKOIPeG6qwwQ==
X-Received: by 2002:a05:6000:40da:b0:38f:4acd:975c with SMTP id
 ffacd0b85a97d-39d87aba7b4mr371058f8f.27.1744142974670; 
 Tue, 08 Apr 2025 13:09:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 07/15] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Date: Tue,  8 Apr 2025 21:09:04 +0100
Message-ID: <20250408200916.93793-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ec8baecb9ba5..c5f698cd74f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0

