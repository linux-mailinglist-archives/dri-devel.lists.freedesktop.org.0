Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801461C98A2
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 20:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E660E6EA4B;
	Thu,  7 May 2020 18:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A4F6EA4A;
 Thu,  7 May 2020 18:03:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1307A80511;
 Thu,  7 May 2020 20:03:12 +0200 (CEST)
Date: Thu, 7 May 2020 20:03:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 06/36] drm/amdgpu: use the unlocked drm_gem_object_put
Message-ID: <20200507180310.GC13247@ravnborg.org>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-7-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-7-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=QX4gbG5DAAAA:8 a=zd2uoN0lAAAA:8 a=e5mUnYsNAAAA:8
 a=pGLkceISAAAA:8 a=SyXvwejEuiepUdTv1WYA:9 a=wPNLvfGTeEIA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Thu, May 07, 2020 at 04:07:52PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> =

> The driver does not hold struct_mutex, thus using the locked version of
> the helper is incorrect.
> =

> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Fixes: a39414716ca0 ("drm/amdgpu: add independent DMA-buf import v9"):
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 43d8ed7dbd00..652c57a3b847 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -587,7 +587,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct=
 drm_device *dev,
>  	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
>  					&amdgpu_dma_buf_attach_ops, obj);
>  	if (IS_ERR(attach)) {
> -		drm_gem_object_put(obj);
> +		drm_gem_object_put_unlocked(obj);
>  		return ERR_CAST(attach);
>  	}
Likewise previous patch.
Drop this as the patch is correct after the rename a few pathces later.

	Sam

>  =

> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
