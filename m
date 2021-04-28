Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129236DF45
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 20:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0748E6E0D6;
	Wed, 28 Apr 2021 18:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191046E056
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 18:58:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g10so7610804edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PBfFqysSCv5aYeJdgDmOL5M990SamiTBuxP7uomvGBg=;
 b=oT2D5Aoidg7czILy93VJIsF9oN0MCYYU2FHF52ELXDsHFIJwz/zgfEfrIAlo/r8+aQ
 ZAiLLnky/5ixQ9b7EuEXxoJGfCZTSweo8y8/9V3BKkW2UiNtJ8xCl/QxV5xiuhra+tFb
 7wNhrojBn987qppCgyEbRn0popM9pJnzwhS8+NQPVyBLuTfEVjimf9WU7UUs17SEGSCr
 kL1GpU+VyodmZEvWK3ZW2yJi/ve8O15m0mNk4KLmBboAFkjOOojCcRWs6QTHZdiAQhRU
 RFQGkl13wT3VG3RAYl84vApoYYyicdTMtHjwjdCUDqSaT/OkwbTTqWhkk1bisJmAVZEB
 emPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBfFqysSCv5aYeJdgDmOL5M990SamiTBuxP7uomvGBg=;
 b=bh6jDjhRgLJNFcqdNAM5gQk9t6b/nIpMwN+7w2rf45z4mSAVEz4+JSjj2cdPMSP90S
 EKlp4iTJnCUovxNqJtgvbBr4w9f4LpH4et5WimUciNT3H/72NgH5C/VLFGlE6gWHP3kO
 e/WYqLOjyZ0OtFY+8gTsYqY3+k5+xMla1WE0mrW2fH4jABELy8rMHdXsQXuWcpxQGuOT
 j67nOPuhPnb7H8YuW0fPNpNicor7j+6VR++gLo2I3yDFaSvc34aYCS5vaX40KOdHbca4
 VKkWcJvB+o8yl60RBKxknNOedVRnAf0RI2N/EhQHy4IS3v/ERTIkGmJTdd0I7SkzruY0
 BZDw==
X-Gm-Message-State: AOAM532IDAjYTiO6hQlip4SKTtTmL18+OtkQYzeEB84b+kEkKI8c0dHE
 0FQe8hnhqlDt00+NWUHCwUQ1JidCdOUQTvzlefy0RbD3GOc=
X-Google-Smtp-Source: ABdhPJyvbTIB+8eZVU0z8DLyCDcNctzs0qmvkinlK31RGaTasbfRxOdzEqFDRgwRN9zgPGnAoZCxr15Nw3v1lpLcB7M=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr13421187edu.213.1619636308543; 
 Wed, 28 Apr 2021 11:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
In-Reply-To: <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 13:58:17 -0500
Message-ID: <CAOFGe979BEBSSw_0oqGRADHWZJAg4c=iyr3FiJB5oxno+YM+uw@mail.gmail.com>
Subject: Re: [PATCH 08/21] drm/i915/gem: Disallow bonding of virtual engines
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 12:18 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Wed, Apr 28, 2021 at 5:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Apr 27, 2021 at 08:51:08AM -0500, Jason Ekstrand wrote:
> > > I sent a v2 of this patch because it turns out I deleted a bit too
> > > much code.  This function in particular, has to stay, unfortunately.
> > > When a batch is submitted with a SUBMIT_FENCE, this is used to push
> > > the work onto a different engine than than the one it's supposed to
> > > run in parallel with.  This means we can't dead-code this function or
> > > the bond_execution function pointer and related stuff.
> >
> > Uh that's disappointing, since if I understand your point correctly, the
> > sibling engines should all be singletons, not load balancing virtual ones.
> > So there really should not be any need to pick the right one at execution
> > time.
>
> The media driver itself seems to work fine if I delete all the code.
> It's just an IGT testcase that blows up.  I'll do more digging to see
> if I can better isolate why.

I did more digging and I figured out why this test hangs.  The test
looks at an engine class where there's more than one of that class
(currently only vcs) and creates a context where engine[0] is all of
the engines of that class bonded together and engine[1-N] is each of
those engines individually.  It then tests that you can submit a batch
to one of the individual engines and then submit with
EXEC_FENCE_SUBMIT to the balanced engine and the kernel will sort it
out.  This doesn't seem like a use-case we care about.

If we cared about anything, I would expect it to be submitting to two
balanced contexts and expecting "pick any two" behavior.  But that's
not what the test is testing for.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
