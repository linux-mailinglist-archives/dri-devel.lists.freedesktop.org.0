Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB277E0615
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 17:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CCC89209;
	Fri,  3 Nov 2023 16:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260A389209
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 16:02:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so447697566b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699027366; x=1699632166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=griz2BFiZEJVkDOK8xMpjXUbb64ilzQ2lF7lpZbQxN0=;
 b=VSnunqm5X3AeknWapP+NMz2TgEllWjS1AsxGjTsx7ssb55gb6BUwCrjIc14MIEXG1s
 /s1vWUDQaeSq0N5956w7V+EA/PQIpgd4zZD2czf3T1W3MMDofsfIqlA2hwiHz1Szots7
 JCP2ORUnSRe4qU19fZqWTRGkT0ZWaRnJbesBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699027366; x=1699632166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=griz2BFiZEJVkDOK8xMpjXUbb64ilzQ2lF7lpZbQxN0=;
 b=SgEmxbrxF5inqhRBimU5sjPKvQ+w9JoW77xLyhFjIeVjVFCsgts19ccpxqPhPhVh6D
 cc4QWy74WzGPRnw/FxiTr8p1Ly2YsAFu/nSuVeMkMX4nRwDdiBrcFLEn5omI5jUtpjWz
 GS37Xp2hTcHa/cu6QEYRO7Wa5k+Tzlpu8CxbClUSTCuMaQ1juSbWeeDt33kM+L7SYxyG
 Ta7yLPQIfg0oxoaJe3pecNn1Eac0jKnB+2LClxkDJMzNdaOduo7eRLod4Jd5XbUvJoW6
 9Vw3H9WlZbHPhHlosk3tFGs7M3MxOcmXBA0PGpsT2a5/bSJgf3WCAUy0VA2Yu3P+sszP
 hN8g==
X-Gm-Message-State: AOJu0YwDNw0c1LS4a+bZhEGp77iRtokvP44cGULiLdi9nD6l/elLIx6Y
 XUh6OgVIx2OKtjgciXpXsh7ZrR54ILyL70EyP1j1DOJt
X-Google-Smtp-Source: AGHT+IEXWJ8XUz/WLcXuUvXVQYRIcNm0L4n1sJK3qVLEDF9WqxBL7OEHtR10EJMCejZFHbAwnUYh6w==
X-Received: by 2002:a17:906:af89:b0:9b2:b37d:17ff with SMTP id
 mj9-20020a170906af8900b009b2b37d17ffmr2359111ejb.19.1699027366415; 
 Fri, 03 Nov 2023 09:02:46 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 uz12-20020a170907118c00b0099bcd1fa5b0sm1041308ejb.192.2023.11.03.09.02.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 09:02:45 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so72605e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:02:45 -0700 (PDT)
X-Received: by 2002:a05:600c:1c26:b0:404:74f8:f47c with SMTP id
 j38-20020a05600c1c2600b0040474f8f47cmr179376wms.5.1699027365615; Fri, 03 Nov
 2023 09:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231102221309.1971910-1-hsinyi@chromium.org>
 <20231102221309.1971910-4-hsinyi@chromium.org>
In-Reply-To: <20231102221309.1971910-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Nov 2023 09:02:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUNdSzppccDO=y0iu_QR8nEe3poRLMmWvFMfZsnWZo4A@mail.gmail.com>
Message-ID: <CAD=FV=VUNdSzppccDO=y0iu_QR8nEe3poRLMmWvFMfZsnWZo4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/modes: Add a function to clear preferred modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 2, 2023 at 3:13=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> Add a function to clear the preferred bit of a connector's existing modes=
.
> This is useful for edp panel to unset the preferred modes read from edid
> if the panel has hard-coded modes.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> - fix doc string (reported by kernel test robot).
> - split mode and panel patches.
> ---
>  drivers/gpu/drm/drm_modes.c | 16 ++++++++++++++++
>  include/drm/drm_modes.h     |  1 +
>  2 files changed, 17 insertions(+)

This seems fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Since it introduces a new API to the core and Hsin-Yi and I work
directly together, I'd probably give this ~2 weeks on the list before
landing so there is adequate time for people to comment. That'll be
right in the middle of Plumbers, though, so it might be more like 3
weeks. If someone non-ChromeOS wants to review and/or apply sooner, I
certainly wouldn't object.
