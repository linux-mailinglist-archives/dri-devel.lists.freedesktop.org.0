Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519E44EB20
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 17:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771786EE83;
	Fri, 12 Nov 2021 16:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DDA6EE8E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 16:12:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso10270694wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 08:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=twurRhba5qgXRpgexuSI57Dp4Y9u2cq2aOPi/t5IpCg=;
 b=P5AJMChoaTUh2v8lFArlEIxhsCWAkMxOmfTMhbkQvQDPp4rJAdPEpg5fljtJxT16r1
 Vl1X1fTWPLWfziVxg2uS2EQxFUqItRjnMV7PX/rvoynchtAeMIhH/o6qCVyZcKW9MpgF
 6C4zjXegh05Rxg9jEX8zfB35njzKFfOkhs2DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=twurRhba5qgXRpgexuSI57Dp4Y9u2cq2aOPi/t5IpCg=;
 b=0SKpY/YPpOPK7fo9qCVkRi8umcjNQZgM4d6zKyDfr9JVobqBbMXkrkHoAnWCQ8IY1s
 mYd46AZ474U00BbC2BoZ44btRWCkFqfAYF9Y6ugJTY8ZyHqgWR/Co06Uri7R6bZCYrbq
 1XvTlSiUoC7FhFAzBWx4J+Xx3k81AqgHkePul4w0Qw1sj3LWgySFJTtkk0+oFx9ziMAm
 gYYvKUJVEuHkYF71zh0pA9sPWywYseB0LFgGh/r1gixuMvVaqZF+bxoN5Ijbrqo+TxGV
 kNHtaYwbvXGTMHSFfZcl9gPXprKYXzwGaIca6I0ORYFE0irjxICTWzegvx8eDR2l7Mj5
 21uw==
X-Gm-Message-State: AOAM5305Psu9RQ6Uoo6a1VWjJA8tBBWLh88L2XF7sqJ735lEayikr/tC
 qt6k5wqtcn6EENwyeLSg+hZ6lQ==
X-Google-Smtp-Source: ABdhPJyEP4m/8kd4jlKweTPP4u7zakHKKjuN/yJDukwgCYB58zUMCs0ErybOgSz0h1SjnM9VGwNqyA==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr36546315wml.20.1636733542549; 
 Fri, 12 Nov 2021 08:12:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o2sm6374468wrg.1.2021.11.12.08.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 08:12:22 -0800 (PST)
Date: Fri, 12 Nov 2021 17:12:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
Message-ID: <YY6SZJM8nDDCAzXU@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Jones <pjones@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Borislav Petkov <bp@suse.de>
References: <20211111111120.1344613-1-javierm@redhat.com>
 <YY0A8LOVhs5JbMXW@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YY0A8LOVhs5JbMXW@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ilya Trukhanov <lahvuun@gmail.com>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 12:39:28PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 11, 2021 at 12:11:20PM +0100, Javier Martinez Canillas wrote:
> > The efifb and simplefb drivers just render to a pre-allocated frame buffer
> > and rely on the display hardware being initialized before the kernel boots.
> > 
> > But if another driver already probed correctly and registered a fbdev, the
> > generic drivers shouldn't be probed since an actual driver for the display
> > hardware is already present.
> > 
> > This is more likely to occur after commit d391c5827107 ("drivers/firmware:
> > move x86 Generic System Framebuffers support") since the "efi-framebuffer"
> > and "simple-framebuffer" platform devices are registered at a later time.
> > 
> > Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
> > Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> > Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> > 
> > Changes in v2:
> > - Add a Link: tag with a reference to the bug report (Thorsten Leemhuis).
> > - Add a comment explaining why the probe fails earlier (Daniel Vetter).
> > - Add a Fixes: tag for stable to pick the fix (Daniel Vetter).
> 
> That does not mean that it will make it into the stable tree.  Please
> read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.

Defacto your auto-picker is aggressive enough that just Fixes: is actually
good enough to get it into stable :-)

But yeah explicit cc: stable can't hurt.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
