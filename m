Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF39642E3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D5910E62C;
	Thu, 29 Aug 2024 11:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FpPo36b+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6026E10E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:22:27 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-428141be2ddso4648535e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724930545; x=1725535345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwq6oUC3DLFb6LHJMA7x3N/oOgzyp0ek1NiN8KPUNVo=;
 b=FpPo36b+Sns1RN7keBG66e6rnr7MGhYsOqoydUZPlDs2MbMD5HXEE+UrhbB5NcO9as
 YNWSgDpPJwmF1MX44VqYoqXtgfGE+Zq7FB0Ujez1RIhwvnRIOp7/pTDMZ7W9yJTAOr2d
 Kg1o4YBXAyLKuCyqnlrK4xNJ2aD1n29fJGh0PV3TDQMT+Bit4PNNCTK7T2Gv6DXo1g05
 k5ml20YAFjrfQ7C3kdABEya5UrPyEaY9/JSmMO24bsU9kzeXHVjcKUVoYI6apMkwZEVo
 WyWM5wrNqCiSslShirqYA+AXyiR+Nr6QkDV2ML4HLHgVp5pacc7kXfCsXgz31Bx/uyTO
 8VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724930545; x=1725535345;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwq6oUC3DLFb6LHJMA7x3N/oOgzyp0ek1NiN8KPUNVo=;
 b=QIl3BGwphyg+DQ1rXydhMwrgWrCeTnW4qGOlqDBKNGc2CwxjQ2enSMxsU1f4qfKcND
 cIGp+RG4wh2yDzZ9h+u2srzII0Ouc/scqFL4cjJMnoHXaR6HMXKzzRT8t+LStbJu5HgY
 khOfoEi/22PdIe/JNt9L4lcDP3Bv52PdMjNDYW8pikC4E62HmIw1jVDHeqi+g2mCEr7C
 V9mNTIxcjZT1I2K91I6cs6af0702iXrVdVJYhp9G/fnmjK+OYbiY4ebElQW1W4zuwPzx
 ZvCouUwQTUUpSMjjHVrqsnt9b0jIEk0OoGnsfC1Foo+j9B04cQ4ngHP/b7iMGyZW3A5I
 BVtQ==
X-Gm-Message-State: AOJu0YyW+3VVYL8/ni0uJ0o0km6hSm+/L2DuvCSHHIimnOxUE6xY8bRx
 gez3HHUcz566HPa81RX5GxvNawjBNttN3I9q+Yjx4LBzcpeYENoXA2H2XyxfStndslQgrqGQPXk
 E
X-Google-Smtp-Source: AGHT+IGX8FgKJ9OLClmHZ9MmqJf1OLjmkFuFn7waOynWRsD8HlkQEk2ZA1PtyRRNz/LCammUU4hm7Q==
X-Received: by 2002:a05:600c:1548:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-42bb01bfbfemr21200945e9.17.1724930545034; 
 Thu, 29 Aug 2024 04:22:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e33d60sm14122015e9.43.2024.08.29.04.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 04:22:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
References: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
Subject: Re: [PATCH 0/2] drm/panel: annual cleanup of visionox vtdr6130 driver
Message-Id: <172493054424.1145269.17157130520267583947.b4-ty@linaro.org>
Date: Thu, 29 Aug 2024 13:22:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Wed, 28 Aug 2024 18:03:38 +0200, Neil Armstrong wrote:
> Switch to _multi() dsi functions and devm_regulator_bulk_get_const()
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: visionox-vtdr6130: switch to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/175d648be98bae22eb22444377dd9a0c497c9d46
[2/2] drm/panel: visionox-vtdr6130: switch to devm_regulator_bulk_get_const
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e0cb0c785250d0565c19ba17fc95bd7ab97670ba

-- 
Neil

