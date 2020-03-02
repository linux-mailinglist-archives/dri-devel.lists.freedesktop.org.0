Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F199B175742
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4256E1F3;
	Mon,  2 Mar 2020 09:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76796E1F3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:36:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v2so11527319wrp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bT1Y+mUIU7xcRwW2i9E/T7191FycwgyjFlm/K/VgOMU=;
 b=OYFO9J3mjGCs6MFFcZSndPzFiA+vQHzzVXvTUxj4HBmUJ5kRQ5gPM3UDfZGXG7faLg
 78M2ZGy3swqBgvAj+wzOImFTx3tQwYSwPMlr6ldBc6HqsXxyWG6kXmhBgFdLGdLh5lQN
 kptzwdWT7omuq2QfpBpv2gRXHL3cHaUezL5Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bT1Y+mUIU7xcRwW2i9E/T7191FycwgyjFlm/K/VgOMU=;
 b=qPMs1Nvv8sjzi+1t+zF8IQ+I0yNT8nWMpWTN/ZtUauYC/EhuH5sNoxO2ixLmICWFIs
 y383Ybd161yT2DWHF22PYr3sOxi45vfjF3h8UX725xPN3O7t0oTW4qHRm+RcMjLOLY27
 z5JFjV3+y7svNVxk4cu698pwBUWBHKPkrE8WjH9PWt9v+uVLF+cueNsoEEd+6soMA6Uj
 olvRkZgoKd4y0aTpOqduRT3nql9Gy6fkd+xModtHiFUhRq55HP6zXGXf1vBDqtKvygE7
 zwmwqnc3ifGOgTYJYwYOKqGI/EQ+63ySIEQAwUCMH9VVQ2Omfxni9cc/eKeiyKVxOFV7
 Spxg==
X-Gm-Message-State: APjAAAVyqaZVvg7cpRpEmT3o0B6V3pwJmg3toQjyRJaNBhGuOzvbyKco
 rRmziEnSMqOU1frsKkZdoikiPg==
X-Google-Smtp-Source: APXvYqzD1lvE95IKDrDQssMyeZZ9C20r31OpGhphgk9UjZrsqdCLFDmUk+0q2PehrX3szjsfwebOkA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr21313680wrs.230.1583141803047; 
 Mon, 02 Mar 2020 01:36:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y12sm27388889wrw.88.2020.03.02.01.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 01:36:42 -0800 (PST)
Date: Mon, 2 Mar 2020 10:36:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200302093640.GC2363188@phenom.ffwll.local>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
 <20200229111710.GB3674@ravnborg.org>
 <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
 <87blpfqffp.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87blpfqffp.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:22:34AM +0200, Jani Nikula wrote:
> On Sat, 29 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Sat, Feb 29, 2020 at 12:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >> > > > +     /**
> >> > > > +      * @managed:
> >> > > > +      *
> >> > > > +      * Managed resources linked to the lifetime of this &drm_device as
> >> > > > +      * tracked by @ref.
> >> > > > +      */
> >> > > > +     struct {
> >> > > > +             struct list_head resources;
> >> > > > +             void *final_kfree;
> >> > > > +             spinlock_t lock;
> >> > > > +     } managed;
> >> > >
> >> > > I am missing kernel-doc here.
> >> > > At least document that lock is used to guard access to resources.
> >> > > (s/lock/lock_resources/ ?)
> >> >
> >> > Dunno why, but the support for name sub-structures seems to have
> >> > broken in kerneldoc. So I can type it, but it's not showing up, so I
> >> > didn't bother. Well I had it, but deleted it again. It's still
> >> > documented to work, but I have no idea what I'm doing wrong.
> >>
> >> Most readers prefer the .c files as the source.
> >> I personally read the generated kernel doc when I google
> >> and when I check that my own stuff looks good in kernel-doc format.
> >> So comments are still valueable despite not being picked up by
> >> kernel-doc.
> >> You know this - but I just wanted to encourage you to write the few
> >> lines that may help me and others :-)
> >
> > Hm I thought way back this actually worked. Again ping for Jani, he's
> > better on top of what's happening in kernel-doc land.
> 
> I haven't really been all that active lately, but I think the syntax
> here would be e.g. "@managed.resources:".

That's the one that doesn't seem to work unfortunately.

Adding kerneldoc people and mailing list, maybe this was intentionally
removed somewhen ... Jon, any pointers?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
