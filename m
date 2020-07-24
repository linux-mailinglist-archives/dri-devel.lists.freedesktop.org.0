Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67BA22C0EB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 10:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440706E93C;
	Fri, 24 Jul 2020 08:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181806E93C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 08:36:06 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n24so6388342otr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyvELLVteHVe9UZvoio90k5VkZYDN5tow8fZJ9hfYSA=;
 b=BPHZSSA0lTmvTlqfj1+dzkyNhnStIdWWdFx8N8Lmmtd/VBwLQpDVE4yQpbgSyqjlMz
 kILDQ6apiB8vM1yd/4WL8g/YnZCfag8TxaxN8K5bTIWhwag9/ZJdnkflbBHNqlJCejMo
 2/XWV7OZUPUuUO4FyDFcDcUnbU0SZzLtpbfMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyvELLVteHVe9UZvoio90k5VkZYDN5tow8fZJ9hfYSA=;
 b=KiOXOykDovCBJDV5gw0xYmaI8ijVsc1ldxu8qyrOGZcLAz47VNZ0X34LHQpPpR+Vtt
 Dk5R3bxR7n19HiEcOj5Rb8cQfK2V1/L7DgeGEb0HWErxLSLIN5YVjYFszkXyT4gkkfcV
 vbJIAmBXbhOEn3VuDBntClCy4/547ALAQdrxbW+VlC5Tlkzzsn6/Fl0pgKQK9VjdjxfR
 vMXsq+Vl+Ei4KDIxvFjpwe7ZvAtLjrWLCi1cwQJW00Xv8+W6jBKtUc+DzGud4RWb69pd
 ypyWYLSmEgafgNnzR4rDo0SAbxSDFuuCRy/q4/Xk9pj8V/K+wdP0stZovpKH/0uMc6r5
 5UHQ==
X-Gm-Message-State: AOAM533nKE9NAi1DfWdHx+MPGXmBYFKCXkE1gDNL3PlWM7rXr4iB2d2s
 JqiQAhaAbqgCF1WUAuxfZUmfI4o9h/R9Dt/zKMblKQ==
X-Google-Smtp-Source: ABdhPJy/U9WvN1PxTr1n95vCmFPVyX1Gx9b/vpurobzo1CigY2d/GU6G0QziWWJt/L7nbuShpIMy3vStZBGd8ouVKJQ=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr7534380otr.303.1595579765430; 
 Fri, 24 Jul 2020 01:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
 <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
 <20200722222243.GM6419@phenom.ffwll.local>
 <d05752c669260a7662d7208a4ce602b75ff33b30.camel@pengutronix.de>
In-Reply-To: <d05752c669260a7662d7208a4ce602b75ff33b30.camel@pengutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Jul 2020 10:35:54 +0200
Message-ID: <CAKMK7uEoT765tLCaTFcC2CcBPqypkCzgoitEfOR-XnQ-NJPuKA@mail.gmail.com>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 4:46 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Daniel,
>
> On Thu, 2020-07-23 at 00:22 +0200, daniel@ffwll.ch wrote:
> [...]
> > Yeah the drmm_ versions of these need to check that the ->cleanup hook is
> > NULL.
> >
> > Also there's not actually a double-free, since drm_foo_cleanup removes it
> > from the lists, which means drm_mode_config_cleanup won't even see it. But
> > if the driver has some additional code in ->cleanup that won't ever run,
> > so probably still a bug.
> >
> > I also think that the drmm_foo_ wrappers should also do the allocation
> > (and upcasting) kinda like drmm_dev_alloc(). Otherwise we're still stuck
> > with tons of boilerplate.
>
> Ok, I'll try this:
>
> drmm_encoder_init() variant can verify that the passed
> drm_encoder_funcs::destroy hook is NULL.
>
> drmm_simple_encoder_init() can just provide empty drm_encoder_funcs
> internally.
>
> > For now I think it's ok if drivers that switch to drmm_ just copypaste,
> > until we're sure this is the right thing to do. And then maybe also roll
> > these out for all objects that stay for the entire lifetime of drm_device
> > (plane, crtc, encoder, plus variants). Just to make sure we're consistent
> > across all of them.
>
> Thank you for clarifying, I wasn't sure this was the goal. I've started
> with this function mostly because this is the most used one in imx-drm
> and the only one where I didn't have to deal with va_args boilerplate.

Hm if we go with also exposing the drmm_foo_init() variants then I
think these should check that the passed-in memory is indeed allocated
by drmres on the right device. That's kinda the bug I'm afraid of when
we exposed drmm_foo_init() to drivers and not just drmm_foo_alloc()
which does everything and correctly for you. For the drmm_is_manged or
so I think we can just reuse the same loop I've typed up already for
drmm_kfree. There shouldn't be too many allocations on that list that
the list walk at driver load will matter. Oh also better name than
drmm_is_managed would be good, devres doesn't seem to have that. Hm
maybe drmm_assert_managed(dev, void, size) and it checks that it's
fully contained within a drmm_kmalloc region.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
