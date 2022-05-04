Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B05E519CAF
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAFD10E132;
	Wed,  4 May 2022 10:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AB810E132
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:15:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gh6so1995477ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=DtdZXt+SmpFrTqYzesf1kphNYf64qbUXNNBxD4Vh4gg=;
 b=NQ/nVH3+I5wmrMuaf5Igp+9JPz9VnJMklXL6usvarWEUcE3q01DMETuxdCABgYWZS9
 Fv81L2lH1UnnY8DSTyCyRtENnwA25rykS9Z3g+xZo51wLgykM1xR/OX9neUeC2wl+HyV
 DR57VBOYRIBwPpXhDOeFBoq0Q9HL6+wFidm5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=DtdZXt+SmpFrTqYzesf1kphNYf64qbUXNNBxD4Vh4gg=;
 b=rUgMeZ8mIJVvDUQbh+VRycmUQe/JS6N456Oa1q0LKt5q/x4hBHU+SIGwlxz7AEoGph
 ac8T5Xc1i23ahJNzdq0mrUR86fvH0fkUmkEzvv5S0RpG5nW+8q1+mO4ZnIbL5IJ0vnDM
 84nBRMrS0R5kZMYLkftwd7oprVCEW6blSFLdBUBEiOFvYkdBP/OyQ8oiel4FonWxVZW5
 uaWG3tOQdBbJh60r8ExYqExpM3ZeJA7CfgncuOFz7kdrgVV9Lo5LKTzXwZg0yFd03/hn
 WJLxYArnhp0vPT520bgxcX49Zn6uEt1xc1NkEp7SHYOAbXf0cgFWmyBC1tL9S/JY7j/0
 Q/8Q==
X-Gm-Message-State: AOAM531ISfHxeX07myEw7W/o3ptN+/CTv1z0/dTje0Dp/noGvKGWNlDb
 ldJXy0uSRnIJ08tH8PWwnBxhcQ==
X-Google-Smtp-Source: ABdhPJz0H56c29EX1eI0wf0rZke27JXxOA9/8s1bZYMKsmv1nfRfAWELn2LuYxHYEzxR1YOIACFKBQ==
X-Received: by 2002:a17:906:eb82:b0:6f3:9044:5fba with SMTP id
 mh2-20020a170906eb8200b006f390445fbamr19213483ejb.715.1651659304347; 
 Wed, 04 May 2022 03:15:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gx4-20020a1709068a4400b006f3ef214dc1sm5591621ejc.39.2022.05.04.03.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 03:15:04 -0700 (PDT)
Date: Wed, 4 May 2022 12:15:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
Message-ID: <YnJSJideWoEF+ZE0@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Guenter Roeck <linux@roeck-us.net>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Zheyu Ma <zheyuma97@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-3-javierm@redhat.com>
 <YnJLzY7Yiax/AwMx@phenom.ffwll.local>
 <8a4d6469-d3c0-833d-40c8-3a786d04eba4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a4d6469-d3c0-833d-40c8-3a786d04eba4@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 12:09:57PM +0200, Javier Martinez Canillas wrote:
> Hello Daniel,
> 
> On 5/4/22 11:47, Daniel Vetter wrote:
> > On Mon, May 02, 2022 at 03:09:44PM +0200, Javier Martinez Canillas wrote:
> >> A reference to the framebuffer device struct fb_info is stored in the file
> >> private data, but this reference could no longer be valid and must not be
> >> accessed directly. Instead, the file_fb_info() accessor function must be
> >> used since it does sanity checking to make sure that the fb_info is valid.
> >>
> >> This can happen for example if the fbdev driver was one that is using a
> >> framebuffer provided by the system firmware. In that case, the fbdev core
> >> could unregister the framebuffer device if a real video driver is probed.
> >>
> >> Reported-by: Maxime Ripard <maxime@cerno.tech>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > 
> > Doesn't this mean we just leak the references? Also anything the driver
> > might refcount in fb_open would be leaked too.
> >
> 
> It maybe result in leaks, that's true. But I don't think we can do anything
> at this point since the fb_info just went away and the file->private_data
> reference is no longer valid...
>  
> > I'm not sure what exactly you're trying to fix here, but this looks a bit
> > wrong.
> >
> 
> This is fixing a NULL pointer deref that at least 3 people reported, i.e:
> 
> https://github.com/raspberrypi/linux/issues/5011
> 
> Because if a real DRM driver is probed, then the registered framebuffer
> is unregistered and the fb_info just freed. But user-space has no way to
> know and on close the kernel will try to dereference a NULL pointer.

The fb_info shouldn't go boom because that's refcounted with
get/put_fb_info. Maybe we go boom on something else, but the fb_info
itself should work out ok. If it doesn't work, then there's a bug and
papering over it by just leaking it all isn't a solution.

> > Maybe stepping back what fbdev would need, but doesn't have (see the
> > commit reference I dropped on the previous version) is drm_dev_enter/exit
> > around hw access. the file_fb_info check essentially provides that, but
> > with races and everything.
> >
> 
> Yes, but I don't know how that could work since user-space can just open
> the fbdev, mmap it, write to the mmap'ed memory and then close it. The
> only way that this could be done safely AFAICT is if we prevent the real
> video drivers to be registered if the fbdev is currently mmap'ed.
> 
> Otherwise, the firmware initialized framebuffer will go away anyways and
> things will break for the user-space process that's currently using it.

We should probably nuke the mmap and make it SIGBUS. This is essentially
the hotunplug problem, and fixing it properly is very nasty.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
