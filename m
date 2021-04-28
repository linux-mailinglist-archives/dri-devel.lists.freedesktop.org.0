Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1336DDEA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3436ECD9;
	Wed, 28 Apr 2021 17:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2F26ECE6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:09:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id r9so95738712ejj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2oPnxKbug4ZQyYnKoQEp8G0S59q7mO9fI27sL6LUmM=;
 b=StPLB44tgNmFzs0KquC2KTlRxdFV9D3QWJiPCiUrzyOQXpX4iYmbWatRK5hndFuo/0
 tLOmNwz36KttcSMGoyyqppLn+aAoXvr0PJ+uMC930eanrEDTgvxYM6FOA9MqxXvSVgi4
 SsHQJu3Nzlq2T0D8k4lt7VKzKlWSsowSEequK1AZ++UEWjcfxAuIQeplkrlZh/fHPMhB
 Wh4nRx75s/Q7UMd11dO/FQ/3oFB0mB3ANjOcMQ7yykYyyIQGrXHlV5dsX2mnS42WdfCf
 UuFkDiPVtWrUbqbtpTRbKZaSAlroa4RTT6YxoZsF+8C/WZ6mOMF/zBmYL6BEbf1cndSD
 9/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2oPnxKbug4ZQyYnKoQEp8G0S59q7mO9fI27sL6LUmM=;
 b=QUuijDVsrCdFtLjwVvuBNzkKpoOzZB0YEdMOrDufBiXi6IsUdixkTkHu024j8cHcI3
 ALJDBnX/o8W7zKqT9dH4bDjfp+bNBBqzgt7iXoaeE5h34nwcSb3ch5EOJ18uV6Mg1U1L
 u7npjM2MUkciv2j7yE8H1pYSjkwkiOERC/oMXwz37Qgc3LP793dle0hMTLtZPUusFvUi
 xMroprGh64grq6herjINC1zGyhTutqdlZbBUsXfNVrPfZFN5O2ezXgZEObbzyF3Eate0
 zKocN/PsQmUTZ7dUPEgetdntajqy4RB2SySyXm5QwSh/ltI5+sL28V9tVU4dNcDhgkmH
 3eOA==
X-Gm-Message-State: AOAM531UCRnTvJMwcLCR4FlFOQU8Pcw52hh+tYoNDRdlzF5vYNaj/u4B
 OH6lPvb5XwgWKudbRKil5a/Ny1jShsFV3/4chc3YJA==
X-Google-Smtp-Source: ABdhPJzs0A36/UOFl4ra/fvooGMHw74LsoZc/YIuuCsegW6q1ggNjXTQbU4pDhC0d8MuCgU6WNJwcUYARcEeoKhHop4=
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr29826570ejc.210.1619629783415; 
 Wed, 28 Apr 2021 10:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-10-jason@jlekstrand.net>
 <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
 <6b388d4d-1d50-94f3-344a-5b6b3639e8ad@linux.intel.com>
 <YIlrCmvC10oAiRcL@phenom.ffwll.local>
 <27db8ded-3b17-748e-f602-a8c1aef7367f@linux.intel.com>
In-Reply-To: <27db8ded-3b17-748e-f602-a8c1aef7367f@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 12:09:31 -0500
Message-ID: <CAOFGe94czhE=SHZLOWmH6vPRs1ujhsP9BBxc6i+N_bkPZ+6UHw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 09/21] drm/i915/gem: Disallow creating
 contexts with too many engines
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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

On Wed, Apr 28, 2021 at 9:26 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 28/04/2021 15:02, Daniel Vetter wrote:
> > On Wed, Apr 28, 2021 at 11:42:31AM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 28/04/2021 11:16, Daniel Vetter wrote:
> >>> On Fri, Apr 23, 2021 at 05:31:19PM -0500, Jason Ekstrand wrote:
> >>>> There's no sense in allowing userspace to create more engines than it
> >>>> can possibly access via execbuf.
> >>>>
> >>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>>> ---
> >>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++----
> >>>>    1 file changed, 3 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>> index 5f8d0faf783aa..ecb3bf5369857 100644
> >>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>> @@ -1640,11 +1640,10 @@ set_engines(struct i915_gem_context *ctx,
> >>>>                    return -EINVAL;
> >>>>            }
> >>>> -  /*
> >>>> -   * Note that I915_EXEC_RING_MASK limits execbuf to only using the
> >>>> -   * first 64 engines defined here.
> >>>> -   */
> >>>>            num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> >>>
> >>> Maybe add a comment like /* RING_MASK has not shift, so can be used
> >>> directly here */ since I had to check that :-)
> >>>
> >>> Same story about igt testcases needed, just to be sure.
> >>>
> >>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>
> >> I am not sure about the churn vs benefit ratio here. There are also patches
> >> which extend the engine selection field in execbuf2 over the unused
> >> constants bits (with an explicit flag). So churn upstream and churn in
> >> internal (if interesting) for not much benefit.
> >
> > This isn't churn.
> >
> > This is "lock done uapi properly".

Pretty much.

> IMO it is a "meh" patch. Doesn't fix any problems and will create work
> for other people and man hours spent which no one will ever properly
> account against.
>
> Number of contexts in the engine map should not really be tied to
> execbuf2. As is demonstrated by the incoming work to address more than
> 63 engines, either as an extension to execbuf2 or future execbuf3.

Which userspace driver has requested more than 64 engines in a single context?

Also, for execbuf3, I'd like to get rid of contexts entirely and have
engines be their own userspace-visible object.  If we go this
direction, you can have UINT32_MAX of them.  Problem solved.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
