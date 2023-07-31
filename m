Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B376A369
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 23:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4E10E063;
	Mon, 31 Jul 2023 21:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A442510E063
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 21:54:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 257A586AA5;
 Mon, 31 Jul 2023 23:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690840438;
 bh=4isZiaGWZ6cqDzZcBvzMFLTHhafDLkMu8A2wa1Nq/bk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rnrDjqMH9wTcfL72RpNYvviSDpkiiy5Ro6OivJlrFOi+P9/jRTbtTuDZ8GxHZv2+i
 G2NsukCv+QQPPMd/hUTnGtFr1ReLylgjbh0mK9xq97BabrFTVVwu3tNimZ92MWunkq
 cNzQyv/E4LDfX7WNEqAGG20tMSBCltSi6BPeYFQo4MDdvC4YuFxeuJGgRHYpA4r2H+
 Ex4lOlLtpWurJs6TZVibkh9y3lNwOqLDbDaxz6kfrpDyfKGQF28lGRv8PvmLvHZXzA
 HqWwO5SWqIdxbz59EmJKzsI8dehzZrekupDgg90OJORIlcktn/MXwwhtV1BtiHfVl4
 Mt953cLBSPVUQ==
Message-ID: <cf4e61a8-c3f5-0ba9-d7b4-c48f1ef0985e@denx.de>
Date: Mon, 31 Jul 2023 23:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Doug Anderson <dianders@chromium.org>
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
 <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
 <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
 <594f8182-b74d-6ef2-0d90-74061b35bc50@denx.de>
 <CAD=FV=VXMsZ-kUOgd32LnjBP4eP-j0rbiDhF6O0wSAQsEB5mng@mail.gmail.com>
 <2a6e338d-36ef-6836-bc9d-ef1f727463a4@denx.de>
 <CAD=FV=X17TEovhxm9Wh9qX0RZXAO3Km0coYnfnoO=nsr=doUFw@mail.gmail.com>
 <75b6257d-b9d0-9cba-b3d3-218bad8209b4@denx.de>
 <CAD=FV=VSAJyY=m0NJhYeEPgnqSsQHMi74-MoMk5JuroPCjbEnA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAD=FV=VSAJyY=m0NJhYeEPgnqSsQHMi74-MoMk5JuroPCjbEnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/23 23:34, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 31, 2023 at 2:15 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/31/23 21:50, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Jul 31, 2023 at 11:03 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 7/24/23 15:49, Doug Anderson wrote:
>>>>
>>>> Hi,
>>>>
>>>> [...]
>>>>
>>>>>> Maybe the EPROBE_DEFER actually happens and triggers the failure ?
>>>>>
>>>>> I could certainly believe that EPROBE_DEFER is involved.
>>>>
>>>> So no, it is not. It is difficult to set this up and access the signals,
>>>> but so I did.
>>>>
>>>> What happens is this:
>>>> panel_simple_probe() calls devm_regulator_get()
>>>>      -> If the regulator was ENABLED, then it is now DISABLED
>>>
>>> As per my previous response, I don't think this is true.
>>
>> I just measured that with a scope on actual hardware .
>>
>> reg_fixed_voltage_probe() is the code which turns the regulator OFF,
>> specifically in the part gpiod_get_optional(...GPIOD_OUT_LOW);
> 
> Great, at least we're on the same page here now.
> 
> 
>>> So just as a point of order, do you agree that prior to the commit
>>> that you are "Fixing" that we _weren't_ doing the full delay at probe
>>> time? That means that if things worked before they were working by
>>> some amount of luck, right? The old code used to do a delay after
>>> turning _off_ the regulator (at unprepare time).
>>
>> Yes, that's well possible.
> 
> ...so assuming we agree that this is _not_ a regression introduced by
> e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next
> prepare to shorten it"), that means that all other preexisting users
> of panel-simple were fine with the old behavior

No, it does not mean that all the previous users were fine with that 
behavior. It means the driver operates panels out of spec, we cannot 
know which ones, but we do know it does. Whether users noticed that 
defect or not is another question, which we cannot answer.

> where the unprepare
> delay was only enforced when the panel driver itself turned things off
> and then back on and no extra delay was needed at probe. The one board
> we know about that has a problem with this behavior is the one you're
> reproducing on, which we think only worked previously by chance.

There is at least one device now which shows a problem with the current 
state of driver.

>>> I will also continue to assert that trying to fix the problem via a
>>> delay in the probe of the panel code is the wrong place to fix the
>>> code. The problem is that you need a board-level constraint on this
>>> regulator (off-on-delay-us) preventing it from turning on again within
>>> a certain amount of time after it is turned off. This allows the
>>> regulator framework, which is what decided to turn this rail off
>>> during the regulator probe, to enforce this constraint.
>>
>> No, the driver must respect the unprepare delay, that is what is
>> currently not happening. Trying to somehow work around that by adding
>> random changes to DT is not going to fix the fact that panel-simple is
>> not respecting its own internal built-in constraints.
> 
> Well, except that the panel _isn't_ actually unpreparing the panel.
> The constant you're talking about is a delay between unpreparing the
> panel and then preparing it again and we're not doing that here. Here,
> you are trying to account for an implicit unprepare that happened
> outside the context of the panel driver (in the regulator framework).
> The regulator framework is the one disabling the regulator on its own
> and without the knowledge of the panel driver.

I agree until this point.

> The problem should be
> addressed at the regulator framework, which might involve the
> off-on-delay.

I disagree with this point.

> I would even go further and say that, perhaps, when the regulator
> framework turns this regulator off at bootup then you might be
> violating the power sequencing requirements in the panel anyway. If
> the bootloader left the panel on and _also_ left an enable GPIO on
> then it's entirely possible that you've got a power leak through the
> enable GPIO where you're backpowering the panel's logic when the
> regulator framework turns things off. This is something that would be
> impossible for the panel driver to solve because the panel driver
> hasn't even probed yet.

I agree with this part as well.

> In any case, at this point it seems unlikely that I'll convince you or
> that you'll convince me. I wonder if it's time for someone else on
> this thread to provide an opinion.

I agree with this part as well.
