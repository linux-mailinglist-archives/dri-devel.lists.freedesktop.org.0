Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D545E6349
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C72E10EB0E;
	Thu, 22 Sep 2022 13:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2229C10EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:10:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3696A1595;
 Thu, 22 Sep 2022 06:10:18 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC7BE3F73B;
 Thu, 22 Sep 2022 06:10:05 -0700 (PDT)
Message-ID: <618e79c6-a1af-3262-2edd-b2d6c0064e02@arm.com>
Date: Thu, 22 Sep 2022 14:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/rockchip: dw_hdmi: relax mode_valid hook
Content-Language: en-GB
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220822152017.1523679-1-s.hauer@pengutronix.de>
 <20220822152017.1523679-2-s.hauer@pengutronix.de>
 <a279a697-6960-c517-8984-335aa207126a@arm.com>
 <20220825114025.GR17485@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220825114025.GR17485@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kernel@pengutronix.de, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2022 12:40 pm, Sascha Hauer wrote:
> On Wed, Aug 24, 2022 at 05:07:50PM +0100, Robin Murphy wrote:
>> On 2022-08-22 16:20, Sascha Hauer wrote:
>>> The driver checks if the pixel clock of the given mode matches an entry
>>> in the mpll config table. The frequencies in the mpll table are meant as
>>> a frequency range up to which the entry works, not as a frequency that
>>> must match the pixel clock. Return MODE_OK when the pixelclock is
>>> smaller than one of the mpll frequencies to allow for more display
>>> resolutions.
>>
>> Has the issue been fixed that this table is also used to validate modes on
>> RK3328, which doesn't even *have* the Synopsys phy? Last time I looked, that
>> tended to lead to complete display breakage when the proper phy driver later
>> decides it doesn't like a pixel clock that mode_valid already said was OK.
>>
>> The more general concern is that these known-good clock rates are good, but
>> others may not be even when nominally supported, which I suspect is the
>> dirty secret of why it was implemented this way to begin with. I would
>> really really love this patch so my RK3399 board can drive my 1920x1200
>> monitor at native resolution, but on the other hand my RK3288 box generates
>> such a crap 154MHz clock for that mode that - unless that's been improved in
>> the meantime too - patch #2 might be almost be considered a regression if it
>> means such a setup would start defaulting to an unusably glitchy display
>> instead of falling back to 1920x1080 which does at least work perfectly
>> (even if the slightly squished aspect ratio is ugly).
> 
> I could limit the change to rk3568 only. Would that be an option?
> Not sure if I should rk3399 as well then as this would work, at least in
> your setup.

I think for now it might be enough to force an exact match if 
hdmi->plat_data.phy_force_vendor is set, with a big fat comment that 
it's to preserve the previous behaviour until vendor phy support can be 
sorted out properly. Beyond that, given that RK3288 and RK3399 do 
nominally support 4K as well, I don't think we actually have to leave 
them out, I just wanted to flag up that untested non-standard clock 
rates are a known source of potential issues once we open the door to them.

Cheers,
Robin.
