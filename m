Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1714105E3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 12:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E196E069;
	Sat, 18 Sep 2021 10:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD096E069
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 10:09:47 +0000 (UTC)
Date: Sat, 18 Sep 2021 10:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631959784;
 bh=ll76qEOcSNUelo48U9giKZcgjKv2TvO6dO9wfmqe3Tw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Exeu9UjVmYb6a92oBaXroqz9i0sHon9RfEQajsBcFD4HXM2VlKjtvc/gQ0/Kkxmh7
 3HJ6LeI3T/fCfBiX0I3ZxJLSSARj9SfEMzRuxghRV43u5I3Ndbma+BEifBFxTlXNKV
 jyks0DWsoBhvh0unw0D68qj8muLKQZrxfzSJ7Dk+nHRDzPw6kO663NhkeQkmetREwc
 jl7m0vg+KGwvrr0W6Hx8B/nwmse7NphAd/QMul3VeR9Hart2K8FXdRuAOu5kcs44jy
 xzBTm/oepQSFx+Gi1w1WYz22k9msoFxgJaaVQI5t0hIzltP0ma66U1yTPBvgW1IKeS
 uF+6D+yjqjiKA==
To: Michael Stapelberg <michael@stapelberg.ch>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org,
 felix.kuehling@amd.com, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
Message-ID: <Ec7qdLcYN_zNMfyzQd3VwYIsEfepGv3fZRaXbIOUgb6P5Ot2J36V9bXRmfAg70ThbtKNEulHf1eh7tQa71nBeGgUWQJSJ-5ePphoNsdwKkc=@emersion.fr>
In-Reply-To: <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Emma and Maxime

On Saturday, September 18th, 2021 at 11:18, Michael Stapelberg <michael@sta=
pelberg.ch> wrote:

> Hi,
>
> torvalds at linux-foundation.org (Linus Torvalds) writes:
> > Did I fix it up correctly? Who knows. The code makes more sense to me
> > now and seems valid. But I really *really* want to stress how locking
> > is important.
>
> As far as I can tell, this merge conflict resolution made my Raspberry
> Pi 3 hang on boot. You can find the full serial console output at:
>
> https://t.zekjur.net/linux-5.14-raspberry-pi-3-hang-vc4.txt
>
> The last few messages are from vc4, then the boot hangs.
>
> Using git-bisect, I tracked this down to
> https://github.com/torvalds/linux/commit/e058a84bfddc42ba356a2316f2cf1141=
974625c9,
> which is the merge you=E2=80=99re talking about here, AFAICT.
>
> I also tried the git://anongit.freedesktop.org/drm/drm, and that tree
> boots as expected, suggesting that the problem really is with the
> additional changes.
>
> The code seems to work on my Raspberry Pi 4, just not on the Raspberry
> Pi 3. Any ideas why that might be, and how to fix it?
>
> Thanks!
>
> --
> Best regards,
> Michael
