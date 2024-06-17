Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA490B364
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9E410E412;
	Mon, 17 Jun 2024 15:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="g+XBkEVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718DA10E412
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:06:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-360719c3514so375179f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718636812; x=1719241612; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x05MuZm+VFFsAZdQmr3txP0YJ1eGmSHBVXfcJ189TpA=;
 b=g+XBkEVEoR59xvcLlGeNuuLU8hqGBQEKbcsFFUjFT3iUh9TAj1xKNz1TNnn74qPKRT
 03CEGWUQovfTFOVCfzjDGnk2WKfmaF3PK9S6+SUpSKWliRJkfGeSBhX63t5hLYYoeyA9
 /twmJ/cGbuDOqAs8wTTuc8GcDlN4/hVZcVD1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718636812; x=1719241612;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x05MuZm+VFFsAZdQmr3txP0YJ1eGmSHBVXfcJ189TpA=;
 b=uQUSefkNrqm5w7grAeCiNcEk9ZZwAjypLjF3ZPBMLS+TNywK99EgBKgIQ9ScCFUttF
 7y1iyTM4NtTicSN8xIfpLdLA5Y2QGAs7waN4IieYHmidayawatMjOlcP2SaGHP2to6Rh
 ys6NEtXFyKaQvoMnM4LUvhT35QcmByK3SPUMPuQM76UsXm8jutdegnRwvR3A7JX+lnSW
 cl0Vy7FFJUrVERkbXCbGomkUEgn2Q05kqkcltAIpg+98S5GgFo1JgHwO91CNFvixYNN/
 6/v8aYfhch9SabkG+ilhLjX/df7w4mOSbiZhodi1dUez1CQNZoPHVBj29ymD9Pn24ldg
 OMfw==
X-Gm-Message-State: AOJu0YyZeyjbUKl1JyvTD0G44/boI7oaaWdfMYev7zwYVaxYReMRKYHG
 5WegSngyLaR1ZxuAWm2I3CCJ2xZf8OQRnKyXMr6ek9ZbQ213DysDwpDFGi51FRM=
X-Google-Smtp-Source: AGHT+IG0sNsP01gXbCoGsUbCJQsBP5VUKRc6nY7BWadr1rCTjdFLYZgXdyb4y+MwW6Wllxjq9K7rMw==
X-Received: by 2002:a05:6000:4029:b0:360:872b:7e03 with SMTP id
 ffacd0b85a97d-360872b7ed8mr5553785f8f.0.1718636811597; 
 Mon, 17 Jun 2024 08:06:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f2303sm12143750f8f.87.2024.06.17.08.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 08:06:51 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:06:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Ubisectech Sirius <bugreport@ubisectech.com>
Subject: Re: [PATCH] drm/lease: use kvcalloc instead of kcalloc to avoid warn
 triggering.
