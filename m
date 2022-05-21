Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874352FDDB
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 17:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACA110E5B4;
	Sat, 21 May 2022 15:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746E810E5B4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 15:28:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h5so13904832wrb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=474y7UfCRTsp7NYIaB401zDajP8fumzJCkbTMejJvAo=;
 b=egau6YuJmG0rUfjr1WGwMPgtoGz0oaIp6jir0ySrR8KpYY3iin1mA0DLxw5CgXjfmc
 8Pg42jto7J+ozkNb9HbVEhYlqvqH4BtHlUo4rXCr+jAjl1tjQ2ZqgttnN4Izo2t40GST
 A1hfPqiAqa7o6bjunCs93ODy20hN4Cpze5TQGbYi+VaJFFKtO2caZKXJY+7oKTtEp5zC
 9xd+l7B+cLL4tJ/iq+Ao7KoFSdJ1b4E817c8IHf+et8KUEHpCwKk6SUslDlOyIuIeMAE
 ThymgL9Xn/M92z4lnjAsadLaBnXW4LW3XJpVntRz3gKqG8xXDKzwTh3ilh6Vhfblp+Gm
 wC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=474y7UfCRTsp7NYIaB401zDajP8fumzJCkbTMejJvAo=;
 b=IVEb9MKPD/PaAfHfQhzBYjwnC+I249tcCxmJuAzDAVIPnev/NMKi9mFkugfkswlIMv
 uOKVZ33Ml6jphejzFZI2+zMjqzx0CfLj9TqrVNukhwXlRtWFN6FDIsL/2L9aeE+90d+Q
 oaXmVyo5TGnLffDG6KCgtBgFelfWyi9aZW7vNhdfInoqc6X+URcSFtBXQiDpRcNdr5xg
 8Q3ZWfZVzzog3kKeH6FfeVIIBJtqO1JAq1Mwop42zaoC6+vsOjrTd6tjUPuZAK7M3Nbn
 f2b3Qy06PbPL3CA1zfCI0jKZixkJR2dhlaBgfx2tFAze+XzloE5/v+7bk3XHuwRT68DB
 jqyw==
X-Gm-Message-State: AOAM531LH54y6LbdRfRS4vOtanhzREVa+BM6WTNUoxqxhkAWLpqRQ+eo
 S3fzgEY5csvQIzhwQvsFHS6l83ux5MuULNNKKBo=
X-Google-Smtp-Source: ABdhPJy1gy3TcT6tbHE9HFuEjS++I3T9N2yFEV3c8NSNJllsZt4VZryxiLQf35/3BKKO+BCfqLJt0T3F6KUfSvF/NSQ=
X-Received: by 2002:a5d:598c:0:b0:20c:6912:6870 with SMTP id
 n12-20020a5d598c000000b0020c69126870mr12311621wri.465.1653146934778; Sat, 21
 May 2022 08:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220417181538.57fa1303@blackhole>
 <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
 <CA+E=qVdEtx8wVbcrMQYGB1ur1ykvNRp1L174mVSMkB0zeOPYNQ@mail.gmail.com>
 <20220428175759.13f75c21@blackhole.lan>
 <CA+E=qVcNasK=q8o0g1teqK3+cD3aywy+1bgtTJC4VvaZvfZtGA@mail.gmail.com>
 <20220519153952.7c6c412b@blackhole>
In-Reply-To: <20220519153952.7c6c412b@blackhole>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 21 May 2022 08:28:27 -0700
Message-ID: <CA+E=qVeQNy3ACATMq+HPqx9Anxm1U_X2mWPo8J4_3yxiKBn9Pg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix anx6345 power up sequence
To: Torsten Duwe <duwe@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 6:40 AM Torsten Duwe <duwe@lst.de> wrote:
>
> On Wed, 18 May 2022 09:53:58 -0700
> Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> > On Thu, Apr 28, 2022 at 8:58 AM Torsten Duwe <duwe@lst.de> wrote:
>
> > > power on the eDP bridge? Could there be any leftovers from that
> > > mechanism? I use a hacked-up U-Boot with a procedure similar to the
> > > kernel driver as fixed by this change.
>
> I was asking because I recall an ugly hack in some ATF code to power up
> the chip correctly. Did you patch ATF, and maybe call functions of it
> at runtime?

Initially it's powered on by ATF on system power up. ATF parses DTB
and finds the regulators that it needs to enable and enables them.
It's done in ATF because u-boot SPL didn't have enough space to fit in
the AXP803 driver. It's only done at startup and once linux takes
over, ATF doesn't touch these regulators.

> > >
> > > But the main question is: does this patch in any way worsen the
> > > situation on the pinebook?
> >
> > I don't think it worsens anything, but according to the datasheet the
> > change makes no sense. Could you try increasing T2 instead of changing
> > the power sequence?
>
> According to the datasheet, there is also T3, I realise now. The
> diagram talks about "System Clock", but both Teres and Pinebook have a
> passive resonator circuit there. Correct me if I'm wrong, but without
> chip power, there is little to resonate. What if that driving clock
> circuit is powered by Vdd25? Maybe the earlier provision of 2V5 is
> enough for Teres' Q4, but Pinebook X4 takes even longer? The start-up
> times can be in the range of milliseconds.

That's plausible, but can you please try just increasing the delays
without changing the power sequence?

>         Torsten
