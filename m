Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887209A694C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B77F10E4E0;
	Mon, 21 Oct 2024 12:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B8BSqy3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB7D10E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:59:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so45629995e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515542; x=1730120342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=;
 b=B8BSqy3Gcwlmc2ua8+nTn+teXXuQp2zuTVGO6ul6t3ay6mOmK7BngB0xWTILGQnnyG
 sHmGcSjZRp71LWt5/TQutAL+RaWFMtFCDMLjQfSbB5JK8p3TJEg85HkSOXNfgyfAApb7
 uH942PW/HpKNOOxW/QRdzKFwNQ2IJIV1yUCuXL77RS8IZi/qD1JtwWtUb2/SHZHLoS8n
 7YzE3xijds2ayQYEZjGfb9R3g2T66XGtk6yaRffDfDqr3dIxH7wUH9GTccFWuWlskmcm
 fJOxY+t2EQddySWiD7QqG5G9DwRSh4MRfguCOtqB0zpda4M8FJQ9TdBnDu+/9xTUFnof
 wiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515542; x=1730120342;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=;
 b=pZG4Dh5DrvemlfMfzwAE9sgwno/toF4lOiBhQCss9He5VaRxBsJzwFLcNDwWxSKyXq
 FZIHbqKWZqTwVNfVTRr1cExWDIGiPIvJ6BmMhI9Klgi3J+/4K7RLqDhezU+xkomw0rwO
 EDwkU1hCtNmG/CnP3rz8mahpRxsYLUDiYxb6hY1J8JqsHSCgi8mqlvv3DrIS2xBstLpM
 UPnhcP3AJavTaWz4mNCeM4tE2lqWDMn6XnRuEvln//1WxqLosD9rveHEZTUsstNFvA+z
 CNfpY1ZqZ+YdxuHYafzcYPTwKDNcwsralmnqHsD6k1m/EhHG6Zs6SloZxGVPB5q+l5CD
 AyKg==
X-Gm-Message-State: AOJu0Yx7aetkGSdYfTVl2m/3z2YQRjEBH/TApi+QwfkYVqbQ102XqOXk
 K68JF6whh6d4lR9J/iIfJByCN2tyChW+wmvt5sIaVNSDv7SQDBbyiBpgyzKjC00=
X-Google-Smtp-Source: AGHT+IH04j80oL9ouXTZKR+04j2kFDZL0aYwGPdMMYjCKFcqtXA5i8kcVtQSqWhMcA827fSFGcOcew==
X-Received: by 2002:a05:600c:3151:b0:431:6060:8b22 with SMTP id
 5b1f17b1804b1-43161641a62mr89150865e9.10.1729515542557; 
 Mon, 21 Oct 2024 05:59:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:59:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
Subject: Re: (subset) [PATCH 0/5] drm: misc: few simple cleanups
Message-Id: <172951554139.1240386.5313614669791374928.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Sun, 08 Sep 2024 16:21:30 +0200, Krzysztof Kozlowski wrote:
> No dependencies, trivial patches.
> 
> Best regards,
> Krzysztof
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d9c12481f980bdad9cf6fdb742e49c5b50622795
[2/5] drm/meson: constify regmap_config
      (no commit info)
[5/5] drm/bridge: ti-dlpc3433: constify regmap_config
      (no commit info)

-- 
Neil

