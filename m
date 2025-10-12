Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F0BD0AF1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22E510E19B;
	Sun, 12 Oct 2025 19:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MeqPKIsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91FD10E03F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso593986266b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297021; x=1760901821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=;
 b=MeqPKIsS6p7jmGClsgWLdupiX43XTB7Uwf6hdpF0lm8RR6ziuIu9aaJ53TaxYlJh8x
 hW8mt45QGLr13hdGYv94oy6IjNNAdyxjzRsIoloG/ugIFJMJj6qq7EHUkcQrih3bl3Yc
 Z1CfxbjmS5/1Ai6bS+yR0pAdE2VQ9PS5AKpyrw5aiAyRJuDPUUgYLzRtleCdeEy6cwSU
 Sv98GaaxdB4p6g4cC/FqS322w+PbY8P7qg/Tsr9zHMQ/oD+0HxVLOVx13XB12jvFuMjt
 EVoIpxKqzMSr20h3igrYfORLP3/QKnyqRC1DWdVBcNJKAG1NqR5a430SRWe4ydAAcdN0
 WLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297021; x=1760901821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=;
 b=YFT0vVEQOn57osfSv1ajVOv3chKHbdEVQM92d0VzqegMxwGbAmm4yhB1WWKrMv2FgL
 F/yfEPQz975R9uihMNhuQoZ7hxwRq6YcTElpi4riccHogSCIr8sDfit2sL9UtZpugau+
 Uyhza68HNOfAWoXyqETb7aPIf6C9dE+001ENgwdAIUlxWNHD2zDBn5QAOEfhLI7MTqVj
 VH1L53ecjfH7MPmagyvnBNTyR17gDV8jWYyRU0JIyEXik+sLo054l49u9GEOb1XGqxUO
 r149+FpHbPy2MJTDmXyyvTbOotr7dj73vkp5dLs5S90YpdApxzVqiOLS6galZhFfJAOP
 TxjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuYQ6Ghyu7UwTAF+3uyzm6H9nm3Lp+r2rPAbHa3kpK5wq5sDQQGGL7GP1YzQGRIC2u+/1wqexjrfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI/RZhtkQVw+D21T6pKbtWKDD0ALXf+tzIMlXboj4oxXO3Thyx
 wexI50QVnL8nUSMpOcJEoOM7j03bMWDjQdWr2jc5V7effUZObCPQ7EJR
X-Gm-Gg: ASbGncvyaaIcFNU6TjZ4PgX/ij80qMKOadq75xccAuL6rH21cTHXdYJqqQaZrV++xAG
 OzK997D6d2fgLyHJOhOxpKY1IH3mKR7awakHcbYiO+bOAvTzxFEwRM1Jt2JgOshBUsNAiumZxKX
 1YsXHSWPQjzrp7gpTuwEStV+MCigEqG4EkXZLS09FCYwUdZtRu8P6/C/sk88kOqlVE0P+N6iLVf
 PAiaRApfBALzbSJ6U5m289Bzr9i/ycQBnTopfcP0/VAYxLemvucOIxuRc9C/7S7ut0dVXzucxt6
 uCQHrJBdm4NQX8jhCvbFQcgSZFvkOy+TBWB9JtOPSGVCO3g4e8wtrNNHG9oTG9iFPD6aDfUbQit
 7kbVif0w/h4jhCxc0sDe3zn8sK11uG382hA7k8NfBPSg5yBGns5Fa5Kwn3bZPlgCBkn6jXY2+/W
 LFp0xFFbiDnnp0DuEFooWnWRU2i1+hZfU=
X-Google-Smtp-Source: AGHT+IG0sfEJIgIhhCJn3/nqxzgHPFNNqWX+VjerNb/aGPJmXt/GeMNgqqdE+ygKI0NpsjQeQpcZAA==
X-Received: by 2002:a17:907:2d22:b0:b49:3ee4:d4a6 with SMTP id
 a640c23a62f3a-b50aab9d96bmr2151162666b.18.1760297020857; 
 Sun, 12 Oct 2025 12:23:40 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:40 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
Date: Sun, 12 Oct 2025 21:23:01 +0200
Message-ID: <20251012192330.6903-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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

Properly define macros. Till now raw numbers and inappropriate macro was
used.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index a1c1cbccc654..b5badfa2c997 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -39,6 +39,9 @@
 #define DE3_CH_BASE				0x1000
 #define DE3_CH_SIZE				0x0800
 
+#define DE33_CH_BASE				0x1000
+#define DE33_CH_SIZE				0x20000
+
 #define SUN8I_MIXER_BLEND_PIPE_CTL(base)	((base) + 0)
 #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x)	((base) + 0x4 + 0x10 * (x))
 #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x)	((base) + 0x8 + 0x10 * (x))
@@ -242,7 +245,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
-- 
2.51.0

