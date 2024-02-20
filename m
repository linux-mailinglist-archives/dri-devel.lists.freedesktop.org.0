Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7285C008
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C0310E4C1;
	Tue, 20 Feb 2024 15:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yXd3NA+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4310E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:35:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4127109686fso3122995e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443345; x=1709048145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwLWP4/vhF0uIJPtwS5+bkpQQd9v2zac6pd8EH25YT0=;
 b=yXd3NA+cWVP6g9mR7FHt2PBL/aCBa9+Mp1HZkR2PHxyoyorcIm5N4mrjnO4l8TQq7W
 9SLURqQGxOgtu5F/FK6y+hngQ9FuH1Ui3s6VHP6et/6m/QaEXfthmNijqEQVUJMu4rfi
 JT6T9mLwhtHcGJJ0YrWLdb/zqrmefyfjC6u1MkJLpYWVoKj0EiXtjCbEe8ma4cMIND9U
 QceawENT40qwaXZO1d/bvXlXrZQc5z/pMCGG0s7ukcCUIRoleL01HiQTmgdS0RyVxFQc
 bb/J43Ygc6zb/uCW5IHpMXzAEVGghbFV0671nBmptVassut0AV8jwBC0hJiwe9kXfdzi
 5BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443345; x=1709048145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YwLWP4/vhF0uIJPtwS5+bkpQQd9v2zac6pd8EH25YT0=;
 b=pD+H9h9wJbrdr3hvJG2/vjk/obPsgBGP/+xF3cTAv16/ieKKL9ylEoe6cK1LBYdBwO
 Tj5bb2WklD+Uc7jQPVHUVQi+mzsRviQC7cAGQm9Op+CnZF/2bwGbnD76cwsTCwiEiqgw
 MTsw625DL4DCQ6qqEERKprHoRRZ280KUbYGnqEYjDBdHqv2ajZRRb6uHf2oZYjHhHGLQ
 6w+KK8tEx0RKohPRqxri/zL5aohrZsf9DjDd6ork1jIHUTeLLLandFZfs7kNSokI9ONZ
 W9jsxpqLP/zLm0wnyEgUAGAIEHUPu1qLL0Yb2cvCwYfdx5uqW7Ex4W+L/Qk/11u6o563
 7U3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTdz4rkHBLp2Q7p1yRHxfA+VIRWTfm/FYEXPEf//Vs7mS+z2WyqPoKQNZC15QkuBendRk1ttkcslydbjLH8tOztgXysdH0vnt0zl/7ZPZ2
X-Gm-Message-State: AOJu0YxYUuF/lXJj30IfbW/zh04My8Wv6kcthxkbH4GMPX2jUC1wEktO
 2XTaShDxvDpn60CGebmqbnZJ9ELog9LQlUs8tVFFgSUQSRPEUvIzHMq69i9gglw=
X-Google-Smtp-Source: AGHT+IEMn5UIvIGN8ynNgBG1UECcP3133jvG/f9Bq3NQkmhEynvf2+SdDbQmpD5zbEoioW5xKTd9vA==
X-Received: by 2002:a5d:414e:0:b0:33d:1427:5274 with SMTP id
 c14-20020a5d414e000000b0033d14275274mr10295254wrq.52.1708443345703; 
 Tue, 20 Feb 2024 07:35:45 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b004126ec2f541sm2444905wmo.0.2024.02.20.07.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:35:44 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/4] backlight: mp3309c: Fully initialize
 backlight_properties during probe
Date: Tue, 20 Feb 2024 15:35:27 +0000
Message-ID: <20240220153532.76613-5-daniel.thompson@linaro.org>
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

