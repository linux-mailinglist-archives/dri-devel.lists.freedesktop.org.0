Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB900B2E003
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E5410E0B8;
	Wed, 20 Aug 2025 14:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAqECZE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456910E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:55:35 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-321cf75482fso1075487a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755701734; x=1756306534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o0V2bDIBX6RG9O1tv9XNytM5AkMScDjTGK8YhSMkxjM=;
 b=SAqECZE0DJKoe5K20f36bAwd3vHXO7TKP97B2iMz/5OxJIJ9F4svxzfLXDGwNlxo3+
 RXXgTlIJ8AMz4tgRT9WVrjqC0OrXV3+ISaDHgn3Lzsvj8R+Twhvao/RGsBY1CYHO2i5a
 ri5H+Axhh+Hm6tcgHj1G8v5XfNmlKmSrp//Rmit83VcI9Y8NDRp0TsBdJ09v5I7rNxSp
 v+N+ZMNhqAujM4UFW8eoReigv2euNamWIbWRTWoi+fDiec5aVFJRazPcnBnOxBn+k2K8
 esEAqZt62TcsJMsA/7pg6mJbK1dtngTnbfpHf8C5buCcLrycbuvMED30fBCmd2rA3Xpd
 cFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755701734; x=1756306534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0V2bDIBX6RG9O1tv9XNytM5AkMScDjTGK8YhSMkxjM=;
 b=nm4smF3wY3NOGchERMxvKane97YeQ+WcelOqSCM/boKIeSOP07iVy/uJW70g2M/ICg
 bgM49Nev2NHrOO+aQDM3T81Nq6FvvP4fOOPhLlsi3OqHjKkG4zzMbuzmOhm+b6WjKTOy
 hdDuCwcCWkdpPxYhpfbRKExKJfYnPxeBc5rh6/w9XQ/hKvHCYnQKnSyPzrQ+/7hkpc3n
 xMypfV6UlHHyvHMplrBxAhUM/IvBBHy5VarPkX5iNN68wz1760wNowehS2aCx63OPlgd
 5v8n3IFs0FqUzYNLec/5Loh+e8PqDdDY3D38Y+xqk9d+n0bbvUy0MR/g2cd8/Jx/KMtn
 koJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwXTQoHioPYvsOPEqUuUgnhaOIkSlFWuYXstNMqzMDTJTZVEVEAaek5KZPjMNm1fBsgGlbXpm50dM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWA+C29NC3nERvJ4n+yFOcZwWvzzxTSnPNXFo00TQ74D5AyZhj
 Fikm+MsNlSUZ41zEES+jFau3H1osEsPukNDkdm2tmgawHp5OQsIAC9l+
X-Gm-Gg: ASbGncscOJp2Sy8dRd4Z6+mCGo4UbBRFVkeun/tQoTXtQd+SAOoGep22b1QPy0Wsu/8
 MFf63+o+r/mK0TSK10heqM6meADrdeglzeFg/Jq0OCW8BilTzkSpCpk2MHa+E+xivvEbVoVnZ3K
 4Yfkft9SWyvoHnM6+ngsi0lETFxuJzWcRU2ByglntVb8rwztlItePqEZPkMCZRqOgNnW/B1bVH5
 rJka4gjsyhtvqOJ3iTGGMhBPqroLegQczReG570NG1/dvXCTANtQh/4/kqbsr6JdPuSTVFEdNuA
 dErWxioUgK+ZoJbk3rKec9LngzFgyGKsfzpfISq04hppDB6dZqNhhw1huPwLExPlwZpdF6G/pkt
 3BXxWqF3+FxTVYlGfng==
X-Google-Smtp-Source: AGHT+IGmg/Cdj77TohGjYD8IlyALQCYhp/tkC4enDj7ZH8cBGpX8QTjsNTkyqiMmliHyuGe6n21pIw==
X-Received: by 2002:a17:90b:1810:b0:31f:252:e765 with SMTP id
 98e67ed59e1d1-324e1086f4bmr4174755a91.6.1755701734365; 
 Wed, 20 Aug 2025 07:55:34 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e8f20c7dbsm2403650b3a.68.2025.08.20.07.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:55:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:25:27 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, skhan@linuxfoundation.org, krathul3152@gmail.com
Subject: Re: [PATCH v3] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
Message-ID: <aKXh31C9LGZBgu7Y@Terra>
References: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
 <20250819121517.46998-2-krathul3152@gmail.com>
 <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
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

On Tue, Aug 19, 2025 at 10:14:30PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/19/2025 2:11 PM, Athul Raj Kollareth wrote:
> > Replace the DRM_* logging macros used in gem helper files with the appropriate
> > ones specified in /include/drm/drm_print.h.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> > Changes in v3:
> >     - Revert all changes to drm_gem_objects_lookup()
> >     - Use drm_device as suggested in [1]. 
> > Changes in v2:
> >     - Change drm_gem_objects_lookup() to take a drm_device* argument.
> >     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> > 
> > [1]
> > https://lore.kernel.org/dri-devel/90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com
> > ---
> >  drivers/gpu/drm/drm_gem.c            | 10 +++++++---
> >  drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 4a89b6acb6af..fbea8c50f17c 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
> >  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> >  					  GFP_KERNEL);
> >  	if (!vma_offset_manager) {
> > -		DRM_ERROR("out of memory\n");
> > +		drm_err(dev, "out of memory\n");
> 
> IIRC we shouldn't additionally report OOM errors as there will be
> already lot of messages when we hit this
>

Okay, then I will remove it.

> >  		return -ENOMEM;
> >  	}
> >  
> > @@ -787,6 +787,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  	u32 *handles;
> >  	struct drm_gem_object **objs;
> >  
> 
> remove extra line and please run checkpatch.pl as it should catch that
> 
> also consider declaring variables in reverse-xmas-tree order
> 

Got it, thanks, I'll keep that in mind.

Best regards,
Athul

> > +	struct drm_device *dev = filp->minor->dev;
> > +
> >  	if (!count)
> >  		return 0;
> >  
> > @@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  
> >  	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
> >  		ret = -EFAULT;
> > -		DRM_DEBUG("Failed to copy in GEM handles\n");
> > +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
> >  		goto out;
> >  	}
> >  
> > @@ -856,9 +858,11 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
> >  	long ret;
> >  	struct drm_gem_object *obj;
> >  
> 
> ditto
> 
> > +	struct drm_device *dev = filep->minor->dev;
> > +
> >  	obj = drm_gem_object_lookup(filep, handle);
> >  	if (!obj) {
> > -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> > +		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
> >  		return -EINVAL;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> > index 4f0320df858f..a507cf517015 100644
> > --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> > @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
> >  
> >  	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
> >  	if (ret) {
> > -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> > +		drm_err(dev, "Failed to vmap PRIME buffer\n");
> >  		return ERR_PTR(ret);
> >  	}
> >  
> 
