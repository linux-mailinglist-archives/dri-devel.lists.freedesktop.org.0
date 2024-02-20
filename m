Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD085BFE3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F9110E4BC;
	Tue, 20 Feb 2024 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s8oFi/BX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0640D10E4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:30:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4126f8c6b3cso4982605e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443022; x=1709047822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwLWP4/vhF0uIJPtwS5+bkpQQd9v2zac6pd8EH25YT0=;
 b=s8oFi/BXPQxFSCnNvZwoxs9cOTQ1kuSaQFL2NnuLQy3yOzh1La+CwZV9niVNzBWOKr
 PUxoNVrJsCm3apOKh0Cjq4sKkqQEG1Q/3KRQHweKTOw+YWp3zmFdyjl+E3WI1UeW5sng
 MViFlzCG16nLB0a78wnxH0R5GZU0z/rtMgXuLCbwvrzIkGDqlUY16aaIx0zE2EfW9cnt
 tj7s1VWPof6t/oVdkUhiQC0Rr2pSTmksl+Wnc24JRzGxKRYcwDeP9WXPDvlrLETPYKQB
 ER/amzQRY2+wF7OXAhKvMROrzDCWeRhi980CEDEsBXGlChUdK4STsF4k9IS4DNLjuDNo
 zrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443022; x=1709047822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YwLWP4/vhF0uIJPtwS5+bkpQQd9v2zac6pd8EH25YT0=;
 b=CXMz6yMrPCwTjSJWpxIFx0SNHXFpkPQYq44DFWW0OqlKWK0is75EaDxGlEF6sCuCow
 WqbQdYdA71ZSCjQKFp+ZRM++C5vJ3u1kX9U6/HKRCT4Hxl1w66LkFzhP8KqrKI3nh2eN
 DVyY5heDthOmfiqmCsiYLIHRR3lF9nAYwinNCHBeu1+uRcqOs3stoYPh0Gtcl1NX/LFG
 N5czyIh364No+KMOtEsRWjsxYI9rgyaTJuV2WtEmMaua+OeQ0p//lTYamWs6q8sTYpQp
 PRs8u0owvF2r3R+1vmlZOgnViYoo4qtBicqxACsuoeCUxZ5ZcQjFq2/iKOvmXhhYN4B6
 OsmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN1Yx9eGDLi6ctoRN2dQzaD+qwHIX47dG1eBimKT6JVya88J5YOm9tU6PsmMVmXc+LoxL8RSzXhDoYaCFE+SFtjsnEjRnNUwpKft9ng3Uq
X-Gm-Message-State: AOJu0YyeIRow/TWr/JXDUfSgIVvx+GMNqY4h5kq8PA38zWxzaCUQRGou
 4tiZa1SNHGP5Nctv6d6y1MiMOih+0XqErMf8zhU04Jl5c9/wchPhVruYWhWhca5XD1o4qeUbn+8
 zN+s=
X-Google-Smtp-Source: AGHT+IEGWcSQbhDlP9tq4t7O/sVQt2zHCnqWm9u68HuVcuEt7FNSTdwzCSXTgIgXE/i7RnLhBW0X2w==
X-Received: by 2002:a05:600c:2805:b0:411:a5f9:26f5 with SMTP id
 m5-20020a05600c280500b00411a5f926f5mr13067635wmb.38.1708443022356; 
 Tue, 20 Feb 2024 07:30:22 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b0040fe308ff25sm14691564wmb.24.2024.02.20.07.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:30:21 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] backlight: mp3309c: Fully initialize backlight_properties
 during probe
Date: Tue, 20 Feb 2024 15:30:08 +0000
Message-ID: <20240220153010.76238-5-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220153010.76238-1-daniel.thompson@linaro.org>
References: <20240220153010.76238-1-daniel.thompson@linaro.org>
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

props is stack allocated and, although this driver initializes all the
fields that are not "owned" by the framework, we'd still like to ensure
it is zeroed to avoid problems from this driver if the fields change.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/mp3309c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 34d71259fac1d..cdf302d6f1cb5 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -373,6 +373,7 @@ static int mp3309c_probe(struct i2c_client *client)
 	chip->pdata = pdata;
 
 	/* Backlight properties */
+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.brightness = pdata->default_brightness;
 	props.max_brightness = pdata->max_brightness;
 	props.scale = BACKLIGHT_SCALE_LINEAR;
-- 
2.43.0

