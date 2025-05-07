Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51BAAECE3
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF67610E8AB;
	Wed,  7 May 2025 20:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hUQkXYPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A2810E8A7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:42 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7304efb4b3bso146096a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649362; x=1747254162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyxyGKOhdeBoSewax9mMg22YYljQWuA4ui8yO4vMooE=;
 b=hUQkXYPVq5fOtDZAASJVzbCScSACQjCK2yOWd9IKRe+Z1xuiSfcV0one5FZs2UluZ5
 LhUxHLVQVOywi2/8kv7vMuYauaBTdelWXwcfrK1J2dfMva1L4iy+O07+QqF9QaJlQf+k
 pgmGCtNtD8G3kfaAG4h+KnUWSEWUaDBeA6HjKS9nulhArHEq1lp8DvHO7urbuwrqWpx7
 gQxHCko2Wwcst0QfwWHTkwaIu2NYi2ceMALefY2EGcnATWP2ASRYeWF7rBk/3lApusWw
 PkE/8x/o/5v6Jk4YCZjrI9/VQ0cI4mN4dBJEQeC7S9mwLJNNAf6VCVMx8rGZJ/DQN42a
 onMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649362; x=1747254162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyxyGKOhdeBoSewax9mMg22YYljQWuA4ui8yO4vMooE=;
 b=fygZtNo8YeTQxFaCbLI3ZkWFRmJNRWwmg3kldfJOKHxzWMjI6Cbpa7s88pDddUEfkK
 kFzLUMiUA0nNwhANC5zUCQtW80NJ+Ou9omHnnRC+rralzJZ51oULCIDuSyOQnnSMMwnM
 D+vU8joShP4lQu35ghlgAOjIkWC1dmvvrlxKFsYJCBmIFgvqKwtQLJpTqf+ANvlDTyGc
 enmSWGlEJsYuJ5/U7RaJximlwrAUWPpoV8YAiV0wD35OVQ0cmodvQual5xzBJVjpLFVq
 lGHzS8IzFeSbiToF5wsIXOY4vH94TVIzmumc4pan9DN4E4C/fSgbkH5GlVOCllmtwpJD
 K5Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDHl1cGASsVL1O1ImUcJov+70WZC4ufROLGjf+qT9UQcPY7eOfbOYDx2RJdHGut8o0ooEfHvvgjFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLePBclgP4+h7dE/MAutD4BbVZ6CJSCKdCuuKRQGazy1wrdR0I
 0JJT/ZS2NYjLY4/theCwScyfOJSFOG4a9Ecfi+ehlRXv6uV5fpVh
X-Gm-Gg: ASbGncsgjIj1RXPw6jUbTHOKq/v7jL/LUrsTk2wd6hCZjA/+MxKJ93fT418aKA0ykcP
 BFuTvLE9f/vR4evA49mXW1gg2hE+Ai9RYAQIvLE+kz0OXm2Z+7c47lWvjjsv7uPS1QAWcmYrmDI
 /RBd8inZFQ78Xf3LmRcwoygtQiZTue0QqN57jPqFjarJCIT6JOzsrBnYHeRJesKz6a5Biz47lto
 /Q4S/0dqkdTw+yCbB81vqCPgWI3ZqaXrm8BRhO3GJSe7EvIbnO+Gu3XcNpILZ+zMfxnirDzEGmr
 O8GsIzhpdfKx/kMyx62+utcSIV8hY41Lma8SUiBYtXHfbWR8UFuf1LS+kT9yssrFDVtbiCI=
X-Google-Smtp-Source: AGHT+IHjxCL4ilnBbhzBiVvVv0rtl3RMnbLX5YjwRMZiBzGEtkE2X44D+/p+uvnENdOwMRWrcTLoQA==
X-Received: by 2002:a05:6830:90b:b0:72a:d54:a780 with SMTP id
 46e09a7af769-73210afb31dmr2552776a34.17.1746649361838; 
 Wed, 07 May 2025 13:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:41 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 19/24] drm/sun4i: tcon: Add support for R40 LCD
Date: Wed,  7 May 2025 15:19:38 -0500
Message-ID: <20250507201943.330111-20-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and related SOCs have an LCD timing controller
(TCON) which is compatible with the R40 SOC's controller and existing
sun4i driver. The H616 does not expose this controller but the H700 and
T507 (based on the same die) do. The controller supports LVDS and RGB
output.

Add quirks and compatible string to cover these SOCs.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..8cc8488483ec 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1514,6 +1514,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun6i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1555,6 +1563,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.43.0

