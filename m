Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155FC20390F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110EA6E81C;
	Mon, 22 Jun 2020 14:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473946E81C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 14:24:50 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id d67so15742104oig.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pq0o845q+TFQnWFAED4xcPE0QdHR/oMejdmFT1x2Uzs=;
 b=i0IOWNGGdNTWcqQLuW+vUKnjl4aKC1xOUiF70Mp2zvzwru/EEg0bXrrXPmy3GeMiCn
 IU1HdQYfoeJZFsm8ACrVC6IMustvrxDtVvaP4+WDTrSNcF/dhMevovEJxw+P1MqTb7GT
 tg9eszkYj/qY5Qtmv8RuOsDCGlHXy0hbkcrvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pq0o845q+TFQnWFAED4xcPE0QdHR/oMejdmFT1x2Uzs=;
 b=lpQWMFMYuHjXJn5b4h+MTo/a8+uHiu+EYhuuxHK5xltjQWk7O7yetlOYXVYwI0ydLW
 0mElmrxIAYa2pm4rsWY5e7HAjkMBnAvOoQp1Yr4SsnK2BzaUJql9Jd2JDOn4TjvASY6p
 DCwa/wxALLxZtVL331/ZZbSPJlw6XIHI1RcMC7AVRmu5JCi1AOABtnTvPDryGRzFrkb3
 i6pNNjTDU5AORr/tgbtBkzTjQbjTBhkAyZ547vCI+mmzFN04PqLiPJF7uboUmG771V2/
 ggYNFxoMEJylLtH9iWOfiEJ8kWmFX6VAh7Nspquo0fCwpSx/g5VWMWeK4H98nW5VD0pu
 9XeA==
X-Gm-Message-State: AOAM5310YBxH46IPuNn8u9YXk9YUa4X0WFpQuElgXxTf92Be2GPM+EKw
 RPS/cxJZYfAHC4JrHfRyw08MH24421a1zxPa+YZCog==
X-Google-Smtp-Source: ABdhPJxynmWvG+o/4EbTUhESpNF8T0bjh0oo/UhhSp2gK3yu79zD1BCCEtPMCyC+Sd6x2stT7jV4+WgNcwRpv720yEI=
X-Received: by 2002:aca:ad97:: with SMTP id
 w145mr12706039oie.128.1592835889599; 
 Mon, 22 Jun 2020 07:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <20200622093501.GZ20149@phenom.ffwll.local> <20200622172157.49b835ca@eldfell>
In-Reply-To: <20200622172157.49b835ca@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Jun 2020 16:24:38 +0200
Message-ID: <CAKMK7uG+RTRZ39na3GO7OWiUASokEhe0Ndkex9vNOMj7R34Dwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 4:22 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 22 Jun 2020 11:35:01 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Sun, Jun 21, 2020 at 02:03:01AM -0400, Andrey Grodzovsky wrote:
> > > Will be used to reroute CPU mapped BO's page faults once
> > > device is removed.
> > >
> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > ---
> > >  drivers/gpu/drm/drm_file.c  |  8 ++++++++
> > >  drivers/gpu/drm/drm_prime.c | 10 ++++++++++
> > >  include/drm/drm_file.h      |  2 ++
> > >  include/drm/drm_gem.h       |  2 ++
> > >  4 files changed, 22 insertions(+)
>
> ...
>
> > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > index 0b37506..47460d1 100644
> > > --- a/include/drm/drm_gem.h
> > > +++ b/include/drm/drm_gem.h
> > > @@ -310,6 +310,8 @@ struct drm_gem_object {
> > >      *
> > >      */
> > >     const struct drm_gem_object_funcs *funcs;
> > > +
> > > +   struct page *dummy_page;
> > >  };
> >
> > I think amdgpu doesn't care, but everyone else still might care somewhat
> > about flink. That also shares buffers, so also needs to allocate the
> > per-bo dummy page.
>
> Do you really care about making flink not explode on device
> hot-unplug? Why not just leave flink users die in a fire?
> It's not a regression.

It's not about exploding, they won't. With flink you can pass a buffer
from one address space to the other, so imo we should avoid false
sharing. E.g. if you happen to write something $secret into a private
buffer, but only $non-secret stuff into shared buffers. Then if you
unplug, your well-kept $secret might suddenly be visible by lots of
other processes you never intended to share it with.

Just feels safer to plug that hole completely.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
