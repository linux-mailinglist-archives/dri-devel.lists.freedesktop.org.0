Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7680BAD2A08
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D45610E442;
	Mon,  9 Jun 2025 22:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j399zvHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE3210E441
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so1798025f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509812; x=1750114612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JPP9VkVYCYtwZNTr/n+Ytie5XMaieXyfIeFmS7/fH8=;
 b=j399zvHMZIy4fvjaD97T/pXfpfNejBBChgpWkV4e8tgAC3/Ae0wVgBSZG7k690Qsq1
 as+WOeHOXOF1v/F7u6EoaQwPqjns69H10T8VYjkBhrnm/fvGabNWG1vIZ7ZI3eisvsE8
 SRcHemK4OY0YKpU1g2UQeI2f1RJ9+ExRXw2T1jBPWw7/mWV4SrFbszkGve1DSKIhzrWQ
 epNPVY7HApsGMpfkemC7LYae02rV4a1rHB+18ZrfNuUFUSxL5X5WlzcPNhimxTIHiguF
 Z2LsY0JMNlaR/OMCsdfQX+/+gRYvwbUkZS5I2ggJEX8UvcAPrebwpGi8K5VHwHFac3NS
 m4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509812; x=1750114612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JPP9VkVYCYtwZNTr/n+Ytie5XMaieXyfIeFmS7/fH8=;
 b=Gi8T7CKm88iTraDVY9Oo+KdaaiIlXe/e3dfKbDVRG+mDSGHLClkhqpfEU6IqC2AOb0
 MI9HGEw5MzaQAjiKi4VeHXTNwVzvCA44xW83a9chw9e1yHJOF43CSPnByriKQVwja64q
 sP0lS9bc6iGs4Mr8+//F4O7Clwie49OQ67/zErKt6nFxZ8+VIcdB0NampITdizz62u4i
 UxN8dq5lPD2hDzAQHHFVB0fVW6mLcWKMmz5VtvPOVA2q7sya34hPDnTTZGKJfqtGnnS6
 f6oi1rZZrJY3jiADS7OlK9X/umB+AeG3LKigt1nnhpyEgBJpbnhu4iaoIwAIYf0pO9Wy
 Bd7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6GyzgFfmtEqa7Gt171/rDie6lBupoD9sg4XbkfJ5quJBpRrc2l7JBa5V/59ZtYL1BfVFPH3iu5os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2CMYD4tZGsup3J6L6N6QMa+2KmZ3ygbp12OTXWS1FgoCWawhs
 GEFJ2EvK1pecC/wpujyVyLW+ZO687ms3uHQeIkdpiXFSRIIBcMLfhjrN
X-Gm-Gg: ASbGncsMxtQpZO8rpuF4iCTCRN9XfnptRYWg9EGD/CC2u3r58RxjGDs9+FTr1tkT9sS
 ZVd0N/dlHWQ7c3q5QqJraBZv/rit6/mnnEHNZXJsDPvkFfNl7TZpqQSP6eR2klJ/dG24Ek4Z4Gz
 yrvBSZz95uKbnS8AmnPY4BukTvIK4S9YTC8DbUTjinUhcQtwrb6eoqewHhOXQDFxkZNosFZwpUz
 6N+R9NRLwHQ4eqTI847mQeCT2p7H20UUFGvuAsu+/5hHwh8Urq2lp86xHLclYV3UVsVKm2PIT0z
 ONV+E3MxqVo4vb7FJ0VuTJm+VSbDH1Lt1pXqi09VPz5p21tan6bVXzAh4dq0+M6WEHmvvZNP05c
 13dmc+WWnD+cSzi5WaUE=
X-Google-Smtp-Source: AGHT+IEApn/uKPfPAE0Z6mSCiUxgpurDdVsA+B6RTSy30d4Q/p30De7VgoNSDWLlynetn4i/Wk2EXQ==
X-Received: by 2002:a05:6000:2384:b0:3a4:f2aa:2e32 with SMTP id
 ffacd0b85a97d-3a531ce191emr10590244f8f.44.1749509812413; 
 Mon, 09 Jun 2025 15:56:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:51 -0700 (PDT)
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
Subject: [PATCH v7 6/9] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Date: Mon,  9 Jun 2025 23:56:27 +0100
Message-ID: <20250609225630.502888-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
- No changes

v5->v6:
- No changes

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication

v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index d4f2867e0c5f..004911240cef 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -210,8 +210,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -284,6 +285,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -316,9 +318,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -326,6 +328,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -965,7 +968,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

