Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296683AD413
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 23:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6646EAA4;
	Fri, 18 Jun 2021 21:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940D16EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 21:01:31 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso10990406otu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=H17G11qGODSdDOGEe1xmBe6pWkQ5qPdhrIEmhXM+rw0=;
 b=RHK/5OXFBKs+4LPZvc+CUDOd5wQ47ro+3v+Z2pnoIWr261BWAMrs5aEbrq8cclHrrr
 8rVvUs6GEGt+dNZ/oPA7HccZXozm46JCx2gjx8mVwqZP3w4d6Xm3xWRik3EfgvJfY1LS
 A+ZoQK50lRrEU5KhTlDW2ufHKiyEzNSN+6hMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=H17G11qGODSdDOGEe1xmBe6pWkQ5qPdhrIEmhXM+rw0=;
 b=TmR5pRKMYxDWlIRwLqo4+qjq6Tks40gaoGSdW949yiEsptRAVv5FgnSVvhU4Y+iC7i
 8EJbc625E1wArAu9E7Y5zw4Ivbbb/TPhIZp3Ym03WwEbkTr52JyPZYiwnJwVvSIvMmQL
 icV57vlVBTZ+Trt/tXWFE/XvAUKN83A+M4kctZs/de9eqU+oxyYZK8TUe2E2XmszBMUJ
 zbeWzkhISyzgr+dnnVOsGXSjYHQE6eWuxWJ6R1/c+vtZR+NpS6zLAY3JyErrLTCq7cvC
 y+7csLoH6nevEnTbUtP382iHj9+WVkGU6Zm+7i+9pj83k9KbVq2ge3P/2YI026dMJ0Ab
 7MZQ==
X-Gm-Message-State: AOAM5333aZml+UOZHlQx85zC+fbazeRKT4lojrrZY6n2ZhfQUxIdAw6M
 YQvnRH4kUmWnpz0I30/N+kSPpNOrn+kM2PGNntyu5A==
X-Google-Smtp-Source: ABdhPJxjtXMdrYKvKpZRnjmtZfC9Z8wYXjc1peXnZpKUPxLpRF5e+Dr1uEmSe4rbLNz8drYEa5YCYoR0Nm0zi9qFrVU=
X-Received: by 2002:a9d:624d:: with SMTP id i13mr2777378otk.34.1624050090738; 
 Fri, 18 Jun 2021 14:01:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Jun 2021 14:01:30 -0700
MIME-Version: 1.0
In-Reply-To: <68b1697e-acb0-10b7-3e89-2287e196a230@linaro.org>
References: <20210608195519.125561-1-swboyd@chromium.org>
 <a6356956-9d4a-6fe7-2acc-bbe968d3a936@linaro.org>
 <CAE-0n521fW2F9V6E_7ei2KMsEUMLKSOCtAbRrVX+xXyrS0K9XQ@mail.gmail.com>
 <68b1697e-acb0-10b7-3e89-2287e196a230@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 18 Jun 2021 14:01:30 -0700
Message-ID: <CAE-0n50QLnxaUZNkAb9Vm0553QMWKz6nHp9qXjrm=JPD++w6SA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Stash away calculated vco frequency on recalc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Quoting Dmitry Baryshkov (2021-06-09 09:03:14)
> On 09/06/2021 01:11, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2021-06-08 14:41:21)
> >> Hi Stephen,
> >>
> >> On 08/06/2021 22:55, Stephen Boyd wrote:
> >>> A problem was reported on CoachZ devices where the display wouldn't come
> >>> up, or it would be distorted. It turns out that the PLL code here wasn't
> >>> getting called once dsi_pll_10nm_vco_recalc_rate() started returning the
> >>> same exact frequency, down to the Hz, that the bootloader was setting
> >>> instead of 0 when the clk was registered with the clk framework.
> >>>
> >>> After commit 001d8dc33875 ("drm/msm/dsi: remove temp data from global
> >>> pll structure") we use a hardcoded value for the parent clk frequency,
> >>> i.e.  VCO_REF_CLK_RATE, and we also hardcode the value for FRAC_BITS,
> >>> instead of getting it from the config structure. This combination of
> >>> changes to the recalc function allows us to properly calculate the
> >>> frequency of the PLL regardless of whether or not the PLL has been
> >>> clk_prepare()d or clk_set_rate()d. That's a good improvement.
> >>>
> >>> Unfortunately, this means that now we won't call down into the PLL clk
> >>> driver when we call clk_set_rate() because the frequency calculated in
> >>> the framework matches the frequency that is set in hardware. If the rate
> >>> is the same as what we want it should be OK to not call the set_rate PLL
> >>> op. The real problem is that the prepare op in this driver uses a
> >>> private struct member to stash away the vco frequency so that it can
> >>> call the set_rate op directly during prepare. Once the set_rate op is
> >>> never called because recalc_rate told us the rate is the same, we don't
> >>> set this private struct member before the prepare op runs, so we try to
> >>> call the set_rate function directly with a frequency of 0. This
> >>> effectively kills the PLL and configures it for a rate that won't work.
> >>> Calling set_rate from prepare is really quite bad and will confuse any
> >>> downstream clks about what the rate actually is of their parent. Fixing
> >>> that will be a rather large change though so we leave that to later.
> >>>
> >>> For now, let's stash away the rate we calculate during recalc so that
> >>> the prepare op knows what frequency to set, instead of 0. This way
> >>> things keep working and the display can enable the PLL properly. In the
> >>> future, we should remove that code from the prepare op so that it
> >>> doesn't even try to call the set rate function.
> >>>
> >>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> >>> Fixes: 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll structure")
> >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >>
> >> Thank you for the lengthy explanation. May I suggest another solution:
> >>    - Apply
> >> https://lore.kernel.org/linux-arm-msm/010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com/
> >>
> >>    - And make save_state for 7nm and 10nm cache vco freq (like 14nm does).
> >>
> >> What do you think?
> >>
> >
> > Maybe that can be done for the next merge window? I'd like to get the
> > smallest possible patch in as a fix for this cycle given that the Fixes
> > tag is a recent regression introduced during the most recent merge
> > window.
> >
> > I honestly have no idea what's going on with the clk driver in these
> > files but from the clk framework perspective there are bigger problems
> > than caching the vco freq properly. As I stated in the commit text
> > above, calling set_rate from prepare is plain bad. That should stop.
>
> Could you please spend few more words, on why calling the clock's
> set_rate() callback from the same clock's prepare callback is bad? I
> don't see how this would affect downstream clocks (as we do not change
> the frequency, we just set the registers).

