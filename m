Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2487AD8A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488F10E960;
	Wed, 13 Mar 2024 17:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jJOfNtNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD3210E960
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:37:34 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5131316693cso173431e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710351452; x=1710956252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZH9XYoarv6NevCihCH9rFfZ6985R1tiEG+VgEsvACY=;
 b=jJOfNtNS4YPNd79EzahwKOJJ12859YIMWLFY/u3mHNv7/OqyydbW8+k7yk2L22Spvp
 wRp3ALmvgjiJ6uW6qLXfDNhzURmwa0MCdU9p8Fg3tMHnWVNhR0xZmUEDwQ+1qjYg9l2N
 ys33xYiWgK3zLGhk8wo77QbslsFLN4IOjXbzNj9+BHqbrOBaUbsqUSV3ErwXEMEmprTQ
 w1rhk7lStZBQ/o3SNOZDnCzp2flTBo4H96tnAZJEeOqo9i5xwxiclpHOhraRIsMPbK6s
 SQYXLdjQD24umys1bs05Cu6Ibd9K/5JtQOIabG4a422FGkkY/2y0n0UdZClzCI21klj9
 pPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710351452; x=1710956252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZH9XYoarv6NevCihCH9rFfZ6985R1tiEG+VgEsvACY=;
 b=SbGuCikMwASW9A/YCEa1zhw169oriz5MsIGIR+p2yqPt5PlimP8UxGF43XontKs71m
 /MdiLAn+SSpSKgOrhd9Z6RzYOCN1dGuuprItA+9so6aQ14AD2otPRTQoyFo3kXg9rT8J
 O2n5fTIwMKdUfCCcMfSh3Veuc0fK2B6yXPbVFKgVfwC8Bin1hPjMfRI2538M0z3jfpt+
 B8NDrLtct+zv41wig8xDxtQ18+AOHMnKioZBGkTiDf6eKH0CXaEGbeiY4fWOv95L5gaH
 5lFqaEk+L468ms0PkwZM2wtZ+zVjgbgNWNDESonH/HV7+2SEaXiw+8D4XYBW2sQx62hx
 JBmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD0uCI6qxTnWeEUy74PS6+azqjuftiC1jCtJV1oGKcUUZimSomsUebU73gV8z7/ZtsH22WnK/UdDnWMt8v9JBgrjSMQxWTT+67PxpIq46S
X-Gm-Message-State: AOJu0Yx2MuEzZUUPoLctKFLaqdasXnWbzgkZzsMoSz+3Ul3A3lezP+3Q
 qSvVX2XBxNUqEF03/uCbnXcpY6e+kJBtU8nYcKhe00lFJKQhtSVWdaAFQIIRM4E=
X-Google-Smtp-Source: AGHT+IHv3EW3Wedgv4ApGXEq9qn0lh8eu6xUuhVYlrdISwb1sQOV5/zXUF5PZNcsezYZHMn9OKwzhw==
X-Received: by 2002:ac2:43bc:0:b0:513:4706:1c0b with SMTP id
 t28-20020ac243bc000000b0051347061c0bmr4853708lfl.20.1710351452415; 
 Wed, 13 Mar 2024 10:37:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b004132f9cf053sm2889617wmq.33.2024.03.13.10.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:37:31 -0700 (PDT)
From: neil.armstrong@linaro.org
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH v3 0/3] panel-simple: add support for Crystal Clear
 CMT430B19N00
Date: Wed, 13 Mar 2024 18:37:29 +0100
Message-Id: <171035143128.792807.6928029048259684930.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
References: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Hi,

On Wed, 13 Mar 2024 18:20:13 +0100, Jérémie Dautheribes wrote:
> This patch series add support for the Crystal Clear Technology
> CMT430B19N00 4.3" 480x272 TFT-LCD panel.
> It also adds Crystal Clear Technology to vendor-prefixes.yaml.
> 
> Please note that unfortunately there is no public datasheet available
> for this panel.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: Add Crystal Clear Technology vendor prefix
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fe67bfbd23b0ccfaaa5de9f9176c6283c628cea1
[2/3] dt-bindings: display: simple: add support for Crystal Clear CMT430B19N00
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2fbb050335f8195b86ebcdf498a6c171bba10f8d
[3/3] drm/panel: simple: add CMT430B19N00 LCD panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/751b58418250a56329d35de29329f547c43e7c7f

-- 
Neil
