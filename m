Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E12C68E2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998F26EE41;
	Fri, 27 Nov 2020 15:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFE36EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:44:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f190so3914175wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LHosXNN7QEmyb+KxenNbkD+XPotf9CZ+4DKnyRBZes0=;
 b=fH9aQ+/BOwZBMsUAUM1QtkD0busE6/WQ8rob8FWu64EnTDeLPNX7X1Thr9rb0rB20p
 LtvvLiqKZdCwbQmFdXNdk9Bb/1LaOeIXLvpTkI8gEv2UruK0CaJrkN4ZW14ElGZq39kp
 iEzTxeCzAXQQuoErmwzo1nJbMc8DEVMeu4VNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LHosXNN7QEmyb+KxenNbkD+XPotf9CZ+4DKnyRBZes0=;
 b=nfAqnE+t7kDiyR2hKxUB1T6jtslftFULx3hM/n5Qc8/ZD2hF1r9AhFZPCiAY1B9a1G
 prziN/SqEQZVRWFcyW4PbQBHOrWCM7kmnqcZyN2NhwlLDXMbF4T57+R37Gz+cd/feHgZ
 DWS8MQVqxkorJS6/M/szX0Rb69Gaqx6z0cu4c25pO40tMhpeINy4Ayo9tRungKlPM8ry
 44r5eVC+ESTaINL5wq3hXwgbApw/gzniQLr8jGj9+yOIkowRfDyxo5aiYdg6isfRSIuw
 cAeG8OJp+GFFGcR/buesUxquo9EAon27827V5Sz9rDuf6778dNDCc+jV7pcE8q/x0z7A
 AIww==
X-Gm-Message-State: AOAM531009YvIRcjzHnicvmi73ZjRcW3OoayoqCfJPghl5dJ9RmAVPJz
 QO5TSvOJjt90WfTwlTWVoGshYvqQ6gyvIA==
X-Google-Smtp-Source: ABdhPJxPHTetX3Yol3Wpg8DhdN19bDlgaIQ7btt4oZ1bOSN7w9nnkQVXh4UDHLPKMkztTqxyJNkd8A==
X-Received: by 2002:a1c:205:: with SMTP id 5mr9767297wmc.7.1606491878878;
 Fri, 27 Nov 2020 07:44:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u129sm13475755wme.9.2020.11.27.07.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:44:37 -0800 (PST)
Date: Fri, 27 Nov 2020 16:44:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: Warn on pinning without holding a reference
Message-ID: <20201127154436.GK401619@phenom.ffwll.local>
References: <20201028113120.3641237-1-daniel.vetter@ffwll.ch>
 <376c6ae4-b54d-05e4-1297-7abf379425de@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <376c6ae4-b54d-05e4-1297-7abf379425de@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 01:11:51PM +0100, Christian K=F6nig wrote:
> Am 28.10.20 um 12:31 schrieb Daniel Vetter:
> > Not technically a problem for ttm, but very likely a driver bug and
> > pretty big time confusing for reviewing code.
> > =

> > So warn about it, both at cleanup time (so we catch these for sure)
> > and at pin/unpin time (so we know who's the culprit).
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Remembered this patch, pushed it. Thanks to you both for the reviews.
-Daniel

> =

> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
> >   include/drm/ttm/ttm_bo_api.h | 2 ++
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index f51b5e20fa17..a011072ab61d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -509,7 +509,7 @@ static void ttm_bo_release(struct kref *kref)
> >   		 * shrinkers, now that they are queued for
> >   		 * destruction.
> >   		 */
> > -		if (bo->pin_count) {
> > +		if (WARN_ON(bo->pin_count)) {
> >   			bo->pin_count =3D 0;
> >   			ttm_bo_del_from_lru(bo);
> >   			ttm_bo_add_mem_to_lru(bo, &bo->mem);
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > index 37102e45e496..b45aee23d7d0 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -571,6 +571,7 @@ static inline bool ttm_bo_uses_embedded_gem_object(=
struct ttm_buffer_object *bo)
> >   static inline void ttm_bo_pin(struct ttm_buffer_object *bo)
> >   {
> >   	dma_resv_assert_held(bo->base.resv);
> > +	WARN_ON_ONCE(!kref_read(&bo->kref));
> >   	++bo->pin_count;
> >   }
> > @@ -584,6 +585,7 @@ static inline void ttm_bo_unpin(struct ttm_buffer_o=
bject *bo)
> >   {
> >   	dma_resv_assert_held(bo->base.resv);
> >   	WARN_ON_ONCE(!bo->pin_count);
> > +	WARN_ON_ONCE(!kref_read(&bo->kref));
> >   	--bo->pin_count;
> >   }
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
