Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58028C998
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420286E8AD;
	Tue, 13 Oct 2020 07:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF826E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 07:53:55 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id d28so18261248ote.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xiXjRcPK59Z00b5kWNrryLlI+LbUqqLFwZPEJ/mj9TQ=;
 b=UAC+Al6lRxlOvjOYuseWIzbOGEMq176KtSm7kmUK4JU7UoNRn4fD28KR5v7won2/zb
 S9oj9ZjvNGi/r2Rm8bApAMknVB4HXVCnWyWiRlm4YRKCm8UZack45LD7L7AyqniKiRHj
 kMz73FuzDIKe9KEaVHiuj+Oc2EuGl5HUF0TfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xiXjRcPK59Z00b5kWNrryLlI+LbUqqLFwZPEJ/mj9TQ=;
 b=YkDzupQHzgEdVBP2IPukngekWcd616+1w5yUIBNIex5b1twwt5sYX3kUI43auohv61
 dSUee1zi1NjP/kbHaqIbgVvJ9a+q87qCTVdfZdNa4FBe5RX07cd73dqxWAEjQrOlUUZ1
 /fy0S1xLRy7DxFL/cBRATrpbsKTxVDmVbQrNJ5vtQ6yaQc3FIn3zQz2bh4JgyCIIYqUp
 Wm9XsHS3yO1ycjz5liXweH1FCd2XbFLPSJBnaJVI8y0yUdBDAkm7+HxZ6PJBG2YmQ0kD
 ddoFb4EU4vDUsA6YuoxeTgnM6wlaOBW8Euw6qKJBLzQIXbVnN9mjnpisJI3kpO8DiK90
 qzcA==
X-Gm-Message-State: AOAM531gzX0tkcpact5YLPrDoMkhUlSNNGzipX9wsZ7vD5avbxnYZ0LC
 uiIZrmV4YfQ05N3GM/+LtRWlUT/d3gOHMRSNHndvcQ==
X-Google-Smtp-Source: ABdhPJwBMlQSL2U8rDT4u3S/GJOzya8g3WfuZrYr0OKdflPeoRhpp4cAdftwF65RghOhuxevaU7VWFM7dPOUtBjPSZ4=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr22361108ote.188.1602575634967; 
 Tue, 13 Oct 2020 00:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201012132452.1241297a@linux-uq9g>
 <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
 <20201012142335.GY438822@phenom.ffwll.local>
 <20201013091410.06c98a1c@eldfell>
In-Reply-To: <20201013091410.06c98a1c@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Oct 2020 09:53:44 +0200
Message-ID: <CAKMK7uHY_nrB=0-xkWi+FXFosCY1XPVXLJb+mGqDR+GpRZ6C6Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 8:14 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 12 Oct 2020 16:23:35 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, Oct 12, 2020 at 02:40:58PM +0200, Neil Armstrong wrote:
> > > Hi,
> > >
>
> ...
>
> > > It's weird because it the kernel is misconfigured and no console is specified on the cmdline
> > > this console could become the main console...
> > >
> > > It's a great feature, but couldn't this be a module parameter ?
> >
> > If you have vkms enabled in a distro, you're doing it wrong.
>
> That's really not a great position to take. I would prefer that
> if a random contributor writes a Weston patch and runs 'meson test', it
> will use VKMS to run Weston's DRM-backend tests on his machine
> automatically, maybe save for some seat and device node access
> permissions bits which distributions could be delivering as well.
>
> Just put the VKMS device node into a non-default seat, and Xorg etc.
> will happily ignore it.
>
> For the fbdev device node, I don't know. Maybe a module parameter
> really is a good choice there, defaulting to off. I have no interest in
> testing anything against fbdev, but other people might disagree of
> course.
>
> Why? Gitlab CI is still not running tests for every commit, just per
> MR, and it might even be infeasible too.
>
> I am also hoping for a future where I don't have to build my own kernel
> just to be able to run Weston DRM tests with VKMS. That means I want to
> be able to run my machine with VKMS loaded and active at all times,
> without affecting the normal desktop. I already have such a setup with
> an extra AMD card, but you can't run most KMS tests against real
> hardware drivers.

I just realized that building vkms is no problem, since it doesn't
auto-load. And if our Grand Plans with configurability come true, then
your test-harness will want to do that loading and setup itself
anyway. With that there also shouldn't be any problems with fbcon,
since presumably you already have that bound to the real gpu.

So I think we're all fine here, for everyone.

Now if you built-in vkms, that's a different thing. And for that I
really think a "don't do that" is the right choice.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
