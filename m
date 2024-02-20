Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF885C005
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA91510E4C0;
	Tue, 20 Feb 2024 15:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QDBfE6ao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C5110E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:35:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4126f48411dso4690285e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443343; x=1709048143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jrtujh/LnXfvYMR2N2cwo9zSO80+VM2HiXhsn02tIjQ=;
 b=QDBfE6aobM7lyknRtCa5C0dT8pAVTSzIsLZXu4nGEys60GCHnJ7pIZG4l0gmfwfTHL
 VcFVmQKJoXnLrWJA/JkxfiyxaPoLQu5vtT85zMwQ3jDzX3xi2cRpfwJENRh4s/tKQYlJ
 LBIzlhmhzvq779Tj91WMtjCXX8nWPVPihwa0+tU+k2PCjH11VBq/NUOwUkWJJgNR/uIe
 TAMB3Ryzw5evFax80rKqWzfJnMs/tl0KBwom+dKsp+cyBB6bLuZnl3Kc1hh20SrP8sEM
 A1tWdeirJVA0ucP6nlvUPmBBsaodVTZz0HG+9ANJNIwYej4eZenPvIRFP1rQKdsb7xKm
 /OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443343; x=1709048143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jrtujh/LnXfvYMR2N2cwo9zSO80+VM2HiXhsn02tIjQ=;
 b=aTSXVC70E1sIPygLxVRgAaLnkPpcP8fAZJgBCtsXW/ge4AkQvYI1j5HUI7XDCeX7+m
 AccQKVIGupU5+Vy2/pn9gLhxeT3XW8f0RFTdmj0EJplXspBO64koWU84oqkIZOnYt354
 hHY9kwdDGnDvmmEjSIPBujQKYw3WLSfvFd19EX/QajbW0zGefS7R6NYKU2TZLPq5OG7g
 GzKQlBpKdkYzWvMUM7cP+sFO70UA06JIoJDnHiFWcaf4H/7MVpKMvx3NuAU9/ixBjRY0
 5Fv7QKNaFVyDpyBBVXoV/ZMdrTORIFyHCGQfpRzoDOCSj1GHmToinMCSMGhPt/FDF61U
 75ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU73Rq+gSGgsOMgfsomxEGZdoEqQTTtiFm5phMLtBQci84VFnWtRfo5x5p4JbHYjW1iJ0YzK5+IjNq/STQcVyT2mW+LiBIymwnoI5PlPtG5
X-Gm-Message-State: AOJu0YzqiOPpKV4da69jBy7cNN8LlHRm1AR7TbNOuhK/upnxLxHaE1VW
 U4mnE5VxJIPlqrr52RWMoli1nDHuc/N6cw7tczWtK1l2uoNiORekwL1U1pdGJWE=
X-Google-Smtp-Source: AGHT+IFDWLykrLrTZHAk/OiKu/p48Obi7ksW8/C3NaF3BGJJllJTfI+C8R5qCg4lbmEjSwL/2SNd8Q==
X-Received: by 2002:a05:600c:3ac8:b0:412:6ebe:9ecd with SMTP id
 d8-20020a05600c3ac800b004126ebe9ecdmr2032288wms.3.1708443343086; 
 Tue, 20 Feb 2024 07:35:43 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b004126ec2f541sm2444905wmo.0.2024.02.20.07.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:35:41 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/4] backlight: da9052: Fully initialize
 backlight_properties during probe
Date: Tue, 20 Feb 2024 15:35:24 +0000
Message-ID: <20240220153532.76613-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220153532.76613-1-daniel.thompson@linaro.org>
References: <20240220153532.76613-1-daniel.thompson@linaro.org>
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

Fixes: 6ede3d832aaa ("backlight: add driver for DA9052/53 PMIC v1")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/da9052_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/da9052_bl.c b/drivers/video/backlight/da9052_bl.c
index 1cdc8543310b4..b8ff7046510eb 100644
--- a/drivers/video/backlight/da9052_bl.c
+++ b/drivers/video/backlight/da9052_bl.c
@@ -117,6 +117,7 @@ static int da9052_backlight_probe(struct platform_device *pdev)
 	wleds->led_reg = platform_get_device_id(pdev)->driver_data;
 	wleds->state = DA9052_WLEDS_OFF;
 
+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = DA9052_MAX_BRIGHTNESS;
 
-- 
2.43.0

