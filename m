Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F788D10C0
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 02:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD28710E8C3;
	Tue, 28 May 2024 00:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="boYKRWFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01D210E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 16:06:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5238b5c07efso10974210e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716825966; x=1717430766;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuZ+i6VJ8CA5/JDAq+8Rvl3eR4fp00c+Jua28r3LuRA=;
 b=boYKRWFUZAagnkxsGcupHnWz+0gVtYL2ih/XVONbd4CIlyiDfGRsSCBqGscBYT/TQI
 DcibMAzeYD2/ndwI6pQzzU4vAZBUIVogv8YqP41RyE4QX77KKN5g6RQ5WIGXsx7sk4Yp
 s1tGNdSSpm3QvnMqaTeSo/KbzPDRXYiiEAknx/k6lw/moUm0KuDvj8Dez+oAqntanhSI
 lXuokYXENWH/AG8TmBsv+BChPHwQpSbsNqfjE4iH3XlmvjAFSLjgEIrk8F+TC362yZW7
 NzJjQ0AczmbUWbw89A4fEUSW6kQg1FpaD7P0TLmOvQTd1qd0y1Uq5EaguDnI1pAG8/Xi
 FbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716825966; x=1717430766;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fuZ+i6VJ8CA5/JDAq+8Rvl3eR4fp00c+Jua28r3LuRA=;
 b=dSc7dDOzrl6tN4sfZwGfwl5pAxtqQs2BQm55sDBzWI+NwbSIR3+iiTVrKLQVPu9fcE
 46SnCtocFk9jcC1692hOoCwNNiMjDsOaYSo3Pgu6uvOCttQ7mScOmBSaNcrAF4IBhp2D
 oOYrHMwwA4pwW2latMQsbbdQxSUNdqYdvmTwrAMjIejiU443d4LN8gbhrO3ldCyrNpT/
 JezklbANNLc9hHj5c/LsE5p8Dqc1SzCutGrMOJ5FnSX+Nlw9Lcsyc+a3+Fl0S8rglfl+
 4vdgr0DMpLqOly03BsP67x6AD7cI8wAswZ7QsQbLWJwiP76CP5nlpBXJS61sStSfrgZA
 5UCA==
X-Gm-Message-State: AOJu0YwBYgQfUuBsCMJGdjJLTYGeNNnGe/K0sGSEE8vuRenjzIp0qfDi
 sj8EST9OK3XmSIfaUgEBvW/2Bw5Kiso/eleycgCfg1jez9f/Qop1BV5aq3pAArc=
X-Google-Smtp-Source: AGHT+IFXF5FMgJd6dMl0XynBU6H9dO5312UqjjNFL6kiJDj+4nk7JVqUZ+MGTJrNmQkVx9XicDh+Rg==
X-Received: by 2002:a05:6512:602:b0:51f:2dd6:37f1 with SMTP id
 2adb3069b0e04-52966ca8dd5mr6231511e87.60.1716825966336; 
 Mon, 27 May 2024 09:06:06 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42106a158a6sm125191945e9.25.2024.05.27.09.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 09:06:06 -0700 (PDT)
Message-ID: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
Date: Mon, 27 May 2024 18:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 May 2024 00:08:28 +0000
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

From: Arnaud Vrac <avrac@freebox.fr>

The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
DVI 1.0 and HDMI 1.4b and 2.0b output signals.

Since it's an I2C-programmable bridge, it could have a proper driver,
but the default settings work fine, thus simple bridge is sufficient.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
Change in v2: send from correct address
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 5813a2c4fc5ee..b138279864750 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -292,6 +292,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "ti,tdp158",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	},
 	{},
 };
-- 
2.34.1
