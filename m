Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888888D7DB3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 10:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129F610E318;
	Mon,  3 Jun 2024 08:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VKJMlsyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E6710E318
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 08:46:19 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so22826775e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717404378; x=1718009178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1ljPf81ph/W2qxW2onCfyshEo5iYLRHonj3GjJrQNA=;
 b=VKJMlsyKwD733emnvR5I369zKGxHn5WMvtxCafYZFZy16CMpZvgcl06rBaJb1FNwlv
 u+m5F55kLLq77r8NSJalmk8SYl8yIYYHizBL7vUvMj5o6ueYwNaJKdxGI6sxnAxtyZGP
 nFk/UOIm85jrTg6GagzEkII8g9uXhPF0MxAWPwSOg1bJQQpE9s8PbSitRtHaUGXbMuVZ
 DCRSOt5FO/YIcv9wV9P3H+/Zvar29T/J1P07WqHgzxE2WPAMyqeKy3x3bIHSwuyLiJsV
 sw9Lu4q305/I8oBoSf1n3cPBRQlWazd/Ci7kH7b9svVaNWDRN4h3d7rwWsGjai/Ld647
 WoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717404378; x=1718009178;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1ljPf81ph/W2qxW2onCfyshEo5iYLRHonj3GjJrQNA=;
 b=qGVOxHtVqaIM1B5jWEnUTyhDdHs/Nkb/TssSeZNf2BsBMBQZL7frSEd9ISRRrkdoiZ
 FJgLXKMPr3ZlOciLWctY5HSR/ufKizSxMJwO7QJjT1mZjxrCVX1dL/nv2Q54Dj2l+BgY
 ZLnDg5L7pfSmtAZY39YgljEgecvpWkqTO77RM/yjtAyhqcvQyTwZEwraz1MLj1OsH73i
 Vqvuk9to43TlvSuWDTq9jnTdU8p76rQAlH22fjCb1IaIcs7wvRvfD73sf3f9N/IGtF1X
 AhUz9lsVgzaUPo2aHBCc97iiNtb75t2gRndr+eLuWGRTh1ztF8BrYzQP1bIf0IAgVF54
 SeAg==
X-Gm-Message-State: AOJu0Yzo7yYLQW+BtcTHvQNbsutp3s4dkipjYvwDK9vv+W5WAgoRc+Bi
 CWeNKOSrf7XRbJtcpn8IL/OnTR2KJlciXTO/iOSapmuxdJyEpYrPahMzxpOXaXs=
X-Google-Smtp-Source: AGHT+IFo417hBZRSwsii+or/d9cHPAd7DacIhAnSF4J8FsbSLQbe4tV7OhSfQWo8c6wzbnIOXzFoTQ==
X-Received: by 2002:a05:600c:1c11:b0:421:2a54:2f22 with SMTP id
 5b1f17b1804b1-4212a543232mr85968895e9.9.1717404378173; 
 Mon, 03 Jun 2024 01:46:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213eca8a51sm16117655e9.14.2024.06.03.01.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 01:46:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Ryan Walklin <ryan@testtoast.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>
In-Reply-To: <20240530211415.44201-1-ryan@testtoast.com>
References: <20240530211415.44201-1-ryan@testtoast.com>
Subject: Re: [PATCH v3 0/2] Add WL-355608-A8 panel
Message-Id: <171740437725.4156184.17662886246928360602.b4-ty@linaro.org>
Date: Mon, 03 Jun 2024 10:46:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Fri, 31 May 2024 09:12:12 +1200, Ryan Walklin wrote:
> V3 of this patch with further cleanup to DT binding example code and whitespace fixes in driver code. No functional change from V2.
> 
> Original cover below.
> --
> 
> The WL_355608_A8 panel is a VGA LCD display with an NV3052C-compatible driver IC, used in a number of Anbernic handheld gaming devices. This patch adds a device tree binding, and support for the display timings and init sequence to the NV3052C SPI/RGB driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/45b888a8980ae9a09fbf2f50b0ffb7505a834533
[2/2] drm: panel: nv3052c: Add WL-355608-A8 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/62ea2eeba7bf11f4b04e080475de93c2f8ee0f92

-- 
Neil

