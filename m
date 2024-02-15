Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CFF855F4A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233A010E333;
	Thu, 15 Feb 2024 10:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYrNatWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E462310E333
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992696; x=1739528696;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EwTmMAAMBHJ/7Fdsm8CudM1CTIgpHEqpKsIwBjpniro=;
 b=lYrNatWYojyWa0L3+yXdk2WRb6YcZt0xkyvQ/OiA6MvZcj3TeHsYu78d
 fWpCs3MTsG8qxXbfMOLzi467oqoUcMqEbZPCazKLzxg7DId+B378Dkszc
 iEZaL6+927oxSAs1BjTlALM1D1pmmO6mU35aUn7FZvBoBMAPeDQWtx4vI
 8BCPcGvwu/f+ciA/AuEhZxhbdPTMDCHYtRAbhGYBhWOLCeR1IPY99sQE5
 3OCr67EXbJDnf2RA4BixSFujch305daCsRl/rLerx3FAU2jmw6719Lvhi
 oMhvWJ5r5FE4mCPKzEirfpU+VbUCiRrhOKmqglfd19a/UNOh8iaoA5Giw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5846384"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5846384"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8207115"
Received: from kraszkow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.13])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:24:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, eizan@chromium.org, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Imre
 Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>, Stanislav Lisovskiy
 <stanislav.lisovskiy@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
In-Reply-To: <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
Date: Thu, 15 Feb 2024 12:24:47 +0200
Message-ID: <87sf1u58k0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.or=
g> wrote:
>>
>> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
>> >
>> > If an eDP panel is not powered on then any attempts to talk to it over
>> > the DP AUX channel will timeout. Unfortunately these attempts may be
>> > quite slow. Userspace can initiate these attempts either via a
>> > /dev/drm_dp_auxN device or via the created i2c device.
>> >
>> > Making the DP AUX drivers timeout faster is a difficult proposition.
>> > In theory we could just poll the panel's HPD line in the AUX transfer
>> > function and immediately return an error there. However, this is
>> > easier said than done. For one thing, there's no hard requirement to
>> > hook the HPD line up for eDP panels and it's OK to just delay a fixed
>> > amount. For another thing, the HPD line may not be fast to probe. On
>> > parade-ps8640 we need to wait for the bridge chip's firmware to boot
>> > before we can get the HPD line and this is a slow process.
>> >
>> > The fact that the transfers are taking so long to timeout is causing
>> > real problems. The open source fwupd daemon sometimes scans DP busses
>> > looking for devices whose firmware need updating. If it happens to
>> > scan while a panel is turned off this scan can take a long time. The
>> > fwupd daemon could try to be smarter and only scan when eDP panels are
>> > turned on, but we can also improve the behavior in the kernel.
>> >
>> > Let's let eDP panels drivers specify that a panel is turned off and
>> > then modify the common AUX transfer code not to attempt a transfer in
>> > this case.
>> >
>> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> > ---
>>
>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Thanks for the review!
>
> Given that this touches core DRM code and that I never got
> confirmation that Jani's concerns were addressed with my previous
> response, I'm still going to wait a little while before applying. I'm
> on vacation for most of next week, but if there are no further replies
> between now and then I'll plan to apply this to "drm-misc-next" the
> week of Feb 26th. If someone else wants to apply this before I do then
> I certainly won't object. Jani: if you feel this needs more discussion
> or otherwise object to this patch landing then please yell. Likewise
> if anyone else in the community wants to throw in their opinion, feel
> free.

Sorry for dropping the ball after my initial response. I simply have not
had the time to look into this.

It would be great to get, say, drm-misc maintainer ack on this before
merging. It's not fair for me to stall this any longer, I'll trust their
judgement.

Reasonable?


BR,
Jani.


--=20
Jani Nikula, Intel
