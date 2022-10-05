Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2965F546C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 14:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55310E5F5;
	Wed,  5 Oct 2022 12:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99DCE10E5F5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 12:29:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C68C3113E;
 Wed,  5 Oct 2022 05:29:11 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF7223F73B;
 Wed,  5 Oct 2022 05:29:03 -0700 (PDT)
Message-ID: <583a33d6-9386-14c8-8374-ab53deb4fe34@arm.com>
Date: Wed, 5 Oct 2022 13:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/2] drm/rockchip: dw_hdmi: Add 4k@30 support
Content-Language: en-GB
To: Sascha Hauer <s.hauer@pengutronix.de>, Dan Johansen <strit@manjaro.org>
References: <20220926080435.259617-1-s.hauer@pengutronix.de>
 <cf2285dc-d732-0c6d-83bc-022f23f29524@wolfvision.net>
 <2430a203-f8e7-7d78-3e9e-9e1d9c6826c9@manjaro.org>
 <20220928083755.GU986@pengutronix.de>
 <2f341aa8-b960-26d1-8073-737f828a8805@manjaro.org>
 <20221005100618.GS12909@pengutronix.de>
 <7721ac8b-7e8d-5131-70aa-7579d912a2bb@manjaro.org>
 <20221005111004.GS986@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221005111004.GS986@pengutronix.de>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-05 12:10, Sascha Hauer wrote:
> On Wed, Oct 05, 2022 at 12:51:57PM +0200, Dan Johansen wrote:
>>
>> Den 05.10.2022 kl. 12.06 skrev Sascha Hauer:
>>> On Wed, Sep 28, 2022 at 10:39:27AM +0200, Dan Johansen wrote:
>>>> Den 28.09.2022 kl. 10.37 skrev Sascha Hauer:
>>>>> On Tue, Sep 27, 2022 at 07:53:54PM +0200, Dan Johansen wrote:
>>>>>> Den 26.09.2022 kl. 12.30 skrev Michael Riesch:
>>>>>>> Hi Sascha,
>>>>>>>
>>>>>>> On 9/26/22 10:04, Sascha Hauer wrote:
>>>>>>>> This series adds support for 4k@30 to the rockchip HDMI controller. This
>>>>>>>> has been tested on a rk3568 rock3a board. It should be possible to add
>>>>>>>> 4k@60 support the same way, but it doesn't work for me, so let's add
>>>>>>>> 4k@30 as a first step.
>>>>>>>> 														     Sascha
>>>>>>>>
>>>>>>>> Changes since v1:
>>>>>>>> - Allow non standard clock rates only on Synopsys phy as suggested by
>>>>>>>>       Robin Murphy
>>>>>>>>
>>>>>>>> Sascha Hauer (2):
>>>>>>>>       drm/rockchip: dw_hdmi: relax mode_valid hook
>>>>>>>>       drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 34 ++++++++++++++++-----
>>>>>>>>      1 file changed, 27 insertions(+), 7 deletions(-)
>>>>>>> Thanks for the v2! On a RK3568 EVB1 with a HP 27f 4k monitor
>>>>>>>
>>>>>>> Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
>>>>>> Sadly this still doesn't give my display out on my 2k monitor. Not even just
>>>>>> 1080p picture like the old current implementation does.
>>>>> By "like the old current implementation" you mean that this patchset
>>>>> introduces a regression for you?
>>>> Yes. What currently in the kernel at least shows as 1080p on my 2K monitor,
>>>> while this patchset turns off the screen.
>>> Which SoC are you testing this on? I assume RK3568, right? Which patch
>>> introduces that regression, the first or the second one?
>> I tested on the Odroid M, which is rk3568.
>> I have only applied them both, as I was under the impression that both are
>> needed for the 4k support.
> 
> Yes, both I needed, but I am interested which one introduces the
> regression as I can't reproduce it.

One thing that might be worthwhile is to compare what "drm.debug=4" 
output says about the chosen mode and its clock rate vs. what 
/sys/kernel/debug/clk/clk_summary says about how things ended up in 
practice, to see whether it's a case of the clock not being able to get 
close enough to the correct rate at all.

Robin.
