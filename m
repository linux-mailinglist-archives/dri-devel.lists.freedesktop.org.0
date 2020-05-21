Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31D1DCE49
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 15:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700736E20B;
	Thu, 21 May 2020 13:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27626E20E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 13:38:53 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id b71so7080448ilg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ts0z309lIAjm9mgO7ibMsYXnYNkSLCxhrlQsqBN0sAQ=;
 b=eaN8lMD3zIqy07PFT44JWnHz7nlOheDiPZ6qfTAbj4vS5Oxs2DVFajTaKVUAMNGWoo
 66CpNVwE0r/2elORdRMvN09NPMc/y46o0IoIFSd9hhRCGyMjH5UqEbz8PcaTebpvXVOt
 XukWQP4MWu4JIj2vvgm7hBPmPMgRaG5ULcYIwenbJ5bWZR4q11zyedBvYXaY19qncsXK
 Sg1uoR6Pd8/paoNX1NHJcTejgVq+FRrP6eIU0wfDFulmzBQDhEuIXIsAivqSIe3N/kRh
 M3xcFKdnMW3ctv/nfx6wnm0w/7FmR3xqa8Trh2ci/L1dCxoDywzCEPbKD65C48uKbpm9
 D1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ts0z309lIAjm9mgO7ibMsYXnYNkSLCxhrlQsqBN0sAQ=;
 b=hByW8BWB8A93LPSoY6FlLVP1qG5t7KL/TWtIW7U2AGjUUCL/vvxIDx6O0L9kHGS2EG
 T+DlbfeIhaEcpe4SLRz8F0ZUsvPY+6ktnn0r5dA+2VV3LX4gtEGhgLewTDiUiKSpJOKh
 0Jd0qP60ozyb7pNMQZLvJkWbcUyacTYJaZdlSruoYI+3A07CCZM56LZ4tIIogP/85zZ6
 aQJ/pHpI/5aRO470GAWcJsy3HVWSENjiFgtAUyc8eM4xvicTabQ/ciqODeusPNxqRWhk
 8YHVM9aPwRy0UunIqmuWKTxabtacGv0uUim/vdCGYxLJPIhFYCPrPGQABSnpTLxs11q/
 BKtg==
X-Gm-Message-State: AOAM530ejddljjyl4qQhC24QwW7I6mkyFpxGLYQz/8CYUlCafQm8a69w
 SK0dwnpzHMwagveymStNg/+Bc+WTh2mYTJqUCrAjyg==
X-Google-Smtp-Source: ABdhPJxdnE5+Ync5LnICZeL/dMDAiPbIMWYTdsfszyNh6VU+r4c12bMFKpsmieITVBMYl2I853Izq6Gl2qPmcWRnWU4=
X-Received: by 2002:a92:4ca:: with SMTP id 193mr8667391ile.75.1590068332908;
 Thu, 21 May 2020 06:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200520194744.48936-1-sean@poorly.run>
 <20200521045720.GA8571@intel.com>
 <20200521092715.GD31478@intel.com>
In-Reply-To: <20200521092715.GD31478@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Thu, 21 May 2020 09:38:15 -0400
Message-ID: <CAMavQKJRQn4TB5j99dyby38OZzGd8UQSKPDXzd14qDSmjLJLAA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/hdcp: Avoid duplicate HDCP enables
To: Anshuman Gupta <anshuman.gupta@intel.com>
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
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 21, 2020 at 5:36 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>
> On 2020-05-21 at 10:27:21 +0530, Ramalingam C wrote:
> > On 2020-05-20 at 15:47:44 -0400, Sean Paul wrote:
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > If userspace sets the CP property to DESIRED while it's already ENABLED,
> > > the driver will try to re-enable HDCP. On some displays, this will
> > > result in R0' mismatches. I'm guessing this is because the display is
> > > still sending back Ri instead of re-authenticating.
> > >
> > > At any rate, we can fix this inefficiency easily enough by just nooping
> > > the DESIRED property set if HDCP is already ENABLED.
> AFAIU may below patch also solves above issue implicitly.
> https://patchwork.freedesktop.org/patch/365758/?series=72251&rev=4
> Besides that +1 for below Ram comment, it would be better if such type of duplicate
> enable request should filter by drm_atomic_connector_set_property().

Thanks Anshuman, I didn't see that patch. Indeed that seems like it
accomplishes the same thing.

Let's drop this.

Sean

> Thanks,
> Anshuman Gupta.
>
> > Sean,
> >
> > This will skip the hdcp enable.
> >
> > But at present too we will be getting below WARN_ON from intel_hdcp_enable,
> > to indicate userspace is going wrong with request.
> >         drm_WARN_ON(&dev_priv->drm,
> >                     hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
> >
> > And if we need to filter this out, could we validate the incoming hdcp request at
> > drm_atomic_connector_set_property() itself? No point in going into the
> > atomic commit without a valid request. something like
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index a1e5e262bae2..d98b2eeae78d 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -746,6 +746,12 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
> >                         DRM_DEBUG_KMS("only drivers can set CP Enabled\n");
> >                         return -EINVAL;
> >                 }
> > +               if (config->content_protection_property ==
> > +                   DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> > +                   val == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > +                       DRM_DEBUG_KMS("Redundant req for content protection\n");
> > +                       return -EINVAL;
> > +               }
> >                 state->content_protection = val;
> >         } else if (property == config->hdcp_content_type_property) {
> >                 state->hdcp_content_type = val;
> >
> > -Ram
> >
> > >
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > ---
> > >
> > > I suspect this is the actual root cause I was chasing with
> > > "drm/i915/hdcp: Add additional R0' wait". I was able to reproduce the
> > > R0` messages by marking HDCP desired while it was already enabled. This
> > > _should_ work, but it seems like some displays handle it more graciously
> > > than others.
> > >
> > >
> > >  drivers/gpu/drm/i915/display/intel_hdcp.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > index 2cbc4619b4ce..f770fe0c5595 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > @@ -2156,12 +2156,16 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
> > >     }
> > >
> > >     /*
> > > -    * Nothing to do if the state didn't change, or HDCP was activated since
> > > -    * the last commit. And also no change in hdcp content type.
> > > +    * Nothing to do if content type is unchanged and one of:
> > > +    *  - state didn't change
> > > +    *  - HDCP was activated since the last commit
> > > +    *  - attempting to set to desired while already enabled
> > >      */
> > >     if (old_cp == new_cp ||
> > >         (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> > > -        new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
> > > +        new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
> > > +       (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> > > +        new_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
> > >             if (old_state->hdcp_content_type ==
> > >                             new_state->hdcp_content_type)
> > >                     return;
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
> > >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
