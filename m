Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF219798D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 12:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006C96E06E;
	Mon, 30 Mar 2020 10:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308986E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 10:45:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e9so9403931wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 03:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EOcx2/ay1mPN0F0n5YGVD+XDrnGMF3gy3Cot4J6al+8=;
 b=ShC2d2houGeht/atid683aLiRwIwLH0dYgsuI9DaYKP1sMjsTTiM5JFvryXooRD0rk
 oxxOPSo3eqofYgu/zgQOIWkXkSGZoIGsPnWNJAiz6B0Lr/sMMrfRptfwu4f9hC0YoHP1
 9xePpBUgtpZ43WTeIJUtPgZjqJoD25jydeUWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EOcx2/ay1mPN0F0n5YGVD+XDrnGMF3gy3Cot4J6al+8=;
 b=CcGwly4cOa7DTEEGk7G9hBtzHVTNkI44J7C1D11kF5Ul/gVrG/ibuuOxjisMiiLez2
 Ramz6Od81acMCXuecCWF5XykajgZ3/+gX7SIzV4eEyjNgnurKdS4AdNgKkj1RQhIECYH
 dWw8IXjkSPi8KpTqOQG3SqmgVUiLFWSXWMlFB3slhaSo4PRWvNqeC4bDCdMT5YDOYLif
 3o5Bxp0AFzNQndcFZw4cotkcA6D67MbSC2PyHVOa2fxopdK8RnjRnALhHsxqH1NeGXst
 wuK6hP/qz752S9WEiPpmng+sQa6JWSuLORwsWE+B6QFs6Ia7ehZhIGfPnpOZi/6QC3eS
 bQUw==
X-Gm-Message-State: ANhLgQ0lh90hn+ACuXHmgmzaBSOYbiXGjxGlBcqS9FwJO3UH6UlegQnL
 HfyzowGmI0u+FYdiDLkVQBMaIA==
X-Google-Smtp-Source: ADFU+vuks8WYde21HnCt/lMo2lO1Za/lMxK52SNMUU2U8Frr20n+KifPKJg3SAFVXzLzVlBGDaF3Ow==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr10487191wmk.101.1585565123679; 
 Mon, 30 Mar 2020 03:45:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm13905687wrp.30.2020.03.30.03.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 03:45:22 -0700 (PDT)
Date: Mon, 30 Mar 2020 12:45:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/managed: Fix off-by-one in warning
Message-ID: <20200330104521.GC2363188@phenom.ffwll.local>
References: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
 <20200328184942.GA28087@ravnborg.org>
 <CAKMK7uHjD-wc3qR6h76u+CSJVGC_cJktfwyQDs9Jrt4C3JU3ag@mail.gmail.com>
 <20200330102944.GA568@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330102944.GA568@ravnborg.org>
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
Cc: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 12:29:44PM +0200, Sam Ravnborg wrote:
> On Sat, Mar 28, 2020 at 11:02:26PM +0100, Daniel Vetter wrote:
> > On Sat, Mar 28, 2020 at 7:49 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Daniel.
> > >
> > > On Sat, Mar 28, 2020 at 05:23:58PM +0100, Daniel Vetter wrote:
> > > > I'm thinking this is the warning that fired in the 0day report, but I
> > > > can't double-check yet since 0day didn't upload its source tree
> > > > anywhere I can check. And all the drivers I can easily test don't use
> > > > drm_dev_alloc anymore ...
> > > >
> > > > Also if I'm correct supreme amounts of bad luck because usually kslap
> > > > (for bigger structures) gives us something quite a bit bigger than
> > > > what we asked for.
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Neil Armstrong <narmstrong@baylibre.com
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_managed.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > > > index 4955241ceb4c..9cebfe370a65 100644
> > > > --- a/drivers/gpu/drm/drm_managed.c
> > > > +++ b/drivers/gpu/drm/drm_managed.c
> > > > @@ -139,8 +139,7 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
> > > >  {
> > > >       WARN_ON(dev->managed.final_kfree);
> > > >       WARN_ON(dev < (struct drm_device *) container);
> > > > -     WARN_ON(dev + 1 >=
> > > > -             (struct drm_device *) (container + ksize(container)));
> > > > +     WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));
> > >
> > > I do not think this is the right fix...
> > > The original code would trigger if
> > > 1) the container only had a drm_device - and nothing else
> > > 2) and the allocated size was the same
> > 
> > Yup, which apparently happens for all the drivers calling
> > drm_dev_alloc(). At least on the unlucky architecture that 0day tested
> > on (or build settings, or whatever). The issue was hit with drm/bochs,
> > which is still using drm_dev_alloc (like most older-ish drivers).
> 
> That explains it and then the checks makes sense.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for your review, patch applied and a note to the commit message
added that 0day confirmed that it's indeed this WARN_ON that they've hit.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
