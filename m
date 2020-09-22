Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB52743D3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11932890BD;
	Tue, 22 Sep 2020 14:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997F96E87D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:04:37 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id o6so15720848ota.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4wgsKb3OxXUR5z4H154VpwPi1Z3KYkIOiID7wIY/k60=;
 b=VuFbLfEkHjH/cqWfMgjOT1SBBW/VmcOZqmgV9/23MU+ZebYLhjw6ZxNSK7QeDY1nps
 vFdkzJgmBfJmbbz1bLI8yzePYGFfIX0SU9TTcX2dIsY4uN+cS4vZ1qWiH69Veq+qgLeY
 Lib7wisL9um7XAFnG2j4K0NDro2WwTdN3zD5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wgsKb3OxXUR5z4H154VpwPi1Z3KYkIOiID7wIY/k60=;
 b=LSbjn/vc5ToAyKQJxR7PN2HE2ZKGigXS4ngv5wEoGnBG4nOuU2g7VcR3eqXDIg7rkq
 iKBJ76epA/rFP2y8TVbL9gUQISzcOd3F9mdL2R0zxEj3Kj0g6LFHRUARDqhPLy5ui13F
 4gQGdoU7LfcIh3yhY2ZnAvexCPR9F1mxE6PCLDBiLMG91AtfcXirLPQcGtoOVu4RbS6R
 LrPOHQ1ZWmGYBhRoHUwMCJ2AE8vaj2qiDuNSe7x4ywiZfE2PufIOGkJzmOlgSdM3s7p4
 cd5m6ayjEhaUWJkC3L92VhlEycB0jkhMEUhdDawiEDReJXrXKGvLzMNA5YzSOZupJ3WD
 MREQ==
X-Gm-Message-State: AOAM530do0vnbPfWBbJw0W0O71j9PL0JAALjX/aHiEhvlV/RRiMcbVGL
 X1g4+O2a+afoK2UK2bYWyncnHCbgD8qai04PJa6ewA==
X-Google-Smtp-Source: ABdhPJyBv0gaPZG8IMejxtaWlLqVobObYy9jnCpfJVkRMSl5clWfYxjah6xzCFeAm32mJoMmmJgojTQBRrTDfhZWFQ4=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr2796996otj.303.1600783476894; 
 Tue, 22 Sep 2020 07:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
 <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
 <20200922133636.GA2369@xpredator>
In-Reply-To: <20200922133636.GA2369@xpredator>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Sep 2020 16:04:26 +0200
Message-ID: <CAKMK7uHCeFan4+agMn0sr-z9UDyZwEJv0_dL-K-gA1n0=m+A2w@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Marius Vlad <marius.vlad@collabora.com>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 3:36 PM Marius Vlad <marius.vlad@collabora.com> wrote:
>
> On Fri, Jan 31, 2020 at 07:34:00AM +0000, Daniel Stone wrote:
> > On Thu, 5 Jul 2018 at 11:21, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > reconfiguring global resources).
> > >
> > > But in nonblocking mode userspace has then no idea this happened,
> > > which can lead to spurious EBUSY calls, both:
> > > - when that other CRTC is currently busy doing a page_flip the
> > >   ALLOW_MODESET commit can fail with an EBUSY
> > > - on the other CRTC a normal atomic flip can fail with EBUSY because
> > >   of the additional commit inserted by the kernel without userspace's
> > >   knowledge
> > >
> > > For blocking commits this isn't a problem, because everyone else will
> > > just block until all the CRTC are reconfigured. Only thing userspace
> > > can notice is the dropped frames without any reason for why frames got
> > > dropped.
> > >
> > > Consensus is that we need new uapi to handle this properly, but no one
> > > has any idea what exactly the new uapi should look like. As a stop-gap
> > > plug this problem by demoting nonblocking commits which might cause
> > > issues by including CRTCs not in the original request to blocking
> > > commits.
> Gentle ping. I've tried out Linus's master tree and, and like Pekka,
> I've noticed this isn't integrated/added.

Defacto the uapi we have now is that userspace needs to ignore "spurious" EBUSY.

> Noticed this is fixing (also) DPMS when multiple outputs are in use.
> Wondering if we can just use a _ONCE() variant instead of WARN_ON(). I'm seeing
> the warning quite often.

This would be a driver bug I think. That really shouldn't happen for
normal page flips.
-Daniel

> >
> > Thanks for writing this up Daniel, and for reminding me about it some
> > time later as well ...
> >
> > Reviewed-by: Daniel Stone <daniels@collabora.com>
> >
> > Cheers,
> > Daniel
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
