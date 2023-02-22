Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA569F9C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E63210E0A5;
	Wed, 22 Feb 2023 17:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053A10E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 17:16:37 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id r4so896430ila.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 09:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mhU+BNsquktEtbi/RkYY/MGXDA5v+Q/WUyCHkUYFULs=;
 b=lQDgNkKYm7Kw/9Gqs1sd5jf2/jdTGlJTWv+Qjn++DHaoy2a3+xCayICJe/deXw4GDd
 GKZphll2rGzmsO/otYEyDEBBGtBm0Jz9hP5hf7qC0XFRs8meCXNRsNMxeJQA7l2shvmv
 GZUJmxSCvtrwEvMM/gXOpc9PjlNu+3AwLg1cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhU+BNsquktEtbi/RkYY/MGXDA5v+Q/WUyCHkUYFULs=;
 b=C5pJEohGb2lWf6Hk+6NUBo5u+UJfgLMlGlvQ9DmizmY3IZp86iGqfRPWHhXs44tES9
 dVlEfFFhMub56hhlCXWmAvkQIwi8A+jtOTqAEw2mTc0AO47Drudd5Vzi83uZKf1kdmnr
 jRlxW0Wnz4ImAMepJaHHu80FsJPUmkagoeoo53lplFTK/qL/JcAnK0/7shFHvmuu+OGA
 IZEvwwmjGzLJM7V6szS2vFeNYV0qf5zIL48YjUfMoh5fTDFyoFXvzEOCid2auXHOeMHW
 7QOpzHSgVX2x71C33C368SojEfexHfd7guOPgCUWH+2IXoYbDaspyYLTJcqvtz1lSM5w
 Ei6Q==
X-Gm-Message-State: AO0yUKXwzraZK9RhxiGIw4rkq6Q25WMOqraILot5Xqx1O0+0ey/Kl/2f
 fLrMtYM1cr8RWYUy6vf6R5b4aEHF7qDZ+of4jConFQ==
X-Google-Smtp-Source: AK7set/AvczuuV/MFcXVOCegpHdTpxULr+lm3D7Z1vYckYZ9NKPGNbBTDklJzM7XygKZ0V+MDmS0YVm+hHB5Gb1lfDE=
X-Received: by 2002:a05:6e02:1a2e:b0:313:af46:81ba with SMTP id
 g14-20020a056e021a2e00b00313af4681bamr2377996ile.3.1677086196661; Wed, 22 Feb
 2023 09:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-2-robdclark@gmail.com>
 <b65a2fe2-6f68-2116-9599-2940e66d166b@linux.intel.com>
 <21f36640-3229-0b46-31a2-a47efc5be934@amd.com>
 <b8a16579-4be7-8e14-01e4-9d17c1570c8b@linux.intel.com>
In-Reply-To: <b8a16579-4be7-8e14-01e4-9d17c1570c8b@linux.intel.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 22 Feb 2023 09:16:25 -0800
Message-ID: <CAJs_Fx61OpgFo_kSLoy+2z8mS=wcdK8eZfQBA6dQm9p0=qLU2g@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] dma-buf/dma-fence: Add deadline awareness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 9:05 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 22/02/2023 15:28, Christian K=C3=B6nig wrote:
> > Am 22.02.23 um 11:23 schrieb Tvrtko Ursulin:
> >>
> >> On 18/02/2023 21:15, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Add a way to hint to the fence signaler of an upcoming deadline, such=
 as
> >>> vblank, which the fence waiter would prefer not to miss.  This is to =
aid
> >>> the fence signaler in making power management decisions, like boostin=
g
> >>> frequency as the deadline approaches and awareness of missing deadlin=
es
> >>> so that can be factored in to the frequency scaling.
> >>>
> >>> v2: Drop dma_fence::deadline and related logic to filter duplicate
> >>>      deadlines, to avoid increasing dma_fence size.  The fence-contex=
t
> >>>      implementation will need similar logic to track deadlines of all
> >>>      the fences on the same timeline.  [ckoenig]
> >>> v3: Clarify locking wrt. set_deadline callback
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>   drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
> >>>   include/linux/dma-fence.h   | 20 ++++++++++++++++++++
> >>>   2 files changed, 40 insertions(+)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.=
c
> >>> index 0de0482cd36e..763b32627684 100644
> >>> --- a/drivers/dma-buf/dma-fence.c
> >>> +++ b/drivers/dma-buf/dma-fence.c
> >>> @@ -912,6 +912,26 @@ dma_fence_wait_any_timeout(struct dma_fence
> >>> **fences, uint32_t count,
> >>>   }
> >>>   EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >>>   +
> >>> +/**
> >>> + * dma_fence_set_deadline - set desired fence-wait deadline
> >>> + * @fence:    the fence that is to be waited on
> >>> + * @deadline: the time by which the waiter hopes for the fence to be
> >>> + *            signaled
> >>> + *
> >>> + * Inform the fence signaler of an upcoming deadline, such as
> >>> vblank, by
> >>> + * which point the waiter would prefer the fence to be signaled by.
> >>> This
> >>> + * is intended to give feedback to the fence signaler to aid in powe=
r
> >>> + * management decisions, such as boosting GPU frequency if a periodi=
c
> >>> + * vblank deadline is approaching.
> >>> + */
> >>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin=
e)
> >>> +{
> >>> +    if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> >>> +        fence->ops->set_deadline(fence, deadline);
> >>> +}
> >>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> >>> +
> >>>   /**
> >>>    * dma_fence_describe - Dump fence describtion into seq_file
> >>>    * @fence: the 6fence to describe
> >>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >>> index 775cdc0b4f24..d77f6591c453 100644
> >>> --- a/include/linux/dma-fence.h
> >>> +++ b/include/linux/dma-fence.h
> >>> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
> >>>       DMA_FENCE_FLAG_SIGNALED_BIT,
> >>>       DMA_FENCE_FLAG_TIMESTAMP_BIT,
> >>>       DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> >>> +    DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> >>
> >> Would this bit be better left out from core implementation, given how
> >> the approach is the component which implements dma-fence has to track
> >> the actual deadline and all?
> >>
> >> Also taking a step back - are we all okay with starting to expand the
> >> relatively simple core synchronisation primitive with side channel
> >> data like this? What would be the criteria for what side channel data
> >> would be acceptable? Taking note the thing lives outside drivers/gpu/.
> >
> > I had similar concerns and it took me a moment as well to understand th=
e
> > background why this is necessary. I essentially don't see much other
> > approach we could do.
> >
> > Yes, this is GPU/CRTC specific, but we somehow need a common interface
> > for communicating it between drivers and that's the dma_fence object as
> > far as I can see.
>
> Yeah I also don't see any other easy options. Just wanted to raise this
> as something which probably needs some wider acks.
>
> Also what about the "low level" part of my question about the reason, or
> benefits, of defining the deadline bit in the common layer?

We could leave DMA_FENCE_FLAG_HAS_DEADLINE_BIT out, but OTOH managing
a bitmask that is partially defined in core enum and partially in
backend-driver has it's own drawbacks, and it isn't like we are
running out of bits.. :shrug:

BR,
-R

> Regards,
>
> Tvrtko
