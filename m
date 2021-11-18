Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E9456388
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 20:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079F36E9AD;
	Thu, 18 Nov 2021 19:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DAE6E9AD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 19:30:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c4so7070830pfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pb14MqCTU3J6D9GGe31yDgUMoZQIJFb1ROL5bX0DMqg=;
 b=cQZwJ9YeqwPxXKl7/Ra3o+Rh8nEuwKxhuosgjgtlhTQ9kgdIZjE74Ip21sK6YRPEgm
 7pGvDXGboYqRXhoV3r5ew86r8uC7gbuGrZDoWKAVT5sRfMUYfx0FANg7onPC6+lRTMFT
 G7NBPobkXbp7AjQ9XFWMpeuuNrxYMee4pKUfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pb14MqCTU3J6D9GGe31yDgUMoZQIJFb1ROL5bX0DMqg=;
 b=k86W01hk5osOrMVclph89zNf6TLpKv1xsJ7YNuGD6qGdLRMkNoXgok1C/dX1B+Etfb
 4fXzpbBYsaZoX0nqYEzWZoJxDhUMAVOyV5Zl6GcsegC17k0iigTCeFlVNF0sJCcw4/sy
 PgzUX8Czz1GwfUwdYDAdtyb6nxCRPjFpihXWSCKMCsAE/x5kwme+ssRfeB89ThC/yq2W
 +ellHsSN3oamJvaw/E3oNBsOx0dBOZhDXoaFxMde/w0yHIjV8s5wHMuQ/Z2rERCqn/Xz
 UxQl904kzb+A9pfB1hPgChn2gGR+IvKHagzZ0vyNzsyx2Ccuv2+2g0HwPJzq6q0fAkB2
 keRQ==
X-Gm-Message-State: AOAM5336vQIDHwSMqKbGofmArV2kQyopDXslHmE4NL/W3qxDC62nmGP6
 jCh3UxspRECJK+L8owCjKQY3ZA==
X-Google-Smtp-Source: ABdhPJwhGJoIuasv+jusGZbzhkG5zaQIvyvco0ciQxImTVKnurOgSMOAYFJj+ihc5CEUER2gToLAjQ==
X-Received: by 2002:a65:46cf:: with SMTP id n15mr13180408pgr.260.1637263846379; 
 Thu, 18 Nov 2021 11:30:46 -0800 (PST)
Received: from google.com ([2620:15c:202:201:896b:df38:4eae:c568])
 by smtp.gmail.com with ESMTPSA id e13sm319618pgi.90.2021.11.18.11.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 11:30:45 -0800 (PST)
Date: Thu, 18 Nov 2021 11:30:43 -0800
From: Brian Norris <briannorris@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZap4zKo8D5eZc1y@google.com>
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <YZYXR4u6VBEi4qnM@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZYXR4u6VBEi4qnM@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for the review. Lots to address elsewhere, but I can respond
here first:

On Thu, Nov 18, 2021 at 10:05:11AM +0100, Daniel Vetter wrote:
> On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
> >  
> >  	  If in doubt, say "N".
> >  
> > +config DRM_INPUT_HELPER
> > +	def_bool y
> > +	depends on DRM_KMS_HELPER
> > +	depends on INPUT
> 
> Uh please no configs for each thing, it just makes everything more
> complex. Do we _really_ need this?

First, it's not a configurable option (a user will never see this nor
have to answer Y/N to it); it only serves as an intermediary to express
the CONFIG_INPUT dependency (which is necessary) without making
DRM_KMS_HELPER fully depend on CONFIG_INPUT. (We should be able to run
display stacks without the input subsystem.)

The closest alternative I can think of with fewer Kconfig symbols is to
just use CONFIG_INPUT directly in the code, to decide whether to provide
the helpers or else just stub them out. But that has a problem of not
properly expressing the =m vs. =y necessity: if, for example,
CONFIG_DRM_KMS_HELPER=y and CONFIG_INPUT=m, then we'll have linker
issues.

In short, yes, I think we really need this. But I'm not a Kbuild expert.

> > diff --git a/include/drm/drm_input_helper.h b/include/drm/drm_input_helper.h
> > new file mode 100644
> > index 000000000000..7904f397b934
> > --- /dev/null
> > +++ b/include/drm/drm_input_helper.h
> > @@ -0,0 +1,41 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2021 Google, Inc.
> > + */
> > +#ifndef __DRM_INPUT_HELPER_H__
> > +#define __DRM_INPUT_HELPER_H__
> > +
> > +#include <linux/input.h>
> > +
> > +struct drm_device;
> > +
> > +struct drm_input_handler {
> > +	/*
> > +	 * Callback to call for input activity. Will be called in an atomic
> > +	 * context.
> 
> How atomic? Like hardirq, and nasty spinlocks held?

Maybe I should have just cribbed off the <linux/input.h> doc:

 * @event: event handler. This method is being called by input core with
 *      interrupts disabled and dev->event_lock spinlock held and so
 *      it may not sleep

I probably don't want to propagate the subsystem details about which
locks, but I guess I can be specific about "interrupts disabled" and
"don't sleep".

> > +	 */
> > +	void (*callback)(struct drm_input_handler *handler);
> > +
> > +	struct input_handler handler;
> > +};
> > +
> > +#if defined(CONFIG_DRM_INPUT_HELPER)
> > +
> > +int drm_input_handle_register(struct drm_device *dev,
> > +			      struct drm_input_handler *handler);
> > +void drm_input_handle_unregister(struct drm_input_handler *handler);
> > +
> > +#else /* !CONFIG_DRM_INPUT_HELPER */
> > +
> > +static inline int drm_input_handle_register(struct drm_device *dev,
> > +					    struct drm_input_handler *handler)
> > +{
> > +	return 0;
> > +}
> 
> I guess the reason behind the helper is that you also want to use this in
> drivers or maybe drm/sched?

I think my reasoning is heavily described in both the cover letter and
the commit message. If that's not clear, can you point out which part?
I'd gladly improve it :)

But specifically, see the 2nd bullet from the commit message, which I've
re-quoted down here:

> >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> >    render new frames immediately after user activity. Powering up the
> >    GPU can take enough time that it is worthwhile to start this process
> >    as soon as there is input activity. Many Chrome OS systems also ship
> >    with an input_handler boost that powers up the GPU.

Rob Clark has patches to drm/msm to boost GPU power-up via a similar
helper.

> Anyway I think it looks all reasonable. Definitely need an ack from input
> people

I realized I failed to carry Dmitry's Ack from version 1 [1]. If this
has a v3 in similar form, I'll carry it there.

> that the event list you have is a good choice, I have no idea what
> that all does. Maybe also document that part a bit more.

I'm admittedly not an expert there, and this is actually one reason why
we hoped to make this a library (that nobody wants to keep figuring out
whether all those flags, etc., are really doing the right thing), but
there are comments about what each entry is _trying_ to do. Are you
suggesting more, as in, why "BTN_LEFT + EV_KEY" means "pointer"? Or why
we match certain devices (because they represent likely user activity
that will affect the display pipeline)? Or both? Anyway, I'll give it a
shot, if we keep this.

Brian

[1] https://lore.kernel.org/all/YYW6FwSeNMK25ENm@google.com/
