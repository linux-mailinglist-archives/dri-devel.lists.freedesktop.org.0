Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772A8422A6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 12:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2581D10F09C;
	Tue, 30 Jan 2024 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986A010E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 11:17:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-55369c59708so1550474a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 03:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706613372; x=1707218172; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C2FZft6FauqTz4a6mgFsXH5fOXhbWwAcsXYixHIZpik=;
 b=dpyq282e0kAV48G+H8JDbByCfTrpKbv07w4Sx7VJcxmcG/zkL0m3HiMxSayYWTcRpY
 N2vjVSTWpY5BfisQpvQzMFrioBwiT2JIdFuTJbRCSfp+crrKTFqoNlDI2Ofo75iIZnTh
 WUoRofe6Uhsum8Di/xxwqxtMC/bVeSKgiSQJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706613372; x=1707218172;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C2FZft6FauqTz4a6mgFsXH5fOXhbWwAcsXYixHIZpik=;
 b=r0ni3vib8OSODavBX4rBBgopRfGo5KC2ezdTlYfsKpTH78cgqdxl5p67qhxEFLB0Q7
 FrU9EWxK7fsMlqrMPkVJk45rOwC52PIWwFqguzgApzBgRCwbmqz7GfKAVQKCulRlXmPp
 7LD7bz8y0xQbfuCY+WbyH5Od0lwmSqMYrP2NSRus5BR88IxQxvBzvgy0/0KjXrvcmG9N
 aT4hySuEZQFE27Z1w518BztuRidSsDX/u+o78t4DoFofABcwnGQkrtzo54ABeEmUJCA9
 1/t4OboyZ5VlRhILjoJbDe9TJuEguwrPWa9JMfxk2TQda8vpZfZMgZIJQoZoXqDKSvMP
 2Ptg==
X-Forwarded-Encrypted: i=0;
 AJvYcCXxqkrWT2uOouuTbFEdqt774HIAPWC2Gis3N35fTe0+jT+OYDmQAuo7+b4C6NxNMpx5WAQbJ36wP804k6QIbfsNM7/G4UWu23AB0G2MVHyV
X-Gm-Message-State: AOJu0YydNOBTxcCq91KrVFB+O+g6YAd6huJAlcKabaRvMoghU/zqMfDD
 o+p3zoTfng7oO4u+nTLLy5m+Be4LGbmu1PqZKyDtjZklD7bZ+CUxoct1+knbjTk=
X-Google-Smtp-Source: AGHT+IEMT3X2zvsc4bSoskcD1Q4j1mTrHeLOlnPktNoR8kFYS32umfRbdXFTr6eXS49OA5C1n9722A==
X-Received: by 2002:a05:6402:3106:b0:55e:ff4e:70ad with SMTP id
 dc6-20020a056402310600b0055eff4e70admr3164992edb.0.1706613372045; 
 Tue, 30 Jan 2024 03:16:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u23-20020aa7db97000000b00558a3e892b3sm4797173edt.41.2024.01.30.03.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 03:16:11 -0800 (PST)
Date: Tue, 30 Jan 2024 12:16:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Erik Faye-Lund <kusmabite@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
Message-ID: <ZbjaebswTCxmlwu0@phenom.ffwll.local>
Mail-Followup-To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Stevens <stevensd@chromium.org>
References: <20240129103118.3258781-1-julia.zhang@amd.com>
 <ZbjZJ3qQzdOksnb2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbjZJ3qQzdOksnb2@phenom.ffwll.local>
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

