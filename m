Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18552D3B7B8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 20:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B165510E4F9;
	Mon, 19 Jan 2026 19:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="KorBXypz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05510E4FA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 19:54:47 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-8c537b9fcbfso472547385a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768852487; x=1769457287; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zwZ9o3ha19w1BUlcGeJzNZvsy/mlKSz+FRMjn04+Z/c=;
 b=KorBXypzD3nbVZgfSZP8sNab84oJ0qKD60XopeM+b4lUdHii4ysPHmRwNeX0rpUj8T
 FcIgK9wjimWY0BCCTgACe0o5H4I9m7jrbWfeL3ThXa0R+PZtX//2+7Ujjf+qj+ZBHGnq
 g+4FWHWu32S440psZT1uXQCEFjfIp9IJeU8aFZUtYYj9+BiADM52AYctMLQcbiA2EAtI
 QUScZm6g7SGnNCrbWHHGvcPr1PwDFaBdfGnSVJeJwSd8MHycLhLPpKByrkzRkx/H1fnK
 MCzGAPAy/CE9RTPWpvUKJj/YPjpm5I/sJfRWj05xefZgDI26oxh75PAqdoRb4WuVpb8N
 Oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768852487; x=1769457287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zwZ9o3ha19w1BUlcGeJzNZvsy/mlKSz+FRMjn04+Z/c=;
 b=oQBMoCkOUr0MlH4tL6FYcgcaEEc43hGGwWgU5VJlh4yuHLdMcH+RO8oX+3G6Q1yJ68
 P9Z62hWRtMx5ttSqKkDysBmB5dCbynh4C1SUSpN/D06We1ml4E+T0/G8HNhXt0ZYKWMS
 pIehPU12GlQp8zHw/ofocqsCwWcKTIr34PTff6LfPurzW+EaFI3610+NbsGQDQsANFmB
 BxxdERyR/yHoMXZUMghFmB0BhRhVIkMn4aul++owZ7ExGNoNclR3mlDY9h6hyIlvhEKB
 UW4IEEAfHOevnn0cCn/4speZ4KfqQRQatOu4kOq/FR6YHQqaim+iSkhkVTUa4NlELAOF
 AzlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa/Nbw8rOWg+JPdfbEMGZRqpM6J3gDPWFoPcZMtD3GjXqfZAyaxE1+H8Dzn3Ho7O9FM8vJfpPOwJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw4jEOOTUvodvyUjcI2lprBmngWvD6HpCcxEPCbjFBTC7Ty7DM
 5tiphLt5WBDn6AbZzOw6Rh7WOn/X+tIuDcxNhcM3v9mkU5SB3/E0fJcoDVC+AM2wk+c=
X-Gm-Gg: AY/fxX4AyWrQVsznGfJPo+J2DS7AN6OxndcPWawaMQu9mP0Ur674QBhmyQ6baEcrYK2
 n9mGlGnuA/AIp9ZwCLE1b0PaSAsLALTRFs1Nbx2MrKnFAYoVuEYN0Z582omesRyAFkKACobwxd9
 E134OzswaG85qc7pa1QeGP3BAlRAP1twjIzjKOza/4dYm4SMkRdwy81W71v7Sf4KUlaOQBjBC1/
 eecXOUo/vAAg1fzjxEprY0BA3992INzl6gohWPb9KFReL8GiJ+KolzZ1VQ8vKKFtF2Xlib3vkp6
 6Be4rdnhoL/f2t9V1ELiCGD9va5RyK4pCwgv/P17GVnDZ9pyPzIzo3PaMmmEyr7UDqzkeQu8i4t
 6q7py/CrXOATTXxjMZWpJ5OVYzqGAOlEMh3ybVEq1TMkalhLik6mKtrJMI6nwXI8D0Et/mSlMeH
 7Henxe7qrXkwz/z8FuHeD34b5EdfLw4unkz9lArLVH83SUQSHKJVU1/Lsph2zkBssiRpY=
X-Received: by 2002:a05:620a:4606:b0:8a3:a42e:6e14 with SMTP id
 af79cd13be357-8c589b9706emr2117693085a.10.1768852486747; 
 Mon, 19 Jan 2026 11:54:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e6ad75asm86947906d6.31.2026.01.19.11.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 11:54:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhvKm-00000005JRT-0mKA;
 Mon, 19 Jan 2026 15:54:44 -0400
Date: Mon, 19 Jan 2026 15:54:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iommufd: Require DMABUF revoke semantics
Message-ID: <20260119195444.GL961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
 <20260119165951.GI961572@ziepe.ca> <20260119182300.GO13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119182300.GO13201@unreal>
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

On Mon, Jan 19, 2026 at 08:23:00PM +0200, Leon Romanovsky wrote:
> On Mon, Jan 19, 2026 at 12:59:51PM -0400, Jason Gunthorpe wrote:
> > On Sun, Jan 18, 2026 at 02:08:47PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > IOMMUFD does not support page fault handling, and after a call to
> > > .invalidate_mappings() all mappings become invalid. Ensure that
> > > the IOMMUFD DMABUF importer is bound to a revoke‑aware DMABUF exporter
> > > (for example, VFIO).
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  drivers/iommu/iommufd/pages.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> > > index 76f900fa1687..a5eb2bc4ef48 100644
> > > --- a/drivers/iommu/iommufd/pages.c
> > > +++ b/drivers/iommu/iommufd/pages.c
> > > @@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
> > >  		mutex_unlock(&pages->mutex);
> > >  	}
> > >  
> > > -	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > +	rc = dma_buf_pin(attach);
> > >  	if (rc)
> > >  		goto err_detach;
> > >  
> > > +	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > +	if (rc)
> > > +		goto err_unpin;
> > > +
> > >  	dma_resv_unlock(dmabuf->resv);
> > >  
> > >  	/* On success iopt_release_pages() will detach and put the dmabuf. */
> > >  	pages->dmabuf.attach = attach;
> > >  	return 0;
> > 
> > Don't we need an explicit unpin after unmapping?
> 
> Yes, but this patch is going to be dropped in v3 because of this
> suggestion.
> https://lore.kernel.org/all/a397ff1e-615f-4873-98a9-940f9c16f85c@amd.com

That's not right, that suggestion is about changing VFIO. iommufd must
still act as a pinning importer!

Jason
