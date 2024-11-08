Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E919C1FBE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE8410E9D8;
	Fri,  8 Nov 2024 14:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U48qMfjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2435410E9D8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731077691;
 bh=hvdnxx7510WB1Ax8FW2KrR2RqT/sPNnzIt6wzabe7YY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U48qMfjzMtEUd4GRANr10HemJrLqVHlKwPLz6L48RfmbyVb2u1eqrxCP8Oot8gAE7
 7RFLxXXHnMVpzkItIZLWnv+RZVCOBg6n5aa++x2Vwz/NGQo7JxJFDwi3sZ4clcJ7en
 dqydlPg9lTZvJ2si9B+wp7FoyFNIeET6NteG8XjI5Z/ZV+Ud2iA5GZ1ljWlB3ZwTbc
 LZ6bxNeAHxXYLXkeLCp2OJgIVBVi/RUXHcfngUF33aAS2FGMaS7xzPkFwl+ouGJlRT
 Qpsa7aToej9vAFfwGcBgjiHDhTQaLrzBoqn5obsJYcW4vQSnjgCVyoq4G3uiLEWsDa
 3Fbe+Q80XoBqA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D4A6A17E36A0;
 Fri,  8 Nov 2024 15:54:50 +0100 (CET)
Date: Fri, 8 Nov 2024 15:54:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: olvaffe@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lionel.g.landwerlin@intel.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 simona@ffwll.ch
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled
Message-ID: <20241108155444.3b5c3e52@collabora.com>
In-Reply-To: <20241108094256.3717-2-christian.koenig@amd.com>
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <20241108094256.3717-2-christian.koenig@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri,  8 Nov 2024 10:42:56 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> The function silently assumed that signaling was already enabled for the
> dma_fence_array. This meant that without enabling signaling first we would
> never see forward progress.
>=20
> Fix that by falling back to testing each individual fence when signaling
> isn't enabled yet.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fenc=
e-array.c
> index 46ac42bcfac0..01203796827a 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -103,10 +103,22 @@ static bool dma_fence_array_enable_signaling(struct=
 dma_fence *fence)
>  static bool dma_fence_array_signaled(struct dma_fence *fence)
>  {
>  	struct dma_fence_array *array =3D to_dma_fence_array(fence);
> +	unsigned int i, num_pending;
> =20
> -	if (atomic_read(&array->num_pending) > 0)
> +	num_pending =3D atomic_read(&array->num_pending);
> +	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
> +		if (!num_pending)
> +			goto signal;
>  		return false;
> +	}
> +
> +	for (i =3D 0; i < array->num_fences; ++i) {
> +		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
> +			goto signal;
> +	}
> +	return false;
> =20
> +signal:
>  	dma_fence_array_clear_pending_error(array);
>  	return true;
>  }

It would be good to have comments explaining what happens here. I think
I figured it out, but it's far from obvious:

- we need to read array->num_pending before checking the enable_signal
  bit to avoid racing with the enable_signaling() implementation,
  which might decrement the counter, and cause a partial check.
- the !--num_pending is here to account for the any_signaled case
- if we race with enable_signaling(), that means the !num_pending
  check in the is_signalling_enabled branch might be outdated
  (num_pending might have been decremented), but that's fine. The user
  will get the right value when testing again later

With this explained in comments, the patch is

`Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>`
