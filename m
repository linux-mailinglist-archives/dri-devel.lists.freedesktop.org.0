Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD65233E5
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 15:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCC710E30B;
	Wed, 11 May 2022 13:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850F810E30B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:18:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dk23so3987655ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0ez9TXiKaOl72tEoV60FrlOBkHPwboHnppSug+gfkOo=;
 b=AZvGNJP2363v6TN8/GS5hENFTQ0BNKe+jWaNl89FHJLwTiyzJllczlQosgV/8gKSPl
 k/r0geg1iE4xe/6Vvft5LzRvVcwoMLpok5wnHUrkyJwMmp1MeSKatSjbreIyNyW12vH0
 VY7saVz4vb7tvLBfcWR1gPGEQ/TXeUGYUvTRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0ez9TXiKaOl72tEoV60FrlOBkHPwboHnppSug+gfkOo=;
 b=R+JhGdXyLevMk3gEJoVo62Lin2DYJBqVraD1/AgDMVwgkUVqzN4KV0DHG+0Hp6EupR
 g4mH6WHD698t/hLh+cyeHUVd3OkdXZDJXvE5+p6nhGceu1Icvc1c/6eu2zK8/jrpXzr2
 q69Lr3F/LAmFPiNY+0YsIMJbtIBSjaibr3gKbLKV9PtNX7JN4VvDWOO1RB7EndS9c4bx
 2brnW9+6CoOzrchDDnTWwy8IFKESgniwcTl69R6PA8lvTf9Se4Qe3IhebFl2rvsK5EOz
 XsrJoN3Xi2pX5xWMp39nHVHNvpPavSXCzUdIPZ6QrLLWZAANIy3uQcX0I+n+wcw6Knes
 wDVg==
X-Gm-Message-State: AOAM530OfdVAyfghzZEinWmTXLd2UVnG2skP/jBoPuQvSZpQdqIWcIqe
 3eZLWMgWlui5oOjBKF/xfWmOUA==
X-Google-Smtp-Source: ABdhPJzAAytEOBJC9d8weQVKkGdTDHAUDyPw/j1hyXBhNoXuggtWfKEBCC0fJwT/f+TZszfW1UM2RA==
X-Received: by 2002:a17:907:2d24:b0:6f4:3152:3d1a with SMTP id
 gs36-20020a1709072d2400b006f431523d1amr23800536ejc.324.1652275117889; 
 Wed, 11 May 2022 06:18:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170906c18700b006f3ef214e58sm1003731ejz.190.2022.05.11.06.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:18:37 -0700 (PDT)
Date: Wed, 11 May 2022 15:18:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Message-ID: <Ynu3qy5DrSVHv1/U@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
References: <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <8401c328-ed67-8d5e-4ba2-b487f256e139@intel.com>
 <42fe44ae-de02-5506-d1b4-059af0419366@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42fe44ae-de02-5506-d1b4-059af0419366@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 09:50:38AM +0200, Javier Martinez Canillas wrote:
> On 5/10/22 09:19, Andrzej Hajda wrote:
> > 
> > 
> > On 10.05.2022 00:42, Javier Martinez Canillas wrote:
> >> On 5/10/22 00:22, Andrzej Hajda wrote:
> >>
> >> [snip]
> >>
> >>>>    static void drm_fbdev_fb_destroy(struct fb_info *info)
> >>>>    {
> >>>> +       if (info->cmap.len)
> >>>> +               fb_dealloc_cmap(&info->cmap);
> >>>> +
> >>>>           drm_fbdev_release(info->par);
> >>>> +       framebuffer_release(info);
> >>> I would put drm_fbdev_release at the beginning - it cancels workers
> >>> which could expect cmap to be still valid.
> >>>
> >> Indeed, you are correct again. [0] is the final version of the patch I've
> >> but don't have an i915 test machine to give it a try. I'll test tomorrow
> >> on my test systems to verify that it doesn't cause any regressions since
> >> with other DRM drivers.
> >>
> >> I think that besides this patch, drivers shouldn't need to call to the
> >> drm_fb_helper_fini() function directly. Since that would be called during
> >> drm_fbdev_fb_destroy() anyways.
> >>
> >> We should probably remove that call in all drivers and make this helper
> >> function static and just private to drm_fb_helper functions.
> >>
> >> Or am I missing something here ?
> > 
> > This is question for experts :)
> 
> Fair. I'm definitely not one of them :)
> 
> > I do not know what are user API/ABI expectations regarding removal of 
> > fbdev driver, I wonder if they are documented somewhere :)
> 
> I don't know. At least I haven't found them.
> 
> > Apparently we have some process of 'zombification'  here - we need to 
> > remove the driver without waiting for userspace closing framebuffer(???) 
> > (to unbind ops-es and remove references to driver related things), but 
> > we need to leave some structures to fool userspace, 'info' seems to be 
> > one of them.
> 
> That's correct, yes. I think that any driver that provides a .mmap file
> operation would have the same issue. But drivers keep an internal state
> and just return -ENODEV or whatever on read/write/close after a removal.

Just commenting on the mmap part here. I think there's two options:

- shadow buffer for fbdev defio, and keep the shadow buffer around until
  fb_destroy

- redirect fbdev mmap fully to gem mmap, and make sure the gem mmap is
  hotunplug safe. The approach amd folks are pushing for that we discussed
  is to replace them all with a dummy r/w page, because removing the ptes
  means you can get a SIGBUS almost anywhere in application code, and that
  violates like all the assumptions behind gl/vk and would just crash your
  desktop. Reading/writing garbage otoh is generally much better.

So yeah hotunplug safe fbdev mmap is still quite a bit of work ...

Cheers, Daniel
> 
> The fbdev subsystem is different though since as you said it, the fbdev
> core unconditionally calls to the driver .fb_release() callback with a
> struct fb_info reference as argument.
> 
> I tried to prevent that with commit aafa025c76dc ("fbdev: Make fb_release()
> return -ENODEV if fbdev was unregistered") but Daniel pointed out that
> is was wrong since could leak memory allocated and was expected to be
> freed on release.
> 
> That's why I instead fixed the issue in the fbdev drivers and just added
> a warn on fb_release(), that is $SUBJECT.
> 
> > So I guess there should be something called on driver's _remove path, 
> > and sth on destroy path.
> >
> 
> That was my question actually, do we need something to be called in the
> destroy path ? Since that could just be internal to the DRM fb helpers.
> 
> In other words, drivers should only care about setting a generic fbdev
> by calling drm_fbdev_generic_setup(), and then do any HW cleanup in the
> removal path, but let the fb helpers to handle the SW cleanup in destroy.
>  
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
