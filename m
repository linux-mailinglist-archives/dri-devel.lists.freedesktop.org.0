Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41897462E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 00:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067A510E0A1;
	Tue, 10 Sep 2024 22:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M8eU1/C1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EEE10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 22:58:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2055a3f80a4so44441795ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726009093; x=1726613893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lpX6a2VZYI0Q3F5tVeOcgdqhZYYv8tYMbEYQg5NYqLQ=;
 b=M8eU1/C1SzYNrlvR0nPWwrLPZ8PoYo2yS776siaP3bJj0KHYUTgGCEWUIqnSegr+pD
 fs3XU9icJKRNHqeX3Td7hY93cCS5oFPyzyHnb53f2myP+cujU+h+PF4DGk/iPbzbjiiz
 Z2yu1KRvv1GF4+KB8BX+Iz/EzaMqkTF9UB0vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726009093; x=1726613893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lpX6a2VZYI0Q3F5tVeOcgdqhZYYv8tYMbEYQg5NYqLQ=;
 b=QDXD+kyo3C5ZX3i9XWP9hi25LV6+/jxkKViC7GzMvTNKC1K3aEtKdZr1XlA93u6L4/
 Re9Ts3nbs6fGh60X0CDg2WFkF1wtKYy5nj1grzOU4S14PF5AtO8eRKoBCIVeNFdoKqbF
 +orb6LKLIdh7y90Aea13DG9FRhAy0KLSslcam2+dqcHfJj+dVpo65Xpie1ZzwfAset5M
 gwtr/KHc6CtigEeGFPxkMPeNAkwX3ULYEcnumD4p6YKm9Z1S6LHEpcVn6eDQdLQ+rv0l
 6CBQYYMCyGtz23REqbBSPEV8uZ+VIYKj/aTDS6gIv1dBE30W9/HdlkVCRroo6iVrwO3L
 RRpw==
X-Gm-Message-State: AOJu0Yz2ANj+K/YyaTHaPZWK8RFyIprGBOyXBoNpNexqHkdFK3ciPbxg
 gSzHDJ8LWB+WoQgKGCL0OueKI8Rr6nxz3qlLzr3HurlWRvZIDg1w3DSkpfcc1B0il9MtuusBbH8
 =
X-Google-Smtp-Source: AGHT+IHFVvrTzhYGQ+hPMT+gmzkmlbSSuEnHYLW8yXb38uUd3bYjABqW+7zGj7C9SjbWBUzp3uZcIA==
X-Received: by 2002:a17:902:c94b:b0:205:8b9e:964b with SMTP id
 d9443c01a7336-2074c6ae1b8mr29906575ad.39.1726009093176; 
 Tue, 10 Sep 2024 15:58:13 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com.
 [209.85.214.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710e18fb4sm52865695ad.24.2024.09.10.15.58.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 15:58:12 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20696938f86so51434725ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:58:12 -0700 (PDT)
X-Received: by 2002:a17:902:c94b:b0:205:8b9e:964b with SMTP id
 d9443c01a7336-2074c6ae1b8mr29905655ad.39.1726009091533; Tue, 10 Sep 2024
 15:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com>
 <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 15:57:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
Message-ID: <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: ti-sn65dsi86: annotate
 ti_sn_pwm_pin_{request, release} with __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 10, 2024 at 3:04=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Building with clang, W=3D1, CONFIG_PM=3Dn and CONFIG_OF_GPIO=3Dn leads to
> warning about unused ti_sn_pwm_pin_request() and
> ti_sn_pwm_pin_release(). Fix by annotating them with __maybe_unused.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm happy to land this in drm-misc-next unless there are any extra
dependencies. Let me know. In some sense I guess this could even be
considered a "Fix", though I guess given the history of the compiler
options that might be a bit of a stretch.

-Doug
