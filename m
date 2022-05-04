Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B3519D71
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6201310F657;
	Wed,  4 May 2022 10:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF6210F657
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:56:01 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d6so1244603ede.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BwmxO4LfRKvng41X4d9TcCe1iGtUUpTYikAKxiB/Gus=;
 b=Swq9OPFU/H4vH2Zso3oK+hWWf8Zk79dtPwZyJxnvxTO27XQ0mCO4ki2l3dD/76/HIg
 qrBoZeeReTzGg60P5BDnT9yXTZoUZfB+sXY6JI9sADjoNhJgBEUCy4Jh5L06/nx3e18+
 tdoPGenpO+xOsuPdsCP52sWU6g9Vh4J1Lvc3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BwmxO4LfRKvng41X4d9TcCe1iGtUUpTYikAKxiB/Gus=;
 b=mfmrHP/uShCExtsaGCl7rMzv/Dp4OV/Pl2IlLkWq7yKE5pM1yYlcIaWaXSB1PWljdS
 +Qtoe4ZTOcF5wHG1Eh9SvxnpMm9WKuGNZWxoKEmL4wPTOMQNYKjpCj7SbsrsIgmGaOSL
 U0x7gz+AsGkM/pa9dssg2xo0irH+0lD+d6O3X1SXsR960H8e6Wxt34GuIzRvFw44NRkN
 1Yguye+X3XUAOhEwc/pJ+vV0fqAcYB88rRRkyCIdxDwDBmTDgqI10nDxzSo7YMqkfrN2
 11MkDDNX22xbMwe9zIw/utly2mtVSbfNNwZ1XBHifXURR5ElHDPMKib8F641wpSg6rDM
 jgmA==
X-Gm-Message-State: AOAM5318QPprS1o2CCVdJbZHt0MTzJs1nhEK27yACFgamrNg8Et10f6/
 JpvmpawSX87Gj50+71sm028QHw==
X-Google-Smtp-Source: ABdhPJy+B5Wk9GR7mKblkgeRGx069oBIqEL+VbT3G8TD0KUPLgPlnzfCa6TvbjeSkUISaS9jyUFQkw==
X-Received: by 2002:a05:6402:42c3:b0:427:d0e6:77e4 with SMTP id
 i3-20020a05640242c300b00427d0e677e4mr11472180edc.49.1651661759975; 
 Wed, 04 May 2022 03:55:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3ef214e60sm5568170ejc.198.2022.05.04.03.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 03:55:59 -0700 (PDT)
Date: Wed, 4 May 2022 12:55:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file operations
Message-ID: <YnJbvb5TlHs4ckPM@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Junxiao Chang <junxiao.chang@intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
 <038f8365-b23b-9d81-f7b2-8f8c6eb3a065@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <038f8365-b23b-9d81-f7b2-8f8c6eb3a065@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Junxiao Chang <junxiao.chang@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 11:28:07AM +0200, Javier Martinez Canillas wrote:
> Hello Daniel,
> 
> On 5/4/22 11:02, Daniel Vetter wrote:
> > On Tue, May 03, 2022 at 10:19:34PM +0200, Javier Martinez Canillas wrote:
> >> A reference to the framebuffer device struct fb_info is stored in the file
> >> private data, but this reference could no longer be valid and must not be
> >> accessed directly. Instead, the file_fb_info() accessor function must be
> >> used since it does sanity checking to make sure that the fb_info is valid.
> >>
> >> This can happen for example if the registered framebuffer device is for a
> >> driver that just uses a framebuffer provided by the system firmware. In
> >> that case, the fbdev core would unregister the framebuffer device when a
> >> real video driver is probed and ask to remove conflicting framebuffers.
> >>
> >> Most fbdev file operations already use the helper to get the fb_info but
> >> get_fb_unmapped_area() and fb_deferred_io_fsync() don't. Fix those two.
> >>
> >> Since fb_deferred_io_fsync() is not in fbmem.o, the helper has to be
> >> exported. Rename it and add a fb_ prefix to denote that is public now.
> >>
> >> Reported-by: Junxiao Chang <junxiao.chang@intel.com>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > 
> > Note that fb_file_info is hilariously racy since there's nothing
> > preventing a concurrenct framebuffer_unregister. Or at least I'm not
> > seeing anything. See cf4a3ae4ef33 ("fbdev: lock_fb_info cannot fail") for
> > context, maybe reference that commit here in your patch.
> >
> > Either way this doesn't really make anything worse, so
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> 
> Yes, I noticed is racy but at least checking this makes less likely to
> occur. And thanks, I'll reference that commit in the description of v3.
> 
> BTW, I also noticed that the same race that happens with open(),read(),
> close(), etc happens with the VM operations:
> 
> int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
> {
> ...
> 	vma->vm_private_data = info;
> ...
> }
> 
> static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
> {
> ...
> 	struct fb_info *info = vmf->vma->vm_private_data;
> ...
> }
> 
> static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
> {
> ...
> 	struct fb_info *info = vmf->vma->vm_private_data;
> ...
> }
> 
> So something similar to fb_file_fb_info() is needed to check if
> the vm_private_data is still valid. I guess that could be done
> by using the vmf->vma->vm_file and attempting the same trick that
> fb_file_fb_info() does ?

Yeah should work, except if the ptes are set up already there's kinda not
much that this will prevent. We'd need to tear down mappings and SIGBUS or
alternatively have something else in place there so userspace doesn't blow
up in funny ways (which is what we're doing on the drm side, or at least
trying to).

I'm also not sure how much we should care, since ideally for drm drivers
this is all taken care of by drm_dev_enter in the right places. It does
mean though that fbdev mmap either needs to have it's own memory or be
fully redirected to the drm gem mmap.

And then we can afford to just not care to fix fbdev itself.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
