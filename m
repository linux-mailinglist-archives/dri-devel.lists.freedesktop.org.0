Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458D43A6BFF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6D66E02E;
	Mon, 14 Jun 2021 16:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id E1D5F89FCA;
 Mon, 14 Jun 2021 16:40:17 +0000 (UTC)
Received: from [192.168.0.2] (unknown [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 332C97A03FD;
 Mon, 14 Jun 2021 18:40:15 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: "Christian =?utf-8?q?K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix dma_address check for CPU/GPU sync
Date: Mon, 14 Jun 2021 18:40:12 +0200
User-Agent: KMail/1.9.10
References: <20210614110517.1624-1-christian.koenig@amd.com>
In-Reply-To: <20210614110517.1624-1-christian.koenig@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202106141840.12702.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 14 June 2021 13:05:17 Christian K=C3=B6nig wrote:
> AGP for example doesn't have a dma_address array.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

=46ixes NULL pointer dereference in nouveau_bo_sync_for_device on AGP cards.

Tested-by: Ondrej Zary <linux@zary.sk>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 3e09df0472ce..170aba99a110 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -546,7 +546,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
>  	struct ttm_tt *ttm_dma =3D (struct ttm_tt *)nvbo->bo.ttm;
>  	int i, j;
> =20
> -	if (!ttm_dma)
> +	if (!ttm_dma || !ttm_dma->dma_address)
>  		return;
>  	if (!ttm_dma->pages) {
>  		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
> @@ -582,7 +582,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
>  	struct ttm_tt *ttm_dma =3D (struct ttm_tt *)nvbo->bo.ttm;
>  	int i, j;
> =20
> -	if (!ttm_dma)
> +	if (!ttm_dma || !ttm_dma->dma_address)
>  		return;
>  	if (!ttm_dma->pages) {
>  		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);


=2D-=20
Ondrej Zary
