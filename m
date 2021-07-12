Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A43C5E74
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB5A89C82;
	Mon, 12 Jul 2021 14:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408289C82
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:37:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so11408782wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5MvsjY4pTEd5k29K3lYAodvANPB7dCwy0fDdN4Dc+OU=;
 b=DL95kZw7btL3htFTaW94KekmngiAohubrwxs52d8zHcU2Pbn5FIq7Y1SsbA7R09BqS
 eFcpL7PqpCyuTqLIAzpNm23Z04Gqg/XOiVnaxa2X0FlakC/xkAJkHizc8EUURhyOzF/s
 RLdM1aY0/8HeyoOOqmiWLFcb9UmOz8UikBLp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5MvsjY4pTEd5k29K3lYAodvANPB7dCwy0fDdN4Dc+OU=;
 b=ORGDiHwOjO/Av+2smA+Qn2HogFXTKMemW+wnLpweHoRCkadUCVdwKXcNE0FDrUqOlu
 57LS4G7Turgbnpe4DILiuVCh76u3sN9+UVz1E+hDFQaJsfvUX3wS5NDIhwp47Oe6ziuY
 joKpV/v0GUQgRraQHpu9CF1489j4sryN3HteaB5QpZsPXvRaxCF9MjhD5hKd4s5vYSrl
 dp2Qm6oI8v05LCLY0Jp82e75yrefZ1+YrX4+hFsO+DrhE7W/MOQceHaEKqZ1QocHbKus
 dyNK7GcBeiUpPLFfFkBZe5VZOknCIpkgBc0NKI+xEU95uqpCCwgB3piwL2Akv3hYVKlD
 QecQ==
X-Gm-Message-State: AOAM533YvTwEjm3vvv034WNUR+DVTkr+xJFZmYLPKkAIJv9nq2ziVynW
 ObAPM3mXvawyXdWS5pRTLE7WOw==
X-Google-Smtp-Source: ABdhPJxQay/+e0GLtdI0ff33EQHMLSIiRe5WWhtjGOPQLPgpU8vOTCjIMVM1pdQ7c3u9d0Pa7Ymgqw==
X-Received: by 2002:a05:600c:1d1f:: with SMTP id
 l31mr3197939wms.26.1626100670687; 
 Mon, 12 Jul 2021 07:37:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l20sm13057801wmq.3.2021.07.12.07.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:37:49 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:37:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] fbmem: Do not delete the mode that is still in use
Message-ID: <YOxTvOayYYCro+qh@phenom.ffwll.local>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-fbdev <linux-fbdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20210712085544.2828-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712085544.2828-1-thunder.leizhen@huawei.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 04:55:44PM +0800, Zhen Lei wrote:
> The execution of fb_delete_videomode() is not based on the result of the
> previous fbcon_mode_deleted(). As a result, the mode is directly deleted,
> regardless of whether it is still in use, which may cause UAF.
> 
> ==================================================================
> BUG: KASAN: use-after-free in fb_mode_is_equal+0x36e/0x5e0 \
> drivers/video/fbdev/core/modedb.c:924
> Read of size 4 at addr ffff88807e0ddb1c by task syz-executor.0/18962
> 
> CPU: 2 PID: 18962 Comm: syz-executor.0 Not tainted 5.10.45-rc1+ #3
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ...
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x137/0x1be lib/dump_stack.c:118
>  print_address_description+0x6c/0x640 mm/kasan/report.c:385
>  __kasan_report mm/kasan/report.c:545 [inline]
>  kasan_report+0x13d/0x1e0 mm/kasan/report.c:562
>  fb_mode_is_equal+0x36e/0x5e0 drivers/video/fbdev/core/modedb.c:924
>  fbcon_mode_deleted+0x16a/0x220 drivers/video/fbdev/core/fbcon.c:2746
>  fb_set_var+0x1e1/0xdb0 drivers/video/fbdev/core/fbmem.c:975
>  do_fb_ioctl+0x4d9/0x6e0 drivers/video/fbdev/core/fbmem.c:1108
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Freed by task 18960:
>  kasan_save_stack mm/kasan/common.c:48 [inline]
>  kasan_set_track+0x3d/0x70 mm/kasan/common.c:56
>  kasan_set_free_info+0x17/0x30 mm/kasan/generic.c:355
>  __kasan_slab_free+0x108/0x140 mm/kasan/common.c:422
>  slab_free_hook mm/slub.c:1541 [inline]
>  slab_free_freelist_hook+0xd6/0x1a0 mm/slub.c:1574
>  slab_free mm/slub.c:3139 [inline]
>  kfree+0xca/0x3d0 mm/slub.c:4121
>  fb_delete_videomode+0x56a/0x820 drivers/video/fbdev/core/modedb.c:1104
>  fb_set_var+0x1f3/0xdb0 drivers/video/fbdev/core/fbmem.c:978
>  do_fb_ioctl+0x4d9/0x6e0 drivers/video/fbdev/core/fbmem.c:1108
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Fixes: 13ff178ccd6d ("fbcon: Call fbcon_mode_deleted/new_modelist directly")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Nice catch, that indeed got lost.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: <stable@vger.kernel.org> # v5.3+

Needs to be applied to drm-misc-fixes, but the tree isn't ready yet.
-Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 98f193078c05..1c855145711b 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -970,13 +970,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>  		fb_var_to_videomode(&mode2, &info->var);
>  		/* make sure we don't delete the videomode of current var */
>  		ret = fb_mode_is_equal(&mode1, &mode2);
> -
> -		if (!ret)
> -			fbcon_mode_deleted(info, &mode1);
> -
> -		if (!ret)
> -			fb_delete_videomode(&mode1, &info->modelist);
> -
> +		if (!ret) {
> +			ret = fbcon_mode_deleted(info, &mode1);
> +			if (!ret)
> +				fb_delete_videomode(&mode1, &info->modelist);
> +		}
>  
>  		return ret ? -EINVAL : 0;
>  	}
> -- 
> 2.25.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
