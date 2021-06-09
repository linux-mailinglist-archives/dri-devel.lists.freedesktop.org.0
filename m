Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC0A3A1A68
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 18:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3402A6E4E3;
	Wed,  9 Jun 2021 16:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F2E6E4E3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 16:03:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id r16so489885ljk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RuqmxOf4yLjpj10dbnagltrDlQxjHHVud1GYFzl+boM=;
 b=GEg8dLJ94tZCVq6q2y7z6VM8keYXWV75ZhV1YTmZDzlAhHD3c0Rnlwhy5pH9XXOLFl
 huo9jmerCVyVYXlD4gagBsWkGC6Jt/1hgf8P0CUvqvN2ki3dawB1SxdZqN27Gh6wXMli
 Gfg+Tr/pW2X2idypNwEQseXO4fI7JAQ+jHsvxhN9athlTNM/C4xeDy04L+61hSjBVkGD
 tVXohVyllv1daYzL+ZeYSQ7G2Irsziaz0HJEvWMT0DP20bA+NkOFYw1hTT8FkrFM/SFS
 7gyN5KtaM7L8VJ8AV2YMau9YAcm3M2AkUOhmdK0UoQsal3OQua28zu2XNDLOFQV4odA1
 qNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RuqmxOf4yLjpj10dbnagltrDlQxjHHVud1GYFzl+boM=;
 b=UY5YdvSn+kXO335W9v042zZSUSNsmE6re+IqfYtSiJClRpfQctn6Zu5EL5HEmv0KsG
 oDsXc4YKQGm1d8M7sWgIe0qfKq7kSZClnmu2qIeLpkWvceybnNgXHdhR2unXDPJ6bmxb
 fCG0vT5kMOb9aEpUa5rElQviPqebbJ78TlZYMZPWLPBQZJ8h9VRw8/+Q06aYpwT4xS9N
 6V+h2JplgdyCzuk5pMwSqgbn6QUfrX864QB86rSHVO9+LW6XVzLFjwOHaUOLXMiXL44N
 bb4FGAwR7nWIS2vSi6x1dYcXwpRp6DdgQi2qycPxn5vEV7xBv+XalF5DzlgZY6EgseXM
 AraQ==
X-Gm-Message-State: AOAM5322T9KZc0oLzLxBjJVxSlmDbYF61vCYgkInaDjP4bzSnRaObAwG
 jxVxSqfahHXcIdDLE9XwC3+EAQ==
X-Google-Smtp-Source: ABdhPJzQ1weTRVvAD8CXw6+IYKmErnPUi5/X4q8gI1IcNYVRfaM8pZHTNA/9BLB1wSammGbnHh4cJw==
X-Received: by 2002:a2e:8743:: with SMTP id q3mr525632ljj.14.1623254596655;
 Wed, 09 Jun 2021 09:03:16 -0700 (PDT)
Received: from [192.168.1.8] ([93.92.200.219])
 by smtp.gmail.com with ESMTPSA id f13sm24228lfv.126.2021.06.09.09.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 09:03:15 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: Stash away calculated vco frequency on recalc
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20210608195519.125561-1-swboyd@chromium.org>
 <a6356956-9d4a-6fe7-2acc-bbe968d3a936@linaro.org>
 <CAE-0n521fW2F9V6E_7ei2KMsEUMLKSOCtAbRrVX+xXyrS0K9XQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <68b1697e-acb0-10b7-3e89-2287e196a230@linaro.org>
