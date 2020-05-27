Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E856D1E5974
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3406E46E;
	Thu, 28 May 2020 07:44:02 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA14B6E378
 for <dri-devel@freedesktop.org>; Wed, 27 May 2020 17:32:33 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id c12so9988073qtq.11
 for <dri-devel@freedesktop.org>; Wed, 27 May 2020 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2BXWCTTNBns33NDU0HybwyfZx0pKtO1nI+1NJmXgJE=;
 b=pzODA/cBQXw/CEtKpRqf9bB5Am/l0I4597dz6MLmQeN2ifmLqZSlDgaAtCARJDivD6
 9Kw418h/RetRSvPvlL+x1EYvHZCt7sD4zm0d+hDZx69Tfhz0qgQ11EsKjvSEYaOBzTgp
 b5DZHfScEflBLAaKm+uce0alcIP4cqrff/9d1LxSimEuSPCTi+XHIizQkk/F06h9VE6S
 6DN9TecBtt8FayDYBd3oNgyeUAZTz0aJYB/hXdCXK0Z5zIkG2cdLLzw7lx9I2VrvchJf
 EIe/6mDvet+14KdS1N0+L3YEdhjUBQSpsBmrCwEzjmfgZ8SIWs7uAYXrJ1EmpEsx4G5t
 8uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2BXWCTTNBns33NDU0HybwyfZx0pKtO1nI+1NJmXgJE=;
 b=FU6jeI0KVGhtsAgJvmVbhSmg3HIyXTeYA/zkmtjatnNmK6MIgQpCq6PA1POigdVzhn
 x50sUXsTf60FZHvvOkOlauKv8xxoa0MmqNoRvreBWbSA0+XQX5/UPg7EYbutyziQ6aKW
 UcGz8knhLkAKssyDt01ch52FcfyxMSuSLRcT5ePoXoSkJuD+CP317k6wdGcYu8UoP/wa
 rmaB7VJtiDYVwtu/cz/9qxgjo2aEaEcmOT5LzQOlTqTqGmjljDxbaMtkezV5dpGa1Sin
 GMgfuCXExYAqipF83wJEhmEO0p6YxEdxGgsS24IyjTMrBvPpsM0RNa6s3eUfMMWr4nsw
 W1qg==
X-Gm-Message-State: AOAM531aKheS3tFAMhZw4FV23vIKItzGNxYig8mm4DM9Zvu0LelmmBbM
 siYZc77MNXum3If/H2hB6w7IOo5PzFlntiNOuA0w8A==
X-Google-Smtp-Source: ABdhPJwXpn5szmnzOAoismmK3gW+NO2iRmAMAWoX2x9kLxI2DQOfwiJkkj58xfMAJP5sIq8ExwuoK929yeVdXcjTQns=
X-Received: by 2002:aed:312a:: with SMTP id 39mr5473720qtg.6.1590600752651;
 Wed, 27 May 2020 10:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
 <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
 <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
In-Reply-To: <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 27 May 2020 10:31:55 -0700
Message-ID: <CAGETcx_fuS8cmTwCbZ024gqWOmeAc_ytZZ2P6yReBi7Y9O+qMQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:38 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 1:47 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > + more folks
> >
> > On 5/18/2020 9:55 PM, Rob Clark wrote:
> > > On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> > >>> This patches replaces the previously used static DDR vote and uses
> > >>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> > >>> GPU frequency.
> > >>>
> > >>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > >>> ---
> > >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
> > >>>   1 file changed, 1 insertion(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>> index 2d8124b..79433d3 100644
> > >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> > >>>
> > >>>        gmu->freq = gmu->gpu_freqs[perf_index];
> > >>>
> > >>> -     /*
> > >>> -      * Eventually we will want to scale the path vote with the frequency but
> > >>> -      * for now leave it at max so that the performance is nominal.
> > >>> -      */
> > >>> -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> > >>> +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> > >>>   }
> > >> This adds an implicit requirement that all targets need bandwidth settings
> > >> defined in the OPP or they won't get a bus vote at all. I would prefer that
> > >> there be an default escape valve but if not you'll need to add
> > >> bandwidth values for the sdm845 OPP that target doesn't regress.
> > >>
> > > it looks like we could maybe do something like:
> > >
> > >    ret = dev_pm_opp_set_bw(...);
> > >    if (ret) {
> > >        dev_warn_once(dev, "no bandwidth settings");
> > >        icc_set_bw(...);
> > >    }
> > >
> > > ?
> > >
> > > BR,
> > > -R
> >
> > There is a bit of an issue here - Looks like its not possible to two icc
> > handles to the same path.  Its causing double enumeration of the paths
> > in the icc core and messing up path votes. With [1] Since opp/core
> > already gets a handle to the icc path as part of table add,  drm/msm
> > could do either

Are you sure this is the real issue? I'd be surprised if this is a
real limitation. And if it is, it either needs to be fixed in the ICC
framework or OPP shouldn't be getting path handles by default (and
maybe let the driver set the handles before using OPP APIs to change
BW). I'd lean towards the former.

> > a) Conditionally enumerate gpu->icc_path handle only when pm/opp core
> > has not got the icc path handle. I could use something like [2] to
> > determine if should initialize gpu->icc_path*

This seems like a bandaid. Let's fix it correctly in ICC framework or
OPP framework.

> > b) Add peak-opp-configs in 845 dt and mandate all future versions to use
> > this bindings. With this, I can remove gpu->icc_path from msm/drm
> > completely and only rely on opp/core for bw voting.

I don't know what you mean by "peak-opp-configs" but I guess you are
referring to some kind of DT flag to say if you should vote for BW
directly or use the OPP framework? If so, I'm pretty sure that won't
fly. That's an OS implementation specific flag.

-Saravana
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
