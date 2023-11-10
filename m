Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152E7E7AE5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 10:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E4D10E956;
	Fri, 10 Nov 2023 09:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D92610E956
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699608699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+BHnruLiOv9ier1ZOAArUDLkDsKjvTUfT5UeclLmy0=;
 b=Es2nqhDjmfgSTuEEf+u750Nd+lz8jFmsW0adM5FqEIW9UsIgE2YWt6RLddWF+KEdUFEGpL
 RlkjhPDQMPEWOlYV8xJSy9dK8bssMVbNVZaTAPsSeovdjw4m7TDimwRTkP0kaXRu4yhcsi
 0uJl7lUNejfkX8b2NcZtYUy5ow0LEa4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-qIN6yLluNGGiX6DEXza2Cg-1; Fri, 10 Nov 2023 04:31:35 -0500
X-MC-Unique: qIN6yLluNGGiX6DEXza2Cg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32da7983d20so1247587f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699608694; x=1700213494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+BHnruLiOv9ier1ZOAArUDLkDsKjvTUfT5UeclLmy0=;
 b=Gyry1YGZDqUwWCzsK1cU+jUILMJjOh2j8rzTHamzaaBrVcuO/4jfvC1xGLw8+2IAP+
 kAPgfqePgCczeFhJNyBpGLGsYgm2GnF7gITa5qtffqfX3zcQvt7sJxNwYxbXmfsB7sCw
 5uJUGZm7mUJJMVgY2Jr4GhixE2BaBWnnuS1li3ypqCkg6CArNQ6g4G6KnrihXeUYUAFQ
 XSzfDOfq9CATMINxrxXTYr8gWVw9wrxe9fC0kk6VMQ6+taITK1tCdWb/TEveCzlj7Ro5
 DPW93O18L15STGknNxnpWU7Y4qcj/bXs6Ch7yjZrOSzyJlxvK75OMilBTr3TV0zferuj
 irPg==
X-Gm-Message-State: AOJu0YyEBqJIayk9ZEUcmqREs+UimaZmDj17nkJehHkavk3L54gz+xkd
 VNvRhbA0wOV96QolgT/IpOpbG7H7d4oz7OZkZScFPfAxWGHY88bpCQk0WomQJjpH+i8gi9wnkfb
 ZSc+pZruIo1cbCyPIkauXsMExRJX+
X-Received: by 2002:a05:6000:4020:b0:32f:75d2:bdba with SMTP id
 cp32-20020a056000402000b0032f75d2bdbamr2227704wrb.6.1699608694542; 
 Fri, 10 Nov 2023 01:31:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlkct9WtN0BHrn8GxSUsmqvhbPUTNJIwmNLzRsecCbQNHit/iagOdzfOhv6be+52LcEgPexw==
X-Received: by 2002:a05:6000:4020:b0:32f:75d2:bdba with SMTP id
 cp32-20020a056000402000b0032f75d2bdbamr2227662wrb.6.1699608694060; 
 Fri, 10 Nov 2023 01:31:34 -0800 (PST)
Received: from toolbox ([2001:9e8:8987:cb00:d39c:ef7a:f06b:bbba])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b0032fb17c65desm1507521wrx.19.2023.11.10.01.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:31:33 -0800 (PST)
Date: Fri, 10 Nov 2023 10:31:32 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <20231110093132.GA499673@toolbox>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <n_evglPOy869LKjnmZvX3Ka8Bh6P5NPJkoV7I-yGW9A-YZFl70d4dMuitHkUaPiNyX_o2-DZA31-hR6mp6tShKhGlNC_UWdnpL7OoGrZ52Y=@emersion.fr>
 <CAPY8ntCjN8Hdam=r2i2-EePjhZZFQxn9zEm0Soz-W5WwKGO8Hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCjN8Hdam=r2i2-EePjhZZFQxn9zEm0Soz-W5WwKGO8Hg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 06:38:20PM +0000, Dave Stevenson wrote:
