Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576B70D6F0
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11C10E40A;
	Tue, 23 May 2023 08:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FD310E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:52:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-33114404c9cso10297305ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770733; x=1687362733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7sLAS1re4t0jepnvIMkPI23rNpmWLJZtcQVM+U6RF+I=;
 b=UGRRnuJymzcFEIgOt1c7jWHGtoRQnT32sQuU0zmMQB1tSkJcX4XXJ3W0th1d0drxkE
 ESQ96vRX9bqIW8Tg01BrHzsKLYQJZySPkmz6HWnGaywLPa0ahg4F6Gi42DZEbJxpFAzh
 iE2qubB1+HAqi0VefqWciMtMiaYqbtLY6lX5S/enNs86b8+HTJbtShyvpqpJF9PxNovG
 lYd4wk0gStVIfBgcTuBkUmakTnhhxpTABaGBvM/lk6ZyheGJDw0hOWL4OmqqN0RQobuR
 pyHn9gP98T8eVK4ZAstf8SfAgiaBHiRHznOyRHx8x+TR9a/WRhqxPxwIrF+gB5EiCWnM
 wSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770733; x=1687362733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sLAS1re4t0jepnvIMkPI23rNpmWLJZtcQVM+U6RF+I=;
 b=ldaC8X/ZXcqWvx0Ly7dGidEJ+0/lQBqEQ6ntUtXZyjB9XHIkCh5sb+Z/ClJtEvkik2
 g3jS5iA0FfwaxssCyQRH739b/+Jlua38O67sf98hBWD+LzYAUy4SLYLft8EmXXtjaY+p
 ECGf3UNQ0zs+m3zMciORoZXCeRy2Jcs52OOYZ5vXWq6GLBaOExzigrDk2/IuJ3UO+kuJ
 u3IDw48pkJzseVkmnS5IKcU1LUyeDq4RLEUZWAd7Pn40awXvkOY652G5MdCCqnqr96oZ
 JLU3sjWlZUUThr6e+YK5g0++ZEzQ+1NIT+ALKrnzrR+alTt7F5gWwbvtiKE1JSSYrPZ0
 E2Ww==
X-Gm-Message-State: AC+VfDxnjcO/AS6cXeEDatrvsjTPNQyOdDpTrQqPeNfJgcEYsCQZE4SQ
 PevhFwBeQu0xoPLLCwWBfq4=
X-Google-Smtp-Source: ACHHUZ7x7GRL661Xm6U+t9Prayc8EdalxBRBQSJ1Esy+V4Z78cjwoFzpNSmy+Zh4M/L/Kv3wz1ocIw==
X-Received: by 2002:a92:db08:0:b0:338:65fc:f4c1 with SMTP id
 b8-20020a92db08000000b0033865fcf4c1mr6987356iln.9.1684770733275; 
 Mon, 22 May 2023 08:52:13 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 bs21-20020a056638451500b0040bd3646d0dsm1794208jab.157.2023.05.22.08.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:52:12 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH] drm/bridge: dw-hdmi: Replace all non-returning strlcpy with
 strscpy
Date: Mon, 22 May 2023 15:52:10 +0000
Message-ID: <20230522155210.2336690-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: Guillaume BRUN <the.cheaterman@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Azeem Shaikh <azeemshaikh38@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 603bb3c51027..9d6dcaf317a1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -533,7 +533,7 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;
-	strlcpy(adap->name, "DesignWare HDMI", sizeof(adap->name));
+	strscpy(adap->name, "DesignWare HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
 	ret = i2c_add_adapter(adap);

