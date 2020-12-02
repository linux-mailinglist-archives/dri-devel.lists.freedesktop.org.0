Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC32CBD23
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 13:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE186EA17;
	Wed,  2 Dec 2020 12:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13AD6EA17
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 12:38:53 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w15so1361993oie.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 04:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=II2Z8fMkjiyLwOGWTX9ol8gURECc5ZUa4Jue4e2kl7c=;
 b=DkuhBlnL/fwT/2DNXJltkE8pY73ouylF+jlKsK2EHz7H0/t/JC+UfJA80O9UVxpewQ
 C/Sh6Bg9MEReH+4ae+pD1DY5vpqH+JgeOioTAQagqbM3vcmh75iuVtwmfkYQA/RVjOwp
 00ZS7AdQ4eqz7tDcfWx/sqTiDnbIOADaCScTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=II2Z8fMkjiyLwOGWTX9ol8gURECc5ZUa4Jue4e2kl7c=;
 b=sXEqO6m95/q9B1aq11WH3qZFJ7I+cqZs6+joWc5VWNArOm+qXcLhufjWmiYaltdMAa
 GcnEUo6xkXa/pa47uAK/BfXKs098nBcdarsfbRgxaA7Ft4jPPYj0uFh7N5GXfP1g08rc
 iKA2dZpiN9+kyxSvcU2FXKbfwbWdTNAHQ214wfn7Tmx2f4fS6bdtqXBiSdmt2nkEPBeM
 jgKv6wfhDe5ApVkE3qaK+q1APytu103k2jwV3Ji6AWZnsKegZMX+0i2Av6G5pejCGI6f
 QLdgUJ2g5tgR9NfRxIHNC7BPw6mXScElPJthNOqUaRC8ogSmwy6N7LcQtn4qmka4FdyT
 Op1w==
X-Gm-Message-State: AOAM5337SHmh+a8hVYB6weMgpabxA6PuUlHI98wGHhm+8sUoJeYzHA4m
 R/WRzW+HFaOafHR6PvqzqirF2oIm7eS2UfoIR2+IEy+/UQM=
X-Google-Smtp-Source: ABdhPJyGoDgEnQgtboXPL56SJdIYWIV2Px1HTwMT7dIcG5fCZjw2dX3FX8kaxz8kjlePg1zVYw7/scNKqw1ksUHWlT8=
X-Received: by 2002:aca:7506:: with SMTP id q6mr1397294oic.128.1606912733236; 
 Wed, 02 Dec 2020 04:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
 <20201130103840.GR4141@pendragon.ideasonboard.com>
 <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
 <20201130141057.GL401619@phenom.ffwll.local>
 <93e718be-01ff-fc5c-6497-f7afb2becb38@ti.com>
In-Reply-To: <93e718be-01ff-fc5c-6497-f7afb2becb38@ti.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Dec 2020 13:38:42 +0100
Message-ID: <CAKMK7uGY91+-HUuZfignoFJHWTm-zCAdsH4jLrC=EOXAHdEmvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sekhar Nori <nsekhar@ti.com>,
 Jyri Sarha <jsarha@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 2, 2020 at 12:52 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 30/11/2020 16:10, Daniel Vetter wrote:
>
> > The thing is, the legacy helpers should be able to pull off what userspace
> > needs to do when it's using atomic anyway. Hard-coding information in the
> > kernel means we have a gap here. Hence imo legacy helpers doing the right
> > thing in all reasonable cases is imo better.
> >
> > In many cases I think we should even go further, and ditch driver ability
> > to overwrite legacy helper hooks like this. I thought we'd need that
> > flexibility for legacy userspace being incompatible in awkward ways, but
> > wasn't ever really needed. Worse, many drivers forget to wire up the
> > compat hooks.
> >
> > tldr, imo right thing to do here:
> > - move legacy gamma function from helpers into core code
> > - call it unconditionally for all atomic drivers (if there's no legacy
> >   drivers using the hook left then we can outright remove it)
> > - make sure it dtrt in all cases
>
> There are atomic drivers which have their custom gamma_set function. I guess they don't support
> atomic color mgmt, but do support (legacy) gamma.

Hm yeah, but it's this kind of feature disparity which is why I think
we should at least try to unify more.

> We could make the core code call the gamma legacy helper automatically for atomic drivers that don't
> have gamma_set defined but do have GAMMA_LUT or DEGAMMA_LUT. But the gamma_set function is called
> also in a few places from drm_fb_helper.c, so this code wouldn't be fully inside drm_color_mgmt.c.
>
> Or we could just change drm_atomic_helper_legacy_gamma_set() to do the right thing, depending on
> GAMMA_LUT & DEGAMMA_LUT existence.

Yeah that would be at least better than pushing more decisions onto
drivers as hard-coding. I still think that maybe just automatically
calling the helper when either a GAMMA or DEGAMMA lut is set up would
be better.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
