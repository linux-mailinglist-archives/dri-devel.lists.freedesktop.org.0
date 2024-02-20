Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1785BFE4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C2610E4BD;
	Tue, 20 Feb 2024 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hWQTbzaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901F710E4B6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:30:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4127008decdso5077995e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443021; x=1709047821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcW5EHUKgbIlTJ9AkvlcTH/1qNEKLD/WUfYuV6zpMeg=;
 b=hWQTbzaVwTL3GFXPgFanfLqo5wfuozki2oLYBjP+qOT2Y94l+x5U0iiHbwCsjo8mrT
 VldAYCUvsecBb88RTiS0ZpjZQDgEmM5I6jE297mRvIVrLqQ8tlxDfsYmBEPFNfbOEpVa
 v5r+K3QI9l7192jXHVkIz8Q11yDO62A7icqbrXn5yA8MSzpbzy/cRR+b8siymag5Omjr
 pfL/i3kc4sHYbzNwlC/JHwNYODo66ouLEk9HCPuc06fDccVXT/s0nnNhdG4d99WaCGEI
 qu8Zc3PvN/UuUzG1SE6ZXgXW4ohQC0BY961+5B6zhXhrkUXuqaRTU+H9Ek3yFuP+4s3a
 g3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443021; x=1709047821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CcW5EHUKgbIlTJ9AkvlcTH/1qNEKLD/WUfYuV6zpMeg=;
 b=DGooFvD9OSRlYLEFdmFBTqx9XClyOVg2bhcE1x57nA983Snb0VGo0dAZ7V3KbQ00a2
 P5I7CYJ+MVzspw+im2DFPcLoMWZZJqqtaNjO792Qt51JlE1fpfx9MePxNl3Q9teQEiEx
 Nf9eqK7KjhkUZ3zKwk1RDVSazoHylkkCytvag3ZqRMFK9DQSBFA+xaS5OGtYxSdj3aWx
 4vbtBzYHdV0YfDduPUewe72W9pgKhrX8N2dIfPMpJ2eMkQwlG8NQAl+hPh+8nAuCLEQJ
 ZJT9hTndPapFzXoS0DYJGL4Urp28Krpk9o+8anMzSpmFjeVrtfQ0tovu5b0z6OsAezG3
 ktJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt4zOdTjgoBoJ23jy7mYCVwCtg8KIC/pKYYKq5kPfur8Gq+Cl6aT0OzatT3lO1e7jAcNtfO7tU3+rc4OXY63Sn57qw9NtNc47Ne27NkO1h
X-Gm-Message-State: AOJu0YwpXSe8cdus8i9oiQnTgIBNz9aPZ6XaNwqeJVTMtlSTQJr3sl/e
 n7T0BBSsFIysisFCVjjGvWwykHQM4ovkqOyWe4Gg6BdBfysXK0qjdfkg3iooY2I=
X-Google-Smtp-Source: AGHT+IFRnEcCOrYMH/Z6LuCcovUr2mE5uwVOXe9d/ihECMTEDLLMcUoqMuZPky/aASEJWkUNQz7xAQ==
X-Received: by 2002:a05:600c:1e01:b0:412:5f1f:fd0e with SMTP id
 ay1-20020a05600c1e0100b004125f1ffd0emr6114959wmb.0.1708443020878; 
 Tue, 20 Feb 2024 07:30:20 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b0040fe308ff25sm14691564wmb.24.2024.02.20.07.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:30:19 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] backlight: lp8788: Fully initialize backlight_properties
 during probe
Date: Tue, 20 Feb 2024 15:30:07 +0000
Message-ID: <20240220153010.76238-4-daniel.thompson@linaro.org>
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

props is stack allocated and the fields that are not explcitly set
by the probe function need to be zeroed or we'll get undefined behaviour
(especially so power/blank states)!

Fixes: c5a51053cf3b ("backlight: add new lp8788 backlight driver")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lp8788_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index d1a14b0db265b..31f97230ee506 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -191,6 +191,7 @@ static int lp8788_backlight_register(struct lp8788_bl *bl)
 	int init_brt;
 	char *name;
 
+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = MAX_BRIGHTNESS;
 
-- 
2.43.0

