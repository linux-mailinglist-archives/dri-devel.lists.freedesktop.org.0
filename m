Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F81A48223
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 15:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7B810EB10;
	Thu, 27 Feb 2025 14:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lAnbFDsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185E110EB10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740668145;
 bh=4dno5vBh22aYtl3Z9Df8BPGW9j1ybKlDStdsMmYD354=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lAnbFDsGga/v+vxybKW7lz/QeoHTd54aTEz9fqdEQwnIM1461iwno0TJOh/RrykQ7
 VYw9CKWJaE27YAvwRLpU7YLj05j7PI+iT5ZcgWockyQo0eXPhN71SlRBUWJak9wYSg
 XNgCElnd1DU1tjO1G57LyX1nxj7NBiJxKaw+yZNGt6GKahACQpOdxy+sJl6fcnuFqu
 LagcITCtXVGsmSlZyFwhIdSUyhrz68Tuqi5qhphqQnt9Rm1BRlpo3ghcOLV1PD0xp+
 5mNsVdMS+I/ZyFpx43axToP/0D/qB4ptqdil39hXS7z3/fjL6dJ+IlJqccco1jjKYz
 joD63awNO4ILw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BCCD17E09E7;
 Thu, 27 Feb 2025 15:55:44 +0100 (CET)
Date: Thu, 27 Feb 2025 15:55:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
Message-ID: <20250227155539.59944e18@collabora.com>
In-Reply-To: <20250226183043.140773-4-ariel.dalessandro@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-4-ariel.dalessandro@collabora.com>
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

On Wed, 26 Feb 2025 15:30:42 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> @@ -642,8 +713,15 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>  		.iommu_dev	= pfdev->dev,
>  	};
>  
> -	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
> -					      mmu);
> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
> +		fmt = ARM_64_LPAE_S1;
> +		mmu->enable = mmu_lpae_s1_enable;
> +	} else {
> +		fmt = ARM_MALI_LPAE;
> +		mmu->enable = mmu_mali_lpae_enable;
> +	}

How about we stick to the legacy pgtable format for all currently
supported GPUs, and make this an opt-in property attached to the
compatible. This way, we can progressively move away from the legacy
format once enough testing has been done, while allowing support for
GPUs that can't use the old format because the cachability/shareability
configuration is too limited.
