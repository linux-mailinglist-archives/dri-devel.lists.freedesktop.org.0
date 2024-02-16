Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AC857B42
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6710E54B;
	Fri, 16 Feb 2024 11:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L4pVU1rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4510E4BF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:14:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so16874135e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708082086; x=1708686886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4ZT8wxOTMEaNAlp2WhGQd6HjKItKsveZMf5lqO1FcA=;
 b=L4pVU1rwRW+fDL8S0Teu2hTRh4cqKsHXUGt+iz/8IiQIReWW2DyzUtg2xkmbBKm488
 ujVbm7PY8Z3sinaGemklHatGxZDQvahh+tv8Daks9zaBtFCIXDL+bKegK25BwCOaHs/2
 RycVBCFSp4IrZgI0whkoE52uEporzz8XlRLeUsmGnVVBMXTDvpC0TdP+aJySSloEtctr
 ZAJNuT9wBfd4pB7SCXHSal5ni9YcuLLxNKg8e3ETGNAI/nLpHmfTljfesl7xImNhEZJr
 ueRsUBv5bdOAoYATcEwcvCYOmR1cvNnNxjxPQBidq2UDCcmdr12J6HBmRRCQFVIaW/vF
 l9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708082086; x=1708686886;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4ZT8wxOTMEaNAlp2WhGQd6HjKItKsveZMf5lqO1FcA=;
 b=APOfpr//+0ohgGgTuCM9HwH4dUlpJ8h9oZknrTHJBWseNGAQWt+jFqDvAytNsJV3bT
 nw1gNRmTMwJBJbeozQ+I0KtLyjo3MZIFhJG81Kbm5G11Vy094Wab81GvjNneI7sd47qs
 OSVk5c9prhOjFAHIaFuUN9S7sXDzPaGuEYBXI02YS1g3oS4KtvSNSKdJ5i389H4RrafS
 oq5IN1hDxZ6qBl1IwufruJkXj1wPgaSFISTYISMw3KS9U1QIRGf30OwQhiap/ZV2aLcT
 IRkRP8mkt2lQezdqueEM7nafvWlo+3I3nVcpV0k1xDx7gCUDHbbKWvQQ5Ebg8bKgEY7x
 9I6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/2E1ybaeZWIdbypQB48I1m4HrCAThVTdjfVZsjvaovcJjBDM/h1/oO2GnfO+vZBpXvTBYfFuqyjItObv5cGVx2OoQW4Pql9omtAmymwY/
X-Gm-Message-State: AOJu0YwTVNDDpLHDus3PV6bIkkCla7+18Nta6d72VzBPGK2QNfQlLxsm
 mR9hix/1T3DD18Kb5BDTANAh9jJ06Af9hVhJIJUtjaKAOBj1P5BTpMAYauHjtdg=
X-Google-Smtp-Source: AGHT+IHMW9EOiDBogGRBEw6/c9KN9vSHehtmGG0Sqpr8h98BQtKaE9M8TzBhHR4IQo9aOa3UMDmQKA==
X-Received: by 2002:a05:600c:4f8a:b0:412:4731:a5e9 with SMTP id
 n10-20020a05600c4f8a00b004124731a5e9mr1055108wmq.4.1708082085778; 
 Fri, 16 Feb 2024 03:14:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b00412157dc70bsm2050270wmb.30.2024.02.16.03.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:14:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
Subject: Re: (subset) [PATCH v3 0/4] Add display support for Fairphone 4
Message-Id: <170808208477.3157813.2988071781833358555.b4-ty@linaro.org>
Date: Fri, 16 Feb 2024 12:14:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Fri, 16 Feb 2024 11:10:47 +0100, Luca Weiss wrote:
> Introduce the bindings and panel driver for the LCD panel with the model
> number 9A-3R063-1102B from DJN which is using the HX83112A driver IC. It
> is used on the Fairphone 4 smartphone.
> 
> Then we can add the panel to the device dts and also enable the GPU.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Himax HX83112A
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3b59787a5170e12beb636cf1a66e481526f293cc
[2/4] drm/panel: Add driver for DJN HX83112A LCD panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=654f26a0f43cfd35a5ebd19e008b6f065f2a1f92

-- 
Neil

