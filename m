Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD774235C3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BE16E4BA;
	Wed,  6 Oct 2021 02:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C196E4BA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:20:15 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id d11so1301898ilc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qw5ALBDvPGn69OlbxmlXviRczREpAygguJSlIswWdLw=;
 b=gouZhV8KTp3FExHNgmSHQ9NHjT/H6/1XmoQCCbIXdLmuBMdoHLkUyKYpnhvJm5m9TR
 mCA9H/CGQFKjUHotNj3soqKVAz3xOTjg+B2dFqVtFImI8FxSasJg8IyJKA0a6hAapP8L
 BMiPDMN9+TBopb54525kdJsgwGGqZLTPYFYaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qw5ALBDvPGn69OlbxmlXviRczREpAygguJSlIswWdLw=;
 b=nGwmgKrJPrr+Vsz1hxaI6uGgQIE9+pSamT7jc1q1rtWDpjpzPZTvx7jKImyDzgGyMA
 4ymGmGWpLRkFLLxUh5vr+eX9r3HV/i3ayhvXl9kMubceRGOIGBtnVkGarYBvCzEGvi0e
 6HGxO6V88xSjB7AfCGkmuSB/z1sbkRGKNXl6r6g9mz4EAyPFYKs0bJqQTImjLA2qbfED
 iM5U3ik5AvHErIreZ5MhZbktE854lbLDQgvumltLFDxp3JGlhZHPHLFnUthqJ19+h3J0
 s7+j9Lk6MNy+Pny8xXLrWgLA7Whqo16BvzO47gfSZoPuzM+VDvSVMR6cK5INkfQ9yc0J
 kFuw==
X-Gm-Message-State: AOAM531BPmOrURkwrw9AUQoXV4oufweh3lQm4wdKqwJ6+djPf3fs2o9u
 tHjpFytDjEgP9+sF2WfRYXQ3t1eMndHw/w==
X-Google-Smtp-Source: ABdhPJyg0UyZ1Nf/HdffTjjswuvjF1gpDpHNxPHYg4XuFHxPlmJwroLmpBrZMtd5YFQVXUgBtRRonA==
X-Received: by 2002:a92:d487:: with SMTP id p7mr5481456ilg.130.1633486814635; 
 Tue, 05 Oct 2021 19:20:14 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id s11sm10816015ilv.69.2021.10.05.19.20.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 19:20:13 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id b6so1381993ilv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:20:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:17ce:: with SMTP id
 z14mr5414711ilu.120.1633486812940; 
 Tue, 05 Oct 2021 19:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <YVyAutDoR4otVBS9@intel.com>
In-Reply-To: <YVyAutDoR4otVBS9@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Oct 2021 19:20:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UD0BN55DCCRdFqpvsh9bCnKx0hpoc=5Fqc1F9qDXbyjA@mail.gmail.com>
Message-ID: <CAD=FV=UD0BN55DCCRdFqpvsh9bCnKx0hpoc=5Fqc1F9qDXbyjA@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <oliver.sang@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Tue, Oct 5, 2021 at 9:43 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Mon, Oct 04, 2021 at 09:21:27AM -0700, Douglas Anderson wrote:
> > In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> > the EDID") I broke out reading the base block of the EDID to its own
> > function. Unfortunately, when I did that I messed up the handling when
> > drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> > when we went through 4 loops and didn't get a valid EDID. Specifically
> > I needed to pass the broken EDID to connector_bad_edid() but now I was
> > passing an error-pointer.
> >
> > Let's re-jigger things so we can pass the bad EDID in properly.
> >
> > Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> A bit of historical fallout zone this part of the code. So
> not the easiest thing to read in general. But looks like what
> you have here should work.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks! Pushed to drm-misc/drm-misc-next:

e7bd95a7ed4e drm/edid: Fix crash with zero/invalid EDID
