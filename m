Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB1EA18B04
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 05:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F16B10E223;
	Wed, 22 Jan 2025 04:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OobqpQfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D712210E223
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 04:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737520390; x=1769056390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LxHnnR6mSHv1FRrCXMjIa+c5dsH7Ux6YqKwi2h9qwRk=;
 b=OobqpQfgxoUyjJB5pxMXpXHKMCkHe/8Lqg5gPG3JzuN35J+PmSH2Xnub
 lTKYk3IzMLUZ4dFDQSVwqoUQGSMZGSySDWsY0cFlrVNC+8SxH2C1KFXQP
 /r7cvlXKC9QyjSy0IwtfSX+QLKPpK9wXK6kKV3NzAy/x0dhrAs1d+ZQAa
 b5qRWFT/UJRllSh8/VHsB5Eh1r7yqYzSlTz7RF2P7YPWi9EzRdU3Ggqfn
 wfJC1zpEvrcjbYE/HWNNWm0V9LeNRRbK3gVhbNpX+3EaR9eyBcPTTF/XQ
 CSUw1ghidsULg6yVHJV7IuLePi3qPJqKI7EVqdrsm6/gWjMPlMmlzHUd8 Q==;
X-CSE-ConnectionGUID: s2n4ezwCSACK7QhcE9qc0w==
X-CSE-MsgGUID: RPLd/oYXReejs149wlEZGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="63317726"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="63317726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:33:09 -0800
X-CSE-ConnectionGUID: GiiRJr4GRHis2kjxkPmIjg==
X-CSE-MsgGUID: YdGhyQHZTjSzt2/SOh01zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="106928561"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2025 20:33:05 -0800
Date: Wed, 22 Jan 2025 12:32:56 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Alexey Kardashevskiy <aik@amd.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <Z5B0+OcLWsiHLRIA@yilunxu-OptiPlex-7050>
References: <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <Znh+uTMe/wX2RIJm@yilunxu-OptiPlex-7050>
 <20250120132525.GH5556@nvidia.com>
 <ZnnhKtA2n4s1CLyf@yilunxu-OptiPlex-7050>
 <20250121174303.GV5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121174303.GV5556@nvidia.com>
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

On Tue, Jan 21, 2025 at 01:43:03PM -0400, Jason Gunthorpe wrote:
> On Tue, Jun 25, 2024 at 05:12:10AM +0800, Xu Yilun wrote:
> 
> > When VFIO works as a TEE user in VM, it means an attester (e.g. PCI
> > subsystem) has already moved the device to RUN state. So VFIO & DPDK
> > are all TEE users, no need to manipulate TDISP state between them.
> > AFAICS, this is the most preferred TIO usage in CoCo-VM.
> 
> No, unfortunately. Part of the motivation to have the devices be
> unlocked when the VM starts is because there is an expectation that a
> driver in the VM will need to do untrusted operations to boot up the

I assume these operations are device specific.

> device before it can be switched to the run state.
> 
> So any vfio use case needs to imagine that VFIO starts with an
> untrusted device, does stuff to it, then pushes everything through to

I have concern that VFIO has to do device specific stuff. Our current
expectation is a specific device driver deals with the untrusted
operations, then user writes a 'bind' device sysfs node which detaches
the driver for untrusted, do the attestation and accept, and try match
the driver for trusted (e.g. VFIO).

Thanks,
Yilun

> run. The exact mirror as what a kernel driver should be able to do.
> 
> How exactly all this very complex stuff works, I have no idea, but
> this is what I've understood is the target. :\
> 
> Jason
