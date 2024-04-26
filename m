Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCA8B3110
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 09:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FEB11221D;
	Fri, 26 Apr 2024 07:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CthZ7T6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDBE10E611
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 06:07:44 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6ed04c91c46so1746623b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 23:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714111664; x=1714716464; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zG42sd0qdVLa8JU34BNLB3kozY134d6okuOQvDkvPd0=;
 b=CthZ7T6EiKopkL4HuFPUCSjRDvfRQYpVWAtoBZSG1qDdF2RjAMsaaWkojVmLhjzVL9
 h8/G6n3uc2NaubXaN5wniSFwGWSKj1fPUQma+qcfmOxP61egiEbqy0AiCfo2Nu4wMfMS
 9QSRE4Ixz4gfTkYN/KCyu+82gGAIqfsOsFf6GG27CN07nzrYlXtZAU5T6PDrJOiBSf65
 SVYFnd2A/xylQrP8cxTK2ApLg3iOGbdNhGjo0VfvnCXeTDOLB9+WZF4bSf7XaYQeZDII
 Cyo4msssAvyY8U81ReWjWRE8BGBGMzMzF2T/xcC/ClDEbFWqODHq69mvio4mLKTYS2GQ
 uk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714111664; x=1714716464;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zG42sd0qdVLa8JU34BNLB3kozY134d6okuOQvDkvPd0=;
 b=eyQUnE7G/3hmxSxWq+S2rgBY+f871os5qmnUVgA8f/kT/c1TpToYlOkehyt1V2bnql
 m6IPf1+i3Yn0l/AhIUTGno+MH9xxpRDCFX6X0CnhEZ/XHkehW7GNjz533lBVCxLm9vrG
 N2Ir8qAYtK+iGG4PZKLJUvMDsRc2Xv+8wbRf4Ex28fGR8ox8dkUbvDAMe2L0wiGOJJTk
 GeQpwrGtwgrKBOHmebASH4JyqZM1dpJf63en25H9X7c2Ka4a+bPb2dhcQlpW3vdBZtjK
 zcq6tce29PWlyZIBh0gCqSKG/5gVaLfV7+N1X4jRvNpJG3aW9vyZ2M2wLyk/GNiOxKWW
 qBGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS8Xc9m+pATTEhWLYXstNsAATtJ1Aq8T/zQCAVLVlHtoz5HmtTxY3A3LeizqQeq+MQ+NI3Enbs/8TDxjZi8kcVXedCRYCfbFGykog4Fxef
X-Gm-Message-State: AOJu0YzjVioQtUTvhFJALXepfYlaSXV9VZ3X3yDcuXnV+hQ1xarcpAqk
 sAxTxPwAwVZKCLnDPqt4HOs8Wn9MQD4a/qn+uLdnsS1SsvsogMzt
X-Google-Smtp-Source: AGHT+IGOSK4MpklweTxxvklcwSYbnlF6Rp74+CmSFIyLObuHPsPdfim37L6bFINjXb0LUvy5V8Quqw==
X-Received: by 2002:a05:6a21:272f:b0:1a9:5b1d:6584 with SMTP id
 rm47-20020a056a21272f00b001a95b1d6584mr2029627pzb.32.1714111664108; 
 Thu, 25 Apr 2024 23:07:44 -0700 (PDT)
Received: from liuweife-desk1.sh.intel.com ([192.55.54.48])
 by smtp.gmail.com with ESMTPSA id
 hi2-20020a17090b30c200b002a22ddac1a1sm13965021pjb.24.2024.04.25.23.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 23:07:43 -0700 (PDT)
Message-ID: <710598cf274e83dda29acb68bff1b85a7f0352b2.camel@gmail.com>
Subject: Re: [RFC 5/7] drm/virtio: Ensure that bo's backing store is valid
 while updating plane
From: Weifeng Liu <weifeng.liu.z@gmail.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 26 Apr 2024 14:06:06 +0800
In-Reply-To: <20240328083615.2662516-6-vivek.kasireddy@intel.com>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
 <20240328083615.2662516-6-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1+b1 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Apr 2024 07:09:29 +0000
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

