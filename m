Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D262ACEED9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9FA10E8C9;
	Thu,  5 Jun 2025 12:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VmAAhXWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6294F10E8C9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:04:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6C7F4A3FC;
 Thu,  5 Jun 2025 12:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AF1C4CEE7;
 Thu,  5 Jun 2025 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749125049;
 bh=lCVZA25/isGuQai3LP6gi6FwlJVk5NeO2+7NBohc5SU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VmAAhXWzVGBjeWNpVW2wh+mAxiJcDJYA6OUElXSkndlFiRbwoupeUKMTH94sxLGvI
 mm+H/Gf2F7yPxlLw3e05dd0veLXsk1JP4wjON1COr10tlCInZjoSa7vOOesZdr9d96
 gUOhYR2G5S6tS+73HgdIsXGy6YWJgRN8aWYW/EKfjs3ZHWxP+MMaJm2zNM99QG71LN
 6u/uC+PiBbdLJ33bKUgN8BjrnLIAr+4iPVhyTo6jd6bdl2vM+pfnbPwBAOm/6o6A6f
 lmP5838AChfUmUz4tXi4HnRBYEm8WQTUGcFn9QLj5penqKRJvzkYco8PtO6YVZQ4Mz
 ZmTOk2gmbJV4w==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com,
 linux-pci@vger.kernel.org, zhiw@nvidia.com, simona.vetter@ffwll.ch,
 shameerali.kolothum.thodi@huawei.com, iommu@lists.linux.dev,
 kevin.tian@intel.com
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
In-Reply-To: <20250529053513.1592088-20-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
Date: Thu, 05 Jun 2025 17:33:52 +0530
Message-ID: <yq5ah60u8kev.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Xu Yilun <yilun.xu@linux.intel.com> writes:

> Add new IOCTLs to do TSM based TDI bind/unbind. These IOCTLs are
> expected to be called by userspace when CoCo VM issues TDI bind/unbind
> command to VMM. Specifically for TDX Connect, these commands are some
> secure Hypervisor call named GHCI (Guest-Hypervisor Communication
> Interface).
>
> The TSM TDI bind/unbind operations are expected to be initiated by a
> running CoCo VM, which already have the legacy assigned device in place.
> The TSM bind operation is to request VMM make all secure configurations
> to support device work as a TDI, and then issue TDISP messages to move
> the TDI to CONFIG_LOCKED or RUN state, waiting for guest's attestation.
>
> Do TSM Unbind before vfio_pci_core_disable(), otherwise will lead
> device to TDISP ERROR state.
>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Wu Hao <hao.wu@intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
>

....

> +
> +	/* To ensure no host side MMIO access is possible */
> +	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
> +	if (ret)
> +		goto out_unlock;
> +
>

I am hitting failures here with similar changes. Can you share the Qemu
changes needed to make this pci_request_regions_exclusive successful.
Also after the TDI is unbound, we want the region ownership backto
"vfio-pci" so that things continue to work as non-secure device. I don't
see we doing that. I could add a pci_bar_deactivate/pci_bar_activate in
userspace which will result in vfio_unmap()/vfio_map(). But that doesn't
release the region ownership.


> +	ret = vfio_iommufd_tsm_bind(&vdev->vdev, tsm_bind.vdevice_id);
> +	if (ret)
> +		goto out_release_region;
> +
> +	vdev->is_tsm_bound = true;
> +	mutex_unlock(&vdev->vdev.dev_set->lock);
> +
> +	return 0;
> +
> +out_release_region:
> +	pci_release_regions(pdev);
> +out_unlock:
> +	mutex_unlock(&vdev->vdev.dev_set->lock);
> +	return ret;
> +}

-aneesh
