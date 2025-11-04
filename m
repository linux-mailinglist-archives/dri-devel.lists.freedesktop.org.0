Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6BC32889
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59BB10E2B2;
	Tue,  4 Nov 2025 18:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xy7U+9Lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208910E2B3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47755de027eso7472985e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279804; x=1762884604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=;
 b=Xy7U+9LzA2sFhHTA36b+DbBpv6nJ/CL8fChYyY4IPc0441hvb4KPEtQ4JzwgUL3Nay
 EfFU3uX2W/Few5MrdqJS79uJEqs6TlRNjm4Ene3jS/e/1/5KQqTk55hMTHuk67fxa7vo
 k390ymiCT8Kc6Fd6Hbr3wE/vkAxbqaO7hSO5nNP9FySCBxcu41/EnFq2pEZ86taN2EOs
 NX7ahJOgQK2FIeC2P+CQvrJSiHHEZE1a4/StljbU6JlqR6OF1jD1mvybXyF0YfXJdFtE
 prPZswIVtip7bWFmbBtAogI8vM92adTYF6ynFaExvIzxnH7znCsr30AIXFTXC5iDc08n
 Zo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279804; x=1762884604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=;
 b=NBS5OW1jg0LJGCtdlLHrDhBp8EVQZtZA1CIWLg0R2LrS9jE9UXdAZ3LSWY5vkJeAbc
 zKTOX69ldS5lGG1m1lK3Sat01XNcjRuPRTtiDcqgvSxPER+mdIa5iG78ybxTxzKeW0Pc
 NlL5X7npFVNYUeDlzXbE/id0AFVE2wbBquRVIDipaukGTvNGDXYWEmmA+/321bWG+jub
 zsILVjST/Rx9M+IUtEQ5lnzhtF4JBgJUet12JfuaFa68+EvMGx/KRnwyfTUR7cSeaC7s
 6D4pCYLZbey7HuyAJ8RpE61xvlTcYxHG3vKqUxLvfaT+MANkOtSieL25wgUqWPvMEByS
 CMLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWNYz/ycJP4LccwiFIbzVXfvONd0DztZDAjb4jtkua/d6l1GAMxXSRtZXfsY/AK6b6jpQ8ZPRV650=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMAkxwfHxckaiRu6t61aLeQ2/zGa4oyATloEUwnIXEMXfWaotM
 3VIAIImr40H/uvgv+Ei+kRcYIs/FZTxUnpelVbAhTqmtdZnVysNy7wHXNYvAdQ==
X-Gm-Gg: ASbGncsXP1t7s6Rv2chWKN564xRU8upB5LrXBuYKFXb9FygVbUnkmu5n9oU73UKbgwR
 2dCJ/UiABZD2VjTSLZLSUsEEP6PWjIWpnXAGQ3WUGhcHbry/RBvXnU8X/eif8Fm9u9wLpcYn0/z
 c2Pq4wUWFoDYWpwzbmEUk5fcF37BVQXye3BNHKc8kkunbEE4pD5DzbmzOlIFliGJW3AjbXfi03J
 gOxZeiPSh2DCpd5PTT1PnVFB4JeevkHnMwCvDBLeVI+H0Qp1n8VoDBnFCSwIbXXzQUGo/ZxX7Cj
 ulZEh4l7DoLY6EBEErQb1y4JcPt7hNuMZB+T2zTOau8MClGkcZwMhFMOAwFvOjFRW12zBHcoqNV
 LLcql1Qcs2Vh+5My74pTAraYU2X4q4suue/UWLNTSmWr9Az6xdw8g9hDWKlz48r6JhTNel+mUcE
 ylOmHaiN68rsgweUH0Xw==
X-Google-Smtp-Source: AGHT+IE+aXaz85+OcD9Vk61BR2+xCkKdEVOqbAdpjmknpg/EVMyrQo0hoti++4WquFHkKitI5cwjxQ==
X-Received: by 2002:a05:600c:4e48:b0:477:54c0:6c3b with SMTP id
 5b1f17b1804b1-4775cdad2admr2728525e9.2.1762279804193; 
 Tue, 04 Nov 2025 10:10:04 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:03 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
Date: Tue,  4 Nov 2025 19:09:14 +0100
Message-ID: <20251104180942.61538-3-jernej.skrabec@gmail.com>
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

Those engine versions don't need ccsc argument, since CSC units are
located on different position and for each layer.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

