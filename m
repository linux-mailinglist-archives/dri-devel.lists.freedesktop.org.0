Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B04C36DF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3A410E12A;
	Thu, 24 Feb 2022 20:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADBC10E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 20:25:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7E57583CB7;
 Thu, 24 Feb 2022 21:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645734298;
 bh=1HGtKIHObBMGVHVf1PMb9sIEJB1VOD4ItqmlV4elTJw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dcKz5p61DCalFHaVzuAZZEanAKseu0jE+SxAJuvUjMDdJcAYK6JKPw7iby2V9MIBI
 0sFQRY6K3cdxb9Py47gZSTVbJjETfBwXUXmP5I1Q+Gk9i52cF8Fg0LILkDoYr+J4qk
 70Lw3PxViQmMrNhO2fp2ARW6Kclkz3E+g4rQlELzQKJl0oaQ2n5a+E0op9/Amr1KHd
 FnY4HMCbtNIuuHMlvAH5bm4Tz4WxjbQJWtD2sTZEWmBd9sadR2d4gsf4kv+4hRNnAf
 mt4FcMr98j2tfy7ku5Z40dXZodoH4PcN0sWyUg6Mj50Y/ANO2E3itThWt4Lp3VSRmR
 D+w26VO9gNqYg==
Message-ID: <1941db81-b2c2-58e5-40d7-47c5fe1fbd37@denx.de>
Date: Thu, 24 Feb 2022 21:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host
 HS clock from DSI bridge
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220219002844.362157-1-marex@denx.de>
 <20220224154010.n65epa73meznvwo3@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220224154010.n65epa73meznvwo3@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/22 16:40, Maxime Ripard wrote:
> Hi,

Hi,

> On Sat, Feb 19, 2022 at 01:28:37AM +0100, Marek Vasut wrote:
>> This patch series attempts to address a problem of missing support for DSI
>> bridge-to-bridge or panel-to-bridge clock frequency negotiation. The problem
>> has two variants.
>>
>> First, a DSI->to->x bridge derives its own internal clock from DSI HS clock,
>> but the DSI HS clock cannot be set to arbitrary values. TS358767 is one such
>> bridge in case it operates without Xtal. In that case, the TC358767 driver
>> must be able to negotiate the specific suitable DSI HS clock frequency for
>> the chip.
>>
>> Second, both DSI->to->x bridges and DSI hosts currently calculate, or rather
>> guess and hope they both guess the same number as their neighbor, the DSI HS
>> clock frequency from form of PLL=(width * height * bpp / lanes / 2). This is
>> dangerous, since the PLL capabilities on both ends of the DSI bus might differ
>> and the DSI host could easily end up generating wildly different clock than
>> what the DSI bridge/panel expects to receive.
>>
>> This series attempts to address these negotiation problems by extending the
>> existing .atomic_get_input_bus_fmts callback into .atomic_get_input_bus_cfgs
>> callback in struct drm_bridge_funcs {}. The extended version returns not only
>> a list of a list of bus formats supported by a bridge, but the entire list of
>> struct drm_bus_cfg, which currently contains format and bus flags, but can be
>> extended with other members, like desired clock frequency, as required.
>>
>> This series demonstrates such extension by adding the support for negotiating
>> the DSI clock and by implementing such support in DW DSI Host and TC358767 DSI
>> bridge.
> 
> We discussed it a bit on IRC as well but there's another issue with
> this, let's imagine this setup:
> 
> encoder -> DSI-to-DPI bridge -> DPI-to-HDMI bridge -> HDMI Monitor
> 
> HDMI is fairly favorable, and it would probably use pixel clocks of
> either 148.5, 297 or 594MHz. Let's simplify this a bit and assume your
> DSI-to-DPI bridge can only operate at a frequency equivalent to 297MHz.
> 
> 594Mhz is going to be used by those new fancy monitors, and thus the
> preferred mode is likely to be using 594MHz.
> 
> With your solution, it effectively means that when the system will boot
> up, the preferred mode will be reported to the userspace (and the fbdev
> emulation), whatever is coming next is going to use it, and you're just
> going to... refuse it because it never worked in the first place. You'll
> leave a blank display, and that's it. That's not a great behavior,
> really.

If you cannot support such a panel with this kind of scanout engine, 
what else would you do than blank screen ?

> And since you don't get a state until you start a commit, this would
> need to be able to work without one. Of course, some state parameters
> will affect the clock (like the bpc count) so it won't be perfect, but
> we can at least try.
> 
> Another thing is that the clock that needs to be negociated is likely to
> be device specific. It's probably going to be fairly similar across
> similar devices (like all the DSI bridges you mentioned are using the HS
> clock), but I'm not sure we can make that assumption.

The bridge (data sink) should be able to figure out what kind of clock 
it needs from the source and then request those, yes. With DSI you can 
make an assumption about what kind of clock frequencies each link mode 
would require, but in general, you cannot assume much.

> I think we could make something that work by asking the previous bridge
> in the chain for a given clock rate with a given mode, and then filter
> out / adjust anything we don't like. It would then be able to first
> check if it can provide that clock in the first place, and then the rate
> it has, and would be free to forward the query up to the encoder. And
> since it's tied to the mode, it would work with mode_valid too.

It seems to me this is similar to this solution, except it must happen 
when the mode is available ? But then the question also comes to mind, 
should select_bus_fmt_recursive() be called only after mode is available 
too ?
