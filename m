Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1572DAA72
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 10:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658A6E19A;
	Tue, 15 Dec 2020 09:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6646E185
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 09:55:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d13so950790wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 01:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=wzp3he7Ldny5qGk+iBqbQJSYyDnKTWBE9sD2zWexFDQ=;
 b=i64SMDpxEEYAZao4CPsxjLKjN7RssgNCUSuu5waKnYgHLhBnbHShnKX/Q9LEcxS8kV
 bhBcbYio180Tsw5l8YAkUTXDY+U/xBsXx/aMBla6MCkY+t+xdXTdWHbG12BGVFNxLYOh
 zUhH1B036Nouv10Kn5vkzZK9bbO5//MM/9ZDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=wzp3he7Ldny5qGk+iBqbQJSYyDnKTWBE9sD2zWexFDQ=;
 b=lF1mQ+P6a/d6y1m9OoOJBZ9RMIEbEcKghN1exkpt9XV6BI3c4jNcRmB5NJhi2MUkrD
 DRgsw6aexGwfINkMNR5/2qQ1Js8lDQJNe6wnqtwqfdfq8ZZdFt2lPDUzM86kRTsnL2wL
 RoxUUze7eMjpqaeThUDG5Ys20XGxF8gyryBkTvqcrs8CDDdxXeB6coVr2gP6pfK/f5Ef
 UJP2y55PtQZowenFNIVvEeXZR0iM+De3QzmMfpZ7nriHggTJNpLO6msFUFO/y2ioKPdJ
 4zGgUJi7utWI1wy3cYaBQcEUZ77srvxwjWpjYw/wdwFg0tsPDq+0aIS9XPUXYrwuF3DI
 QbMw==
X-Gm-Message-State: AOAM530dtiHAhcivUKGcBFiqi9A42YtP03sQlZTt+pWwq1LWSrT3h+y3
 gVhVHQtcFuLrCJ2TUHxZOXX9IA==
X-Google-Smtp-Source: ABdhPJz6KDBEAbW3w8wUgDzwxnuw5x1wOy9//Vfnp/AzdlTA/tnX2btyV0/7hxnvpTcmHuPMK7/TTg==
X-Received: by 2002:a5d:5604:: with SMTP id l4mr32732419wrv.127.1608026122572; 
 Tue, 15 Dec 2020 01:55:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o13sm34024033wmc.44.2020.12.15.01.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 01:55:21 -0800 (PST)
Date: Tue, 15 Dec 2020 10:55:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: qiang.zhang@windriver.com
Subject: Re: [PATCH] udlfb: Fix memory leak in dlfb_usb_probe
Message-ID: <X9iICN/VX0whV8Es@phenom.ffwll.local>
Mail-Followup-To: qiang.zhang@windriver.com, b.zolnierkie@samsung.com,
 linux-fbdev@vger.kernel.org, mpatocka@redhat.com,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201215063022.16746-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215063022.16746-1-qiang.zhang@windriver.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bernie@plugable.com, mpatocka@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 02:30:22PM +0800, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>
> 
> The dlfb_alloc_urb_list function is called in dlfb_usb_probe function,
> after that if an error occurs, the dlfb_free_urb_list function need to
> be called.
> 
> BUG: memory leak
> unreferenced object 0xffff88810adde100 (size 32):
>   comm "kworker/1:0", pid 17, jiffies 4294947788 (age 19.520s)
>   hex dump (first 32 bytes):
>     10 30 c3 0d 81 88 ff ff c0 fa 63 12 81 88 ff ff  .0........c.....
>     00 30 c3 0d 81 88 ff ff 80 d1 3a 08 81 88 ff ff  .0........:.....
>   backtrace:
>     [<0000000019512953>] kmalloc include/linux/slab.h:552 [inline]
>     [<0000000019512953>] kzalloc include/linux/slab.h:664 [inline]
>     [<0000000019512953>] dlfb_alloc_urb_list drivers/video/fbdev/udlfb.c:1892 [inline]
>     [<0000000019512953>] dlfb_usb_probe.cold+0x289/0x988 drivers/video/fbdev/udlfb.c:1704
>     [<0000000072160152>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
>     [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
>     [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
>     [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
>     [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
>     [<00000000463fbcb4>] __device_attach+0x122/0x250 drivers/base/dd.c:912
>     [<00000000b881a711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
>     [<00000000364bbda5>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
>     [<00000000eecca418>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
>     [<00000000edfeca2d>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<000000001830872b>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
>     [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
>     [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
>     [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
>     [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
> 
> Reported-by: syzbot+c9e365d7f450e8aa615d@syzkaller.appspotmail.com
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>

Queued up in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/video/fbdev/udlfb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index f9b3c1cb9530..b9cdd02c1000 100644
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -1017,6 +1017,7 @@ static void dlfb_ops_destroy(struct fb_info *info)
>  	}
>  	vfree(dlfb->backing_buffer);
>  	kfree(dlfb->edid);
> +	dlfb_free_urb_list(dlfb);
>  	usb_put_dev(dlfb->udev);
>  	kfree(dlfb);
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
