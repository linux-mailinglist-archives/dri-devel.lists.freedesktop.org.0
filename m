Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C2A101E9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F4610E876;
	Tue, 14 Jan 2025 08:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jE+YwIxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD6910E360
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736842915; x=1768378915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YFJKCb0jqMAhlwNKuT95tl8Htv3gL4ALSvmG3zHbfqM=;
 b=jE+YwIxA2nOhW+W9BCs4jSJhqopYxRk4B67+LzoVqAGAZH8a/J4J1vRu
 c0mN6CRT8yOcpGfLVty90jA9IW2pbBKaIrkh5ZZY5wKwvu6RnrXvtx0np
 o3lycRhHKOjg7JktovKkjtydHlHdURcNdpfHgwSQEh0aVp+6VThQiS6eS
 ITs2kDSfjXQjGKoB1gLJwMqK3bKmEk9YQ6qhfB0LYxZZzAyupuh+zy+gh
 e/wcO/R1h6tgTVN8Lvtwq2maymOfPuVsAfn8SuSRpN+6vqefDaFOspTp2
 QcjqEKms8bK6NlnWMUVsGUosNQCssMTczyho9FB6GbR+kqlyD165UYxCF w==;
X-CSE-ConnectionGUID: VpTm/nIiQV6R3gdiuyuBLA==
X-CSE-MsgGUID: 1uyvpP/vRmuCwga3RLOR5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40893904"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="40893904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:21:54 -0800
X-CSE-ConnectionGUID: 4bgDJI7lSkCxurHBiLu3JA==
X-CSE-MsgGUID: O/PUG0G3R9COCkCPxJ2Amg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105610990"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 14 Jan 2025 00:21:49 -0800
Date: Tue, 18 Jun 2024 07:28:43 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com>
 <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
 <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
 <20250110133116.GF5556@nvidia.com>
 <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113164935.GP5556@nvidia.com>
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

On Mon, Jan 13, 2025 at 12:49:35PM -0400, Jason Gunthorpe wrote:
> On Sat, Jan 11, 2025 at 11:48:06AM +0800, Xu Yilun wrote:
> 
> > > > > can be sure what is the correct UAPI. In other words, make the
> > > > > VFIO device into a CC device should also prevent mmaping it and so on.
> > > > 
> > > > My idea is prevent mmaping first, then allow VFIO device into CC dev (TDI).
> > > 
> > > I think you need to start the TDI process much earlier. Some arches
> > > are going to need work to prepare the TDI before the VM is started.
> > 
> > Could you elaborate more on that? AFAICS Intel & AMD are all good on
> > "late bind", but not sure for other architectures.
> 
> I'm not sure about this, the topic has been confused a bit, and people
> often seem to  misunderstand what the full scenario actually is. :\

Yes, it is in early stage and open to discuss.

> 
> What I'm talking abou there is that you will tell the secure world to
> create vPCI function that has the potential to be secure "TDI run"
> down the road. The VM will decide when it reaches the run state. This

Yes.

> is needed so the secure world can prepare anything it needs prior to
> starting the VM.

OK. From Dan's patchset there are some touch point for vendor tsm
drivers to do secure world preparation. e.g. pci_tsm_ops::probe().

Maybe we could move to Dan's thread for discussion.

https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/

> Setting up secure vIOMMU emulation, for instance. I

I think this could be done at VM late bind time.

> expect ARM will need this, I'd be surprised if AMD actually doesn't in
> the full scenario with secure viommu.

AFAICS, AMD needs secure viommu.

> 
> It should not be a surprise to the secure world after the VM has
> started that suddenly it learns about a vPCI function that wants to be

With some pre-VM stage touch point, it wouldn't be all of a sudden.

> secure. This should all be pre-arranged as possible before starting

But our current implementation is not to prepare as much as possible,
but only necessary, so most of the secure work for vPCI function is done
at late bind time.

Thank,
Yilun

> the VM, even if alot of steps happen after the VM starts running (or
> maybe don't happen at all).
> 
> Jason
