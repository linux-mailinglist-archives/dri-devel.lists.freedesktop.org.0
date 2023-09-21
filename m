Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B607A9B30
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F3210E5E9;
	Thu, 21 Sep 2023 18:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B7110E5E9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:55:23 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-502a4f33440so2346409e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695322521; x=1695927321;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brAzGA2XEfmHNJOmgEz0xYZn4CECqGMWBMjfuyGkpN0=;
 b=bCv3b+gTJxxyJR2kslOdrQcGDxCVNG89u8aVjoplHIjbcjRC6g6zdDXEjJnhkVZTuQ
 aaLGXtxFw6qMHr8xpAGsEJ+fTWsY3c/JqX7A8DcwlWB8eDuEjnasM2H+HPXern64Cjx2
 N57+g/Wn81gZMoVdhKf2TVjnzbEIluEUwExpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322521; x=1695927321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brAzGA2XEfmHNJOmgEz0xYZn4CECqGMWBMjfuyGkpN0=;
 b=mPHd2cQUFUHNRBYgHDDOo5jbzCzKVZZ3tn5zT3gHpnd50mSgX0921iDGOa4Kh2VGF4
 78hNyhm3o7qWeGjOhOSxTDwI8HiuJzDGcTvS4kRPzdUOVTXp8WbwytMEZJ1cUW89JKM/
 YjFg6FQ+bj28nyTibnvkSXTzWdmx9NNTi8FHHlY0IMtCVyyIWWTEZhoKvMYVkOiOjpZW
 XyRU/dB+xS6sVdLUP/4pcpInuqHJflwoUYCM7rb5vqXmDxv9NE2G54zW2mF873vX3nhz
 ajYgUggIZTw/bUlzUm+uwhJWeYOgWybHRWCuj/7FaPS8EHlHN7bDKw7YdMqp2praySa8
 DEgw==
X-Gm-Message-State: AOJu0Yy9ZeL+y3y9J+yBkke9YTdx5b6EsBkPB8SQ/FLEJSHhCqdvu3lu
 TDFWcibZK770l1S8Si8ATKPxanxL0GaD4xiTU2LnpXZO
X-Google-Smtp-Source: AGHT+IHov4lg92HaIgl1WdVSG5W8Djwt4Td8aA6obog8ft9zB3Y3HDmmAQmedBSnAA7iXdnuQOptbg==
X-Received: by 2002:a05:6512:2152:b0:500:b7ed:105a with SMTP id
 s18-20020a056512215200b00500b7ed105amr5401996lfr.29.1695322521195; 
 Thu, 21 Sep 2023 11:55:21 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 k2-20020aa7d8c2000000b0052f3051f7d2sm1169763eds.80.2023.09.21.11.55.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:55:20 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-404f881aa48so21065e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:55:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4c19:b0:3fe:d691:7d63 with SMTP id
 d25-20020a05600c4c1900b003fed6917d63mr120103wmp.6.1695322093885; Thu, 21 Sep
 2023 11:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
In-Reply-To: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:48:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vvqd76m-i2vbpVoiTir18S4ceFTd17nGdH1yU+9jhfDw@mail.gmail.com>
Message-ID: <CAD=FV=Vvqd76m-i2vbpVoiTir18S4ceFTd17nGdH1yU+9jhfDw@mail.gmail.com>
Subject: Re: [RFT PATCH 5/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown/remove time for misc drivers
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: mcoquelin.stm32@gmail.com, jfalempe@redhat.com, yannick.fertre@foss.st.com,
 linux-aspeed@lists.ozlabs.org, emma@anholt.net,
 raphael.gallais-pou@foss.st.com, andrew@aj.id.au, jyri.sarha@iki.fi,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 hdegoede@redhat.com, tzimmermann@suse.de, joel@jms.id.au,
 tomi.valkeinen@ideasonboard.com, airlied@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:41=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver remove (or unbind) time. Among other things, this means
> that if a panel is in use that it won't be cleanly powered off at
> system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart and at driver remove (or unbind) time comes
> straight out of the kernel doc "driver instance overview" in
> drm_drv.c.
>
> A few notes about these fixes:
> - I confirmed that these drivers were all DRIVER_MODESET type drivers,
>   which I believe makes this relevant.
> - I confirmed that these drivers were all DRIVER_ATOMIC.
> - When adding drm_atomic_helper_shutdown() to the remove/unbind path,
>   I added it after drm_kms_helper_poll_fini() when the driver had
>   it. This seemed to be what other drivers did. If
>   drm_kms_helper_poll_fini() wasn't there I added it straight after
>   drm_dev_unregister().
> - This patch deals with drivers using the component model in similar
>   ways as the patch ("drm: Call drm_atomic_helper_shutdown() at
>   shutdown time for misc drivers")
> - These fixes rely on the patch ("drm/atomic-helper:
>   drm_atomic_helper_shutdown(NULL) should be a noop") to simplify
>   shutdown.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  7 +++++++
>  drivers/gpu/drm/mgag200/mgag200_drv.c   |  8 ++++++++
>  drivers/gpu/drm/pl111/pl111_drv.c       |  7 +++++++
>  drivers/gpu/drm/stm/drv.c               |  7 +++++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 11 ++++++++++-
>  drivers/gpu/drm/tve200/tve200_drv.c     |  7 +++++++
>  drivers/gpu/drm/vboxvideo/vbox_drv.c    | 10 ++++++++++
>  7 files changed, 56 insertions(+), 1 deletion(-)

Landed on drm-misc-next:

3c4babae3c4a drm: Call drm_atomic_helper_shutdown() at shutdown/remove
time for misc drivers
