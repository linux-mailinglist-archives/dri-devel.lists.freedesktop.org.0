Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F23C904BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 23:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C8B10E86E;
	Thu, 27 Nov 2025 22:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cnzZhl3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81DB10E7AA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 16:14:37 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-343ff854297so1283118a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764260077; x=1764864877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OelpnF6/6m3NZuiNGWSozOU3js9WsWkx5++wwJ6A4bM=;
 b=cnzZhl3f5GQFyB1T1PsFkIi+fTzz6fkwXuNlmmD83pBpj8e7cGChBlAj9mn/rMmR+a
 F1kGgoc5tWKnGNC+y5EoKgcOQDUJgJjjpqCJMZ6L+5mckzfTz0l4DLsUuKXf5rJhqxjI
 CKq7HSPA/uN6z1L4oUSWTyjXG5/6F9Ks+XDTuDoVn/ZKgT2019yK6he3c+LdOF0ToHqC
 ffH3NLN/79yXGswL0OcFMEZUXDUX9Ax/qAZwI64IkgpQPPh1Tob+1jZ7ii8OMWNMvTEl
 cBF63A0UPijyBp3Y2ypbdEp9/OdxPgEpYKEMiYvto7lWZrpJ8aZc+VU0yI8k1NYLjuP2
 QZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764260077; x=1764864877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OelpnF6/6m3NZuiNGWSozOU3js9WsWkx5++wwJ6A4bM=;
 b=M/N4UBe6p4Nnv3bcLPQrd/LCA9gwqqNoKsiMjhhq7vDVzMmF7LhBafy0qSviyfZ+Jy
 oxy1/Sh/lzlRAEDV+0Az2Qw0AwIa90iJY6aRFZcn10cxcIN8iqlLCQ9V3wYJUUGCClbB
 FCUGroltkpjf9L5YF+GUl+M4/MFwcXrh0JWs1IVVRfOy7ZU3NkwETtoj0WrBSqHDxQng
 lqU9f9Z3G19r/0dFf5eGqv6xVOccPnlaJqM83mHyKUtbIULW0pV9HW2CF7DEDmTqYxsl
 +p3rOG33gPhI/BExsX/4klL4qRYLB4oFD8TCeM8PTkOfqzp0DBKwjQxvKzmxzG6peTud
 GK5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwh3PS68JDWSXE/D3L13Lb00tHmn8I6zPDFvvoyRC06wFgV9rdzjczl3ZksVIYY+PoNBOZax7tdN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnOBPKL7dpiW2vWvTUEeHixdob7WKck/SpKgfrZ7lxGR51VKNP
 BRo7CC+jThPpoJvXMGRtobcqtAasQ+fUKmXqmaOhoHVL6b4rWg/Ty1jF
X-Gm-Gg: ASbGncsstji+38jL9ZZdvUS9G4v7moLz1U8k4Wxx9kqrqLjfYulxhLlsMXOqxgobcOM
 c9nW1MS+HqCfCct8vi0VHI1slUG6Q95xJogzECVyvdQ1KP3a495p7o2Hje0Q84uUh0eXs/tEdfq
 prF5oo8h1hNP+83MUMUPMAJii00lV83ycyj78gj9L+6XEmqhCqgHuKAq9UNQTOh2t/KPDXRvS7I
 rP/1IrcBt641kQQJ6JrfRz9JoUrPhXF7ijDZF28w1txU9SXHUfh9GVCXx40tALRedMVV5mkVu7S
 2OgmODvtEtQ2A3tgzSr8Lu5tb+Ahn6fAmCIWJjs1l6ceJUgWH04wA35TDsmLG2KUmpRYMbE0g20
 FGWfCuw352p0tGKQigEdDz5IkVePJcdCTxA9M1v1H60ot2ml5gs3C5m1JmP94uc6VLz7WM+hHQh
 S4wVHF6TLseqmTJV1Q/hUotbyn/9+zNxD2bSgd4aVeYqs=
X-Google-Smtp-Source: AGHT+IGsHMSsa9YYu1+Xj4wZvo0IRPv2BNsi7Z1fmIKI0IC6FpsgAkLZzLRs9YLWAa44UmaSoqDozA==
X-Received: by 2002:a17:90b:17c2:b0:330:a454:c31a with SMTP id
 98e67ed59e1d1-34733f40ebfmr21016635a91.32.1764260077100; 
 Thu, 27 Nov 2025 08:14:37 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:3b80:1fdf:dd16:5535:2781])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b1cbdc0sm2293025a91.2.2025.11.27.08.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 08:14:36 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Avinal Kumar <avinal.xlvii@gmail.com>
Subject: [PATCH] drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi
 wrapped functions
Date: Thu, 27 Nov 2025 21:38:29 +0530
Message-ID: <20251127161337.396531-1-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Nov 2025 22:28:39 +0000
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
Here is the todo list for reference: https://www.kernel.org/doc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-dsi-functions

This is my first patch in Linux Kernel :)

 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 3c3308fc55df..03c87c02fb57 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -44,7 +44,12 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
 
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
-- 
2.52.0

