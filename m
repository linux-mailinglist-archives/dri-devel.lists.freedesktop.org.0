Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C638AD2E71
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4CA10E47C;
	Tue, 10 Jun 2025 07:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZLX03CTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018B10E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:16:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C09665C0F74;
 Tue, 10 Jun 2025 07:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05171C4CEEF;
 Tue, 10 Jun 2025 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749539765;
 bh=VVeZwsdiJWk7Vp1ob8BKLU+Sz7mH3BRMCSNflC704p0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZLX03CTtDl+hdWdsGPJ/Cv4JQy54Y2BW/+T+c/8PKxEwcCIVkBTGcimkbUe1gHCNf
 cTIWurWIInUIfWCbN/NDv/+9SbnofhsyL+vE8u2nCqMgDAi91ZX6wiRdbVdi3hLF73
 OTOk7NhQ30chXE/F/nhsxJ1oDjaltui0TwGuw/LdazvsdJBbwJkV90VAEnqXUL1d0f
 +osNYY0qR4hHbyBXdVqHVB5q5kzhK5a+r9XaynW+YDhXqRGeMltfIZZ55NnPiz1YUN
 JGRSJdQULqF0DJUoblOXivB8Wah+NczxvoDGxA+l5eLMG8q4lymwP9T9PwgKEmTfvU
 2KLZj5e3ezEPg==
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 09:15:59 +0200
From: Michael Walle <mwalle@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Doug Anderson <dianders@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
In-Reply-To: <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
Message-ID: <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jayesh,

>>> +       /*
>>> +        * After EN is deasserted and an external clock is detected, 
>>> the bridge
>>> +        * will sample GPIO3:1 to determine its frequency. The driver 
>>> will
>>> +        * overwrite this setting. But this is racy. Thus we have to 
>>> wait a
>>> +        * couple of us. According to the datasheet the GPIO lines 
>>> has to be
>>> +        * stable at least 5 us (td5) but it seems that is not enough 
>>> and the
>>> +        * refclk frequency value is lost/overwritten by the bridge 
>>> itself.
>>> +        * Waiting for 20us seems to work.
>>> +        */
>>> +       usleep_range(20, 30);
>> 
>> It might be worth pointing at _where_ the driver overwrites this
>> setting, or maybe at least pointing to something that makes it easy to
>> find which exact bits you're talking about.

Yeah, Jayesh just pointed that out below. I'll add add it to the 
comment.

>> This looks reasonable to me, though.
> 
> I think we are talking about SN_DPPLL_SRC_REG[3:1] bits?

Yes.

> What exact mismatch are you observing in register value?

The one set by the chip itself vs the one from the driver, see below.

> I am assuming that you have a clock at REFCLK pin. For that:

Yes, I'm using an external clock.

> If refclk is described in devicetree node, then I see that
> the driver modifies it in every resume call based solely on the
> clock value in dts.

Exactly. But that is racy with what the chip itself is doing. I.e.
if you don't have that usleep() above, the chip will win the race
and the refclk frequency setting will be set according to the
external GPIOs (which is poorly described in the datasheet, btw),
regardless what the linux driver is setting (because that I2C write
happens too early).

> If refclk is not described in dts, then this register is modified by 
> the
> driver only when pre_enable() calls enable_comms(). Here also, the
> value depends on crtc_mode and the refclk_rate often would not be equal
> to the values in "ti_sn_bridge_dsiclk_lut" (supported frequencies), and
> you would fallback to "001" register value.

> Rest of time, I guess it depends on reading the status from GPIO and
> changing the register.

Not "rest of the time", the reading of the strapping option from the
GPIO always happens if an external refclk is detected. It's part of
the chip after all. It will just sometimes be overwritten by the
linux driver.

> Is the latter one your usecase?

My use case is that the GPIO setting is wrong on my board (it's really
non-existent) and I'm relying on the linux driver to set the correct
frequency.

HTH,
-michael
