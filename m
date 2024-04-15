Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EE8A5CF9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 23:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005BD10E130;
	Mon, 15 Apr 2024 21:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CZ2dWJOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D56C10E130
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 21:33:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4182353a15cso13961005e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713216788; x=1713821588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvC0crxQ4hv14tVfrEC0cLFgOk4kwCtX5f1hXnZbvIs=;
 b=CZ2dWJOfCrG9tOTHZq9KJK65nMlnY9UWkdZSWH12+4/2WyYCLq+zKiahqQgRhxutlZ
 YoFC5WpK5NQXjbfhXm7Hu7qFf2xACAW+9ezp03nPaC5vIEj9wO75dJ+6q6OvvRJ3u6/n
 pPWp3MJ6C5l/e5rHoAssSHyyqPF+tMrp1LWGVLTZNeLAM+q/4Kle9+lLUxiwB8l5fbIH
 4wYNpbLxmo+yZHqQcWluge3u4RKO/Lf6IHbki4mrVyCWD9QDlGgozqbfMLqGm7vLDSTk
 Ewx7KJSaYNTk2ZfuFj+L6dAMukJgOPZ1u373aUnzkSW6hptxpNLmmf2K2iwgjq7Sev53
 ZjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713216788; x=1713821588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvC0crxQ4hv14tVfrEC0cLFgOk4kwCtX5f1hXnZbvIs=;
 b=Wr5hosEdNCqOxpPDn7lZm469QsTGj8tFYtyj77fNdzifOBiVhwx5hRkwhUdPiyU1nU
 t/Wt6wMFO65ROwQNqkjv+hfDKJrxVQJ+G9CtmNLzbBnIhPAMefWjwh+i/auSgYo2bj7S
 lXtB8C6MATwMqVS986GsfG5XejlWcRQ2peT95KfmAYp61+XjViyqNy25jU0Wmq3t0f7w
 WK7gUzSzv/PiRVZg8y4IdOkogjBrGSBxUqjXAcwGX/7cnpirNcNMehBxMPSKo6fvxXx5
 jbCPD/EFH2eBvl+v9krg4tvVXcgP5mNevlCTgic3sdeMLEp8KrBr72BTaIww20MWQpQi
 EXlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcj9+5xx+rABCSCnTNGfjutwZxqwktobawjOauuHfBbU7D8L7GDwi5bwb4xweLKF6+rGXUHOEnIsxjNEaLuwDwjC/B95fI3w1GBztIOyP6
X-Gm-Message-State: AOJu0Yy8A1/Jel6oE1Ls/JDChIpaPVzRFEBuLgJM+q/rGiTaERD8+x+n
 kUDkALKARybGrPk5HqFaru5sOIGRFw4OmoQP9kP2DgALADdaEjbu
X-Google-Smtp-Source: AGHT+IGbVwjwj6P/XwJYoeDaKXfrZhxrIYcAxjHA9f44sCvNTZGbYDkW0+pIuu1H7oDt8UlPAumR3w==
X-Received: by 2002:a05:600c:358d:b0:416:b75e:ffbe with SMTP id
 p13-20020a05600c358d00b00416b75effbemr8521621wmq.32.1713216788218; 
 Mon, 15 Apr 2024 14:33:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b00416b163e52bsm20901026wmn.14.2024.04.15.14.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 14:33:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/7] ARM: configs: sunxi: Enable DRM_DW_HDMI
Date: Mon, 15 Apr 2024 23:33:06 +0200
Message-ID: <8399384.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-5-afbc4a835c38@kernel.org>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <20240403-fix-dw-hdmi-kconfig-v1-5-afbc4a835c38@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Dne sreda, 3. april 2024 ob 12:56:23 GMT +2 je Maxime Ripard napisal(a):
> Commit 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper
> module") turned the DRM_DW_HDMI dependency of DRM_SUN8I_DW_HDMI into a
> depends on which ended up disabling the driver in the defconfig. Make
> sure it's still enabled.
> 
> Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Applied, thanks!

Best regards,
Jernej


