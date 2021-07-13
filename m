Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F363C7159
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E236E092;
	Tue, 13 Jul 2021 13:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81DD6E092
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:41:16 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 201so7500131qkj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vLkS8he1bc7Cmh6yyqncyHjSKkBroAx2qiGQQkmeSgE=;
 b=G6nXn9w5QrREJfLwC4YiSeL105e5K/Qj9voXl1D7Hn7yXZYmyV7BuUuk8b/RxMb8gZ
 mN8sBsBj637g6rXMobZkIO3u87nyfOu1XImkt1jtpAPQL0DrxC3Bmim46FvTj1xaNVGf
 ErbXnNU1epcRtd2zGSxW7gIY9nDszcpXAMk0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vLkS8he1bc7Cmh6yyqncyHjSKkBroAx2qiGQQkmeSgE=;
 b=oPwOP2ln5Ny/E/B4aLkxRhMFe2TGMKXYq4hyyLgpCFx4wl30Qs0irajZro394GE1hl
 yIzd8mlTcYxUSKCc/pW/sQLeidJqeq23X2mUPwTyk3Yx6wm5hhxf3LVnwFfRpw3huNwl
 c1hXRnbYiw3wk76HKrkQe0pfLwm0JWsQUQHnhF0BCwTP3krTFnNm75aP73/Z8ZFRSGqi
 ALCS7Kx/zVdzWs/aGvYS1BjyeYMobb79wepsTmsFhJIj/lPFOGIRV3dWxXGS8AURREdJ
 O4LUYUT7efhoSeZPJcIUXByz53XZfSW6uNrDi2YEbq6RgHB3Sj/MWjWSUWKFVqM/sifr
 GzBg==
X-Gm-Message-State: AOAM530BnNjWA0DH7Y9ifolmINHQF0wgsb0ohZRW++z0kZ9VJe4k2mbp
 kyf2TD50EjmC1UyFY4qGOH2ZjdVLWItjKQ==
X-Google-Smtp-Source: ABdhPJz51psBFDd6oD3VNN5EOQHlMyXAfEUUxfIIB2sQ2fk/mn0Ul8I1IDSY1E3ctyVzC6RkMuarbA==
X-Received: by 2002:a37:9cb:: with SMTP id 194mr4248464qkj.275.1626183675319; 
 Tue, 13 Jul 2021 06:41:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id r16sm1297565qke.73.2021.07.13.06.41.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 06:41:14 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id v189so26338617ybg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:41:13 -0700 (PDT)
X-Received: by 2002:a25:ae14:: with SMTP id a20mr5690442ybj.41.1626183673327; 
 Tue, 13 Jul 2021 06:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210712075933.v2.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid>
In-Reply-To: <20210712075933.v2.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jul 2021 06:41:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wn1GU51vqBUZAt4b-_CE4qJpj+Himm8B9CBSn0L6P2XA@mail.gmail.com>
Message-ID: <CAD=FV=Wn1GU51vqBUZAt4b-_CE4qJpj+Himm8B9CBSn0L6P2XA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: Move panel DP AUX backlight support to
 drm_dp_helper
To: Lyude Paul <lyude@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Robert Foss <robert.foss@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Rajeev Nandan <rajeevny@codeaurora.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 12, 2021 at 8:02 AM Douglas Anderson <dianders@chromium.org> wr=
ote:
>
> We were getting a depmod error:
>   depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
>
> It looks like the rule is that drm_kms_helper can call into drm, but
> drm can't call into drm_kms_helper. That means we've got to move the
> DP AUX backlight support into drm_dp_helper.
>
> NOTE: as part of this, I didn't try to do any renames of the main
> registration function. Even though it's in the drm_dp_helper, it still
> feels very parallel to drm_panel_of_backlight().
>
> Fixes: 10f7b40e4f30 ("drm/panel: add basic DP AUX backlight support")
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Note that I've compile tested this, but I don't have a device setup
> yet that uses this code. Since the code is basically the same as it
> was this should be OK, but if Rajeev could confirm that nothing is
> broken that'd be nice.
>
> Changes in v2:
> - Guard new functions by the proper configs.
>
>  drivers/gpu/drm/drm_dp_helper.c | 113 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_panel.c     | 108 ------------------------------
>  include/drm/drm_dp_helper.h     |  16 +++++
>  include/drm/drm_panel.h         |   8 ---
>  4 files changed, 129 insertions(+), 116 deletions(-)

Pushed to drm-misc-next with Rajeev's review:

072ed3431f5b drm/dp: Move panel DP AUX backlight support to drm_dp_helper

-Doug
