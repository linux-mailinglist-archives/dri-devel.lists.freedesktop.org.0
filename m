Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CC3FC758
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF63089C63;
	Tue, 31 Aug 2021 12:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6307489C63
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:35:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2420035wmr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jqjkTcNYKfzyFpIHY9GPDPWjeBNV/2F2AOaBAYK2ovs=;
 b=NHO+KfQvg8jk/8oprujJHPrqbZQi2DVVV2l36P6CGO7IqAhsx1XKQp/rikjN6LR9zO
 abjBMJHxVj6llGB/1dhtxIYnYlGOGWiwYY+x79TOBcPY3DvEA7+W1Jt17fy5pLnu2exq
 59Mf5HhwmzybVgHLP+HpgXFpjD/hNRDUvoZFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jqjkTcNYKfzyFpIHY9GPDPWjeBNV/2F2AOaBAYK2ovs=;
 b=PKOAUv5r47XBZCcPXiaJ/xrNapHSvJNNgWiMLEzpEU4je81eQj9C9XgRCU33HwVP2h
 galJXuecuwqxGVkVDJFAwQ1uyBHwjATENOJiEe7E9Pd+RFdvFqxRsZ6ATXy2Ufr/GVu3
 q4TWfyLQHH/Bs6JllwH3oDhE+ANO6tHoqQrrMXCPtyv55EPNkDX08njjXzsNinfwLgcR
 xtlF3hdWl1wNubA7h0wIUfh73jxjTGLQvIt33wrV+GZiAkZDktxwYAXHnIlRHhT6WU/5
 snrrCXQH9phMFRHAbcBbB/3/xdpph33Ae/GoZotQTRpQHCvqTsPPL4tCz5DWMLvYXn2U
 CGGA==
X-Gm-Message-State: AOAM530DyPtYb2xWQxmOjRIOvQgFpnBkysaqMCqWPyHCHKcqkJTbDqY0
 SEHGpuENy6aYHRAIz2ZqomY7gA==
X-Google-Smtp-Source: ABdhPJxM7t43JspDgcszisGhtu9sLfqW1NsFQW87rYKFpoFS/aLP5arH0VQSiiqo9MJIfzJOcRNyUA==
X-Received: by 2002:a1c:ac05:: with SMTP id v5mr3869097wme.13.1630413347941;
 Tue, 31 Aug 2021 05:35:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v5sm19103677wru.37.2021.08.31.05.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:35:47 -0700 (PDT)
Date: Tue, 31 Aug 2021 14:35:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
Message-ID: <YS4iIR689bAZ4QT9@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 <YSlI+ryYqoRxM7aB@phenom.ffwll.local>
 <a7395626-f022-5c89-07cd-c30d0d52d3dd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7395626-f022-5c89-07cd-c30d0d52d3dd@redhat.com>
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

On Sat, Aug 28, 2021 at 12:02:21AM +0200, Javier Martinez Canillas wrote:
> Hello Daniel and Thomas,
> 
> On 8/27/21 10:20 PM, Daniel Vetter wrote:
> > On Fri, Aug 27, 2021 at 07:50:23PM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 27.08.21 um 12:00 schrieb Javier Martinez Canillas:
> >>> This patch series splits the fbdev core support in two different Kconfig
> >>> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
> >>> be disabled, while still using fbcon with the DRM fbdev emulation layer.
> >>
> >> I'm skeptical. DRM's fbdev emulation is not just the console emulation, it's
> >> a full fbdev device. You can see the related device file as /dev/fb*.
> >> Providing the file while having CONFIG_FB disabled doesn't make much sense
> >> to me. I know it's not pretty, but it's consistent at least.
> >>
> >> If you want to remove fbdev, you could try to untangle fbdev and the console
> >> emulation such that DRM can set up a console by itself. Old fbdev drives
> >> would also set up the console individually.
> > 
> > Yeah given the horrendous security track record of all that code, and the
> > maze of handover we have (stuff like flicker free boot and all that) I'm
> > wondering whether typing a new drmcon wouldn't be faster and a lot more
> > maintainable.
> > 
> 
> We talked about a drmcon with Peter Robinson as well but then decided that a
> way to disable CONFIG_FB but still having the DRM fbdev emulation could be a
> intermediary step, hence these RFC patches.
> 
> But yes, I agree that a drmcon would be the proper approach for this, to not
> need any fbdev support at all. We will just keep the explicit disable for the
> fbdev drivers then in the meantime.

I think the only intermediate step would be to disable the fbdev uapi
(char node and anything in sysfs), while still registering against the
fbcon layer so you have a console.

But looking at the things syzbot finds the really problematic code is all
in the fbcon and console layer in general, and /dev/fb0 seems pretty
solid.

I think for a substantial improvement here in robustness what you really
want is
- kmscon in userspace
- disable FB layer
- ideally also disable console/vt layer in the kernel
- have a minimal emergency/boot-up log thing in drm, patches for that
  floated around a few times

Otherwise it feels a bit like we're just doing Kconfig bikeshedding and
no real improvement on the attack surface :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
