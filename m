Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4E86B275
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2847510E9F9;
	Wed, 28 Feb 2024 14:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="aOKztkQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5BD10E9F9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:56:09 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d2c8c1b76cso2867631fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709132167; x=1709736967; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vcMWHnsgqS7W8fnpj1PaXiom5DksSZX96pEaShUzcc=;
 b=aOKztkQtfkNeR1Al4MlCrZOM0NVQlK53cppkazMtK1PZqCZpbEG9/3CSU1XIcXS/7l
 SaGHY6FyxjSjxoghYsugDSdNoj0rIKEQARlvteHnfAdHB1oDKYl8iUWqdiBn1Alw0mD4
 U3y+/oKwMzEaQFhwRhkkxWbzlQIynX3pjGMJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709132167; x=1709736967;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vcMWHnsgqS7W8fnpj1PaXiom5DksSZX96pEaShUzcc=;
 b=Ez8/CtXLx6yXe3QDuPmVE8iubBW8eX8a4FRazm7PLAF6fF+N2MPbnj3B9cx1ZKX8X2
 Zz1V62oh8ZiuYVzJ0XMydPe2MW7537Gm0F8OTcloPNi+5BkkJyt2G3jlP3NbQThwJgLE
 PNVoSTwkaar95NO8q/yQJ5IdN9OqhJbVJmq3ySvbzrCHKrQSHhR2oAm/xPpVHxNd4n1f
 6saHX+64Kfde21obKN91j3GZ4aIXkfvqYB6tAwlcitaEJlDpk5GwgMsB5Um9dsRW548V
 r85EHierijiIamDDd0XvLxMvJkpfPokdg1jQ/ZBVAK9K1M4XhXHe3ZY19x3LAKG9XKC9
 lXrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEVB4j7xpZ1FALqkD4fRIP7x3ZzimWqA55PXOkKiz/+doUn31WkWGjkYgIZ8S2zd9I1yKj0F0PdUdkrXvqOFD1oopAp1zkLYLDwXkvmdta
X-Gm-Message-State: AOJu0YzEpYZMPbfRn17nblLMgx1Zrtr++1DstBI4Hm/+2QYJPsmTQJpE
 ZgirblvBUgzCGGjf0GnEMiOMIpogs0Tc5JzDV/UYMDq0K4i+7w/rTJRxXCKMbKw=
X-Google-Smtp-Source: AGHT+IEAGFSW/uX/YpbDaJT1Mv1OsObD1Iuo5PxtDuR6p/AmF+ZMAoYUnQ3pqM6XlOYLcbdO9CcHKg==
X-Received: by 2002:a05:6512:3d88:b0:513:16a8:4292 with SMTP id
 k8-20020a0565123d8800b0051316a84292mr2579206lfv.2.1709132167118; 
 Wed, 28 Feb 2024 06:56:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0033d06dfcf84sm14599276wry.100.2024.02.28.06.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 06:56:06 -0800 (PST)
Date: Wed, 28 Feb 2024 15:56:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: ltuikov89@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/scheduler: Simplify the allocation of slab caches in
 drm_sched_fence_slab_init
Message-ID: <Zd9JhJ8gXfk7k9sz@phenom.ffwll.local>
Mail-Followup-To: Kunwu Chan <chentao@kylinos.cn>, ltuikov89@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240221085558.166774-1-chentao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221085558.166774-1-chentao@kylinos.cn>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Wed, Feb 21, 2024 at 04:55:58PM +0800, Kunwu Chan wrote:
> Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
> to simplify the creation of SLAB caches.
> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Applied to drm-misc-next, thanks for your patch!
-Sima

> ---
>  drivers/gpu/drm/scheduler/sched_fence.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 06cedfe4b486..0f35f009b9d3 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -33,9 +33,7 @@ static struct kmem_cache *sched_fence_slab;
>  
>  static int __init drm_sched_fence_slab_init(void)
>  {
> -	sched_fence_slab = kmem_cache_create(
> -		"drm_sched_fence", sizeof(struct drm_sched_fence), 0,
> -		SLAB_HWCACHE_ALIGN, NULL);
> +	sched_fence_slab = KMEM_CACHE(drm_sched_fence, SLAB_HWCACHE_ALIGN);
>  	if (!sched_fence_slab)
>  		return -ENOMEM;
>  
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
