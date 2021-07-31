Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4673DC796
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 20:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8BC896ED;
	Sat, 31 Jul 2021 18:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B20896ED
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 18:06:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2115180a-f22a-11eb-8d1a-0050568cd888;
 Sat, 31 Jul 2021 18:07:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3FDE9194B35;
 Sat, 31 Jul 2021 20:07:16 +0200 (CEST)
Date: Sat, 31 Jul 2021 20:06:51 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 steev@kali.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, bjorn.andersson@linaro.org,
 daniel@ffwll.ch, airlied@linux.ie, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com,
 jonas@kwiboo.se, mripard@kernel.org, thierry.reding@gmail.com,
 lyude@redhat.com, linus.walleij@linaro.org, rajeevny@codeaurora.org,
 linux-arm-msm@vger.kernel.org, a.hajda@samsung.com,
 tzimmermann@suse.de, narmstrong@baylibre.com,
 Sandeep Panda <spanda@codeaurora.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] drm/panel: atna33xc20: Fix the Samsung ATNA33XC20
 panel
Message-ID: <YQWRO6gTFTtaWAIA@ravnborg.org>
References: <20210730154605.2843418-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730154605.2843418-1-dianders@chromium.org>
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

Hi Douglas,

On Fri, Jul 30, 2021 at 08:45:59AM -0700, Douglas Anderson wrote:
> 
> The overall goal of this series is to make the Samsung ATNA33XC20
> panel work more properly. As part of this, we have:
> * A bugfix for the recently abstracted DP AUX backlight code.
> * A bugfix for the sequencing of the ti-sn65dsi86 bridge driver.
> * Removal of the panel from panel-simple and moving it to its own
>   driver.
> 
> If the bugfixes look good but the rest of the series needs work then
> those could land early on their own. There's no real compile time
> dependency on the bugfixes, things are just glitchier without them.
> 
> NOTE: this series will (slightly) conflict with my other recent series
> making eDP panels probable [1]. I'll re-post that one atop this
> one. It should be noted that the fact that the Samsung ATNA33XC20
> needs its own panel driver means that it _can't_ handled as a probed
> driver. I think this is fine, at least for now. I don't think it would
> be easy to make a unified design with this panel and other panels
> given that it's an AMOLED panel and has a whole bunch of different
> components on board.
> 
> As discussed in IRC, the only difference in v2 is the addition of a
> "Fixes" tag to patch #3 and the collection of Reviews/Acks from Sean
> and Robert.
> 
> If people feel that this is ready to land today then I can help land
> it (please let me know). Otherwise I'm happy for someone else to
> actually do the commit next week (I'm on vacation) or I can take it
> when I get back.
> 
> [1] https://lore.kernel.org/r/20210723002146.1962910-1-dianders@chromium.org/
> 
> Changes in v2:
> - Added Fixes tag as requested by Sam.
> 
> Douglas Anderson (6):
>   drm/dp: Don't zero PWMGEN_BIT_COUNT when driver_pwm_freq_hz not
>     specified
>   drm/bridge: ti-sn65dsi86: Fix power off sequence
>   drm/bridge: ti-sn65dsi86: Add some 100 us delays
>   Revert "drm/panel-simple: Add Samsung ATNA33XC20"
>   Revert "drm/panel-simple: Support for delays between GPIO & regulator"
>   drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel

I have now applied the first three patches to drm-misc-next.

	Sam
