Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E3349D21
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64676EE69;
	Fri, 26 Mar 2021 00:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437336EE68
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 00:01:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o16so4032119wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PD5L6/BnGNUOYnq+podeZDPuG2Y97QqEVfkrK1IqHKI=;
 b=B6NQwFBuWait+We9hI3qAIeoE/vIFeNYMRsJSSiFMX0XGelMpNZukH2xLUzxdXCqGs
 P2JFwSUnlKYJ/MePaY5oezFMp8Q5w7xbEoqbCVfk6jW8KEnInbjs9XBAGQo/hhvJTWuQ
 ZqR30O2NOMakduAdKaofNesdpNnB+Y4WukKEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PD5L6/BnGNUOYnq+podeZDPuG2Y97QqEVfkrK1IqHKI=;
 b=YOH9NE6dpDGrw7IfQ4mNwn1J1Mvq2wgxuxULe45e4frENQK32qAxVIT6P4/BrWHOeA
 midAVjk4TMSVsqtkdHBtdHQiGP0d/nrfZFAtUgWPU4emz20RF697ApqXJUg3mbx5Z11N
 XJI8ST5GmUPdrgQdg1Tsw8PFYxc/R7AmxUzp764S5tqk9QWH6YfytvFn1kshdZDFH9+Q
 GQH5YoXHohhuX5+95FLxD7L+kYJ56yMVz2JKDJZMiwr7HRQUR+XJp2jPZFDpeyJl/sAr
 XfQdzHLECbrcgcwPc1j7DW1nmEGxE0lzzso7aBZS/6txVMkx99TVip9alJ4tcDOd777Z
 eM0g==
X-Gm-Message-State: AOAM532tOvseER4F8Se4tySB4+dHdMecdD+HKe4H/truII7ztllgvUcQ
 A1O1rHN79JnQydfhPrGjJhiUHA==
X-Google-Smtp-Source: ABdhPJwk9nSisrmg8ATbjlzPzivvHviQIkayFb9dcX4bKTLP+a7zY9TxY9WTMbTgh782bw7uBg2nGQ==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr11385199wrq.201.1616716874930; 
 Thu, 25 Mar 2021 17:01:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 1sm8336895wmj.2.2021.03.25.17.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:01:14 -0700 (PDT)
Date: Fri, 26 Mar 2021 01:01:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915: Restrict sentinel requests
 further
Message-ID: <YF0kSGZpSVISQRF0@phenom.ffwll.local>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-4-tvrtko.ursulin@linux.intel.com>
 <CAM0jSHO7QRw2XeBKA-fASnC--k80WZFB40Bv4KWXvX6JRypPXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM0jSHO7QRw2XeBKA-fASnC--k80WZFB40Bv4KWXvX6JRypPXQ@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 03:25:55PM +0000, Matthew Auld wrote:
> On Wed, 24 Mar 2021 at 12:14, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > Disallow sentinel requests follow previous sentinels to make request
> > cancellation work better when faced with a chain of requests which have
> > all been marked as in error.
> >
> > Because in cases where we end up with a stream of cancelled requests we
> > want to turn of request coalescing so they each will get individually
> 
> turn off

Fixed while applying.
-Daniel

> 
> > skipped by the execlists_schedule_in (which is called per ELSP port, not
> > per request).
> >
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
