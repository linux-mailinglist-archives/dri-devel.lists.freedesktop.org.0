Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6824F9B6018
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 11:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACA210E775;
	Wed, 30 Oct 2024 10:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V9oUKfl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7126610E775
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:28:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2FF1A8F;
 Wed, 30 Oct 2024 11:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730284130;
 bh=2m9U0YPyqIjiMux/kzHNN8MUjFxqTrUHxENOWudqImM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V9oUKfl3sIB+kSqLHoxezWGdbKNSlzWNzU0CMhVya0AcOmZB/EgGemyImMbtojmRy
 +sSIkQOU4a6vd4hTb7gOwLFs7XZiDRLS++XNvNc7KKFTJa8/kxruuhLkdQ4g1QL4mn
 ry6RGG4MOdXgDb07CDp/etOd3nZsBYjZHjfk0vqo=
Date: Wed, 30 Oct 2024 12:28:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <20241030102846.GB14276@pendragon.ideasonboard.com>
References: <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
 <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
 <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
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

On Wed, Oct 30, 2024 at 11:25:40AM +0100, Geert Uytterhoeven wrote:
> On Mon, Oct 28, 2024 at 2:34 PM Dmitry Baryshkov wrote:
> > On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> > > On Tue, Oct 22, 2024 at 12:12 AM Geert Uytterhoeven wrote:
> > > > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > > > > in the TI driver does sound like a good idea to me...
> > > > > > > >
> > > > > > > > Great!
> > > > > >
> > > > > > > With the I2C adapter numbers, that becomes:
> > > > > > >
> > > > > > >     /sys/bus/auxiliary/devices
> > > > > > >     ├── ti_sn65dsi86.gpio.1
> > > > > > >     ├── ti_sn65dsi86.pwm.1
> > > > > > >     ├── ti_sn65dsi86.aux.1
> > > > > > >     ├── ti_sn65dsi86.bridge.1
> > > > > > >     ├── ti_sn65dsi86.gpio.4
> > > > > > >     ├── ti_sn65dsi86.pwm.4
> > > > > > >     ├── ti_sn65dsi86.aux.4
> > > > > > >     └── ti_sn65dsi86.bridge.4
> > > > > > >
> > > > > > > > adapter->nr instead like other aux subsystems already do.
> > > > > >
> > > > > > Unfortunately the devil is in the details, as usual: there can be
> > > > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > > > so adapter->nr is not guaranteed to generate a unique name.
> > > > >
> > > > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > > > chip is always at bus address 0x2d so you can't have more than one on
> > > > > the same bus. Unless you added something funky atop it (like a mux of
> > > > > some sort) you might be OK.
> > > >
> > > > It's 0x2c on mine ;-)
> > > >
> > > >     8.5.1 Local I2C Interface Overview
> > > >     The 7-bit device address for SN65DSI86 is factory preset to 010110X
> > > >     with the least significant bit being determined by the ADDR control
> > > >     input.
> > >
> > > Doh! I missed that in my search of the doc. I guess because they
> > > decided to specify the address in binary in that part so my searching
> > > for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> > >
> > > > > > Changing the auxiliary bus to use the parent's name instead of the
> > > > > > module name, as suggested by Laurent, would fix that.
> > > > >
> > > > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > > > > we had a second on i2c bus 4, we'd have:
> > > > >
> > > > >     /sys/bus/auxiliary/devices
> > > > >     ├── 2-002d.gpio.0
> > > > >     ├── 2-002d.pwm.0
> > > > >     ├── 2-002d.aux.0
> > > > >     ├── 2-002d.bridge.0
> > > > >     ├── 4-002d.gpio.0
> > > > >     ├── 4-002d.pwm.0
> > > > >     ├── 4-002d.aux.0
> > > > >     └── 4-002d.bridge.0
> > > > >
> > > > > ...and I think that's guaranteed to be unique because all the i2c
> > > > > devices are flat in "/sys/bus/i2c/devices".
> > > >
> > > > Correct.
> > >
> > > So given everything, using the dev_name() of the "parent" sounds
> > > pretty good and seems like it addresses everyone's concerns. Was there
> > > a part of the conversation where someone pointed out problems with it
> > > that I missed? Is the next step to post a patch implementing that?
> > > It'll change sysfs paths and dev names for everyone using AUX bus, but
> > > presumably that's OK?
> >
> > It also requires changing in the way the auxiliary_match_id() works.
> > Currently matching is done using modname + ID.
> 
> Right, so just using the parent's name instead of modname won't work,
> as the former is not a fixed string.
> 
> > So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
> > ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
> > match_id function, but they won't be that intrusive (one just has to
> > skip two parts of the name instead of skipping just one).
> 
> IMHO this is becoming too complex. What if the parent's name contains
> a period?
> 
> So just using ida_alloc() in the caller seems like the most
> straight-forward solution.

Why would we duplicate that in every user, when it should really be the
responsibility of the bus ? We need a better solution.

-- 
Regards,

Laurent Pinchart
