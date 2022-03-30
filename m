Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2F4EBDEE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E3B10F5F2;
	Wed, 30 Mar 2022 09:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346110F55B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:45:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q20so11881148wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KbOJCKrwaDddMNuzuVStNgP4r5shpPJ35QDTdXWDiFI=;
 b=JTzOmeC7QfdyOiHNf/S/qbzp91IPa9P15fEjpWz8sx0nlVRUG9vI7z64ne9E3ALV1f
 cJUbpv476bz7NDNDMYCca6f3IvdvxOIBm0Cr6d9ufbhlcVYJS4bz4r+Oqd2Uptx4NFOK
 z97HlWk05MQSnAGHEu5mFVdfV4gX1POgLHri8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KbOJCKrwaDddMNuzuVStNgP4r5shpPJ35QDTdXWDiFI=;
 b=Tei7uiJr1JTyGrFT5VLtMVONyntIR+RlTNlsIavOX4FXOvn6W7J4a/PqBAFnvy66so
 IRz8rLBnhcHcsMp7WfKsV5kR1dUxE/suFG1Sxyi1+HX5Dhi6EelT6EuufMIzQho9N3vU
 JuBAXNUhzTxFBtnvMcDHKPS97AJtSbGIgto8ZJYqCns/opy+4y5S06B8MJUEroQ5oT2d
 bA7xb/gW2M0XqNFH3CnD0KedTvQKtA452LVeCZVKMkY9HmEeAklEtCk+blp/VKjHtHqE
 bc5S+2bFcnECt4Cz7oOYkhPI5fcWVzpOqVUHsl4UmNzahuF1gE5ZwHh4bDGxkFCzysrS
 Q+Eg==
X-Gm-Message-State: AOAM531m/Aws6M7dn2szQPqpyDvJL7kXZruY6aNWRfGpk58fAHpLe10Z
 9jStDMfUfxyTfXTkd+Qs8DvQ3f41D1+qf22v
X-Google-Smtp-Source: ABdhPJx33YW+Mcs4+/lL625QUX85LgQxyqgQX6urCzcMM+8tpWXWCL3jU+ZzJh6gX/O2ZX9eDzaIYQ==
X-Received: by 2002:a05:600c:198f:b0:38c:a9e9:754a with SMTP id
 t15-20020a05600c198f00b0038ca9e9754amr3578761wmq.146.1648633519996; 
 Wed, 30 Mar 2022 02:45:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b00205918bd86esm16891954wru.78.2022.03.30.02.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 02:45:19 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:45:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: BUG: KASAN: use-after-free in drm_atomic_helper_wait_for_vblanks()
Message-ID: <YkQmrQCt5IPOMxj8@phenom.ffwll.local>
References: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
 <20220311142205.ztg6njrubmnjud7c@houat>
 <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 12:53:30AM +0300, Dmitry Osipenko wrote:
> On 3/11/22 17:22, Maxime Ripard wrote:
> > Hi Dmitry,
> > 
> > On Thu, Mar 10, 2022 at 03:33:07AM +0300, Dmitry Osipenko wrote:
> >> I was playing/testing SuperTuxKart using VirtIO-GPU driver and spotted a
> >> UAF bug in drm_atomic_helper_wait_for_vblanks().
> >>
> >> SuperTuxKart can use DRM directly, i.e. you can run game in VT without
> >> Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
> >> non-blocking atomic page flips and UAF happens when a new atomic state
> >> is committed while there is a previous page flip still in-fly.
> >>
> >> What happens is that the new and old atomic states refer to the same
> >> CRTC state somehow. Once the older atomic state is destroyed, the CRTC
> >> state is freed and the newer atomic state continues to use the freed
> >> CRTC state.
> > 
> > I'm not sure what you mean by "the new and old atomic states refer to
> > the same CRTC state", are those the same pointers?
> 
> Yes, the pointers are the same. I'd assume that the newer atomic state
> should duplicate CRTC state, but apparently it doesn't happen.

The legacy cursor hack stuff does this, and it pretty fundamentally breaks
everything. Might be good to retest with that disabled:

https://lore.kernel.org/dri-devel/20201023123925.2374863-1-daniel.vetter@ffwll.ch/

The problem is a bit that this might cause some regressions, for drivers
which don't yet have the fancy new cursor fastpath for plane updates.
-Daniel


> >> The bug is easily reproducible (at least by me) by playing SuperTuxKart
> >> for a minute. It presents on latest -next and 5.17-rc7, I haven't
> >> checked older kernel versions.
> >>
> >> I'm not an expert of the non-blocking code paths in DRM, so asking for
> >> suggestions about where the root of the problem could be.
> > 
> > Does it occur with other platforms? Can you easily test on something else?
> 
> Shouldn't be easy to replicate this on other platforms, but I'll try.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
