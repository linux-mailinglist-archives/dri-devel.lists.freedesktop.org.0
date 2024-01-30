Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA3841F51
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 10:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3137112E85;
	Tue, 30 Jan 2024 09:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91A112E85
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 09:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9211D601BE;
 Tue, 30 Jan 2024 09:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72015C43390;
 Tue, 30 Jan 2024 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706606646;
 bh=WTPD0u8lNCTsfkYlNmFQbgM3oe0GIKson6ZShvZ71kw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VnwWbdZnWEdUqlcs1nDlVIFBIRrbma+J9F81Qf9TjbfM3GTI4/Ltn0hn/bjFbbXto
 xfMGOo3Cl7eIQQfodxaGE5D0m5gKrbhIkFJE4bxUOdjGYo2F3JN0vLAdvvmhNiziOk
 hlqZMKDZG5lZ0AdIagtzaWNVmWEkli9NdCb4wB16Z2WW+LA0aVOuo0tjHNZAcA1dwb
 0dE95dOy+teCDMIjKQUm5VkyBrZJ2LrFL0h1HLNQ1FAkPfYHTeIWDtlx4VrR3lVPth
 krAJuIKYQhA3KHzwyODPPmz4a6UmwwVf9Gja8ih/Y0s94zSoc/Axg9RmQQCEee5rzC
 ObS0JSRS9ihIA==
MIME-Version: 1.0
Date: Tue, 30 Jan 2024 10:24:00 +0100
From: Michael Walle <mwalle@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <CABGWkvp5Xx61h+sfKotb=jsQE3jPXP0bJfTtb1k9_OCH-TzTvQ@mail.gmail.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
 <b18d88302acfca001a6693d78909bc2a@kernel.org>
 <31e1a38a1d012a32d6f7bc8372b6360e@kernel.org>
 <CABGWkvp5Xx61h+sfKotb=jsQE3jPXP0bJfTtb1k9_OCH-TzTvQ@mail.gmail.com>
Message-ID: <25f0cdf7305eac946629895179be8f2b@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Inki Dae <daeinki@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Dave Airlie <airlied@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

>> >> Just FYI this conflictted pretty heavily with drm-misc-next changes in
>> >> the same area, someone should check drm-tip has the correct
>> >> resolution, I'm not really sure what is definitely should be.
>> >
>> > FWIW, this looks rather messy now. The drm-tip doesn't build.
>> >
>> > There was a new call to samsung_dsim_set_stop_state() introduced
>> > in commit b2fe2292624ac (drm: bridge: samsung-dsim: enter display
>> > mode in the enable() callback).
>> 
>> I had a closer look at the latest linux-next (where somehow my patch
>> made it into) and tried to apply commit b2fe2292624ac (drm: bridge:
>> samsung-dsim: enter display mode in the enable() callback). It looks
>> like only the following hunk is still needed from that patch. 
>> Everything
>> else is covered by this fixes patch.
>> 
>> Dario, could you rebase your commit onto this patch? I had a quick 
>> test
>> with this change and it seems to work fine for our case.
>> 
>> --snip--
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 63a1a0c88be4..92755c90e7d2 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1498,6 +1498,8 @@ static void samsung_dsim_atomic_disable(struct
>> drm_bridge *bridge,
>>          if (!(dsi->state & DSIM_STATE_ENABLED))
>>                  return;
>> 
>> +       samsung_dsim_set_display_enable(dsi, false);
>> +
>>          dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>>   }
>> 
>> @@ -1506,8 +1508,6 @@ static void
>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>   {
>>          struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>> 
>> -       samsung_dsim_set_display_enable(dsi, false);
>> -
>>          dsi->state &= ~DSIM_STATE_ENABLED;
>>          pm_runtime_put_sync(dsi->dev);
>>   }
>> --snip--
>> 
>> -michael
> 
> I'm sorry, but I didn't understand well what I have to do.

Basically, just rebase your patch (drm: bridge: samsung-dsim:
enter display mode in the enable() callback) on top of
linux-next.

> This is what I have done:
> 
> git clone 
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> cd linux-next
> # add your changes, the ones of the emails
> git am --reject 
> 0001-drm-bridge-samsung-dsim-enter-display-mode-in-the-en.patch
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 92755c90e7d2..b47929072583 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1508,6 +1508,9 @@ static void
> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>  {
>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> 
> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> +               samsung_dsim_set_stop_state(dsi, true);
> +

This one should be removed. There is no stop state anymore.
With that hunk, it doesn't compile anyway.

>         dsi->state &= ~DSIM_STATE_ENABLED;
>         pm_runtime_put_sync(dsi->dev);
>  }
> 
> And then test the driver for my use case.

Yes. The hunk I've posted above, should be all what's left
of your patch, because as far as I see it, most of your changes
are already contained in my fixes patch. What's left is that
you disable the video mode in .disable() and not in
.post_disable().

-michael
