Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F002742DA36
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88346EA8E;
	Thu, 14 Oct 2021 13:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C92D6EA83
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:23:22 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t16so24319861eds.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wuUofU6+PWGPs8M1CU/XSo3dLSGnaYipGyNdWA2RW0s=;
 b=A8y/0cu2Tub5OR461Hsbjs7Qvy/LvIVUmHTKeGz8vtgTWQqBwsJnmcTLJf94/Ta2u8
 ExQ3bf/74mZ4Z4qLaKazyvfKU84GlmZlAN7RSJ2uHVjYbqZCxaS534yVbdGQ2ipDeThh
 4GH5AmX9XUGywy8Pll5hg+1+J6QrFSkEy9qs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wuUofU6+PWGPs8M1CU/XSo3dLSGnaYipGyNdWA2RW0s=;
 b=sZNuaXvC/DqQRi4FlZm1WqTfK/rNNB8GWLvQG/dLbn6tt9kk25N+pNjeAbSqsbEviR
 yIG79x1sxT6JD/MjTmx4AkkYe9xw9sf3RKTAc5fnZ/M11m3Y00jW0PQDSeGuJwPMPsHZ
 thlyfCK2Xs0DeFkfUBwGqi7rLH2GDc0jdEinyrwNTeKfpWLQxx08NtE6Iecq77bWmzVl
 9CRbRNb/w8jWNGVALEoq5HbXOp+PX/366Pxi+e8dkC0+oszrzvbO1h2DLAfj+jLdZOhg
 Q36uJFbysRdTtXT9Sdrk9jOkPrneFl8u0YX0UUZTUBxXGzMLB45zudC40OqiVFP+lqwx
 8bLQ==
X-Gm-Message-State: AOAM533ZDwaCHRuCzJ3Xikh6VCzLNZRjZGLMxJmwbyNcxPHLhyPJEC+1
 KLo0DEgDAYX1frVFmCvl1Ofyyg==
X-Google-Smtp-Source: ABdhPJyGlWYdyLnrvYnR9jEWx6wiCTHXRxdVNMWww7pFvi5CRijgdbOMltAUYLlbGTHDyx3OwaYE+Q==
X-Received: by 2002:a05:6402:3588:: with SMTP id
 y8mr8432674edc.285.1634217795591; 
 Thu, 14 Oct 2021 06:23:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id gl25sm1916632ejb.81.2021.10.14.06.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:23:15 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:23:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 1/4] drm: Introduce drm_modeset_lock_ctx_retry()
Message-ID: <YWgvQXRCnKah8VKR@phenom.ffwll.local>
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
 <20210715184954.7794-2-ville.syrjala@linux.intel.com>
 <YPbTUf9KfiZ5GnFz@phenom.ffwll.local> <YVriZxCeipBUgc8O@intel.com>
 <YWbKM9Fo5OHGafAY@phenom.ffwll.local> <YWbL3Z0UNZLMLC59@intel.com>
 <YWdI82JKcncv3J71@zacax395.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWdI82JKcncv3J71@zacax395.localdomain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 11:00:35PM +0200, Fernando Ramos wrote:
> On 21/10/13 03:06PM, Ville Syrjälä wrote:
> > > And yes C is dangerous, but also C is verbose. I think one lesson from igt
> > > is that too many magic block constructs are bad, it's just not how C
> > > works. Definitely not in the kernel, where "oops I got it wrong because it
> > > was too clever" is bad.
> > > 
> > > > > Yes the macro we have is also not nice, but at least it's a screaming
> > > > > macro since it's all uppercase, so options are all a bit sucky. Which
> > > > > leads me to think we have a bit a https://xkcd.com/927/ situation going
> > > > > on.
> > > > > 
> > > > > I think minimally we should have one way to do this.
> > > > 
> > > > Well, there is no one way atm. All you can do is hand roll all the
> > > > boilerplate (and likely get it slightly wrong) if you don't want
> > > > lock_all.
> > > > 
> > > > The current macros only help with lock_all, and IMO the hidden gotos
> > > > are even uglier than a hidden for loop. Fernando already hit a case
> > > > where he couldn't use the macros twice due to conflicting goto
> > > > labels. With this for loop thing I think it would have just worked(tm).
> > > 
> > > I'm totally ok with repainting the shed, I just don't want some 80s
> > > multicolor flash show.
> > 
> > You have a better idea in mind?
> 
> Sorry, I completely forgot this discussion was going on and I just published V4
> of my patch set here:
> 
>     https://lore.kernel.org/dri-devel/20211013204846.90026-1-greenfoo@u92.eu/
> 
> Please, feel free to let me know (ideally, as a reply to the corresponding i915
> patch from that set) if you rather me not to modify i915 files for now.

My request is that we only have one way of doing this drm_modeset lock
retry business. So either this one here proposed by Ville, or the one Sean
Paul merged.

I honestly don't care which color we pick, as long as it's consistent
across the board. Please all you, figure this out.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
