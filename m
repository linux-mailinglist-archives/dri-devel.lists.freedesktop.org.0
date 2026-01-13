Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AFBD178D3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFAE10E489;
	Tue, 13 Jan 2026 09:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGRUoWb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F0110E489
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:15:22 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-81f3fba4a11so2500628b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768295722; x=1768900522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBICZ8YwEG0B49att9rs+qAvonW13wXo7ZtxBvLrLF0=;
 b=PGRUoWb27Ja1ZKPS0yCStB6sA0nTZIyYVMsCH9tXb0GVhC0fN3Oqem0kYo7NhpXPKu
 IHWEwTCSTUZe8uU27G9NEOBbk7QtiwA8KEb7egglJf+CvaT/f7VLdz9pDSRrOVJXg1PH
 XZsj2G2k/SmGaaTKU64rFIE6fU+hpS8b8eKbivmFRUpg6pjOMBcJZAbARzGR+wF6LEeb
 NJ/onFa7WhrO0hy+LFYRThOTw7O6oSQYl281kKkAnVR6L4pqDjZPNksmBPplWX4y1bNQ
 EOMkm/55C0C9jkMgC5Tdb79SMvC1Cj+dLw1MEQe0nrBCg6EXTA7uj2bTAUi7AiWh0WGf
 i+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295722; x=1768900522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CBICZ8YwEG0B49att9rs+qAvonW13wXo7ZtxBvLrLF0=;
 b=BuJaAh/m25c/ex5EB/GwUcspZMiFXwxcExgcq9AVhKQy54tQh1eF3jjJK23v0mM5XU
 Huc7MvhkQjgClNQHS6MpgvxNqO6bSkcdwvxKL00wy7XUldh/17LTg7Z3x0ygMle5Tp7L
 DWHrt8NxRt88f8+rAPoWXUL2dxSSNCZUuTcybfLBppeigIVEPby9WrIcr6mOWLS4tZuM
 54CBjnlpTs3D7GEtaaGmZwjV3j/L3xtYNcBmG/8+owoJKxYu6ZN8ISKOSxsM/pPRJ6wL
 BoTKBdzsQwwqpOdd7a1J0l3sKNQXyiN9yzJu8E0l+sc2Bh++wFXsf7JusF3fNyoEePEs
 7fKQ==
X-Gm-Message-State: AOJu0YwUxfyg7cwBUDy/qHX6FC+rVsuuwswY9w5/GygsIfAxtndk5CD1
 9C2Uk5kzHYK9ureXTRzBUdIzDwKNuK9FCq9aD9z4TPQFRbaGAUF98HfPz+QQBjW4
X-Gm-Gg: AY/fxX4E3OVIXqgfLDcnIBzczVfe4co1JydyuUf+LCToClurJ88Pyj6V0w3nRQdW/qR
 kMDr5muUoB9cbbH96sECYzlhec2VdP2/Ii4LFf+AD7lfZCkjN30Hiphk01NlbPxRWh50+wL4XUU
 ID/2t4vFcsUo/6sGzATsROZfLuuUMgM/8/4dACDxhvbxZ9y4e3DQ95dLWEEiknpniZZ7KSYAdWM
 /WAQlaW9R1XUvT4jxz33KfD90j98mamgPBCW1xNscIjHkec+sn3JL3CBYXc/HCQ6V/F07GEai+y
 dU8PuK1WCEEJF+Hp4mADNEUBn1/Fi7WwG7KsVmB2D1AwOwRuBThwgBFod2AIQsEaSxu//N0Cw6n
 FWKeF/r15vgiD2IxnIgH9XuJf775cyjVLfmaGTOgXBvOWX5xxGqGk49/oDFZ00ZbEOric1YVyq7
 sB/oeL03KJZw0vXyboud+cMi3I/wcsaL9TEzxd+bmb/FY=
X-Google-Smtp-Source: AGHT+IE7TdFiMxh/aLtniK9nM7l8mguyxtqyvswEX3nVfaaO8igIzHsHZ+QToJPCQrNaqVmSDk2lzw==
X-Received: by 2002:a05:6a00:1f14:b0:81f:4ce8:d642 with SMTP id
 d2e1a72fcca58-81f4ce8f716mr5750940b3a.64.1768295721642; 
 Tue, 13 Jan 2026 01:15:21 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:df08:2b25:2f22:316a:eb93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819baa1936dsm19832778b3a.12.2026.01.13.01.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:15:20 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH v3 2/2] drm/panel: panasonic-vvx10f034n00: transition to
 mipi_dsi wrapped functions
Date: Tue, 13 Jan 2026 14:44:40 +0530
Message-ID: <20260113091440.43735-3-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113091440.43735-1-avinal.xlvii@gmail.com>
References: <20260113091440.43735-1-avinal.xlvii@gmail.com>
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

Changes the panasonic-vvx10f034n00 panel to multi
style functions for improved error handling.

Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
---
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 3c3308fc55df..73c5827a15a4 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -44,14 +44,24 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
 
 static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
 {
-	return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = wuxga_nt->dsi
+	};
+
+	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int wuxga_nt_panel_disable(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
 
-	return mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = wuxga_nt->dsi
+	};
+
+	mipi_dsi_shutdown_peripheral_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int wuxga_nt_panel_unprepare(struct drm_panel *panel)
-- 
2.52.0

