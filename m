Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E669A6B8E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6910E097;
	Mon, 21 Oct 2024 14:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gtr8T9vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D09410E097
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729519608;
 bh=7K6A6Fu5na7P8WgzpchGQD4WMRlPtVyb2QGGuLhDjTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gtr8T9vyRw8l9sqvJvyvz1JNMlw1E3RnqF5G0ZyNbMRulfFCKutQ58GaNkG2dlUp6
 xO4qxzD11RUd7F+brKBnOLt9nrmJKGVUO6EDH/mNP2cpzm1citJXGESl+HK2eYDviC
 9Oe246UKrj9lXMux1prRw/TWk+vlBbmjO3NCxEDoTeIeSDSF274QY6s3ozrMtiQyzk
 JGdzbHju8/7Y4etQPNNOm7YbFtBE9+A87dx0OtdZpMWD8xkYrzUnBYQuHdJpyKai+Z
 1phMds1vakdz96wzwlcFLdpzOtJksN3hMpmxfhu2xYd3LdHxcjrqf4JiGASaNA098t
 sNChnKWMEN/ug==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AEC5917E361F;
 Mon, 21 Oct 2024 16:06:47 +0200 (CEST)
Date: Mon, 21 Oct 2024 16:06:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Simona
 Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] drm/panfrost: handle inexistent GPU during probe
Message-ID: <20241021160642.1dbeb772@collabora.com>
In-Reply-To: <20241014233758.994861-2-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-2-adrian.larumbe@collabora.com>
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

On Tue, 15 Oct 2024 00:31:37 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Just in case we're dealing with a yet not recognised device.

While I can see how problematic it would be if we expose a GPU that
requires kernel quirks we don't know about, I suspect the original
authors had a good reason to allow probing of unknown GPUs (ease of GPU
bringup), so I'll defer that one to Steve and Rob.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index 5a33919fa213..495621324de1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -237,9 +237,10 @@ static const struct panfrost_model gpu_models[] =3D {
>  	 */
>  	GPU_MODEL(g57, 0x9003,
>  		GPU_REV(g57, 0, 0)),
> +	{0},
>  };
> =20
> -static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
> +static int panfrost_gpu_init_features(struct panfrost_device *pfdev)
>  {
>  	u32 gpu_id, num_js, major, minor, status, rev;
>  	const char *name =3D "unknown";
> @@ -324,6 +325,12 @@ static void panfrost_gpu_init_features(struct panfro=
st_device *pfdev)
>  		break;
>  	}
> =20
> +	if (!model->name) {
> +		dev_err(pfdev->base.dev, "GPU model not found: mali-%s id rev %#x %#x\=
n",
> +			name, gpu_id, rev);
> +		return -ENODEV;
> +	}
> +
>  	bitmap_from_u64(pfdev->features.hw_features, hw_feat);
>  	bitmap_from_u64(pfdev->features.hw_issues, hw_issues);
> =20
> @@ -344,6 +351,8 @@ static void panfrost_gpu_init_features(struct panfros=
t_device *pfdev)
> =20
>  	dev_info(pfdev->base.dev, "shader_present=3D0x%0llx l2_present=3D0x%0ll=
x",
>  		 pfdev->features.shader_present, pfdev->features.l2_present);
> +
> +	return 0;
>  }
> =20
>  void panfrost_cycle_counter_get(struct panfrost_device *pfdev)
> @@ -486,7 +495,9 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  	if (err)
>  		return err;
> =20
> -	panfrost_gpu_init_features(pfdev);
> +	err =3D panfrost_gpu_init_features(pfdev);
> +	if (err)
> +		return err;
> =20
>  	err =3D dma_set_mask_and_coherent(pfdev->base.dev,
>  					DMA_BIT_MASK(FIELD_GET(0xff00,

