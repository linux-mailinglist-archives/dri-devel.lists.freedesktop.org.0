Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC8A5A3BF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 20:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F3410E43F;
	Mon, 10 Mar 2025 19:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W9chesfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446C110E4C5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741634749;
 bh=TkqqFuqokwTuvmnu4mxz6BLe3AvgN5TGoGvCmIiu2u0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W9chesfJLumK5PSLlfDprJiWEPiydyLPBC6wW9aQJopJ6eSrqIAN5EkZx51VYZpw7
 DCn++x4ELDzLYJaFfeqTovaerYYv2IeH5VnyMoVbeeX49PaOKTksHHqIrWBEEP8+p3
 gdrB0eIlClIyKRoDLbMNoWdrKe+B72J/OjJMAiOKAM6t+U9M9OBqP3A9b6TRcUmmlR
 WyYQMFjjgGZaFIrld7pcocFmGAWJ0lb1X3m4o0DUjNwjg+6QrTGtDchvKQejfw83L/
 vRhwE6J8TOquv+4oLzXH+m6gv4dm42x48w18ypuJlY06a2BWDu6wXhmP7VNNwjJjuA
 3fUMMeMkrVz+Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F2BF17E0B12;
 Mon, 10 Mar 2025 20:25:49 +0100 (CET)
Date: Mon, 10 Mar 2025 20:25:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
Message-ID: <20250310202543.404e21c0@collabora.com>
In-Reply-To: <ec151d39-2cb2-4f67-a23a-dafc421fff75@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-4-ariel.dalessandro@collabora.com>
 <20250227155539.59944e18@collabora.com>
 <ec151d39-2cb2-4f67-a23a-dafc421fff75@collabora.com>
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

On Mon, 10 Mar 2025 12:34:30 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Hi Boris,
> 
> On 2/27/25 11:55 AM, Boris Brezillon wrote:
> > On Wed, 26 Feb 2025 15:30:42 -0300
> > Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> >   
> >> @@ -642,8 +713,15 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
> >>   		.iommu_dev	= pfdev->dev,
> >>   	};
> >>   
> >> -	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
> >> -					      mmu);
> >> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
> >> +		fmt = ARM_64_LPAE_S1;
> >> +		mmu->enable = mmu_lpae_s1_enable;
> >> +	} else {
> >> +		fmt = ARM_MALI_LPAE;
> >> +		mmu->enable = mmu_mali_lpae_enable;
> >> +	}  
> > 
> > How about we stick to the legacy pgtable format for all currently
> > supported GPUs, and make this an opt-in property attached to the
> > compatible. This way, we can progressively move away from the legacy
> > format once enough testing has been done, while allowing support for
> > GPUs that can't use the old format because the cachability/shareability
> > configuration is too limited.  
> 
> Indeed, that's a better way to go.
> 
> Specifically, what you mean is: keep the same compatible string and add 
> a new property to the `panfrost_compatible` private data for that 
> specific variant?

Exactly.
