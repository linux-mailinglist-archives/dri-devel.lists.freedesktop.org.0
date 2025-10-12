Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2EBD0AF4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B055710E03F;
	Sun, 12 Oct 2025 19:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LrfifgeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1E210E03F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:43 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b00a9989633so650754066b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297022; x=1760901822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=;
 b=LrfifgeYh3dBia0qJT1AhFqAFN+cHXon2ku7kylDYbfOuHa7j77uAl4PwHYNRXgYRa
 CxuIXxL203U/G7pfiYXiFgeIp2EQVCsuXWO1dSIVP5VmDUfuK/8PARbZbTzPNXCfhfq7
 4Z0CBj1OaAzWZMEO/6LySV8Aqo7YOO5dwz2Me1U7EBthXweRR3gwzvuiPghCdZNfA7Fv
 s09r2DTlTLsu0si8ZVoSPdHIFXVAACeyL6PXtyNQjcUOdpmR4sS0JHu2P76KTV7sO9Po
 zC2leoPBeaxTO2eBtSvJWYYrlqXsMoVeFfcSgNWKMvzDJ9YMfGfy+m023gqaJC5nNGCw
 i0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297022; x=1760901822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=;
 b=U2P/9pWPWBIxtBw96zCeOXQn8DqCMTxfBGgaYdj9Dg0XZz2Q2HgJoEY8+7bIUqBBB0
 fRgL+rLMiepABvvZaugc4oQIG5fFStar3ZEYzZHdjq3iaEfpu3Psv+SeESAmKDwQnwzk
 GxR8d8cV5CxVtvKMfJ3NKCCqV6fDKawZ26ZTPY4y33XejAIOe2PpGjiHNUtznea1tqkd
 assbWlzNVwG3Byomoy9h75udQyhYwdnPhka991xy2KQtQ/T1iODpbymjlRO+ekqLdClq
 +x4BThcnTbTyf2Y7fJ3DbpNXUE+rvN635mAfdwZ//a47DWlrbUCCF6SwZZN/mr+c0qCh
 fsnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9WqZuPC4pDguKHUxuTelHo81D/8yTcpR5ogaaR5S4Av8R2vqD4KWgKGTYr7xdJdCSoR3vuqitWGM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxufjuktMKDg6y8FlRXqNOvu1uXEmX4OyPsJimD5o3gE4nsmnYI
 VTjx5zv6piPxlYColcSYXk58gYFiNQiv94sz/LPW5V/fB5vpll5Byt7u
X-Gm-Gg: ASbGncvw3qLEyoUUXfFaL1AGzCr7hBPedGQ+m/VnUjhIf7g7rKSo1Q0AwdBrZPw1wga
 3SeeZbXosfsrXbw/xYi5viA2bTtmfvuxm/HBJJu4vJOOfZBGtpK/DmpwvJIMjxWdJwwOOOhAcaf
 AcDL1jJxb/42pKC3X2lUVKVFN7d3GWN1G7ZRrB1vzQxj/q87i/RZqE26rdVG/n+4qI8EsOb2Z7i
 h98VvS+yd/x6WUm2OW0Un2/z3X3uZHs+1nvYOWqy6CeyMv10Hm2CVgyDTFvSIbDX0m0gROV1ROF
 XmOIxVFo+CHwUMHBPm6fiIsikiUbnT+q6EvhGITxS6QfVnXT5CrLu2fIxVSxkp2cM+z5AzFGbMI
 5eP2Zwtms0kRezRcBwP/1KdFI+UPYR/eMM5ycSOJp8udZhHLANN9H0mc5Mi96TYn3RctX/JxKE9
 +FEo0DOBFj+2EZHsuBnOsg
X-Google-Smtp-Source: AGHT+IHSovbe/H5UYTgSA1JPDJbOFUPVXMxcZWI/chJwYDsAxjOuahQb+OA171YuZ238MSsvaekD/g==
X-Received: by 2002:a17:906:6a16:b0:b23:20e7:b480 with SMTP id
 a640c23a62f3a-b50bedbf4f1mr2357634066b.18.1760297021975; 
 Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
Date: Sun, 12 Oct 2025 21:23:02 +0200
Message-ID: <20251012192330.6903-3-jernej.skrabec@gmail.com>
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

Those engine versions don't need ccsc argument, since CSC units are
located on different position and for each layer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 31a8409b98f4..f7f210a925f8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -790,7 +790,6 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
@@ -800,7 +799,6 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
-- 
2.51.0