Message-ID: <ZnBRCTvblurScWIH@phenom.ffwll.local>
References: <20240617035258.2774032-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617035258.2774032-1-airlied@gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Mon, Jun 17, 2024 at 01:52:58PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Attempt to use kvmalloc to avoid kmalloc warnings on larger allocations.
> 
> It might make sense to try and make a limit for the number of objects allowed here.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 18929 at mm/page_alloc.c:4545 __alloc_pages+0x402/0x21b0 mm/page_alloc.c:4545
> Modules linked in:
> CPU: 1 PID: 18929 Comm: syz-executor.3 Not tainted 6.8.0 #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:__alloc_pages+0x402/0x21b0 mm/page_alloc.c:4545
> Code: ff 00 0f 84 15 fe ff ff 80 ce 01 e9 0d fe ff ff 83 fe 0a 0f 86 0e fd ff ff 80 3d c7 cf 6a 0d 00 75 0b c6 05 be cf 6a 0d 01 90 <0f> 0b 90 45 31 e4 e9 87 fe ff ff e8 5e 3e 9b ff 84 c0 0f 85 7a fe
> RSP: 0018:ffffc90001cc7808 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffff92000398f14
> RDX: 0000000000000001 RSI: 000000000000000b RDI: 0000000000040dc0
> RBP: ffffc90001cc7ab8 R08: 0000000000000007 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 00000000007a1200
> R13: 000000000000000b R14: 0000000000040dc0 R15: 000000000000000b
> FS:  00007f1717ba5640(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000203d0000 CR3: 000000001f5c0000 CR4: 0000000000750ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  __alloc_pages_node include/linux/gfp.h:238 [inline]
>  alloc_pages_node include/linux/gfp.h:261 [inline]
>  __kmalloc_large_node+0x88/0x1a0 mm/slub.c:3926
>  __do_kmalloc_node mm/slub.c:3969 [inline]
>  __kmalloc+0x370/0x480 mm/slub.c:3994
>  kmalloc_array include/linux/slab.h:627 [inline]
>  kcalloc include/linux/slab.h:658 [inline]
>  fill_object_idr drivers/gpu/drm/drm_lease.c:389 [inline]
>  drm_mode_create_lease_ioctl+0x4ca/0x1f70 drivers/gpu/drm/drm_lease.c:522
>  drm_ioctl_kernel+0x1eb/0x3f0 drivers/gpu/drm/drm_ioctl.c:744
>  drm_ioctl+0x582/0xb70 drivers/gpu/drm/drm_ioctl.c:841
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:871 [inline]
>  __se_sys_ioctl fs/ioctl.c:857 [inline]
>  __x64_sys_ioctl+0x1a1/0x210 fs/ioctl.c:857
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x6f/0x77
> RIP: 0033:0x7f1716e8eeed
> Code: c3 e8 97 2b 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f1717ba5028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f1716fe3f80 RCX: 00007f1716e8eeed
> RDX: 00000000200003c0 RSI: 00000000c01864c6 RDI: 0000000000000003
> RBP: 00007f1716f13014 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 000000000000000b R14: 00007f1716fe3f80 R15: 00007f1717b85000
>  </TASK>
> 
> Reported-by: Ubisectech Sirius <bugreport@ubisectech.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Hm this is a bit silly, because we really don't even need the objects[]
array:
- the first loop in could be put into the last one that builds the idr, at
  the cost of us having to tear down the entire idr on failure paths
  instead of releasing the objects[] array. Not a big deal because we
  don't have any real references to the objects, those are all in the main
  device idr, so an idr_destroy should be all it takes.

- validate_lease could also be put into that loop, which means we can
  drm_mode_object_put them as we go.

- because we fail on duplicated entries (not sure we have igts for that)
  with ENOSPC (bit an accidental error code) it's not really possible to
  fail

- I think I just realized that we have a use-after-free in the lease code
  for hotunpluggable connectors, because the lease idr does not hold a
  reference of its own for each object. So maybe more bugs here? Or at
  least the code that re-checks that the object still exists in
  drm_lease_create() and fails with ENOENT is a bit silly and maybe should
  be deleted. But maybe in another patch?

Anyway tldr; I think the unbounded objects[] array is a needless kernel
memory exhaustion path and should just go away completely ...

Cheers, Sima

> ---
>  drivers/gpu/drm/drm_lease.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 94375c6a5425..338716640725 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -386,8 +386,8 @@ static int fill_object_idr(struct drm_device *dev,
>  	int ret;
>  	bool universal_planes = READ_ONCE(lessor_priv->universal_planes);
>  
> -	objects = kcalloc(object_count, sizeof(struct drm_mode_object *),
> -			  GFP_KERNEL);
> +	objects = kvcalloc(object_count, sizeof(struct drm_mode_object *),
> +			   GFP_KERNEL);
>  	if (!objects)
>  		return -ENOMEM;
>  
> @@ -463,7 +463,7 @@ static int fill_object_idr(struct drm_device *dev,
>  		if (objects[o])
>  			drm_mode_object_put(objects[o]);
>  	}
> -	kfree(objects);
> +	kvfree(objects);
>  	return ret;
>  }
>  
> -- 
> 2.45.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
