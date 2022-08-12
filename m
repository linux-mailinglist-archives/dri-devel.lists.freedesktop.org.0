Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD610590C69
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3794E12B425;
	Fri, 12 Aug 2022 07:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16CA45F6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 04:35:25 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31f41584236so192116337b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 21:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=m/u0OQNcK6WLQ8YRwiHl6NaU06ssTUJCYuMG15+ZS1k=;
 b=w3omfvsy9ZZIm8gFmEWlECrda6oZMt1vsZZQNNa7vA6YNhBRRfenX1dnMcRD7XxU8k
 5/I12jbJ+Kmw6PvZ2i9e4weOcxpl30w4qfWoe2AIiQAH4tqvzERwmWH93byasedP1NRH
 K0sgJRHdGRYPXyop74jnRos7N4WoFkuq+Yn9w2YjTdSzY3b5n04Q3cczBpwTGKERCrhr
 yfV2UPPyrywDcNGH7gtc9xI7cr43PftaQY8V/6M/Xh9Ab52KofQD03q3muGqrcQEnCvo
 pubG/ynkx4TMvQMHGiHyG5OvWKgbRVLGFshW5KhzePVEeCZ2EnA/dzvk29dRPwilyWzM
 KABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=m/u0OQNcK6WLQ8YRwiHl6NaU06ssTUJCYuMG15+ZS1k=;
 b=7Qvoear1ta8ezcgVYlt92AXXvi24t9a/XTPHW/6zrh+kF+ScqSCa0+w0y9TkBOYZvu
 6tveSdomruYcKi4AmtbwJmpO3IMivMkfCC2YuIU0EKwg9+9o1B4LLH+sP/KPbouVCdl1
 7iPb4uxqKhQBLFI6Zj2n/XlmlRMY2ZL+Z7L3weiW4EoinqUSD09YdWEO0zGhvSi0dwLH
 bablP/H+UbqZYByCbjUuqkc7P7nYDIxckOTRnTa5H6Mi3CcE3zbiW3mJL1I9AZn7OpWZ
 wv4Waw9qoi//NP5d3tqAVxZJkTaGGxsO3xvApAjaxSS72fqPvPethOwf4gnxoOgJ0N6i
 PTVQ==
X-Gm-Message-State: ACgBeo0vlbePG/fwmgCgEioxgoc+Sgme0MbuF7nnt/RVQbhG9JnnYva+
 RpnG/Eop0I5ur0AXKLvVRSGdM9VwMa90yWMuyqS69w==
X-Google-Smtp-Source: AA6agR5Pdd3iB2032+2rT25Yjp4RON2rJ1jN2byswnxfUC4cUX18fpGQ7WkZ/GY+xY3EQg3B/kDr1Cb0O6OMdTP0Y30=
X-Received: by 2002:a81:1ec4:0:b0:31d:e31f:1b6e with SMTP id
 e187-20020a811ec4000000b0031de31f1b6emr2294072ywe.11.1660278924132; Thu, 11
 Aug 2022 21:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
 <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
In-Reply-To: <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Fri, 12 Aug 2022 12:35:12 +0800
Message-ID: <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, tomba@kernel.org, airlied@linux.ie,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tony@atomide.com, linux-omap@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Ivaylo, Tomi

We have one X15 Android AOSP master build, it could not have the home
screen displayed
on the hdmi monitor connected with this change, with the following
message printed on the serial console
    [  607.404205] omapdrm omapdrm.0: Failed to setup plane plane-0
    [  607.410522] omapdrm omapdrm.0: Failed to setup plane plane-1
    [  607.416381] omapdrm omapdrm.0: Failed to setup plane plane-2
    [  607.422088] omapdrm omapdrm.0: Failed to setup plane plane-3

   # for details, please check the link here: http://ix.io/47m1

It will work with home screen displayed on the hdmi monitor if this
change is reverted.

Is this the broken problem you talked about here?

And could you please give some suggestions on how to have the x15
Android build work with this change?

Thanks,
Yongqin Liu
On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
>
>
> On 17.02.22 =D0=B3. 14:46 =D1=87., Tomi Valkeinen wrote:
> > Hi,
> >
> > On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> >> On devices with DMM, all allocations are done through either DMM or
> >> TILER.
> >> DMM/TILER being a limited resource means that such allocations will st=
art
> >> to fail before actual free memory is exhausted. What is even worse is
> >> that
> >> with time DMM/TILER space gets fragmented to the point that even if we
> >> have
> >> enough free DMM/TILER space and free memory, allocation fails because
> >> there
> >> is no big enough free block in DMM/TILER space.
> >>
> >> Such failures can be easily observed with OMAP xorg DDX, for example -
> >> starting few GUI applications (so buffers for their windows are
> >> allocated)
> >> and then rotating landscape<->portrait while closing and opening new
> >> windows soon results in allocation failures.
> >>
> >> Fix that by mapping buffers through DMM/TILER only when really needed,
> >> like, for scanout buffers.
> >
> > Doesn't this break users that get a buffer from omapdrm and expect it t=
o
> > be contiguous?
> >
>
> If you mean dumb buffer, then no, this does not break users as dumb
> buffers are allocated as scanout:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/om=
ap_gem.c#L603
>
> If you mean omap_bo allocated buffers, then if users want
> linear(scanout) buffer, then they request it explicitly by passing
> OMAP_BO_SCANOUT.
>
> Ivo



--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
