Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B28CBBFA
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 09:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C7810E0BD;
	Wed, 22 May 2024 07:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DA26IKb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900A210E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:28:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5238a0486baso732327e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716362899; x=1716967699; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sk8R6mXr0e8+2F9OipaEL/2bw6UL0WENKLWtD/XIQKM=;
 b=DA26IKb3xeQ48REv0Ffai+09r1/uETHpum/DLMFfzp+ji4CxPaBBCsKi8hTL5r9QL5
 p++0uzrtYDfLajFJavNQfjs4SafWWQBxaJpZOWpnJQvb1izWLJw7avCyXI6HVj7/Q+rp
 ZIFZbQgotDAyKGedYY0t2mpuxScboyecNK/j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716362899; x=1716967699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sk8R6mXr0e8+2F9OipaEL/2bw6UL0WENKLWtD/XIQKM=;
 b=lQX/Lm6Ie7FbR3YKtqIgcMa5HAYA5o5NmU1VHT9VEh8c+YFPhqxI/6lCtrOcGH8S4Z
 B/ax13QKpnoMsQnDwSCRl1dBXswhBl99jbrd1gwGXXpS/ujqUmd6FDTDdqZUIJKbE10R
 IMRIHUXZXv0TIH8unxfER33kf+fz3euMC/MNXY8FRtOKOsfLykfXQEukXkvY2/S503oa
 GFrAT4cc8PVpq7Sw7eY6LT9czyBXTlyL8i39fvqSK8ax/DFq55Y+LDTBYxa64Kn/tq4N
 jSZybC8ss+n8ecSTGqKSF5fp4rrq/p9S2qL7zvD4NJqDXtbJexDsqy9d9l0tYvcNsM8T
 u2tg==
X-Gm-Message-State: AOJu0YxEbBksYUNH01dx9c5gSF1IBDDBJLQyGC/mMAn7Lkz9soAJ9xqI
 DNv+C5MeMlh9H9qGwd/y+7IugKw87A8wz5yU0E+zMEH9tATkSdecMDPB99gWU90=
X-Google-Smtp-Source: AGHT+IEmo5uZOGKhEbeH1p9Uh6HksfUOBw+XyW/1tlkb5tPg23SqZBCYcLXUJNsvIgNxg/rgaIXrAQ==
X-Received: by 2002:a2e:7211:0:b0:2da:320a:6739 with SMTP id
 38308e7fff4ca-2e949558c8emr5770701fa.1.1716362899125; 
 Wed, 22 May 2024 00:28:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe36f373fsm466451025e9.20.2024.05.22.00.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:28:18 -0700 (PDT)
Date: Wed, 22 May 2024 09:28:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC 4/7] drm/virtio: Import prime buffers from other devices as
 guest blobs
Message-ID: <Zk2ekN44RteKMs4Y@phenom.ffwll.local>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
 <20240328083615.2662516-5-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328083615.2662516-5-vivek.kasireddy@intel.com>
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

On Thu, Mar 28, 2024 at 01:32:57AM -0700, Vivek Kasireddy wrote:
> By importing scanout buffers from other devices, we should be able
> to use the virtio-gpu driver in KMS only mode. Note that we attach
> dynamically and register a move_notify() callback so that we can
> let the VMM know of any location changes associated with the backing
> store of the imported object by sending detach_backing cmd.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 54 +++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 1e87dbc9a897..c65dacc1b2b5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -255,10 +255,36 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
>  	return ret;
>  }
>  
> +static const struct drm_gem_object_funcs virtgpu_gem_dma_buf_funcs = {
> +	.free = virtgpu_dma_buf_free_obj,
> +};
> +
> +static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj = attach->importer_priv;
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +
> +	if (bo->created) {
> +		virtio_gpu_cmd_resource_detach_backing(vgdev,
> +						       bo->hw_res_handle);
> +		bo->has_backing = false;
> +	}
> +}
> +
> +static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops = {
> +	.allow_peer2peer = true,
> +	.move_notify = virtgpu_dma_buf_move_notify
> +};
> +
>  struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  						struct dma_buf *buf)
>  {
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct dma_buf_attachment *attach;
> +	struct virtio_gpu_object *bo;
>  	struct drm_gem_object *obj;
> +	int ret;
>  
>  	if (buf->ops == &virtgpu_dmabuf_ops.ops) {
>  		obj = buf->priv;
> @@ -272,7 +298,32 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  		}
>  	}
>  
> -	return drm_gem_prime_import(dev, buf);

I think overall this (entire series) makes sense, but needs someone with
overall virtio understanding to make sure it all fits correctly. Just a
refactor thought here: I think instead of open-coding should we have a
drm_gem_prime_dynamic_import?

Similar in another patch for the dma_buf_pin, should that be also in the
gem helpers to automatically forward to dma_buf if it's imported?

Cheers, Sima

> +	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> +		return drm_gem_prime_import(dev, buf);
> +
> +	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
> +	if (!bo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj = &bo->base.base;
> +	obj->funcs = &virtgpu_gem_dma_buf_funcs;
> +	drm_gem_private_object_init(dev, obj, buf->size);
> +
> +	attach = dma_buf_dynamic_attach(buf, dev->dev,
> +					&virtgpu_dma_buf_attach_ops, obj);
> +	if (IS_ERR(attach)) {
> +		kfree(bo);
> +		return ERR_CAST(attach);
> +	}
> +
> +	obj->import_attach = attach;
> +	get_dma_buf(buf);
> +
> +	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	return obj;
>  }
>  
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
> @@ -281,3 +332,4 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> +
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
