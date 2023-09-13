Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42079F11B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE9C10E4DA;
	Wed, 13 Sep 2023 18:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434710E4DA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:29:09 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-501ce655fcbso124416e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629747; x=1695234547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukvdFrW0mu6Dhs/IRD1IZUwR2wIREV2auFM3wAgq3Xs=;
 b=KBXz5utCIxmbY/5z+KsPB4oEvMbPC0XGUvp1JxEyAu5ilMf/+LtG9bZ8+YDkI8Ca0x
 Dl2oS65U8hoD82EkfUFjsD3Sjh1CaDhg1/RIO9BhFLaa9ldUNUIpDRRCpk7VKZcjff8g
 Es8InQNlr575yQ7JacclXT08zz+1ylQ16PAsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629747; x=1695234547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ukvdFrW0mu6Dhs/IRD1IZUwR2wIREV2auFM3wAgq3Xs=;
 b=knqGot+vaSdbGpe0dzJGYLtf2kwoNif48lKtJJ4JEXRa61HncEOt6mNrat4PihQ5Ek
 qq/vXJ5slupSk/3yTzOBTeQJEAIPV8TEQxCK5o0DSVs6v6Jp9BelGcRkmFxoG/lIq4Rr
 8y8qIe3Imn1hkfqPOZjeG0rAt2K9dyHnlVchjlQZ7Ifp2K8Rl6ce6+JWYcGBqC40nJWD
 hsaoL6MDD5e3p1U3zgGUQYcK690AQR9+pK8qfoTjQVMvfHCQIabAkMZ3edtwQ7UhI/4N
 E/UbkeZe1pNtAFyrjXYxPiMSVM25OeK7k+k43FcwnDBmID8bQFV57i6VynsYMMzDUXqr
 VIqw==
X-Gm-Message-State: AOJu0YxeqvV6TUTKXlVQSt0N8hxXZanl88sr7dpem6tYyWpZKtzKilDD
 4To5/4T1NjgHV6mQ/LYFfXCK1gaFmZAsao+IL/fgnyyl
X-Google-Smtp-Source: AGHT+IFsXNOjSJ4ZN8Pw1Dy+mfuXNYotRrc72UkTqCkWrbtVW2cg9RfymeHofx1SN/JU1034yR7q8w==
X-Received: by 2002:a05:6512:2386:b0:4fe:5741:9eb9 with SMTP id
 c6-20020a056512238600b004fe57419eb9mr3421739lfv.49.1694629747247; 
 Wed, 13 Sep 2023 11:29:07 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 o3-20020ac24343000000b004fdb85646f1sm2239090lfl.201.2023.09.13.11.29.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:29:06 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5009687f822so598e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:29:06 -0700 (PDT)
X-Received: by 2002:a19:a40a:0:b0:502:cdb6:f316 with SMTP id
 q10-20020a19a40a000000b00502cdb6f316mr106284lfc.3.1694629746197; Wed, 13 Sep
 2023 11:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
 <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
 <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
 <xtyiu2i2m2xokxfrgwocdcw4sy2oreszgwczmbnfvp4kbmrdvb@vr5huyfhmmmh>
In-Reply-To: <xtyiu2i2m2xokxfrgwocdcw4sy2oreszgwczmbnfvp4kbmrdvb@vr5huyfhmmmh>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:28:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UfxdK9PsungMC0EiPvfPN7O+SVPq+CdCZ44GQyjwfmqQ@mail.gmail.com>
Message-ID: <CAD=FV=UfxdK9PsungMC0EiPvfPN7O+SVPq+CdCZ44GQyjwfmqQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 7, 2023 at 7:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> > a) Block landing the change to "panel-tdo-tl070wsh30.c" until after
> > all drivers properly call drm_atomic_helper_shutdown().
>
> I don't think we care about all drivers here. Only the driver it's
> enabled with would be a blocker. Like, let's say sun4i hasn't been
> converted but that panel is only used with rockchip anyway, we don't
> really care that sun4i shutdown patch hasn't been merged (yet).

Yeah, I suppose that would work, though it would require a bit of
research. Some other things have popped onto my plate recently, but
for now I'm going to focus on seeing how much of the drivers can get
their shutdown fixed. When that stalls out then we can see if we can
unblock some of the panels by digging into which DRM drivers they're
used with.

Also, as my proposal in the cover letter [1], I'm leaving a breadcrumb
here that I landed the first 3 patches in this series just to get them
out of the way. Those 3 patches didn't depend on the resolution of the
issues discussed here.

[1] https://lore.kernel.org/lkml/CAD=3DFV=3DUFuUsrrZmkL8_RL5WLvkJryDwRSAy_P=
WTa-hX_p0dF+Q@mail.gmail.com/
