Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6F7EC720
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C5010E060;
	Wed, 15 Nov 2023 15:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3806D10E059
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:26:54 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-581ed744114so3168650eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700062013; x=1700666813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZGFsZil0baYKKqeLGbbmIrruY0ps4D1rKYDPh+vV2g=;
 b=NVLj7FOQxbHfJ1n6sCQpxdiL6KOos9xSrAjpuQUbN2SXTXWCWImPDFSxw4g6H2tqbp
 nvgj1HZfEFrORYXsD9qBKoeV0oa4xKT+UrMPT+R3o37CiMF7y9fbvlEpaCAUhVfpbOYN
 a0/1nHZHJGtmMM58LooqPO396x6EcQ6xcKugJfHFvJ3jWyzaw18snKO90XnNODWOfspq
 RgQ6thdO0biNsRl6dEliZfIChAeTZ/r5W8yJh+nANWi8pVDPXSf2alvJlAXaG5bOdYmT
 2kS/5yFP27npALbrXGlz83734oXnicd4NP57ez0kKkuvAgbfnW9C0a+ZECTCXAXy29Vl
 YCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700062013; x=1700666813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZGFsZil0baYKKqeLGbbmIrruY0ps4D1rKYDPh+vV2g=;
 b=GT6uqywWEJ7Y0nnzP6s6KLVJ8Y6K2qnwPhWDe01J6FII6Vxrl4GYaEbwjIaA81KgL6
 2EFYEQuPhRNwmeNRUstfr8leDo68p7Er2vR72ClbNvK973g8kM+viMDZHmpKjmyiGfKT
 SUv8cyuXAonEJAm0Aa9tM7a49sLRISErVaw5UTvy9t0GfF9swNGSnBpCQP6+0/Z5e36u
 tiRbnlyCbnPdfQ1YqD7YdvR/iGu7KiEuoEjuuYt4GtCVcEvXnb8R0v8HIFUfvTv5MnrJ
 pxzvBdu69QQIVMu4F2imw+cR0p0WNdY5MqdgeiiIM5NVk8fTh8vOV4PzNXWxrZWLuGO5
 Lraw==
X-Gm-Message-State: AOJu0YyK6GKZLRzfZ5aKBtj4svP5tXopnoNxweIJLf4W7voYXBPB51Rj
 NznUQTkyFArpUC6ClKuQzyvhlnMirhM=
X-Google-Smtp-Source: AGHT+IHYrxG2w1/cHskJG3vTQP4FMyX6nm01gaV4IGT/y9/Nm4/afRw3q1CqHTi2fBEJPEQhVv9eYA==
X-Received: by 2002:a4a:7505:0:b0:581:d5a6:da4a with SMTP id
 j5-20020a4a7505000000b00581d5a6da4amr10251799ooc.1.1700062013294; 
 Wed, 15 Nov 2023 07:26:53 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056830101200b006cdf9935af2sm398012otp.53.2023.11.15.07.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:26:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/panel-elida-kd35t133: hold panel in reset for
 unprepare
Date: Wed, 15 Nov 2023 09:26:45 -0600
Message-Id: <20231115152647.2303283-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115152647.2303283-1-macroalpha82@gmail.com>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

For devices like the Anbernic RG351M and RG351P the panel is wired to
an always on regulator. When the device suspends and wakes up, there
are some slight artifacts on the screen that go away over time. If
instead we hold the panel in reset status after it is unprepared,
this does not happen.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 6cd8536c09ff..f1fc4a26f447 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -104,6 +104,8 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 		return ret;
 	}
 
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vdd);
 
-- 
2.34.1

