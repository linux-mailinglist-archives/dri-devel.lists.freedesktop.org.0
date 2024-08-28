Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE3962C00
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6767E10E58B;
	Wed, 28 Aug 2024 15:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zmU9zBTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945B310E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:19:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so57901195e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724858392; x=1725463192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpCSPrvHbvgoQAYP88DpEJGLj5yIDmGzU0Kjzww6IQQ=;
 b=zmU9zBTeyr8GiB+oeOko1YeeyxzW5fS7dIeSX/5sXs7S1z+oFzRarjRponm5gc4Y7a
 QNLb/OXbZ1APwHJIdTTnE0YkY8HOpIAdSH2QmTWm1Hl4kLwZkamZyG+jPMpCuWOIOvhD
 zqcY6Ftm35/obSXNTgcm11XXT8rg/hZCR6MR1Y1SxUZdRyr3IOcUZ89/KastKhfSpOr1
 yu1z0GeESxGNjOH+NRQIlsd8RtlP5RjF+uhMZ8qGUKEz340wIA25fftasvBYuNmb014I
 71RQFfowJJU4YAPWG97e5LdOeSk/RTGUWOTCOLkpn/A1mc0KbHsIvOYg2cldtFBHU13m
 I+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724858392; x=1725463192;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CpCSPrvHbvgoQAYP88DpEJGLj5yIDmGzU0Kjzww6IQQ=;
 b=gq8+du28dzbQhL6vlFVatE6AHyurZXrLs6AyjCSMAvH3u8BamGR6f0I37WeO/3/yaF
 8SEHkrs4g4Jj5qOiveEFjhIfGbnMxulYjDqXMA1IxQsqFrJ0QkE2VNJ2eN6ALv6u3lQE
 fBT0inFu1pYOOZLldTPCx/ePGDRFd9DRKvXBkXIgDXVTkF077laA71hiLWCgUFQGmCT6
 qjz10ln47HwK3Ez0jxQ+QFE2UVxO4deikHYEzK0vE/ZVO5APEtAtvU9tNJxVGdUC2+c8
 sRLCsptLsMRszGkhBm/U6rdegjqnkiGFY+JVdFiAMy6slki/xMdscTNQhWaZlJ5bCHez
 njJg==
X-Gm-Message-State: AOJu0YyCHeGPxwnc+KGlpBJ9kz6uysE4M27eWkLDYu1rUjqRwMtvDQ4s
 sSx388+03oizmvDoYBQX/nriOHZYMaOoPSGGABTBugwDr+kzMJXRUQnJKiRIMKA=
X-Google-Smtp-Source: AGHT+IEGSU/UwPVBHorEXHqFGG8jxUW916b7N6C+V6g9017AC5VrtKCvylicZ/00xhSSsodhFPWXdg==
X-Received: by 2002:a05:600c:4f47:b0:426:629f:1556 with SMTP id
 5b1f17b1804b1-42acd5e2150mr117558075e9.31.1724858391632; 
 Wed, 28 Aug 2024 08:19:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425a77sm24631045e9.45.2024.08.28.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:19:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Doug Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org>
References: <20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org>
Subject: Re: [PATCH v3 0/2] drm/panel: add support for the BOE TV101WUM-LL2
 DSI Display Panel
Message-Id: <172485839079.3445878.15332347279646667687.b4-ty@linaro.org>
Date: Wed, 28 Aug 2024 17:19:50 +0200
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

On Wed, 28 Aug 2024 17:04:18 +0200, Neil Armstrong wrote:
> Document and add support for the 1200x1920 BOE TV101WUM-LL2 DSI
> Display Panel found in the Lenovo Smart Tab M10 tablet.
> The controller powering the panel is unknown.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document BOE TV101WUM-LL2 DSI Display Panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1da04eac69197032813940426b73fff6f0a84c64
[2/2] drm/panel: add BOE tv101wum-ll2 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aec8485f226c36eb4eea1d489772cd6f2c40144d

-- 
Neil