Date: Wed, 9 Jun 2021 19:03:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n521fW2F9V6E_7ei2KMsEUMLKSOCtAbRrVX+xXyrS0K9XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2021 01:11, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2021-06-08 14:41:21)
>> Hi Stephen,
>>
>> On 08/06/2021 22:55, Stephen Boyd wrote:
>>> A problem was reported on CoachZ devices where the display wouldn't come
>>> up, or it would be distorted. It turns out that the PLL code here wasn't
>>> getting called once dsi_pll_10nm_vco_recalc_rate() started returning the
>>> same exact frequency, down to the Hz, that the bootloader was setting
>>> instead of 0 when the clk was registered with the clk framework.
>>>
>>> After commit 001d8dc33875 ("drm/msm/dsi: remove temp data from global
>>> pll structure") we use a hardcoded value for the parent clk frequency,
>>> i.e.  VCO_REF_CLK_RATE, and we also hardcode the value for FRAC_BITS,
>>> instead of getting it from the config structure. This combination of
>>> changes to the recalc function allows us to properly calculate the
>>> frequency of the PLL regardless of whether or not the PLL has been
>>> clk_prepare()d or clk_set_rate()d. That's a good improvement.
>>>
>>> Unfortunately, this means that now we won't call down into the PLL clk
>>> driver when we call clk_set_rate() because the frequency calculated in
>>> the framework matches the frequency that is set in hardware. If the rate
>>> is the same as what we want it should be OK to not call the set_rate PLL
>>> op. The real problem is that the prepare op in this driver uses a
>>> private struct member to stash away the vco frequency so that it can
>>> call the set_rate op directly during prepare. Once the set_rate op is
>>> never called because recalc_rate told us the rate is the same, we don't
>>> set this private struct member before the prepare op runs, so we try to
>>> call the set_rate function directly with a frequency of 0. This
>>> effectively kills the PLL and configures it for a rate that won't work.
>>> Calling set_rate from prepare is really quite bad and will confuse any
>>> downstream clks about what the rate actually is of their parent. Fixing
>>> that will be a rather large change though so we leave that to later.
>>>
>>> For now, let's stash away the rate we calculate during recalc so that
>>> the prepare op knows what frequency to set, instead of 0. This way
>>> things keep working and the display can enable the PLL properly. In the
>>> future, we should remove that code from the prepare op so that it
>>> doesn't even try to call the set rate function.
>>>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
>>> Fixes: 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll structure")
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>
>> Thank you for the lengthy explanation. May I suggest another solution:
>>    - Apply
>> https://lore.kernel.org/linux-arm-msm/010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com/
>>
>>    - And make save_state for 7nm and 10nm cache vco freq (like 14nm does).
>>
>> What do you think?
>>
> 
> Maybe that can be done for the next merge window? I'd like to get the
> smallest possible patch in as a fix for this cycle given that the Fixes
> tag is a recent regression introduced during the most recent merge
> window.
> 
> I honestly have no idea what's going on with the clk driver in these
> files but from the clk framework perspective there are bigger problems
> than caching the vco freq properly. As I stated in the commit text
> above, calling set_rate from prepare is plain bad. That should stop.

Could you please spend few more words, on why calling the clock's 
set_rate() callback from the same clock's prepare callback is bad? I 
don't see how this would affect downstream clocks (as we do not change 
the frequency, we just set the registers).

>  From my quick glance, the patch you mention looks like another
> workaround instead of a proper fix. Why would we need to save the
> registers at boot and then snap them back into place on enable? Maybe we
> shouldn't reset the phy after registering the clks? Instead register the
> clks after the phy is reset so recalc_rate can accurately calculate the
> frequency.

The problem here is not about registration. PHY gets reset not just only 
on registration, it also might be powered off/reset later (e.g. when the 
DSI output is disabled for any reason). And during each of these resets 
we have to keep the PLL state. So keeping the state from the bootloaders 
seems also natural to me.

> I suppose that would break continuous splash screen though
> where you want the PLL to stay running the entire boot? But then
> issuing a reset would break that, wouldn't it? As you can see I'm pretty
> confused about how this is all supposed to work.

Yes, the continuous splash would be broken by resetting the PHY early.

> Note: my problem isn't about recovering what boot sets, it's mostly
> exposing incorrect usage of the clk framework in this driver because it
> relies on this chain of events:
> 
>   1) recalc rate calculates something different than what is
>      set via clk_set_rate()
> 
>   2) clk_set_rate() is called with the different rate
> 
>   3) clk_prepare() is called to actually enable the PLL and wait for it
>      to start
> 
> If clk_prepare() was called before clk_set_rate(), which is totally
> valid, then it should similarly fail and think the rate is 0 and the PLL
> won't lock. Does implementing save_state fix that? If so, it seems like
> we have two pieces of code working around each other, maybe for
> suspend/resume purposes.

Ah, we were safe here because the DSI driver first calls clk_set_rate, 
then clk_prepare_enable for the link clocks, which in turn makes VCO 
clock first receive the rate and then enable PLL.

> I admit this patch I'm proposing is another workaround, but at least it
> makes things work again without going off and adding a bunch of register
> save/restore logic.

I think we can not come with the better solution in the next day or two, 
we should merge your workaround. For now I'm trying to understand what 
are the alternatives and which of them can be better.

Also it's not about registers save/resore. We can add a call to 
recalc_rate to pll_save_state (as 14nm driver does).


-- 
With best wishes
Dmitry
