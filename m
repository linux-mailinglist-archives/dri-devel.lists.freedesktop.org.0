Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD194DC43E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080E310E215;
	Thu, 17 Mar 2022 10:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0C710E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:49:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n35so1246767wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 03:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=u68S3XKSCZAMP62m3aNQ/j4jRRcnjMgWixQrjLmtpDw=;
 b=YlAQwBJxPiG/VXPkVpppT1k9Odb0GLO5SH77/VCll+er9qw7gLViZ882/nb39B/ltK
 oIOu+0XFogHAx3EcDK3qXjo0N/CgackhvDEbJnZ3Q3BPdF8TAjFJRO0Bzg6S58desIIq
 E3NXPvzU4QIFqbIqGE4bE5+VXbA9j8HRMuhws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=u68S3XKSCZAMP62m3aNQ/j4jRRcnjMgWixQrjLmtpDw=;
 b=jVGv0w2G62GZNaLBzaZlWvQ73fiPgQzKM8N+OPaH22+dsDqzGg6r37J8uFTk5UYn6w
 gzK4umOV2s1oNxCl/3K7QnGw2k482SGE1VvVH9/f3LPQJUNG2T0rW4VlCQxQZJdJxHyk
 GHileANdntz/Mq354pnqm+Z1FcFu8F1EGUVm4ztFljF4DPkKFyj9KXEoibYQ3QqULyac
 UylgOAYj6uRW7XLHnEkWSkJYC3FrQF6FqyiHzzoLFigW2AEc0gJVP6OFzUyicCJ3q+5G
 Er7TrfUJBNt1FzwO2koEcT8XrS1CC+VM8GB0EtnvEci2V6UPyLoq42BjjZGhH2kazWRV
 5fFg==
X-Gm-Message-State: AOAM531nazKJ0mjVBSKoHcyXWUwwpGooweJOpSlNjGkV5nFCIoiOruSv
 +WB+hiqoPliu+4ApU+yaRok8QA==
X-Google-Smtp-Source: ABdhPJzhQ1kqm4iylqrPFAuFVextJ5iiugEB6SMDkQIya6R32kfH/2J59AU4VzEDcOHoG6pKAfV8cA==
X-Received: by 2002:a1c:1941:0:b0:38b:4af1:49f8 with SMTP id
 62-20020a1c1941000000b0038b4af149f8mr10937295wmz.156.1647514162494; 
 Thu, 17 Mar 2022 03:49:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b001f0620ecb3csm3827570wrt.40.2022.03.17.03.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 03:49:21 -0700 (PDT)
Date: Thu, 17 Mar 2022 11:49:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH] drm: drm_bufs: Error out if 'dev->agp' is a null pointer
Message-ID: <YjMSMIrbsVZjEw8W@phenom.ffwll.local>
Mail-Followup-To: Zheyu Ma <zheyuma97@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1646983382-30036-1-git-send-email-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646983382-30036-1-git-send-email-zheyuma97@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 07:23:02AM +0000, Zheyu Ma wrote:
> The user program can control the 'drm_buf_desc::flags' via ioctl system
> call and enter the function drm_legacy_addbufs_agp(). If the driver
> doesn't initialize the agp resources, the driver will cause a null
> pointer dereference.
> 
> The following log reveals it:
>     general protection fault, probably for non-canonical address
>     0xdffffc000000000f: 0000 [#1] PREEMPT SMP KASAN PTI
>     KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
>     Call Trace:
>      <TASK>
>      drm_ioctl_kernel+0x342/0x450 drivers/gpu/drm/drm_ioctl.c:785
>      drm_ioctl+0x592/0x940 drivers/gpu/drm/drm_ioctl.c:885
>      vfs_ioctl fs/ioctl.c:51 [inline]
>      __do_sys_ioctl fs/ioctl.c:874 [inline]
>      __se_sys_ioctl+0xaa/0xf0 fs/ioctl.c:860
>      do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>      do_syscall_64+0x43/0x90 arch/x86/entry/common.c:80
>      entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Fix this bug by adding a check.
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

You can only hit this if you enabled a DRIVER_LEGACY drm driver, which
opens you up to tons of other CVEs and issues. What's your .config?
-Daniel

> ---
>  drivers/gpu/drm/drm_bufs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index fcca21e8efac..4fe2363b1e34 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -734,7 +734,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
>  	int i, valid;
>  	struct drm_buf **temp_buflist;
>  
> -	if (!dma)
> +	if (!dma || !dev->agp)
>  		return -EINVAL;
>  
>  	count = request->count;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
