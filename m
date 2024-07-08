Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C7929E93
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 10:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E7010E2E9;
	Mon,  8 Jul 2024 08:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cU4DfM9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B60710E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 08:58:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-426607d4eb7so1979765e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720429086; x=1721033886; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LMyKqbyil9/Tq34DWS+1DnlmwOF50Yp/OlECGa9z5DM=;
 b=cU4DfM9oU3U0m5EoCrYVKTEymhDZQJ0v45XjCs1zOib5imLh2L4b1bnXX6S5jXquAp
 YRAoNwuUswGNsmBbqerwQDWgRh0iIvC2dUBNK4Y6h1Z4MiWrm/gXxF+ZEHJj4/3iptO7
 CCINxd7vtOEpUqjLZX+ESWZMcU8bcZWz2vBDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720429086; x=1721033886;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LMyKqbyil9/Tq34DWS+1DnlmwOF50Yp/OlECGa9z5DM=;
 b=MEPouTr1sy+Qxw5VsxtzxIK68MBu3Dk++JBwFycBjAsN0WQrfBquwEXw2B9KHQXwu5
 81dR6IwgiU85OT3H+6ZT6t26mXDqPCdZysWlNfTayAIu6uzsEDHg+tTV3TKq61M3Oqou
 lPf9Isl6fFwaDImwt7sxmINGWFe2eaPKO5x/+lgeHQh4cZ9lDca6A9TIaydH4B8qP7r2
 NYW56P09D3gMSzSClXLQGtzbjBZldc011QxnOcSEXo2nW7TOdJMtQNgWThghz8X8sB8E
 DysnEPsCN2Lc3vf27e2q8S1WCjNVu6aWKHhfTBaR0a580cmkzvGJ3dKnY/oBnVNA2Fw9
 VLIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzZbZUhjAwwrs3W7CW6pzhT75QgIvnwtZnfx16f/Dsfhg8GFb1Mo8J/R8C86Zxvn5aLR0la2Ylb7wTUV+3CYLZjuqJHkyfT2vCIpxJsE7r
X-Gm-Message-State: AOJu0YxcCzHt/ZoojoxAIMlQZ6zNkhqMoJc6gb7NjfiP6TMr+HXSNu2z
 oKDHDmQcU0I95ibQUrnXFFRquJzJM7kDvBtywAMxWx51Jih/FMu+m1jrPrdpNFU=
X-Google-Smtp-Source: AGHT+IEgRfZAD4TamAlnn0Yf85HMM/eXJHl7e7yKmoXUefz2s+P9sIXchH0/DmhuDKjCe3s2Xa/6LA==
X-Received: by 2002:a05:6000:400e:b0:367:95e3:e4c6 with SMTP id
 ffacd0b85a97d-3679dd12d7fmr7114858f8f.1.1720429085635; 
 Mon, 08 Jul 2024 01:58:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678e5c2b08sm14834906f8f.71.2024.07.08.01.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 01:58:05 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:58:03 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 regressions@leemhuis.info, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Kaplan <david.kaplan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/qxl: Pin buffer objects for internal mappings
Message-ID: <ZouqG20NkG5DdBC_@phenom.ffwll.local>
References: <20240702142034.32615-1-tzimmermann@suse.de>
 <096287bd-c882-4d9d-bd4d-19c2fa68b8ec@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <096287bd-c882-4d9d-bd4d-19c2fa68b8ec@suse.de>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 08, 2024 at 10:09:44AM +0200, Thomas Zimmermann wrote:
> Hi,
> 
> ping for a review. This is a bugfix for a serious problem.

