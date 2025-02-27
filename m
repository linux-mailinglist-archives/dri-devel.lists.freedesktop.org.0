Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DEA4779C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 09:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347BA10E142;
	Thu, 27 Feb 2025 08:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VrHzvZqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24B610E142
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740644465;
 bh=tKJ+yth8ev19KlGJZ3+pzqr1l9cZRFzf8DLc14xlgJA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VrHzvZqpiKxDs8wkCmp53jU7ntvOlrol9fnucm/GnSGSZwdJmccY8Ml+ltBwnKmSE
 fiQx918TruV7AWqfiiODKtaten/2SVvmqnto8lBZkGLSqqdcBPbHTc/acuVu+mqj58
 PqMvaWUSBkqusWqwlwiLYgTvRoT9n0/Rd2sm+YB865Xey7mP7AwBpmB29KeUIb2f/L
 DU/OTmgJmnXt0RfxqA10y8g9Gq+4GmsSGOLi3tFvyJFfZIhphUI27j5R99eG+O39vQ
 Y/ISAV38gxFCqKfFJj7wT7WembEaetVaHk8qrBgDN2D1PtUTm19alNuxNwh8t/PgZH
 efJ9WSLlNlzPw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BDAFE17E0605;
 Thu, 27 Feb 2025 09:21:04 +0100 (CET)
Date: Thu, 27 Feb 2025 09:21:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [RFC PATCH 1/4] drm/panfrost: Use
 GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
Message-ID: <20250227092100.7e9dfca1@collabora.com>
In-Reply-To: <20250226183043.140773-2-ariel.dalessandro@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-2-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Feb 2025 15:30:40 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> As done in panthor, define and use these GPU_MMU_FEATURES_* macros,
> which makes code easier to read and reuse.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c  | 6 ++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index b91019cd5acb..7df2c8d5b0ae 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -615,6 +615,8 @@ static void panfrost_drm_mm_color_adjust(const struct drm_mm_node *node,
>  
>  struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>  {
> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
> +	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
>  	struct panfrost_mmu *mmu;
>  
>  	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
> @@ -633,8 +635,8 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>  
>  	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= SZ_4K | SZ_2M,
> -		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
> -		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
> +		.ias		= va_bits,
> +		.oas		= pa_bits,
>  		.coherent_walk	= pfdev->coherent,
>  		.tlb		= &mmu_tlb_ops,
>  		.iommu_dev	= pfdev->dev,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index c7bba476ab3f..b5f279a19a08 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -16,6 +16,8 @@
>  #define   GROUPS_L2_COHERENT		BIT(0)	/* Cores groups are l2 coherent */
>  
>  #define GPU_MMU_FEATURES		0x014	/* (RO) MMU features */
> +#define  GPU_MMU_FEATURES_VA_BITS(x)	((x) & GENMASK(7, 0))
> +#define  GPU_MMU_FEATURES_PA_BITS(x)	(((x) >> 8) & GENMASK(7, 0))
>  #define GPU_AS_PRESENT			0x018	/* (RO) Address space slots present */
>  #define GPU_JS_PRESENT			0x01C	/* (RO) Job slots present */
>  

