Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0EAA19F3C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 08:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FC610E77E;
	Thu, 23 Jan 2025 07:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvpTQxMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B203110E77E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737618138; x=1769154138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WfCoT8DAVyePFPdKpLI3f57LRfvllzvhy6jwVyfb9z0=;
 b=lvpTQxMO0RhFFy3Y/lHaJhfOPvy5dLPsSI7f+AOWkEw88+1yJdgUGtfj
 zjXZWg4Cz2pGlUZFNTYfWgtKHXHGJG+vnLto8MS390LTYExKO1I3FzCWb
 9oV63jjLQ75Z/3Fr5EQxf8pkcvOQ8dyVqoG/de+RJiK/lzl+A5Utxrb/B
 mPpCqVVRFPKZDATUW9eW/38jz+bTdXLGpENCvAAgTs2HJrhLSAp71G8c1
 F3h30NLscQe/2oW275erPHKR9Di7xzy66jz8+cAbN7CrQ9CJSFhca5Ra4
 akDE1+WmIOWyS/No6QPBybQpzgWmTl2q5QHJ/Q7fY9+NCVRsP/ep3r/77 Q==;
X-CSE-ConnectionGUID: rHMmGBdAQ2a4S9KQDhCDrg==
X-CSE-MsgGUID: nHtYkyeeRQeFVzg4qFZ7Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37992357"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37992357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:42:16 -0800
X-CSE-ConnectionGUID: 1OH4uuflR5S+l2cqgHzD4w==
X-CSE-MsgGUID: Mc61jTczThiN5e0xUsKqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112028936"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2025 23:42:10 -0800
Date: Thu, 23 Jan 2025 15:41:58 +0800
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
Message-ID: <Z5HyxlaiXqp2/KOA@yilunxu-OptiPlex-7050>
References: <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <Znh+uTMe/wX2RIJm@yilunxu-OptiPlex-7050>
 <20250120132525.GH5556@nvidia.com>
 <ZnnhKtA2n4s1CLyf@yilunxu-OptiPlex-7050>
 <20250121174303.GV5556@nvidia.com>
 <Z5B0+OcLWsiHLRIA@yilunxu-OptiPlex-7050>
 <20250122125512.GD5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122125512.GD5556@nvidia.com>
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

On Wed, Jan 22, 2025 at 08:55:12AM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 22, 2025 at 12:32:56PM +0800, Xu Yilun wrote:
> > On Tue, Jan 21, 2025 at 01:43:03PM -0400, Jason Gunthorpe wrote:
> > > On Tue, Jun 25, 2024 at 05:12:10AM +0800, Xu Yilun wrote:
> > > 
> > > > When VFIO works as a TEE user in VM, it means an attester (e.g. PCI
> > > > subsystem) has already moved the device to RUN state. So VFIO & DPDK
> > > > are all TEE users, no need to manipulate TDISP state between them.
> > > > AFAICS, this is the most preferred TIO usage in CoCo-VM.
> > > 
> > > No, unfortunately. Part of the motivation to have the devices be
> > > unlocked when the VM starts is because there is an expectation that a
> > > driver in the VM will need to do untrusted operations to boot up the
> > 
> > I assume these operations are device specific.
> 
> Yes
> 
> > > device before it can be switched to the run state.
> > > 
> > > So any vfio use case needs to imagine that VFIO starts with an
> > > untrusted device, does stuff to it, then pushes everything through to
> > 
> > I have concern that VFIO has to do device specific stuff. Our current
> > expectation is a specific device driver deals with the untrusted
> > operations, then user writes a 'bind' device sysfs node which detaches
> > the driver for untrusted, do the attestation and accept, and try match
> > the driver for trusted (e.g. VFIO).
> 
> I don't see this as working, VFIO will FLR the device which will
> destroy anything that was done prior.
> 
> VFIO itself has to do the sequence and the VFIO userspace has to
> contain the device specific stuff.

I don't have a complete idea yet. But the goal is not to make any
existing driver seamlessly work with secure device. It is to provide a
generic way for bind/attestation/accept, and may save driver's effort
if they don't care about this startup process. There are plenty of
operations that a driver can't do to a secure device, FLR is one of
them. The TDISP SPEC has described some general rules but some are even
device specific.

So I think a driver (including VFIO) expects change to support trusted
device, but may not have to cover bind/attestation/accept flow.

Thanks,
Yilun

> 
> The bind/unbind dance for untrusted->trusted would need to be
> internalized in VFIO without unbinding. The main motivation for the
> bind/unbind flow was to manage the DMA API, which VFIO does not use.
> 
> Jason
