Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CF8A06D53
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4025A10E008;
	Thu,  9 Jan 2025 04:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnGKSany";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2B010E008
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736398747; x=1767934747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hTsQuirja3kP5fdTsWRC1+w6gEXwh2kLQxBcBcrjnGc=;
 b=gnGKSanyOXKy0U+d+/2347yok0CmmCq+vFRycO7GW7z7BbABx5UECxzY
 hNq+kSYKoF062Xyc/e8pBRkL9EshhOCsgoEIIX49jIYH8fyzP8vosbcRT
 m6gQWZ/UdnteZXjEQAMq3irD73ycWbvZFIEcLO4Km1MXHaCmtFjMLXmoS
 5ZiFFozl7UctnHp08e2K3CNamfiWxgLoZhCx3Hw5SIFh5W9LoDDGfqtIo
 J5avcItPoh9256IsnBXUalynKAStdwpIvLmuWFxeBZZhzHK/2Agt+bsj3
 9nhJ22C9NbWV+9r4Fu9excFzekRQ1B85OvagX6kZXDDWeoE0l8ownhucZ A==;
X-CSE-ConnectionGUID: z7FAxYuAQKOCcStXBA7uSg==
X-CSE-MsgGUID: bkAOmOfGQRa5UpI2o9kqtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36544357"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36544357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 20:59:05 -0800
X-CSE-ConnectionGUID: Bqdvx8OPQBunJyDfrdjsLg==
X-CSE-MsgGUID: wzJdr5qoSB2owTRZBfIIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126591019"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2025 20:59:00 -0800
Date: Thu, 9 Jan 2025 00:57:58 +0800
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
Message-ID: <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108133026.GQ5556@nvidia.com>
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

On Wed, Jan 08, 2025 at 09:30:26AM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 07, 2025 at 10:27:15PM +0800, Xu Yilun wrote:
> > Add a flag for ioctl(VFIO_DEVICE_BIND_IOMMUFD) to mark a device as
> > for private assignment. For these private assigned devices, disallow
> > host accessing their MMIO resources.
> 
> Why? Shouldn't the VMM simply not call mmap? Why does the kernel have
> to enforce this?

MM.. maybe I should not say 'host', instead 'userspace'.

I think the kernel part VMM (KVM) has the responsibility to enforce the
correct behavior of the userspace part VMM (QEMU). QEMU has no way to
touch private memory/MMIO intentionally or accidently. IIUC that's one
of the initiative guest_memfd is introduced for private memory. Private
MMIO follows.

Thanks,
Yilun

> 
> Jason