I tried to look around whether there's any place where we could WARN_ON if
we create a vmap but it's not pinned. But there's lots of places where we
want the vmap only for the duration of the dma_resv locked section, so
really can't do that. And your patch removes the unlocked vmap
implementation, which would be the only place really.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Best regards
> Thomas
> 
> Am 02.07.24 um 16:20 schrieb Thomas Zimmermann:
> > Add qxl_bo_pin_and_vmap() that pins and vmaps a buffer object in one
> > step. Update callers of the regular qxl_bo_vmap(). Fixes a bug where
> > qxl accesses an unpinned buffer object while it is being moved; such
> > as with the monitor-description BO. An typical error is shown below.
> > 
> > [    4.303586] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65376256x16777216+0+0
> > [    4.586883] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65376256x16777216+0+0
> > [    4.904036] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65335296x16777216+0+0
> > [    5.374347] [drm:qxl_release_from_id_locked] *ERROR* failed to find id in release_idr
> > 
> > Commit b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
> > removed the implicit pin operation from qxl's vmap code. This is the
> > correct behavior for GEM and PRIME interfaces, but the pin is still
> > needed for qxl internal operation.
> > 
> > Also add a corresponding function qxl_bo_vunmap_and_unpin() and remove
> > the old qxl_bo_vmap() helpers.
> > 
> > Future directions: BOs should not be pinned or vmapped unnecessarily.
> > The pin-and-vmap operation should be removed from the driver and a
> > temporary mapping should be established with a vmap_local-like helper.
> > See the client helper drm_client_buffer_vmap_local() for semantics.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
> > Reported-by: David Kaplan <david.kaplan@amd.com>
> > Closes: https://lore.kernel.org/dri-devel/ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de/
> > Tested-by: David Kaplan <david.kaplan@amd.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Zack Rusin <zack.rusin@broadcom.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: virtualization@lists.linux.dev
> > Cc: spice-devel@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/qxl/qxl_display.c | 14 +++++++-------
> >   drivers/gpu/drm/qxl/qxl_object.c  | 11 +++++++++--
> >   drivers/gpu/drm/qxl/qxl_object.h  |  4 ++--
> >   3 files changed, 18 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> > index 86a5dea710c0..bc24af08dfcd 100644
> > --- a/drivers/gpu/drm/qxl/qxl_display.c
> > +++ b/drivers/gpu/drm/qxl/qxl_display.c
> > @@ -584,11 +584,11 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
> >   	if (ret)
> >   		goto err;
> > -	ret = qxl_bo_vmap(cursor_bo, &cursor_map);
> > +	ret = qxl_bo_pin_and_vmap(cursor_bo, &cursor_map);
> >   	if (ret)
> >   		goto err_unref;
> > -	ret = qxl_bo_vmap(user_bo, &user_map);
> > +	ret = qxl_bo_pin_and_vmap(user_bo, &user_map);
> >   	if (ret)
> >   		goto err_unmap;
> > @@ -614,12 +614,12 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
> >   		       user_map.vaddr, size);
> >   	}
> > -	qxl_bo_vunmap(user_bo);
> > -	qxl_bo_vunmap(cursor_bo);
> > +	qxl_bo_vunmap_and_unpin(user_bo);
> > +	qxl_bo_vunmap_and_unpin(cursor_bo);
> >   	return cursor_bo;
> >   err_unmap:
> > -	qxl_bo_vunmap(cursor_bo);
> > +	qxl_bo_vunmap_and_unpin(cursor_bo);
> >   err_unref:
> >   	qxl_bo_unpin(cursor_bo);
> >   	qxl_bo_unref(&cursor_bo);
> > @@ -1205,7 +1205,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
> >   	}
> >   	qdev->monitors_config_bo = gem_to_qxl_bo(gobj);
> > -	ret = qxl_bo_vmap(qdev->monitors_config_bo, &map);
> > +	ret = qxl_bo_pin_and_vmap(qdev->monitors_config_bo, &map);
> >   	if (ret)
> >   		return ret;
> > @@ -1236,7 +1236,7 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
> >   	qdev->monitors_config = NULL;
> >   	qdev->ram_header->monitors_config = 0;
> > -	ret = qxl_bo_vunmap(qdev->monitors_config_bo);
> > +	ret = qxl_bo_vunmap_and_unpin(qdev->monitors_config_bo);
> >   	if (ret)
> >   		return ret;
> > diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> > index 5893e27a7ae5..cb1b7c2580ae 100644
> > --- a/drivers/gpu/drm/qxl/qxl_object.c
> > +++ b/drivers/gpu/drm/qxl/qxl_object.c
> > @@ -182,7 +182,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
> >   	return 0;
> >   }
> > -int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
> > +int qxl_bo_pin_and_vmap(struct qxl_bo *bo, struct iosys_map *map)
> >   {
> >   	int r;
> > @@ -190,7 +190,13 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
> >   	if (r)
> >   		return r;
> > +	r = qxl_bo_pin_locked(bo);
> > +	if (r)
> > +		return r;
> > +
> >   	r = qxl_bo_vmap_locked(bo, map);
> > +	if (r)
> > +		qxl_bo_unpin_locked(bo);
> >   	qxl_bo_unreserve(bo);
> >   	return r;
> >   }
> > @@ -241,7 +247,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
> >   	ttm_bo_vunmap(&bo->tbo, &bo->map);
> >   }
> > -int qxl_bo_vunmap(struct qxl_bo *bo)
> > +int qxl_bo_vunmap_and_unpin(struct qxl_bo *bo)
> >   {
> >   	int r;
> > @@ -250,6 +256,7 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
> >   		return r;
> >   	qxl_bo_vunmap_locked(bo);
> > +	qxl_bo_unpin_locked(bo);
> >   	qxl_bo_unreserve(bo);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
> > index 1cf5bc759101..875f63221074 100644
> > --- a/drivers/gpu/drm/qxl/qxl_object.h
> > +++ b/drivers/gpu/drm/qxl/qxl_object.h
> > @@ -59,9 +59,9 @@ extern int qxl_bo_create(struct qxl_device *qdev,
> >   			 u32 priority,
> >   			 struct qxl_surface *surf,
> >   			 struct qxl_bo **bo_ptr);
> > -int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map);
> > +int qxl_bo_pin_and_vmap(struct qxl_bo *bo, struct iosys_map *map);
> >   int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map);
> > -int qxl_bo_vunmap(struct qxl_bo *bo);
> > +int qxl_bo_vunmap_and_unpin(struct qxl_bo *bo);
> >   void qxl_bo_vunmap_locked(struct qxl_bo *bo);
> >   void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
> >   void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
