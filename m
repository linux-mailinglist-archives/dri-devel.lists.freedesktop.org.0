Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00319179B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E08610E79D;
	Wed, 26 Jun 2024 07:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KjmxHqmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1A10E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:31:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so804006f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719387060; x=1719991860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tv9djtWEOzxTaL6lh9T+uBzCSiUjvyz1rjw0jY3cUB8=;
 b=KjmxHqmZb/wN9dJ47Fvz3HjpH75QTDosDZxNqrcDDooxb2IEwrBceJT7vxVYuWZUrR
 HTICyFkqzo6rLCPDXiuIQFlECTVipcoc51wHspyin47tT2Um0JQVBqx88VAO39Q0dGHy
 dNzwGUTKyA5jyrRc3BKzyNQxz/T2ZtIz8d4V9wSl8EAbRCoXGWSMwLdcfDsoH2ph6PgM
 EO39T4DAownJ4j7gKh0gguqiapKiJI1qt+FPs28Svm9gN2pTvqFQjyhnjtrMqXyPP+HU
 mxNRobr2qVuKwcBLM8DzvCrSNhuw6jL7yyFD55wHUheTKcm2UjJ8FApbYtTaFjoyrg8r
 2f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719387060; x=1719991860;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tv9djtWEOzxTaL6lh9T+uBzCSiUjvyz1rjw0jY3cUB8=;
 b=vQS9jzxekb6kmKvM8Uej7OzgEDRqjQLwGCbykdradUUr6qBSbTTFiLkd37by7hlDXb
 M4rL/cRZjWjexVpOS35iiOJky9E0HozNb8qVv8dxU2GkiyQvcwA6W7hYv4SuGZAdFewZ
 Qb0xVsMlnWq+M2FTnlqWBnaLhwnAjDGkvxcIU1yH+94egL3KWiTYoJDG1wmCClU2OXXR
 BTMvDmv8JD/SoQgeZkTezs+vKPDIkoZXhjmL9ExIQCMq8oMsiyFcCzTgYNXPATPxTZBM
 yQ7BtZON1isE2WNNIsGSM2A/wjFUVnXqttpz3CnIbPqr7pQjdPEUaY9WjY+jKBjPAXC5
 01Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhcfp4ta1WxLpv/h3ePaZJFmJnqM1yKgADF6JA7uv7odV87+KZqD4qBV5/4nw2spJkZMFcsrSMmLFhpQE4UWp0hT9d30z7mrSfF/vUJQiu
X-Gm-Message-State: AOJu0YwTO8gCWhcDTzlAroUpNP3/IJ/E5dsSKGmUNr/Iaq1eAdMTL/C9
 yVhaqozsb4IxR1oPFd+w0WiARTf3L8kJYIg0QEOtc9xq0Lcjl3kJvgYX0CISbrvc6+S9H8r9Fr1
 7M/w=
X-Google-Smtp-Source: AGHT+IFBXULLdxfeEky/0MesQJ9m6VVrSGMEmCaQc90xJfwO02ZaFbxqLfpmYopxto8Z2nDrU6fdNQ==
X-Received: by 2002:a5d:44c8:0:b0:362:4dc7:dc7b with SMTP id
 ffacd0b85a97d-366e965298amr5956254f8f.58.1719387059782; 
 Wed, 26 Jun 2024 00:30:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f6769sm15081665f8f.5.2024.06.26.00.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:30:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: amlogic: add power domain to
 hdmitx
Message-Id: <171938705880.1642577.605500417615578025.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 09:30:58 +0200
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

On Tue, 25 Jun 2024 16:50:13 +0200, Jerome Brunet wrote:
> This patchset add the bindings for the power domain of the HDMI Tx
> on Amlogic SoC.
> 
> This is a 1st step in cleaning HDMI Tx and its direct usage of HHI
> register space. Eventually, this will help remove component usage from
> the Amlogic display drivers.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: meson-dw-hdmi: add missing power-domain
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c19f15b1e056a1ab896d54909f75febf70d98be6

-- 
Neil

