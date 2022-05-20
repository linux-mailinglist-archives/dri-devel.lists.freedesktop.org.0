Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF852E137
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 02:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0310E337;
	Fri, 20 May 2022 00:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85A210E337
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 00:34:19 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f17f1acffeso8713385fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 17:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=e9ljUUDHH/JyJI4aQ9kIel1eQTZZ1jPr0AhJXun2ykU=;
 b=gXlvnDGCdBwNwVpzUu6dPjZu7hjujZnhRYw5U+bmqIlSChZfw/OgFYiEYX1UOjmt8C
 EMmWLvNQR/CWX+kboCzZbsmEQVjW13Wm37nBkgZh8w8r9I4I3mDLxrAmUh7cttqcGqvX
 VJ54e9ZT9WGzRe6fqS26MvM4QLCTL9Eal9+FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=e9ljUUDHH/JyJI4aQ9kIel1eQTZZ1jPr0AhJXun2ykU=;
 b=wXpbOtm7hYCL/yuFAiLo3jKXLxof3HlmxNOfoAHIIAE0GxmKWVTL6ZFfGvwbeWcK9o
 QaVt+WKYeBfYDXGyCdK1NSIEVtszS0rHrs2L4JEO4WZkuNYr7mofIFsSyUC/oDAIEQLu
 6ADly3fqsLKdNe053lRclWFFiF4wYfI7cszfKF8ya/zEql/seFDiM0JtAdJcISy2xdjL
 HkuUBCVppVf76D5ar/KB+4vFCjErri1J75pUTpDdEKJ45nEBEpY4RcN8MDAsPWS0O9za
 fLWTztUw2l1/sSe1aoVdtI7WICr95JOXH/7a3RMgzmeSiV/gZAuigBueTs6SZ+iW52KL
 CAbA==
X-Gm-Message-State: AOAM531eTABiS/qt9L61ox1EBSffMHPhGgLzXKcMvgjBEjXvN93Fgd6c
 3OiG5PSCZm63K8EyEvJVeIoiL2/jBPUwpex7MkTM6A==
X-Google-Smtp-Source: ABdhPJz7GCry66MK6mS2X/Oob/iO+dMt3elWph3akDsxT5xS/EtFSj9XGQ/M4XZ3r6HgPrufR7ngXa2CnDPqZiOI8Bk=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr4014027oap.193.1653006859019; Thu, 19
 May 2022 17:34:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 17:34:18 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W6Z1TG4vQcDDeNsGkjZVAR8=A1L1pDfo1rDFCh84H4Rg@mail.gmail.com>
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
 <CAE-0n51iNXN4oOP-wAqrm9U6qC84fQ+qMUBu0BODXjsCDk+H=w@mail.gmail.com>
 <CAD=FV=W6Z1TG4vQcDDeNsGkjZVAR8=A1L1pDfo1rDFCh84H4Rg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 17:34:18 -0700
Message-ID: <CAE-0n50RXmaUsu5F9syJT-ZXzX8WacpJDFnhb1xQaou1Pxizng@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
To: Doug Anderson <dianders@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2022-05-12 16:24:13)
> On Wed, May 11, 2022 at 6:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > Quoting Douglas Anderson (2022-04-18 10:17:54)
> > > diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> > > index 53d1e722f4de..0940c415db8c 100644
> > > --- a/include/drm/dp/drm_dp_helper.h
> > > +++ b/include/drm/dp/drm_dp_helper.h
> > > @@ -2035,6 +2035,32 @@ struct drm_dp_aux {
> > >         ssize_t (*transfer)(struct drm_dp_aux *aux,
> > >                             struct drm_dp_aux_msg *msg);
> > >
> > > +       /**
> > > +        * @wait_hpd_asserted: wait for HPD to be asserted
> > > +        *
> > > +        * This is mainly useful for eDP panels drivers to wait for an eDP
> > > +        * panel to finish powering on. This is an optional function.
> >
> > Is there any use for the opposite direction? For example, does anything
> > care that HPD is deasserted?
>
> Not that I'm aware of. Originally I was planning to have it so that a
> timeout of "0" meant to just poll without sleeping at all, but it
> ended up making the code a lot more complicated because everywhere
> else we had the "readx" semantics where 0 meant wait forever. It
> didn't seem worth it. I can go back to that behavior if need be.
>

Got it.

>
> > > +        *
> > > +        * This function will efficiently wait for up to `wait_us` microseconds
> > > +        * for HPD to be asserted and might sleep.
> > > +        *
> > > +        * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
> > > +        * expired and HPD wasn't asserted. This function should not print
> > > +        * timeout errors to the log.
> > > +        *
> > > +        * The semantics of this function are designed to match the
> > > +        * readx_poll_timeout() function. That means a `wait_us` of 0 means
> > > +        * to wait forever. If you want to do a quick poll you could pass 1
> > > +        * for `wait_us`.
> >
> > It would also make sense to have a drm_dp_wait_hpd_asserted() API
> >
> >   int drm_dp_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us);
> >
> > and then this aux function could be implemented in various ways. The API
> > could poll if the aux can only read immediate state of HPD, or it could
> > sleep (is sleeping allowed? that isn't clear) and wake up the process
> > once HPD goes high. Or if this op isn't implemented maybe there's a
> > fixed timeout member that is non-zero which means "sleep this long".
> > Either way, making each drm_dp_aux implement that logic seems error
> > prone vs. having the drm_dp_aux implement some function for
> >
> >         get_immediate_hpd(struct drm_dp_aux *aux)
>
> There's a reason why I changed the API to "wait" from "get". If you
> can think of a good place to document this, I'm all ears.
>
> The basic problem is ps8640 (my nemesis, apparently). On ps8640,
> because of the black box firmware blob that's on it, we have a crazy
> long delay in its runtime resume (300ms). So what happens with ps8640
> is that if we make the API "get_immediate_hpd()" it wasn't so
> immediate. Even with autosuspend, that first "get" could take 300 ms,
> which really screwed with everyone else who was waiting with a 200 ms
> timeout.
>
> Now, in theory, one could argue that the fact that ps8640 had a 300 ms
> sleep would mean that the very first "get" of the panel would already
> show HPD high. I don't know why that wasn't the case, but ps8640 is an
> annoying black box.
>
> In general, though, the DP controller might need some amount of time
> to power itself back up and configure itself. Even though the ps8640
> case is extreme, it wouldn't be totally extreme to assume that an AUX
> controller might take 20 ms or 50 ms to power up. That could still
> throw timings off. Implementing the API as a "wait" style API gets
> around this problem. Now the DP controller can take as long as it
> needs to power itself up and it can then wait with the requested
> timeout.

To clarify, are you saying that the 'wait' passed in will be added to
whatever time it takes for the driver to runtime resume to check HPD
status? Or is the driver supposed to subtract any time to power up from the
'wait' passed in and then poll or wait for an irq about HPD?

Would it be incorrect to somehow have the pm_runtime_get_sync() call in
the mythical wrapper API with a ktime_get() before and after and then
subtract that from the 'wait' time and call "get_immediate_hpd()"?

It would help me understand further if the 'wait' is described as a
maximum time we're willing to wait or a minimum time we're willing to
wait for hpd to be asserted. Usually a timeout is the maximum we're
willing to wait so I think you're saying the wait is the maximum time
after we know the drm_dp_aux is fully powered up and ready to check the
state.
