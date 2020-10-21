Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CB2950D4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 18:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C686E28B;
	Wed, 21 Oct 2020 16:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919B06E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:34:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c16so3279988wmd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w1XFXB4Lo0aWOgZF5lGLmTIHFRPFV3ALzwHfkaTecHk=;
 b=KRAdZ5EHZhGlOY9kYxl4cbmtfro/BKg/yv6DqN0dBOjvY3WvA++BZw33nidAz4KUTN
 mTJh5IzwKccgptRMeoYAJGOz3+iPBErvEleGjAArtx4ryzL7toqd/imSaICsaCiV622v
 bmiz7E9OuViwli/Mc2bXTzJo3YJsNwEGwJFoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w1XFXB4Lo0aWOgZF5lGLmTIHFRPFV3ALzwHfkaTecHk=;
 b=mZz4vbao8BhzJZpr7YyWznNmT35TYdk/YuCgF2/K0hZ+GYFvhq3ZhaM/P/UWPVQ082
 OtoHPMB6HUZkbhjW+6KD/0Yw0EUB3yUaXZlBopbwKQDo0azYXoKXMCQXOyeo7DJ9NXdc
 pdbhSHsgdAJktPquQNHgA41JC4z6fLEj094o05bU7uSjOYva4NZqMXfFYFnFq0AmHM1P
 gudughZmLoO6o9m2cSdykTwn8WCsoC3Zq+hkrh5RpXlDoyPvIVb2wqlkKTI56Y6iwgln
 vUIqq9O/rhbwfHZ3ylyTe7cdgw3e8HuhJgNtCpNoZ8Z1fsZEimOXpUpZgc/+ExkG5AJg
 +Ukg==
X-Gm-Message-State: AOAM530FSmA/hdmwkszY/IgCVIX/+eiDAofWveWXFK+2gRMOl0DNWk5t
 pXx83pvULLQtzedwQWmjR1FFeQ==
X-Google-Smtp-Source: ABdhPJxD5BXcGhMlk4C+AiZAera5C1GikZByVFHzWSQGo/agy+tg4D8YH38faq/jTFL5oTYnc+1BgA==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr4216159wmi.29.1603298095017; 
 Wed, 21 Oct 2020 09:34:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 30sm4982706wrs.84.2020.10.21.09.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:34:54 -0700 (PDT)
Date: Wed, 21 Oct 2020 18:34:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
Message-ID: <20201021163452.GP401619@phenom.ffwll.local>
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
 <20201021083415.GN401619@phenom.ffwll.local>
 <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
 <CAKMK7uECj12NaOeh3PzLM8C_oT=_bce515z-5rDGnjkKf92Htw@mail.gmail.com>
 <CAPj87rMc5=eBKRDJUg0VSCCWcvNk6_8vj1TZeJcK8oPdi=DVwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rMc5=eBKRDJUg0VSCCWcvNk6_8vj1TZeJcK8oPdi=DVwQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Ken Huang <kenbshuang@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Adrian Salido <salidoa@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 05:11:00PM +0100, Daniel Stone wrote:
> On Wed, 21 Oct 2020 at 16:58, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Oct 21, 2020 at 4:59 PM Ken Huang <kenbshuang@google.com> wrote:
> > > It's useful in Android and other embedded devices to implement Always On Display (ex. showing clock faces with less than 15% OPR on screen).
> > >
> > > OPR (On Pixel Ratio) is the percentage of luminance amount over the display area.
> > > It's derived by gray levels of display image pattern and the backlight (or OLED) driving force (or current).
> > > ex: OPR=100% means a full white pattern with maximum backlight (or OLED) brightness, while full black would be OPR=0%.
> > >
> > > In userspace, when the client initializes, we can set capability via drmSetClientCap() to ask the display driver to expose the drm modes with DRM_MODE_FLAG_LOW_POWER flag.
> > > Userspace can check DRM_MODE_FLAG_LOW_POWER flag to know which modes can be used to consume the least amount of power during Always On Display.
> > > Ignoring modes with this flag set during normal operating mode.
> >
> > Hm I'm not really sure what this changes ... I think we need the
> > entire pile of patches: Userspace, driver, drm core, anything else.
> > Just adding this flag doesn't make much sense really, since I have no
> > idea what the semantics are. Even after you've explained the use-case.
> 
> It makes sense to me: some modes are annotated with a 'low-power'
> flag, tucked away behind a client cap which makes clients opt in, and
> they can switch into the low-power mode (letting the display/panel
> save a lot of power) _if_ they only have at most 15% of pixels lit up.
> 
> My worry is about the 15% though ... what happens when hardware allows
> up to 20%, or only allows 10%?

Yeah exactly, that's what I'm worried about too, these kind of details.
Opt-in flag for special modes, no problem, but we need to make sure we
agree on what flavour of special exactly they are.

> If we can reuse the same modelines, then rather than create new
> modelines just for low-power modes, I'd rather create a client CRTC
> property specifying the number/percentages of pixels on the CRTC which
> are lit non-zero. That would give us more wriggle room to change the
> semantics, as well as redefine 'low power' in terms of
> monochrome/scaled/non-bright/etc modes. But it does make the
> switching-between-clients problem even worse than it already is.

Yeah, that would make sense too. Or maybe even add read-only hint that
says "if you're below 15% non-black we can do low power for your, please
be nice".
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
