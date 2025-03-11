Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166BA5BA3A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512610E51D;
	Tue, 11 Mar 2025 07:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RC5XNDhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA3410E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741679553;
 bh=EimAiqOb8wjiUPBJICf8ehV1iDRon72lxCFcAtQyG1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RC5XNDhswZec48hvGwJO3Ne0/FLgT7vITlZQ0t2ppxFhr8b6Yinjer64D49aJuXVm
 fb9xWd3Gx9HrmuCr1BCZpoc4Ys4/wHamUXeX56j75E+9niet0Ku/ZEjbQwrIME+QYy
 WbzAXLVyPRvs4dFaPXa+azYplQUMs8IMaY/r9XlLbb2iLnIlMo21YzuQH4cV4kGg+j
 RnMiqz2lA5/i5lJfPYa7YhSyD/+RDtCEmSHM9r+ekNcwNvkNux4Dt9hBoEsUuEL9qP
 aq17fyGgqimLjGUfkXGm3OjulnGBOaImG4LYUH4Gm3JXD+EjbgQXQ/ThqNupvPZlHR
 qd+uYu7o8NyiA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A8B5817E0237;
 Tue, 11 Mar 2025 08:52:32 +0100 (CET)
Date: Tue, 11 Mar 2025 08:51:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 3/6] drm/panfrost: Unify panfrost_mmu_enable/disable
 common code
Message-ID: <20250311085158.37329b0c@collabora.com>
In-Reply-To: <20250310195921.157511-4-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-4-ariel.dalessandro@collabora.com>
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

On Mon, 10 Mar 2025 16:59:18 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Both these functions write to MMU_AS_CONTROL register in the same way.
> Define a common _panfrost_mmu_as_control_write function with the shared
> code.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 33 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 294f86b3c25e7..31df3a96f89bd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -121,38 +121,37 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
>  	return ret;
>  }
>  
> -static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
> +static void
> +_panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
> +			       u64 transtab, u64 memattr)

I'm honestly not convinced this is needed. Let's just stick to
panfrost_mmu_enable/disable().

>  {
> -	int as_nr = mmu->as;
> -	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
> -	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
> -	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
> -
>  	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
>  
>  	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
>  	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
>  
> -	/* Need to revisit mem attrs.
> -	 * NC is the default, Mali driver is inner WT.
> -	 */
>  	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
>  	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>  
>  	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
>  }
>  
> -static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
> +static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>  {
> -	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
> -
> -	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), 0);
> -	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), 0);
> +	int as_nr = mmu->as;
> +	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
> +	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
> +	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
>  
> -	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), 0);
> -	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), 0);
> +	/* Need to revisit mem attrs.
> +	 * NC is the default, Mali driver is inner WT.
> +	 */
> +	_panfrost_mmu_as_control_write(pfdev, as_nr, transtab, memattr);
> +}
>  
> -	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
> +static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
> +{
> +	_panfrost_mmu_as_control_write(pfdev, as_nr, 0, 0);
>  }
>  
>  u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)

