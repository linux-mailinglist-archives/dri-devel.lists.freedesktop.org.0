Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C2A81656
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D0F10E743;
	Tue,  8 Apr 2025 20:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bRJUttKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8FB10E740
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso30308f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142982; x=1744747782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5UKgKQvaXs6YrCZVC7gLgiEaU1R+CcaX0kl6BJO5kk=;
 b=bRJUttKGKXfLu0NUvGGxee3Vd8PBwDhobZse7pW36piT9/Jgzx+fNeWMD6p6/wzJ6M
 ZRI6axyPv2Cw5lG0+jooj0v0RusBRciyqQ+0P2btQJgBSAkDC9v8DYKKC/+2D22GhOfR
 c6KF/D9E46EV7WIwAfrR7S1mNS8ko0WligURxTGH64LgFbJ6O2h/Sd29dhItQ7318W/X
 4NenVBUy//acZdVe0C/j+6xBN/xTC99qtGMA4OjnfsOyKvu6wd/A2uBfllTkU1vsXZTj
 iD5Bvqxu3P51PDo635EMYu7mXJq3l9AEw7cx0P+R4V1/9rczJ72kKbXjy9ixdsc27Mvt
 2mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142982; x=1744747782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5UKgKQvaXs6YrCZVC7gLgiEaU1R+CcaX0kl6BJO5kk=;
 b=JtoBDqJSZUFjEpGEh28yi/w+6cVPobCe3W/0oPd5beTLSgICDwWnyVu+rdneeAhdiY
 JhrKP8SE0IiLy1dVl6e7QD4kiL5BycFwCuJS7R7FdPPgN4bmCp8DmvEeqGFp6z3SuiBW
 /TaRTlP66YkGjnroEOzVvk6ejlWLc71yQf1q+ML46SDdAy5dPRGJAKhIKwBCe5v0keHA
 fZtRhKkLofi4/hbSFvKWeoART6I2zAGQc//1XVNVEZstZGRSf6DApXkDu1psNnQFs6Qe
 AdRESPEIdNw6PP6vW5JXOvcmOKikrIl4YBwx7irbeK5ECJBTxkaK6oUduBfF1t1BriLV
 s7Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDrFR01xMVKiyZ8mpsgBSf/c2s2PxreNqlD5ZUTmIAgDz/pSbiZoz5Lwuhq1p0DDpkEJLu5gaNjrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjRhrAk/XQkMGf0WyPJj9sJxK4x3GCqTvirXGy499OnfwxdZln
 WOhfztSCYKH81BgHKKXEn1uKE1gWyHkfcyzLFDrOcJ9//aARBv8w
X-Gm-Gg: ASbGncvMyXWVYeoaZXM+TZuKGO0QKYQtioJQWyidkjsPOULbEbRXHHwau2+J8UDHcoX
 8QXReXXTmOIjEqxBpT/VNETSgOxDAD39rM0ZlRN3KFlf8xErVmAkpN/jZ2d224zwsvnrN/IQBCb
 pGhN8GcfacyV+R6dcwxjfUIwRIZT/LUp+cBmnfx/VXQeeNYmEolrGfZRs9DqEz3mW2SkMGOxPuS
 jvbMgRsj0503c9wW8EcValf6/oAZkE0w5H47uCEXyC5o9lCVKMA8BTjLA66Ldi5J/OxmyZMc2TH
 LsxMNCa7HBTfT3yHp2mQocwsEPkpuuGbhAigvpuUgr9JX4vvt7J0tvVkTZ+dE6/85nVC
X-Google-Smtp-Source: AGHT+IG7VxLPR9y5rEEZM8VlKr+o3RYut3+7teErCX9saj503WzjEEkkStiitVXuJWUJ2hjvjmD4+g==
X-Received: by 2002:a5d:6da2:0:b0:39c:1258:d12c with SMTP id
 ffacd0b85a97d-39d82110bb9mr3987088f8f.28.1744142981592; 
 Tue, 08 Apr 2025 13:09:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:40 -0700 (PDT)
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
Subject: [PATCH v2 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init()
 callback for RZ/V2H(P)
Date: Tue,  8 Apr 2025 21:09:09 +0100
Message-ID: <20250408200916.93793-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c8be7428c4d7..85f23a41911e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -35,6 +35,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -318,6 +319,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0