> Hi Simon
> 
> On Thu, 9 Nov 2023 at 17:46, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, November 9th, 2023 at 16:42, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> >
> > > > > - What would be a good name for the heap? "vc4" is maybe a bit naive and
> > > > >   not precise enough. Something with "cma"? Do we need to plan a naming
> > > > >   scheme to accomodate for multiple vc4 devices?
> > > >
> > > > That's a general issue though that happens with pretty much all devices
> > > > with a separate node for modesetting and rendering, so I don't think
> > > > addressing it only for vc4 make sense, we should make it generic.
> > > >
> > > > So maybe something like "scanout"?
> > > >
> > > > One thing we need to consider too is that the Pi5 will have multiple
> > > > display nodes (4(?) iirc) with different capabilities, vc4 being only
> > > > one of them. This will impact that solution too.
> > >
> > > It does need to scale.
> > >
> > > Pi5 adds 4 additional DRM devices (2xDSI, 1xDPI, and 1xComposite
> > > Video), and just this last week I've been running Wayfire with TinyDRM
> > > drivers for SPI displays and UDL (DisplayLink) outputs as well.
> > > Presumably all of those drivers need to have appropriate hooks added
> > > so they each expose a dma-heap to enable scanout buffers to be
> > > allocated.
> >
> > I'm not sure this makes sense necessarily for all of these devices. For vc4 and
> > the 4 additional RPi 5 DRM devices, probably. For the rest, e.g. UDL, I'm not
> > sure it makes sense to expose scanout memory allocation via DMA heaps: AFAIK
> > UDL needs CPU access to the buffers, it can't "scanout", and thus directly
> > rendering via v3d to a "scanout-capable" buffer doesn't make sense. There will
> > be a copy (CPU download) either way, and allocating via v3d wouldn't make a
> > difference.
> 
> You as a developer may know that UDL is going to need CPU access, but
> how does a generic userspace app know? Is it a case of falling back to
> allocating via the renderer if there is no suitably named heap?

If we're going with the idea of using sysfs to link a device to a heap
(which I think we should), then those devices all should be linked to
the system memory heap, no?

> > > Can we add another function pointer to the struct drm_driver (or
> > > similar) to do the allocation, and move the actual dmabuf handling
> > > code into the core?
> >
> > Do you mean that the new logic introduced in this patch should be in DRM core
> > to allow other drivers to more easily re-use it? Or do you mean something else?
> 
> Yes, make it easy to reuse between drivers.
> 
> > Indeed, there is nothing vc4-specific in this patch, the only requirement is
> > that the driver uses drm_gem_dma_helper. So this code could be moved into (or
> > alongside) that helper in DRM core. However, maybe it would be best to wait to
> > have a second user for this infrastructure before we move into core.
> 
> Upstreaming of the DSI / DPI / composite drivers for Pi5 should only
> be a few months away, and they can all directly scanout.
> 
> I expect the Rockchip platforms to also fall into the same category as
> the Pi, with Mali as the 3D IP, and the VOP block as the scanout
> engine. Have I missed some detail that means that they aren't a second
> user for this?
> 
> > > > > - Need to add !vc5 support.
> > > >
> > > > If by !vc5 you mean RPi0-3, then it's probably not needed there at all
> > > > since it has a single node for both modesetting and rendering?
> > >
> > > That is true, but potentially vc4 could be rendering for scanout via UDL or SPI.
> > > Is it easier to always have the dma-heap allocator for every DRM card
> > > rather than making userspace mix and match depending on whether it is
> > > all in one vs split?
> >
> > I don't think it's realistic to try to always make DMA heaps available for each
> > and every driver which might need it from day one. It's too big of a task. And
> > it's an even bigger task to try to design a fully generic heap compatibility
> > uAPI from day one. I'd much rather add the heaps one by one, if and when we
> > figure that it makes sense, and incrementally work our way through.
> 
> Is it really that massive a task? We have the dma heap UAPI for
> handling the allocations, so what new UAPI is required?
> 
> If it's a new function pointer in struct drm_driver, then the heap is
> only created by the core if that function is defined using the driver
> name. The function returns a struct dma_buf *.
> Any driver using drm_gem_dma_helper can use the new helper function
> that is basically your vc4_dma_heap_allocate. The "if
> (WARN_ON_ONCE(!vc4->is_vc5))" could be handled by not setting the
> function pointer on those platforms.
> 
> Sorry, I feel I must be missing some critical piece of information here.
> 
>   Dave
> 

