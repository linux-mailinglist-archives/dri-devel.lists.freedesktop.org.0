Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93A956F9F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAA210E2FA;
	Mon, 19 Aug 2024 16:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fmPRwWGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B05710E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:03:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4280b3a7efaso35389735e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083380; x=1724688180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIm5AIc1rs1wFkF7rx3Vybk+LgYQZZfGKlSD6OqWXYw=;
 b=fmPRwWGA3aeMVs7n8z77y6/ZqKqCR6lUqQTVlzHxRpV5QxFpBnszcBV0Dyf7pzkw0b
 Pcl1KPr2aYzpMFmbE21A3wyO6okq7e7KXCwCzeypvzclMM/0TpGwXHPfi4VjaOViIdZH
 Bywzey2yUbEp5y03EQAPf6e9y4LfArP1wOArmCAh5vARHtqKzDBxzhw1k+XQwFULLtL8
 D5Q0BGJapUEO6sV7yI0ERzlcjFHrKqHYdWD7isxyQ374HZV/jay7AkRErPoZPtts10Yq
 LVUBy/1uiegs3lgjHaqHy9q3nPpNgl/q4M6qBguGnfnYgakMWeye7mnlJ1szjzOmINDC
 wSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083380; x=1724688180;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIm5AIc1rs1wFkF7rx3Vybk+LgYQZZfGKlSD6OqWXYw=;
 b=iLKPUOGkaiHfPm3pDAL8TjcJtBxXYZ15WLC8LAi5O8Z4QFu2BH19sFxos7ztF0HgBR
 JpVjTC9ToNBI4/NF6uZ08yoIAxIwLOp9WmKg6zWofuBuEXkaeOqvOsXwqtyPf55lC2i1
 hK6Gpz/vt0dztOACeg5Ik+dop5k69GH69AZ1hlChmMK3psH3dHgU+Tn33xQmoSj7ow9f
 gV1gtAZGbYc4n5epOl4MzRxto9RMts/LJ7IFBO8Zu9Z1fDW8/MEIds5L0M6gNISondml
 UOLhw3zXaSK28JBKjx5wmdl0wqAGIsCW1NONRt7D9hiDlED5PhUNn03NsCIjlE29JH6r
 /rSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD+U3KJi+tgGbTFW9E1alknLjMeXS4dRFbChmmS/QfC3eZbl9vIWSQRUqkFTkdBPTdYU3df3caEqn3uNPnYHtHU20z+MI/4sd/q+EUm4MA
X-Gm-Message-State: AOJu0YzRgzNCbA9Wysxvu54p8GHRiGIrTxEa+ppiWcZw3FJaptfQQOQZ
 REIvgJTsNWq859w9z+nC4WL3rwDoGcuDDl1JBalFt3n/Cpr0XWh8JIymwdXOp5U=
X-Google-Smtp-Source: AGHT+IGuwzR+Pe76TvMgOJvWX/WfjTd/rE7pWKgN8HYr94IuvHOY+JDJP/vG+x0fCT1HB2/isZ0/RA==
X-Received: by 2002:a05:600c:4e8c:b0:428:f1b4:3473 with SMTP id
 5b1f17b1804b1-429ed7cc4c9mr72422445e9.26.1724083380149; 
 Mon, 19 Aug 2024 09:03:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aabe9sm10907638f8f.92.2024.08.19.09.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:02:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240804061503.881283-1-kikuchan98@gmail.com>
References: <20240804061503.881283-1-kikuchan98@gmail.com>
Subject: Re: [PATCH v4 0/5] drm/panel: st7701: Add Anbernic RG28XX panel
 support
Message-Id: <172408337897.1748689.3164061549359158890.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 18:02:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Sun, 04 Aug 2024 15:14:44 +0900, Hironori KIKUCHI wrote:
> Add support for the display panel of the Anbernic RG28XX, a handheld
> gaming device from Anbernic. "RG28XX" is the actual name of the device.
> 
> This panel is driven by a variant of the ST7701 driver IC internally,
> and is connected via an RGB parallel interface for image transmission and
> an SPI interface for configuration.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/panel: st7701: Rename macros
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/00b8a47d8ebe0419e649dc81b96033f6db6a4746
[2/5] drm/panel: st7701: Decouple DSI and DRM parts
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a055c91ac6ea493c2508401537e8732dd2a7bbf8
[3/5] dt-bindings: display: st7701: Add Anbernic RG28XX panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9a01fb40fda3de773eabd87d0d10f9c1f49ad581
[4/5] drm/panel: st7701: Add support for SPI for configuration
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6a60273a0e8274820210abcfe7ec0d5f1f38f458
[5/5] drm/panel: st7701: Add Anbernic RG28XX panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f7c4a15225faeffe1e9f9a752097e7d85603ffef

-- 
Neil