The clk framework is caching things and we don't want clk providers to
be calling into the clk framework again from within the clk ops. This
recursion into the framework is why we have a nasty recursive aware lock
in the clk framework that we're never going to get rid of if more and
more code keeps recursing into the framework.

I think you're saying that the code is reusing the set rate clk op
without going through the framework. That's mostly OK, as long as some
proper locking is in place so that clk_prepare() can't call down into
the clk op while clk_set_rate() is also calling down into the same clk
op. Do we have to call the set rate code here on prepare so that the clk
frequency can be restored? Maybe the name of the function threw me off.

>
> >  From my quick glance, the patch you mention looks like another
> > workaround instead of a proper fix. Why would we need to save the
> > registers at boot and then snap them back into place on enable? Maybe we
> > shouldn't reset the phy after registering the clks? Instead register the
> > clks after the phy is reset so recalc_rate can accurately calculate the
> > frequency.
>
> The problem here is not about registration. PHY gets reset not just only
> on registration, it also might be powered off/reset later (e.g. when the
> DSI output is disabled for any reason). And during each of these resets
> we have to keep the PLL state. So keeping the state from the bootloaders
> seems also natural to me.

Got it. This seems like another version of the half-baked
save_context()/restore_context() clk ops. Maybe we should add some sort
of save/restore a clk and all its children API that clk providers can
call that calls the clk ops to save and restore and then puts things
back into place. Then the clk framework will be aware of what's going on
and be able to cache frequency and enable state, etc.

>
> > I suppose that would break continuous splash screen though
> > where you want the PLL to stay running the entire boot? But then
> > issuing a reset would break that, wouldn't it? As you can see I'm pretty
> > confused about how this is all supposed to work.
>
> Yes, the continuous splash would be broken by resetting the PHY early.
>
> > Note: my problem isn't about recovering what boot sets, it's mostly
> > exposing incorrect usage of the clk framework in this driver because it
> > relies on this chain of events:
> >
> >   1) recalc rate calculates something different than what is
> >      set via clk_set_rate()
> >
> >   2) clk_set_rate() is called with the different rate
> >
> >   3) clk_prepare() is called to actually enable the PLL and wait for it
> >      to start
> >
> > If clk_prepare() was called before clk_set_rate(), which is totally
> > valid, then it should similarly fail and think the rate is 0 and the PLL
> > won't lock. Does implementing save_state fix that? If so, it seems like
> > we have two pieces of code working around each other, maybe for
> > suspend/resume purposes.
>
> Ah, we were safe here because the DSI driver first calls clk_set_rate,
> then clk_prepare_enable for the link clocks, which in turn makes VCO
> clock first receive the rate and then enable PLL.

Yep.

>
> > I admit this patch I'm proposing is another workaround, but at least it
> > makes things work again without going off and adding a bunch of register
> > save/restore logic.
>
> I think we can not come with the better solution in the next day or two,
> we should merge your workaround. For now I'm trying to understand what
> are the alternatives and which of them can be better.
>
> Also it's not about registers save/resore. We can add a call to
> recalc_rate to pll_save_state (as 14nm driver does).
>

The recalc_rate function can be called many times even when nothing has
changed, similarly the determine_rate/round_rate callback can be called
many times before the framework decides what it really wants to use.
Please don't bolt on state saving logic to recalc_rate. I'd prefer that
recalc_rate does one thing, calculate the frequency of the clk, and
return it to the framework.
