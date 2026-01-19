Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DDFD3A70F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6C410E403;
	Mon, 19 Jan 2026 11:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HB+uACCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B34C10E3FE;
 Mon, 19 Jan 2026 11:39:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E20AF41AF1;
 Mon, 19 Jan 2026 11:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2908BC116C6;
 Mon, 19 Jan 2026 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768822782;
 bh=NZVnVMnc93yrNSPZAamiI0H9QvR3dmJkS6zLGXYAAfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HB+uACCj5ZPlkAOwL/R6IQDksq8pEEFe84iMPztm/VOhwikWTRV5wRfnLkfiphSKd
 Fh9TV5wfhgpwUNpbkpy+vbkZJjIZFVJWhod2TUgsjA2ejemZEB6RZYb4XQXGmuUMc0
 TQfFNqr0oqgyyJLNXdcQUq8hGlsjBPUNv/e3ME328S93ARoDrbNtNscbyrKe9C0jnU
 0PRJziOHH7RUfX49k7oDBWs2UYoxp1nPMgzHpFWedKrA3sZexH5IoENp8+WO64VAD/
 FeTeCCP7+lEv9QCL8ELtGGhjn/qc4YzwSE2GN/mcQ9pJ922fdr4yElH+ngNTdyxMxF
 ykLI1YdYm/dnA==
Date: Mon, 19 Jan 2026 13:39:38 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
Message-ID: <20260119113938.GL13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
 <9eba2527-a06e-4f74-a7d6-93f6f91e00e9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eba2527-a06e-4f74-a7d6-93f6f91e00e9@amd.com>
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

On Mon, Jan 19, 2026 at 11:56:16AM +0100, Christian König wrote:
> On 1/18/26 13:08, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Document a DMA-buf revoke mechanism that allows an exporter to explicitly
> > invalidate ("kill") a shared buffer after it has been handed out to
> > importers. Once revoked, all further CPU and device access is blocked, and
> > importers consistently observe failure.
> > 
> > This requires both importers and exporters to honor the revoke contract.
> > 
> > For importers, this means implementing .invalidate_mappings() and calling
> > dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s support
> > for revocation.
> > 
> > For exporters, this means implementing the .pin() callback, which checks
> > the DMA‑buf attachment for a valid revoke implementation.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  include/linux/dma-buf.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)

<...>

> > + * Returns true if DMA-buf importer honors revoke semantics, which is
> > + * negotiated with the exporter, by making sure that importer implements
> > + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> > + * DMA-buf attach.
> 
> That wording is to unclear. Something like:
> 
> Returns true if the DMA-buf importer can handle invalidating it's mappings at any time, even after pinning a buffer.

<...>

> 
> That's clearly not a good name. But that is already discussed in another thread.

<...>

> Oh, we should have renamed that as well. Or maybe it is time to completely remove that config option.

<...>

> This is checking exporter and not importer capabilities, please drop.

<...>

> So when invalidate_mappings is implemented we need to be able to call it at any time. Yeah that sounds like a valid approach to me.
> 
> But we need to remove the RDNA callback with the warning then to properly signal that. And also please document that in the callback kerneldoc.

Will do, thanks

> 
> Regards,
> Christian.
> 
> > +}
> > +
> >  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> >  					  struct device *dev);
> >  struct dma_buf_attachment *
> > 
> 
