Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5396D84C1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025E210EA22;
	Wed,  5 Apr 2023 17:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A488F10EA1F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:20:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9333b408ee7so3813166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680715222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E6Y3l2ai2dkc+mwGS+IVGglHZ/U6Qnew1qE+qgx1f2Q=;
 b=SBpgp9hyv9GLHorepCDl1dWQ1zCUOrNCShT6xTHvqseGuObap60syj/CFUCpG5qndU
 iQOeawocmoCTDlzaKbyqTZ15L4EQw4BzB4dCmxl7m5y2SQzh1I96hEsWopwLsz+mwMcC
 oNHvTfsFYG9RH1uRncHAov08tORi7KaPXQnKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680715222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6Y3l2ai2dkc+mwGS+IVGglHZ/U6Qnew1qE+qgx1f2Q=;
 b=Ly3ARAnL7odGj/CFI6mENF5V+Uw9uZhB/6BYriWzBJASyB+YNXusdxJBjBql+JN2Nt
 3oU5ONMJBuo5TWhVPEHDeUGA8e79i8mDJ9mDNczLQ/C0qZ3n+l8OVf4XqfGJ09vFDbIJ
 3mO0QrIiGwJNSj95K8Oo4hQjXFlPvGoucxXTHoSFoTSMfn+fUXZYGPuq9lyDT9JZyQBV
 c7AckCrmN2BWpWqtLqDUADNkQdF1vRQMmSjfndpPm56bO4j3GFDUOfYBJDehLRSyMlrt
 UfZySyhJbiFrN9RqNONioaPnX9Tm5CKU1ecV49aFVDPeKaSi14u1j8p1BWuZdxvf0OkW
 7DLg==
X-Gm-Message-State: AAQBX9ei+UZB+awe4mFEW3OfOJvYAHb3TZlbvd8/un9L1/H19Hs3shJR
 Bn0HFLamOiflqf7SYS8cdVEbCg==
X-Google-Smtp-Source: AKy350ZwGbyqfaCkugmYUI/uINYuGvFkZm6SRhoXyZOTjkrRlbZEGaRGbGQLY/1n8PyJmKLwiowUpQ==
X-Received: by 2002:a17:906:3f12:b0:947:8734:a058 with SMTP id
 c18-20020a1709063f1200b009478734a058mr2278478ejj.4.1680715222675; 
 Wed, 05 Apr 2023 10:20:22 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 xc2-20020a170907074200b00947a6d84fefsm7397173ejb.75.2023.04.05.10.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 10:20:22 -0700 (PDT)
Date: Wed, 5 Apr 2023 19:20:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 3/3] drm/fb-helper: fix input validation gaps in check_var
Message-ID: <ZC2t1I1SQrQh/fy1@phenom.ffwll.local>
References: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
 <20230404194038.472803-3-daniel.vetter@ffwll.ch>
 <87a5zmd2jn.fsf@minerva.mail-host-address-is-not-set>
 <ZC12aR9ddp3j/3dL@phenom.ffwll.local>
 <87ilea9twa.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilea9twa.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 06:27:17PM +0200, Javier Martinez Canillas wrote:
> Daniel Vetter <daniel@ffwll.ch> writes:
> 
> [...]
> 
> >> 
> >> but only the 'var->xres > fb->width || var->yres > fb->height' from the
> >> conditions checked could be false after your __fill_var() call above.
> >> 
> >> You should drop the 'var->bits_per_pixel > bpp', 'var->xres_virtual >
> >> fb->width' and 'var->yres_virtual > fb->height' checks I believe since
> >> those will always be true.
> >
> > The __fill_var is after this. I'm honestly not sure what the exact
> 
> Ah, your patch adds it after that indeed. Please ignore my comment then.

So rb: you?

> > semantics are supposed to be, but essentially if userspace asks for too
> > big virtual size, we reject it. And for anything else we then tell it
> > (with __fill_var) how big the actually available space is.
> >
> > What I'm wondering now is whether too small x/yres won't lead to problems
> > of some sorts ... For multi-screen we set the virtual size to be big
> > enough for all crtc, and then just set x/yres to be the smallest output.
> > That way fbcon knows to only draw as much as is visible on all screens.
> > But if you then pan that too much, the bigger screens might not have a big
> > enough buffer anymore and things fail (but shouldn't).
> >
> > Not sure how to fix that tbh.
> 
> Would this be a problem in practice?

I'm frankly not sure. You'd get a black screen for fbcon/fbdev across all
outputs, but only if you have userspace doing this intentionally.

In a way it's just another artifact of the drm fbdev emulation not using
ATOMIC_TEST_ONLY in the various places where it should, and so doesn't
really know whether a configuration change will work out.

We already have this in obscure mulit-monitor cases where adding another
screen kills fbcon, because the display hw is running out of fifo or
clocks or whatever, and because the drm fbdev code doesn't check but just
blindly commits the entire thing as an atomic commit, the overall commit
fails.

This worked "better" with legacy kms because there we commit per-crtc, so
if any specific crtc runs into a limit check, only that one fails to light
up.

Imo given that no one cared enough yet to write up atomic TEST_ONLY
support for fbdev emulation I think we can continue to just ignore this
problem.

What should not happen is that fbcon code blows up drawing out of bounds
or something like that, resulting in a kernel crash. So from that pov I
think it's "safe" :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
