Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186CEC328CE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D2910E651;
	Tue,  4 Nov 2025 18:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cwxs5UAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E7610E65B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-477563bcbbcso5302365e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279831; x=1762884631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=;
 b=cwxs5UAmoP/uJSpIygcrnpoaLQFERKnKxaanEkGSqm5AZXWK2IJuj2iunwSrvUOmtW
 4ZMUBdWIIU6WxVfPn1dR6DKJFC/yT7xIIYTOXNArCtCk08Jgq2m/IiUPa0JCqDGU/b4+
 c6a3rSzUbz8OK0KNnJ/lenjt0HCh054BGd596j7cky7HlqeT3Q6SVA3QRk+Qgf3sRAh2
 q301G2/9emDnz6O5H5rYkVaSHTpxJ2x+JLWW0QaRZHYSeb1QeX94ikLXWfqjrWyVNwVZ
 S7EzAMyRbLoY7ohB91qvRwKe2OcooBGKeDFCXWSjq9+iPeDg59cZ0s5l75oFuVHwLN/t
 RsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279831; x=1762884631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=;
 b=DI/j88zvVQKtvlTxpAYwp2eIGT+X/yUXjVdTz0RTcBgbnaF22SZbGYrZJjiJSIModx
 fl4heL9RUfrP8HHF0h7x6wGaiTuxewgaKMISbE89adpxGsuGxvACISaQDE80Yfhlieg1
 C2WH0tQqp8KJWmJMcWAFDvUtL5FwoN3TSjYXapksUtD5y1keH9GKtXir70k55DiS+mHS
 kilqwD9xqfF2eIZ1nAOi2Bu9rT15+ZJluGSX5budelOTOpRPmSWOvbkoWvXjM8FlzzEF
 sCjsl+80Y6vq4niRV66evd5r9LRnpoK5r6S48n7d0Ek67y7x+D4nTkqDM1QB6aCVarzA
 Mz7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM6638FGTqoDSlGjPj5ppSB0TaCy376q3pefoOOHpL4ejxectpyqPmgqwDrCCPAbt1X7DejHBWy3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzijPmys9eaU/1mK9tkmu585EUrFD2mu60XqzgmS/2T0Ho9+KCH
 5msskzqG10Z8EDIxLGZqGzLgg32SEoerQbDtSRuUhDjYOF00nO86JDwU
X-Gm-Gg: ASbGncuNGveEd46dJahT1eGX5HINNcLqhCJsyJuK45eUwi44PQuONxo5QZMxZvZOF6g
 5nTlFCf/FM00Is8v93oKUeXguRff5+/lEkyR6KVCIhO6NqizOW3FH1LmiacFpPSzb+4OGZnQGPw
 D96jipP9tNP3jVi2mY3uzuurfworvdzo6xDMpJsJRm7/+avv0KGSaIwo0Uj94DraWFWEni/ddbX
 Spzdx3zJafjsuRipPeb+8ZKJ+zgNDuCpPTBi0VtxK3h4bJTS1vjkjCsWPu1+nlQZJYNcvPuf9+V
 BqiAi2eoCdcMmNMNGY7lDytmzTF9iqb0gseKpjrpjRQOs3uW9pAxe5WXUqE5W+2GhubDj4fRfUH
 ovmQjF7Kg7gKq8wz56KFiiDDxy09EqzP1IKbl+hYdic77jGSDvbYxGupUoJrR07MSrcuZugCnQ/
 3psOYHra4q+oeXTAbTEnfuswsuWf19
X-Google-Smtp-Source: AGHT+IHkpIC3aSMOHY0XvNH+UoXWk3HEri1Jf6ytHO5K5mDJ0+pJHIyqN7z61F+ww/rx9c/Kck19GA==
X-Received: by 2002:a05:600d:8381:b0:46e:376c:b1f0 with SMTP id
 5b1f17b1804b1-4775ce9bc74mr1190495e9.7.1762279830853; 
 Tue, 04 Nov 2025 10:10:30 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
Date: Tue,  4 Nov 2025 19:09:35 +0100
Message-ID: <20251104180942.61538-24-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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

Now that channel base calculation is straightforward, let's update VI
scaler base calculation to be simpler. At the same time, also introduce
macro to avoid magic numbers.

Note, reason why current magic value and new macro value isn't the same
is because sun8i_channel_base() already introduces offset to channel
registers. Previous value is just the difference to VI scaler registers.
However, new code calculates scaler base from channel base. This is also
easier to understand when looking into BSP driver. Macro value can be
easily found whereas old diff value was not.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 0e308feb492a..fe0bb1de6f08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -836,7 +836,8 @@ static const u32 bicubic4coefftab32[480] = {
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return sun8i_channel_base(mixer, channel) + 0x3000;
+		return DE33_VI_SCALER_UNIT_BASE +
+		       DE33_CH_SIZE * channel;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 73eecc4d1b1d..245fe2f431c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -18,6 +18,8 @@
 #define DE3_VI_SCALER_UNIT_BASE 0x20000
 #define DE3_VI_SCALER_UNIT_SIZE 0x08000
 
+#define DE33_VI_SCALER_UNIT_BASE 0x4000
+
 /* this two macros assumes 16 fractional bits which is standard in DRM */
 #define SUN8I_VI_SCALER_SCALE_MIN		1
 #define SUN8I_VI_SCALER_SCALE_MAX		((1UL << 20) - 1)
-- 
2.51.2

