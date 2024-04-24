Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D26C8B02BD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E5D112A9C;
	Wed, 24 Apr 2024 06:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/K9WhS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BE5112A9C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:59:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51b09c3a111so5111144e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941994; x=1714546794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pn3zv77j+I/km22hX1hF/bl6YKQ/ohkjehGzLRwZ1C0=;
 b=b/K9WhS+ty2A09M4cZOWTE0ZM/Y+p2N5+SslWUzNn/5YZgxrTRDDwjIAltv1bLZVas
 /D7p3RMFJbARua7WVAsnvAEjj7cXF5mkJ/e/HGAf1XpQzZ3xzy5fM40aqlj/YPctFH8a
 jLom4AEiz+HNBr0XgeCi9Okw6F1haoGmjsTKbP9AiYCm1IYOrVRAFT+iXYdonCR1hfVM
 Wsrm6HHW7aBW+ngizMowypXE3okWTrCE51DPu4JoO+wjBr6BTVTfl3oQpbdXCYeSTp2t
 XCi2vrFAb5+HKM55+n5xGfoZh1CQYa5YoXas6TkIL5e4uV/WL78noPC99iv69v4xEyFE
 FUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941994; x=1714546794;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pn3zv77j+I/km22hX1hF/bl6YKQ/ohkjehGzLRwZ1C0=;
 b=v0+GDRnscy6bcSY+3qIZSGmwdXvpVoXa88WEQwyyaC7j0UToKup92lptZVwtiAdQPy
 CYVdJaJMFb80pE5HH6JEW/gc7YEepSizOWqS4KfaILy2tFcZg6aYJjF2hM8pIBEB5DYX
 2WvV2K4egpR7mTaellJCATUE0GiTfcxatTb5uluTmJFk0nUmRK7gq/Zbop/V1TOMqq5n
 WbPm1lR/eNzxkNPrKI54YY8YKBOdzeZ/2AJUK+enb4MeyjZnG6Dd+YIO42+cL38c9MnO
 ZqDzZKKA5FcaoF9STWCTzIrQ5+4vet0EeL+RKHKAasDHMIw6/IOa4PyCCsrv08XEEX4x
 WSLw==
X-Gm-Message-State: AOJu0YzYD2IgYFQJqxyyzWK4BbxTY5OJVS98e06QvNaMgXmv78wix5Ju
 ZufulGBvfjT+sLLDlbgqf/NsavDv2U4j2yKXARDWSv5kJU9rVJhfF+midiD8o38=
X-Google-Smtp-Source: AGHT+IEAhGdMSIV0cWqzcYj35a9RYOZoMLrNeJQoRvlbbFbkFKLDaeGMDWu5e67JHg+V6aliWQcsNg==
X-Received: by 2002:a2e:9456:0:b0:2d8:df61:9c6c with SMTP id
 o22-20020a2e9456000000b002d8df619c6cmr799462ljh.20.1713941993879; 
 Tue, 23 Apr 2024 23:59:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b004186c58a9b5sm22465392wmb.44.2024.04.23.23.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 23:59:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
Subject: Re: (subset) [PATCH 0/6] drm/panel: small fixes for visionox and
 novatek panel drivers
Message-Id: <171394199276.1308236.5206485375489277476.b4-ty@linaro.org>
Date: Wed, 24 Apr 2024 08:59:52 +0200
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

On Thu, 04 Apr 2024 13:07:58 +0300, Dmitry Baryshkov wrote:
> While taking a glance at the novatek-nt36672e driver I stumbled upon a
> call to unregister the DSI device for the panel, although it was not the
> panel driver that registered the device.
> 
> Remove this call and a similar call from the visionox-rm69299 driver.
> While we are at it, also optimize regulator API calls in these two
> drivers and in the novatek-nt36672a driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[3/6] drm/panel: novatek-nt36672e: stop setting register load before disable
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/302aeb946731923c4ff7cca093868e4148ebc701
[4/6] drm/panel: novatek-nt36672e: stop calling regulator_set_load manually
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9dab1af1e7592d9317bf3857e8cf019120973053
[5/6] drm/panel: novatek-nt36672a: stop calling regulator_set_load manually
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a8ee5f50a9d87f35ca80d6ea74ac07ae97d5a21b
[6/6] drm/panel: visionox-rm69299: stop calling regulator_set_load manually
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/251e3c1fe15cb8bf71a834f863f6225b8164f7b8

-- 
Neil

