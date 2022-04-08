Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C844F9910
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270BB10E7C7;
	Fri,  8 Apr 2022 15:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739910E7C7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 15:11:04 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 h3-20020a4ae8c3000000b00324b9ae6ff2so1525299ooe.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXUmuDU0vkpHZ9hnvSeZrhPPxW96vR7qCyJK+B/lIPA=;
 b=Fd9ihj4LzQLZsdjPfTu5TNI05+jEF8IGeDZxGE4ox/5zdPTahtNlQzgQnNkolJ/dzi
 Pq3cH4otSZdqGXbCbce6q4J0FQsbcMPYO2FUTgXxnXKZOpfnkHuArprpZDdYNbBIrTi6
 DJjVTVEmLX4n8URKpm9ZJ08pRvsmC7DFORtn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXUmuDU0vkpHZ9hnvSeZrhPPxW96vR7qCyJK+B/lIPA=;
 b=Xi3ybFd8VP1JGQcmKuHCQUfSr2p/HCRc1rZ1afr73DT2z43UJ0rd2zYxCxBxl9LOFE
 AyDSpmyogXD8NJvRRKN0SiUYU/3TajmSQgkFxo680xUSLE4siQ3jS0r/UVstXCkDhJ0O
 6xORYjHFm/QgC6p1UTQ6yybizY7HDUHYiENlkOvFGWAWHIjx+TsouQMI8TbdF6ZzlwB2
 ShFAiYMajOjn0Q1fBC5E1C5u2vR0PUTDl0ducIeTWln5LGOQmmyOwRTuH45LfLypho9A
 6EYF7DrYRcxWw3iaLv9V3NpIWz1qoAWG9udVxI3kH1hSTfwADa6zxx/Yz2gW657Va7Ff
 dLWg==
X-Gm-Message-State: AOAM5300h6Tgqe65HkHU5SClMwFLuxVjSAApCLTjXNd9rdsktGz6o3SA
 8mJYVFcvbkdQSJn0YsXa3c6OK/asVWmrW5ZMELzorQ==
X-Google-Smtp-Source: ABdhPJxSncAFZlaQdaugzmFbtQ6xYsfcqiI0VDE76UdCgXSQnGmKCwU6itIltFLsjSqovb+JUDdzmW+XJYS4jafLs5A=
X-Received: by 2002:a4a:d8c4:0:b0:324:cc3:6e72 with SMTP id
 c4-20020a4ad8c4000000b003240cc36e72mr6312572oov.46.1649430664031; Fri, 08 Apr
 2022 08:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
 <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
 <Yk/rHyGrOlrkDtdR@phenom.ffwll.local>
 <b9fd2365-9412-b496-6e41-757d6d5d0f0c@linux.intel.com>
 <CAPM=9tyJTMBidxLip9XkJjYPNr5s7=oQqLYo9++UtHEemR9DQQ@mail.gmail.com>
 <b03c8d96-26d2-9ef9-1589-f47dd529146e@linux.intel.com>
In-Reply-To: <b03c8d96-26d2-9ef9-1589-f47dd529146e@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 8 Apr 2022 17:10:52 +0200
Message-ID: <CAKMK7uFqB4rFro-eDDv-3ywfUcy59g73qcy3Ez_k-P2SgtSQeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling
 requests
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 12:29, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 08/04/2022 10:50, Dave Airlie wrote:
> > On Fri, 8 Apr 2022 at 18:25, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 08/04/2022 08:58, Daniel Vetter wrote:
> >>> On Thu, Apr 07, 2022 at 04:16:27PM +0100, Tvrtko Ursulin wrote:
> >>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>
> >>>> Inherit submitter nice at point of request submission to account for long
> >>>> running processes getting either externally or self re-niced.
> >>>>
> >>>> This accounts for the current processing landscape where computational
> >>>> pipelines are composed of CPU and GPU parts working in tandem.
> >>>>
> >>>> Nice value will only apply to requests which originate from user contexts
> >>>> and have default context priority. This is to avoid disturbing any
> >>>> application made choices of low and high (batch processing and latency
> >>>> sensitive compositing). In this case nice value adjusts the effective
> >>>> priority in the narrow band of -19 to +20 around
> >>>> I915_CONTEXT_DEFAULT_PRIORITY.
> >>>>
> >>>> This means that userspace using the context priority uapi directly has a
> >>>> wider range of possible adjustments (in practice that only applies to
> >>>> execlists platforms - with GuC there are only three priority buckets), but
> >>>> in all cases nice adjustment has the expected effect: positive nice
> >>>> lowering the scheduling priority and negative nice raising it.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>
> >>> I don't think adding any more fancy features to i915-scheduler makes
> >>> sense, at least not before we've cut over to drm/sched.
> >>
> >> Why do you think so?
> >>
> >> Drm/sched has at least low/normal/high priority and surely we will keep
> >> the i915 context priority ABI.
> >>
> >> Then this patch is not touching the i915 scheduler at all, neither it is
> >> fancy.
> >>
> >> The cover letter explains how it implements the same approach as the IO
> >> scheduler. And it explains the reasoning and benefits. Provides an user
> >> experience benefit today, which can easily be preserved.
> >
> > won't this cause uAPI divergence between execlists and GuC, like if
> > something nices to -15 or -18 with execlists and the same with GuC it
> > won't get the same sort of result will it?
>
> Not sure what you consider new ABI divergence but the general problem
> space of execlists vs GuC priority handling is not related to this patch.

It 100% is.

Mesa only uses 3 priority levels, which means the 1k execlist levels
(or whatever it was) nonsense has not left the barn and we can get it
back in.

This here bakes it in forever as implicit uapi.

> Existing GEM context ABI has -1023 - +1023 for user priorities while GuC
> maps that to low/normal/high only. I915_CONTEXT_DEFAULT_PRIORITY is zero
> which maps to GuC normal. Negatives map to GuC low and positives to
> high. Drm/sched is I understand similar or the same.
>
> So any userspace using the existing uapi can already observe differences
> between GuC and execlists. With your example of -15 vs -18 I mean.
>
> I don't think anyone considered that a problem because execution order
> based on priority is not a hard guarantee. Neither is proportionality of
> timeslicing. Otherwise GuC would already be breaking the ABI.
>
> With this patch it simply allows external control - whereas before only
> applications could change their priorities, now users can influence the
> priority of the ones which did not bother to set a non-default priority.
>
> In the case of GuC if user says "nice 10 churn-my-dataset-on-gpu &&
> run-my-game", former part get low prio, latter gets normal. I don't see
> any issues there. Same as if the "churn-my-dataset-on-gpu" command
> implemented a command line switch which passed context priority to i915
> via the existing GEM context param ioctl.
>
> I've described the exact experiments in both modes in the cover letter
> which shows it works. (Ignoring the GuC scheduling quirk where
> apparently low-vs-normal timeslices worse than normal-vs-high).

Guc is not breaking anything because the _real_ uapi only has 3 levels
(plus one for kernel stuff on top).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
