Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED0D39FA7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59E110E374;
	Mon, 19 Jan 2026 07:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OOYMTqRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8829610E370;
 Mon, 19 Jan 2026 07:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16355434B7;
 Mon, 19 Jan 2026 07:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F96C116C6;
 Mon, 19 Jan 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768807529;
 bh=Sy0oZJNxE3l4wUF1ShDJYtcIYRfebTgMszB/pVPpbG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOYMTqRrGNEs2jAmSYlM686r10g9BCiY0dH1nHfSd9wBLODRb8DM164wJPnvPjUZJ
 icgeXWdtQ7Oia1ErMzqcQuhf52/tfn7nc5Db0Pgu4mF4oKXHNz7EAU6VPQm5fLTGmH
 dpWD45Ghuyew+XIW6NcIv4QphDm7ZCu0u2N2glr45RlAuFFKTsiYSKNgep1eD0k+ze
 DGHBEAu/8vNU8SRkbYapnqC57ld4+aZRHd6cB3kj5nGczjtxNRKaQQAT7M5FarOcTS
 +AznVeitmh0vPl0biNbAXazx0fJsZPdtNy+ZzqhsViFUZFhUJS6vri3NJErSen8Aar
 zIN3x/bF6bUXQ==
Date: Mon, 19 Jan 2026 09:25:24 +0200
From: Leon Romanovsky <leon@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
Message-ID: <20260119072524.GD13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
 <d41d08e3-6a86-40a4-925c-6a3172670079@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d41d08e3-6a86-40a4-925c-6a3172670079@nvidia.com>
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

On Sun, Jan 18, 2026 at 01:40:11PM -0800, John Hubbard wrote:
> On 1/18/26 4:08 AM, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> ...
> > +/**
> > + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
> > + * revoke semantics.
> > + * @attach: the DMA-buf attachment to check
> > + *
> > + * Returns true if DMA-buf importer honors revoke semantics, which is
> > + * negotiated with the exporter, by making sure that importer implements
> > + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> > + * DMA-buf attach.
> > + */
> > +static inline bool
> > +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)
> 
> Maybe a slight rename, to dma_buf_attachment_is_revocable()?

I can do that. The issue is that even "dma_buf_attachment_is_revoke"
is already too long. :)

Thanks

> 
> 
> thanks,
> -- 
> John Hubbard
> 
