Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7133FA07D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE61D6E9B9;
	Fri, 27 Aug 2021 20:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4C36E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 20:20:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q14so12195823wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=87OtDxWiEoXbayG11yI3BuRN29+LIvQ+JH3zx+0332Q=;
 b=ULbhHOnn9MrYE4bxDvydkaX2HPz3X75iWzwQgLRdtT6lZQDe50Lwy/IcAOPSkYRWe0
 j49eQ1verzDp5pJ1z/kLVqH7Iz2Pv8UmWsEy8uP3WrXhfRPubYOJOMxD2sRxFVRp2/Wh
 kMBdW1uYDsq+7yGal61QlESL/rfdlYF02IiyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=87OtDxWiEoXbayG11yI3BuRN29+LIvQ+JH3zx+0332Q=;
 b=dBiJ0ffy+29eyq6qVrGqnrNEH371KkvKQeMkc1IYspmpgikMs+J474imUGjuM42NgB
 GxQR9FvCLfzeBUa3vJI+YNg3GBdVvMyJwojEr7UteV+IF9BeHD2V657OaM8cF1TVS162
 kt8NH7GQuY9OOQEMyU7tWe0CqarUrym0O2beNESO1mo5HoeyM7Z0yVsoPwbrqW0okvaV
 GEOPZ1VNdZKD3hoYjhABURoJprTUNH8/bxq5y6HYHuWPIZ0gxddMGjUJqtT8cxkPEtFj
 ZYV0Q8gAS8Sbvp/XZvOg2brRLyZDlHPLiRUGY2a103fYG72GCX/Ycffz9SFQ4Sw+Ylvb
 brsA==
X-Gm-Message-State: AOAM530/tFGGL/4Tfs6Ds5CecfKUY7uv9+01WI8l80UUqwoogJWvbzKK
 1s/z6N5iepP+RoZv7ufEChCCXA==
X-Google-Smtp-Source: ABdhPJxhnMZJlzB+8+d7f5HkiNoG4KYXmvFm/ogC8IbWQpisgT+ThOQTY4B4jZ0HKySDhJHKL64+UQ==
X-Received: by 2002:adf:f943:: with SMTP id q3mr12659368wrr.118.1630095614282; 
 Fri, 27 Aug 2021 13:20:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m5sm11998000wmi.1.2021.08.27.13.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 13:20:13 -0700 (PDT)
Date: Fri, 27 Aug 2021 22:20:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ingo Molnar <mingo@redhat.com>, David Airlie <airlied@linux.ie>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
Message-ID: <YSlI+ryYqoRxM7aB@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>
References: <20210827100027.1577561-1-javierm@redhat.com>
 <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64
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

On Fri, Aug 27, 2021 at 07:50:23PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.08.21 um 12:00 schrieb Javier Martinez Canillas:
> > This patch series splits the fbdev core support in two different Kconfig
> > symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
> > be disabled, while still using fbcon with the DRM fbdev emulation layer.
> 
> I'm skeptical. DRM's fbdev emulation is not just the console emulation, it's
> a full fbdev device. You can see the related device file as /dev/fb*.
> Providing the file while having CONFIG_FB disabled doesn't make much sense
> to me. I know it's not pretty, but it's consistent at least.
> 
> If you want to remove fbdev, you could try to untangle fbdev and the console
> emulation such that DRM can set up a console by itself. Old fbdev drives
> would also set up the console individually.

Yeah given the horrendous security track record of all that code, and the
maze of handover we have (stuff like flicker free boot and all that) I'm
wondering whether typing a new drmcon wouldn't be faster and a lot more
maintainable.

With drm_client this shouldn't be too much work at least for the drm code.

> Another low-hangling fruit is a config option to enable/disable the fbdev
> userspace interface (i.e., dev/fb*). Disabling the interface would remove
> the rsp mmap of the fbdev graphics buffer. We sometimes have to use an extra
> shadow buffer because mmap requires non-moving buffers. Without mmap we
> might be able to avoid some of the costly internal memcpys for some of our
> drivers.

And yeah stuff like that wouldn't be needed for drmcon either.
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > The reason for doing this is that now with simpledrm we could just boot
> > with simpledrm -> real DRM driver, without needing any legacy fbdev driver
> > (e.g: efifb or simplefb) even for the early console.
> > 
> > We want to do that in the Fedora kernel, but currently need to keep option
> > CONFIG_FB enabled and all fbdev drivers explicitly disabled, which makes
> > the configuration harder to maintain.
> > 
> > It is a RFC because I'm not that familiar with the fbdev core, but I have
> > tested and works with CONFIG_DRM_FBDEV_EMULATION=y and CONFIG_FB disabled.
> > This config automatically disables all the fbdev drivers that is our goal.
> > 
> > Patch 1/4 is just a clean up, patch 2/4 moves a couple of functions out of
> > fbsysfs.o, that are not related to sysfs attributes creation and finally
> > patch 3/4 makes the fbdev split that is mentioned above.
> > 
> > Patch 4/4 makes the DRM fbdev emulation depend on the new FB_CORE symbol
> > instead of FB. This could be done as a follow-up but for completeness is
> > also included in this series.
> > 
> > Best regards,
> > Javier
> > 
> > 
> > Javier Martinez Canillas (4):
> >    fbdev: Rename fb_*_device() functions names to match what they do
> >    fbdev: Move framebuffer_{alloc,release}() functions to fbmem.c
> >    fbdev: Split frame buffer support in FB and FB_CORE symbols
> >    drm: Make fbdev emulation depend on FB_CORE instead of FB
> > 
> >   arch/x86/Makefile                  |  2 +-
> >   arch/x86/video/Makefile            |  2 +-
> >   drivers/gpu/drm/Kconfig            |  2 +-
> >   drivers/video/console/Kconfig      |  2 +-
> >   drivers/video/fbdev/Kconfig        | 57 +++++++++++++---------
> >   drivers/video/fbdev/core/Makefile  | 13 +++--
> >   drivers/video/fbdev/core/fbmem.c   | 73 ++++++++++++++++++++++++++--
> >   drivers/video/fbdev/core/fbsysfs.c | 77 +-----------------------------
> >   include/linux/fb.h                 | 18 ++++++-
> >   9 files changed, 134 insertions(+), 112 deletions(-)
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
