Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B22A279537
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 01:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ACE6ED80;
	Fri, 25 Sep 2020 23:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8446E6ED80;
 Fri, 25 Sep 2020 23:54:01 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id o64so220965uao.1;
 Fri, 25 Sep 2020 16:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3a4T/qYjLdTTJwj1OQmoXaHAUT02pWpKA08ylkAqoE=;
 b=pZaKST1eNFt4jcmFP/Xj2Ni0tuhAp2ZmWwHuNmX9bKxuv6RCu6/69hYpJBiy7GcWOh
 N3h6y71Y1jEmSo+YUKAjPOtI4Nhs2uO7KKnaeKQOEVClHkWzmQGlQQnIeWO5GnVvgCzW
 w4Ozwrn/tnDgcOw93WcfHUxBml9D0itIFao5Wv/C9de/jwdBHOZMAEY79mo/puERtSfn
 Wj7NhXD4kDsJx7RnRKg6ouEX0wNOdyaJi7q1tQTKmcWeS3TjAXW8ojMjp692EJ14lIyy
 jTKPx0ioeW8kU729YKVFO1dWYV0LYDnDtrPUp8crCWp6zMA9zAK3IThq3EQksrdDN5jj
 RovQ==
X-Gm-Message-State: AOAM533yoCOS0ycem1XccF6qekP3uLPcSeykGFUM/kqrnlWpr6CGEcMe
 xr0Yj/csbW1HfG3g5r38YUxjVjgp9Y23zpQC9Bo=
X-Google-Smtp-Source: ABdhPJwPZLu2RiCnmxt1vGCrhOphqmf64XIDBpJTmDRTMaVG8mO61nql1FdhcQeKjUCxnIL8mHJNDkfziqyduuXBIFk=
X-Received: by 2002:ab0:2741:: with SMTP id c1mr764744uap.98.1601078040403;
 Fri, 25 Sep 2020 16:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200922210510.156220-1-lyude@redhat.com>
 <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
 <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
 <CAKb7Uvj++15aEXiLGgSZb37wwzDSRCetVT+trP6JNwhk8n-whA@mail.gmail.com>
 <8bd8ee03f88e7e674e0ea8c6d63d783777cfe414.camel@redhat.com>
In-Reply-To: <8bd8ee03f88e7e674e0ea8c6d63d783777cfe414.camel@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 25 Sep 2020 19:53:49 -0400
Message-ID: <CAKb7UvgL_rV73BqvVoZsagy+_+cnBios1pKazq064D51NdAuqw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
To: Lyude <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 6:08 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2020-09-22 at 17:22 -0400, Ilia Mirkin wrote:
> > On Tue, Sep 22, 2020 at 5:14 PM Lyude Paul <lyude@redhat.com> wrote:
> > > On Tue, 2020-09-22 at 17:10 -0400, Ilia Mirkin wrote:
> > > > Can we use 6bpc on arbitrary DP monitors, or is there a capability for
> > > > it? Maybe only use 6bpc if display_info.bpc == 6 and otherwise use 8?
> > >
> > > I don't think that display_info.bpc actually implies a minimum bpc, only a
> > > maximum bpc iirc (Ville would know the answer to this one). The other thing
> > > to
> > > note here is that we want to assume the lowest possible bpc here since we're
> > > only concerned if the mode passed to ->mode_valid can be set under -any-
> > > conditions (including those that require lowering the bpc beyond it's
> > > maximum
> > > value), so we definitely do want to always use 6bpc here even once we get
> > > support for optimizing the bpc based on the available display bandwidth.
> >
> > Yeah, display_info is the max bpc. But would an average monitor
> > support 6bpc? And if it does, does the current link training code even
> > try that when display_info.bpc != 6?
>
> So I did confirm that 6bpc support is mandatory for DP, so yes-6 bpc will always
> work.
>
> But also, your second comment doesn't really apply here. So: to be clear, we're
> not really concerned here about whether nouveau will actually use 6bpc or not.
> In truth I'm not actually sure either if we have any code that uses 6bpc (iirc
> we don't), since we don't current optimize bpc. I think it's very possible for
> us to use 6bpc for eDP displays if I recall though, but I'm not sure on that.
>
> But that's also not the point of this code. ->mode_valid() is only used in two
> situations in DRM modesetting: when probing connector modes, and when checking
> if a mode is valid or not during the atomic check for atomic modesetting. Its
> purpose is only to reject display modes that are physically impossible to set in
> hardware due to static hardware constraints. Put another way, we only check the
> given mode against constraints which will always remain constant regardless of
> the rest of the display state. An example of a static constraint would be the
> max pixel clock supported by the hardware, since on sensible hardware this never
> changes. A dynamic constraint would be something like how much bandwidth is
> currently unused on an MST topology, since that value is entirely dependent on
> the rest of the display state.
>
> So - with that said, bpc is technically a dynamic constraint because while a
> sink and source both likely have their own bpc limits, any bpc which is equal or
> below that limit can be used depending on what the driver decides - which will
> be based on the max_bpc property, and additionally for MST displays it will also
> depend on the available bandwidth on the topology. The only non-dynamic thing
> about bpc is that at a minimum, it will be 6 - so any mode that doesn't fit on
> the link with a bpc of 6 is guaranteed to be a mode that we'll never be able to
> set and therefore want to prune.
>
> So, even if we're not using 6 in the majority of situations, I'm fairly
> confident it's the right value here. It's also what i915 does as well (and they
> previously had to fix a bug that was the result of assuming a minimum of 8bpc
> instead of 6).

Here's the situation I'm trying to avoid:

1. Mode is considered "OK" from a bandwidth perspective @6bpc
2. Modesetting logic never tries 6bpc and the modeset fails

As long as the two bits of logic agree on what is settable, I'm happy.

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