On Tue, Jan 30, 2024 at 12:10:31PM +0100, Daniel Vetter wrote:
> On Mon, Jan 29, 2024 at 06:31:19PM +0800, Julia Zhang wrote:
> > As vram objects don't have backing pages and thus can't implement
> > drm_gem_object_funcs.get_sg_table callback. This removes drm dma-buf
> > callbacks in virtgpu_gem_map_dma_buf()/virtgpu_gem_unmap_dma_buf()
> > and implement virtgpu specific map/unmap/attach callbacks to support
> > both of shmem objects and vram objects.
> > 
> > Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_prime.c | 40 +++++++++++++++++++++++---
> >  1 file changed, 36 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> > index 44425f20d91a..b490a5343b06 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> > @@ -49,11 +49,26 @@ virtgpu_gem_map_dma_buf(struct dma_buf_attachment *attach,
> >  {
> >  	struct drm_gem_object *obj = attach->dmabuf->priv;
> >  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> > +	struct sg_table *sgt;
> > +	int ret;
> >  
> >  	if (virtio_gpu_is_vram(bo))
> >  		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
> >  
> > -	return drm_gem_map_dma_buf(attach, dir);
> > +	sgt = drm_prime_pages_to_sg(obj->dev,
> > +				    to_drm_gem_shmem_obj(obj)->pages,
> > +				    obj->size >> PAGE_SHIFT);
> > +	if (IS_ERR(sgt))
> > +		return sgt;
> > +
> > +	ret = dma_map_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +	if (ret) {
> > +		sg_free_table(sgt);
> > +		kfree(sgt);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	return sgt;
> >  }
> >  
> >  static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
> > @@ -63,12 +78,29 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
> >  	struct drm_gem_object *obj = attach->dmabuf->priv;
> >  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> >  
> > +	if (!sgt)
> > +		return;
> > +
> >  	if (virtio_gpu_is_vram(bo)) {
> >  		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
> > -		return;
> > +	} else {
> > +		dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +		sg_free_table(sgt);
> > +		kfree(sgt);
> >  	}
> > +}
> > +
> > +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
> > +				     struct dma_buf_attachment *attach)
> > +{
> > +	struct drm_gem_object *obj = attach->dmabuf->priv;
> > +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> > +	int ret = 0;
> > +
> > +	if (!virtio_gpu_is_vram(bo) && obj->funcs->pin)
> > +		ret = obj->funcs->pin(obj);
> >  
> > -	drm_gem_unmap_dma_buf(attach, sgt, dir);
> > +	return ret;
> 
> This doesn't look like what I've expected. There should be no need to
> change the map/unmap functions, especially not for the usual gem bo case.
> We should definitely keep using the exact same code for that. Instead all
> I expected is roughly
> 
> virtgpu_gem_device_attach()
> {
> 	if (virtio_gpu_is_vram(bo)) {
> 		if (can_access_virtio_vram_directly(attach->dev)
> 			return 0;
> 		else
> 			return -EBUSY;
> 	} else {
> 		return drm_gem_map_attach();
> 	}
> }
> 
> Note that I think can_access_virtio_vram_directly() needs to be
> implemented first. I'm not even sure it's possible, might be that all the
> importers need to set the attachment->peer2peer flag. Which is why this
> thing exists really. But that's a pile more work to do.
> 
> Frankly the more I look at the original patch that added vram export
> support the more this just looks like a "pls revert, this is just too
> broken".

The commit I mean is this one: ea5ea3d8a117 ("drm/virtio: support mapping
exported vram"). The commit message definitely needs to cite that one, and
also needs a cc: stable because not rejecting invalid imports is a pretty
big deal.

Also adding David.
-Sima

> 
> We should definitely not open-code any functions for the gem_bo export
> case, which your patch seems to do? Or maybe I'm just extremely confused.
> -Sima
> 
> >  
> >  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
> > @@ -83,7 +115,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
> >  		.vmap = drm_gem_dmabuf_vmap,
> >  		.vunmap = drm_gem_dmabuf_vunmap,
> >  	},
> > -	.device_attach = drm_gem_map_attach,
> > +	.device_attach = virtgpu_gem_device_attach,
> >  	.get_uuid = virtgpu_virtio_get_uuid,
> >  };
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