On Thu, 2024-03-28 at 01:32 -0700, Vivek Kasireddy wrote:
> To make sure that the imported bo's backing store is valid, we first
> pin the associated dmabuf, import the sgt if need be and then unpin
> it after the update is complete. Note that we pin/unpin the dmabuf
> even when the backing store is valid to ensure that it does not move
> when the host update (resource_flush) is in progress.
>=20
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 56 +++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/vir=
tio/virtgpu_plane.c
> index a72a2dbda031..3ccf88f9addc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <linux/virtio_dma_buf.h>
> =20
>  #include "virtgpu_drv.h"
> =20
> @@ -131,6 +132,45 @@ static void virtio_gpu_update_dumb_bo(struct virtio_=
gpu_device *vgdev,
>  					   objs, NULL);
>  }
> =20
> +static bool virtio_gpu_update_dmabuf_bo(struct virtio_gpu_device *vgdev,
> +					struct drm_gem_object *obj)
> +{
> +	struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(obj);
> +	struct dma_buf_attachment *attach =3D obj->import_attach;
> +	struct dma_resv *resv =3D attach->dmabuf->resv;
> +	struct virtio_gpu_mem_entry *ents =3D NULL;
> +	unsigned int nents;
> +	int ret;
> +
> +	dma_resv_lock(resv, NULL);
> +
> +	ret =3D dma_buf_pin(attach);
> +	if (ret) {
> +		dma_resv_unlock(resv);
> +		return false;
> +	}
> +
> +	if (!bo->has_backing) {
> +		if (bo->sgt)
> +			dma_buf_unmap_attachment(attach,
> +						 bo->sgt,
> +						 DMA_BIDIRECTIONAL);
> +
> +		ret =3D virtgpu_dma_buf_import_sgt(&ents, &nents,
> +						 bo, attach);
> +		if (ret)
> +			goto err_import;
> +
> +		virtio_gpu_object_attach(vgdev, bo, ents, nents);
> +	}
> +	return true;
> +
> +err_import:
> +	dma_buf_unpin(attach);
> +	dma_resv_unlock(resv);
> +	return false;
> +}
> +
>  static void virtio_gpu_resource_flush(struct drm_plane *plane,
>  				      uint32_t x, uint32_t y,
>  				      uint32_t width, uint32_t height)
> @@ -174,7 +214,9 @@ static void virtio_gpu_primary_plane_update(struct dr=
m_plane *plane,
>  	struct virtio_gpu_device *vgdev =3D dev->dev_private;
>  	struct virtio_gpu_output *output =3D NULL;
>  	struct virtio_gpu_object *bo;
> +	struct drm_gem_object *obj;
>  	struct drm_rect rect;
> +	bool updated =3D false;
> =20
>  	if (plane->state->crtc)
>  		output =3D drm_crtc_to_virtio_gpu_output(plane->state->crtc);
> @@ -196,10 +238,17 @@ static void virtio_gpu_primary_plane_update(struct =
drm_plane *plane,
>  	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
>  		return;
> =20
> -	bo =3D gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> +	obj =3D plane->state->fb->obj[0];
> +	bo =3D gem_to_virtio_gpu_obj(obj);
>  	if (bo->dumb)
>  		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
> =20
> +	if (obj->import_attach) {
> +		updated =3D virtio_gpu_update_dmabuf_bo(vgdev, obj);
Hi Vivek,

It's possible that the objects imported from other devices are used in
other ways apart from being scanned out (e.g., they might act as
texture resources in 3D contexts in the virtio-GPU back-end).  Thus I
think we should find a better way of updating DMA-BUF objects, like
doing so in move_notify callback.

BTW, this patch set is very useful in implementing virtual display for
the case of SR-IOV, especially it supports sharing device local memory
between host and guest.  Thanks for your work and I am really hoping it
gets merged one day!

Best regards,
-Weifeng
> +		if (!updated)
> +			return;
> +	}
> +
>  	if (plane->state->fb !=3D old_state->fb ||
>  	    plane->state->src_w !=3D old_state->src_w ||
>  	    plane->state->src_h !=3D old_state->src_h ||
> @@ -239,6 +288,11 @@ static void virtio_gpu_primary_plane_update(struct d=
rm_plane *plane,
>  				  rect.y1,
>  				  rect.x2 - rect.x1,
>  				  rect.y2 - rect.y1);
> +
> +	if (obj->import_attach && updated) {
> +		dma_buf_unpin(obj->import_attach);
> +		dma_resv_unlock(obj->import_attach->dmabuf->resv);
> +	}
>  }
> =20
>  static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,

