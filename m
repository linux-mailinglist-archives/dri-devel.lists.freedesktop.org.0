Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5EED3A0EC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8938510E38C;
	Mon, 19 Jan 2026 08:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BDgV12G7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805AF10E173;
 Mon, 19 Jan 2026 08:04:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2E816014E;
 Mon, 19 Jan 2026 08:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7CAC116C6;
 Mon, 19 Jan 2026 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768809850;
 bh=HRBEt4RF/jLlwOJnYEYMNWDtdCxSUN5YasBH6jxxKIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BDgV12G7l5a1sp8yv1MAiOTY/L1jkmyTQZGAh3jpU9VjkGMv9/T3jgHh2lE5LuXTK
 Q0XiE0/v6mTCIL++UG0OUkE3zwpNkiDWjOwRxhFFIi2wh+H4hSil6YHS5SELsgqCDn
 WeDdVnUzfPkFP37afqzkaFH2kBs5cZ3OkLmqvQ8WC6xPHnyiZoM6tCbAr4Rpggc7r2
 +twjbWsZJSrJk1zeM7aeq7DGnmBtEQc4wcipZGljnLygNxxBENIhR7XiKP9tHHgxTC
 bG2/CJQU8uA+pwflgnBuItu8+MXhQXRs68HQNRr/vZQQeXMAP3G3vwl+sklL/3KSsp
 iWYoOtPON0K+w==
Date: Mon, 19 Jan 2026 10:04:04 +0200
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
Message-ID: <20260119080404.GF13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
 <d41d08e3-6a86-40a4-925c-6a3172670079@nvidia.com>
 <20260119072524.GD13201@unreal>
 <3380a80a-7574-4dbf-87cb-0735fb20cd15@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3380a80a-7574-4dbf-87cb-0735fb20cd15@nvidia.com>
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

On Sun, Jan 18, 2026 at 11:32:20PM -0800, John Hubbard wrote:
> On 1/18/26 11:25 PM, Leon Romanovsky wrote:
> > On Sun, Jan 18, 2026 at 01:40:11PM -0800, John Hubbard wrote:
> > > On 1/18/26 4:08 AM, Leon Romanovsky wrote:
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > ...
> > > > +/**
> > > > + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
> > > > + * revoke semantics.
> > > > + * @attach: the DMA-buf attachment to check
> > > > + *
> > > > + * Returns true if DMA-buf importer honors revoke semantics, which is
> > > > + * negotiated with the exporter, by making sure that importer implements
> > > > + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> > > > + * DMA-buf attach.
> > > > + */
> > > > +static inline bool
> > > > +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)
> > > 
> > > Maybe a slight rename, to dma_buf_attachment_is_revocable()?
> > 
> > I can do that. The issue is that even "dma_buf_attachment_is_revoke"
> > is already too long. :)
> > 
> 
> If you're really pressed for space for some reason,

Mainly aesthetics.

> maybe dma_buf_attach_revocable() ?
> 
> Just trying to hang on to the "revocable" part of the name, as
> I think it's an improvement.

Sure

> 
> thanks,
> -- 
> John Hubbard
> 
> 
