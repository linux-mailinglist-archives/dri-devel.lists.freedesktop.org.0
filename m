Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3F43CA8D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232EE6E895;
	Wed, 27 Oct 2021 13:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB726E895
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:25:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0796A610A4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635341157;
 bh=DRpvfgGLpwYbFsAv9yOUJyHOhSz2wXFNo6XVbHhRxJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ymw0mh2QQY60jm8+Gnw47dKypKUt0vp+Hrwbe+lvi7IvM9xPkr7HMHZUAES5inqA4
 XbofBsLNudDsE3y0LF7jVZQnA7x/bKsIgNvNbHyE0tB+cKLNZ4gWXNdOoeaUchaIOB
 vyuzgfgeciZ3PYuWgewDXi8SeYO1WyBMFcwscHNHvafk7qIPbrVu4fHunL4upzgXR+
 UvXhyAzscA9C/OTv27InGyFGgfSL2XGuY8YQ6yeY/Ekfllk/q1JJmZShivCEXPurEP
 /iT9NqSeS3OBfhwgrEc0l76EUFIw7518/kJJWCb4gJqETWUburbQQ6H5lvKz9XRHC6
 6gpn/duVDWJRQ==
Received: by mail-wr1-f42.google.com with SMTP id z14so4169508wrg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:25:56 -0700 (PDT)
X-Gm-Message-State: AOAM532IfgblI9ul0kd83oMp3Rd+1h46NUsTsNaWNDpnXLtcVwMYbe+Y
 y4DnhRrnERCzn2qJsYw72PPULbP8AOarVRoWu5M=
X-Google-Smtp-Source: ABdhPJzZ/yYljL8fOUgPtoPN2mhzZdD5s1jNGK4CxGyNcQokOv7BNnyqQrxKssWuwuOwTp5bj3HmRZiUoB0GktTIEHg=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr39409910wrq.411.1635341155532; 
 Wed, 27 Oct 2021 06:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook>
 <YVXJLE8UqgcUNIKl@phenom.ffwll.local> <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com>
 <CAK8P3a0_9U0MDLcNG8GL_ZDCGQAsB=G7DBC0k1BYB1HNQTbu4Q@mail.gmail.com>
 <87tuh2hb17.fsf@intel.com>
In-Reply-To: <87tuh2hb17.fsf@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 27 Oct 2021 15:25:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0KHwaSNqg_dz8-w6e_EJBrsQw_ti+5aErsSr+8AfV9cA@mail.gmail.com>
Message-ID: <CAK8P3a0KHwaSNqg_dz8-w6e_EJBrsQw_ti+5aErsSr+8AfV9cA@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Oct 27, 2021 at 3:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 27 Oct 2021, Arnd Bergmann <arnd@kernel.org> wrote:
> > This fails because of all the other drivers that try to 'select DRM_KMS_HELPER'.
> > Kconfig will now complain about a symbol that gets selected while its
> > dependencies
> > are not met.
> >
> > To work around that, every single driver that has 'selects DRM_KMS_HELPER' would
> > now have to also list 'depends on (DRM_FBDEV_EMULATION && FB) ||
> > !DRM_FBDEV_EMULATION'.
>
> So the fix would be that nobody selects DRM_KMS_HELPER...

That's not going to help in this case, the way the helper functions work is that
you select them as needed, and you avoid the other dependencies. This part
works fine.

We could probably get rid of this symbol by just making it an unconditional
part of drm.ko, as almost every driver ends up using it anyway.

Arguably, this would make the end result worse, as you'd again get drm.ko
itself to link against the old framebuffer code.

What I'm not sure about is whether drivers/video/fbdev/core/fb.ko could
be split up into smaller parts so DRM_FBDEV_EMULATION could
only depend on a set of common code without the bits that are needed
for the classic fbdev drivers.

      Arnd
