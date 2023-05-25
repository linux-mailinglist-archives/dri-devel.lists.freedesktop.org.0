Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA07117EC
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120D10E757;
	Thu, 25 May 2023 20:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDAF10E755;
 Thu, 25 May 2023 20:14:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA19B6435F;
 Thu, 25 May 2023 20:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6894CC433D2;
 Thu, 25 May 2023 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685045682;
 bh=c9RYj0+T+0idw1Qy78csQBqrvbedfd4wjKYCGYBBYrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q1esTd0qvQJc7TabmbiYhEBwa0xNKAeKW7a84pfVHnWhu/iA29rxP1T9hxs59SbsX
 eUk+QNURpIP86mhVgJ4oEo0KOALxuVfwQjbVXuzv0VEILEnClglckuNPQlH4U89aQr
 KNRuq/zeefVuy3pkin9GdjC4JvGbRuPulhBLk+u25Xzfr7xveS4YsIgknyTVIHJjew
 EYr3l206f7r3O/V+3LaWNHJQfIX6j7CiMn4L3D/nrGJ3UDeWG9Qzw38YxudMhoF90W
 EMOPCgOC+stBd2u4eMe4LVwNqTNF6uH+2IuI2Lk1sZwoCsZ8aySOoW2/sOLKv0rK0z
 J+4mVPPhfua3A==
Date: Thu, 25 May 2023 13:14:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] drm/amdkfd: remove unused function
 get_reserved_sdma_queues_bitmap
Message-ID: <20230525201439.GA2741545@dev-arch.thelio-3990X>
References: <20230525200759.3214525-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525200759.3214525-1-trix@redhat.com>
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
Cc: llvm@lists.linux.dev, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 04:07:59PM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:122:24: error:
>   unused function 'get_reserved_sdma_queues_bitmap' [-Werror,-Wunused-function]
> static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
>                        ^
> This function is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Caused by commit 09a95a85cf3e ("drm/amdkfd: Update SDMA queue management
for GFX9.4.3") it seems.

You can actually go a step farther and remove the
reserved_sdma_queues_bitmap member from 'struct kfd_device_info' because
it is now only assigned, never read.

$ git grep reserved_sdma_queues_bitmap next-20230525
next:20230525:drivers/gpu/drm/amd/amdkfd/kfd_device.c:        kfd->device_info.reserved_sdma_queues_bitmap = 0xFULL;
next:20230525:drivers/gpu/drm/amd/amdkfd/kfd_device.c:        kfd->device_info.reserved_sdma_queues_bitmap = 0x3ULL;
next:20230525:drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
next:20230525:drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:    return dqm->dev->kfd->device_info.reserved_sdma_queues_bitmap;
next:20230525:drivers/gpu/drm/amd/amdkfd/kfd_priv.h:    uint64_t reserved_sdma_queues_bitmap;

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 493b4b66f180..2fbd0a96424f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -119,11 +119,6 @@ unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm)
>  		dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
>  }
>  
> -static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
> -{
> -	return dqm->dev->kfd->device_info.reserved_sdma_queues_bitmap;
> -}
> -
>  static void init_sdma_bitmaps(struct device_queue_manager *dqm)
>  {
>  	bitmap_zero(dqm->sdma_bitmap, KFD_MAX_SDMA_QUEUES);
> -- 
> 2.27.0
> 
