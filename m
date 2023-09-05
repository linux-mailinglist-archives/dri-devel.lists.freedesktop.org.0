Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC667921E7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 12:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B14D10E49B;
	Tue,  5 Sep 2023 10:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D3A10E48D;
 Tue,  5 Sep 2023 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693910325; x=1725446325;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FOrzDSmYIDB82+DRnZRNZGG7/K5RvZ9RHJth/JxCWCI=;
 b=V72mRxoSMB66O+P+dlm6J0qHfoDjQjzvfFgOFJQdQPjQOpNeFLcwxT7h
 vZM86uQqSriaHQMH02xcocxxCv2EmjbkqHXknTBjWeKPdD7NxNLUGSnI2
 ZNMyvP7xr5o/TzqZryILoEMzN4gevU9F8PNXgLz1VGXdIWT2AKBFEU+60
 HTrcaP8Ot7+TxakDCmrvqUvBTMOb5NZ/ZOvE2XLtHdwTuO/rssR1OL9yn
 tFIiZUSEqYgQln6441CWvXOErLunEW2rAbjatTdPIoocAl3+OWWbouTli
 W221IM4+pnVo0Iy39FWfeDSOTgN5al/nx6aSRjkzZGv4sBZtf09HFCnlV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379484065"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="379484065"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 03:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987784595"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="987784595"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 03:38:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user to
 select the primary video adapter at boot time
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
Date: Tue, 05 Sep 2023 13:38:39 +0300
Message-ID: <874jk8j45s.fsf@intel.com>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Sep 2023, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> On a machine with multiple GPUs, a Linux user has no control over which
> one is primary at boot time. This series tries to solve above mentioned
> problem by introduced the ->be_primary() function stub. The specific
> device drivers can provide an implementation to hook up with this stub by
> calling the vga_client_register() function.
>
> Once the driver bound the device successfully, VGAARB will call back to
> the device driver. To query if the device drivers want to be primary or
> not. Device drivers can just pass NULL if have no such needs.
>
> Please note that:
>
> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I would
>    like to mount at least three video cards.
>
> 2) Typically, those non-86 machines don't have a good UEFI firmware
>    support, which doesn't support select primary GPU as firmware stage.
>    Even on x86, there are old UEFI firmwares which already made undesired
>    decision for you.
>
> 3) This series is attempt to solve the remain problems at the driver level,
>    while another series[1] of me is target to solve the majority of the
>    problems at device level.
>
> Tested (limited) on x86 with four video card mounted, Intel UHD Graphics
> 630 is the default boot VGA, successfully override by ast2400 with
> ast.modeset=10 append at the kernel cmd line.

The value 10 is incredibly arbitrary, and multiplied as a magic number
all over the place.

> $ lspci | grep VGA
>
>  00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
>  01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XTX [Radeon HD 8490 / R5 235X OEM]
>  04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30)
>  05:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 720] (rev a1)

In this example, all of the GPUs are driven by different drivers. What
good does a module parameter do if you have multiple GPUs of the same
model, all driven by the same driver module?

BR,
Jani.

>
> $ sudo dmesg | grep vgaarb
>
>  pci 0000:00:02.0: vgaarb: setting as boot VGA device
>  pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
>  pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  vgaarb: loaded
>  ast 0000:04:00.0: vgaarb: Override as primary by driver
>  i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
>  radeon 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
>  ast 0000:04:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
>
> v2:
> 	* Add a simple implemment for drm/i915 and drm/ast
> 	* Pick up all tags (Mario)
> v3:
> 	* Fix a mistake for drm/i915 implement
> 	* Fix patch can not be applied problem because of merge conflect.
> v4:
> 	* Focus on solve the real problem.
>
> v1,v2 at https://patchwork.freedesktop.org/series/120059/
>    v3 at https://patchwork.freedesktop.org/series/120562/
>
> [1] https://patchwork.freedesktop.org/series/122845/
>
> Sui Jingfeng (9):
>   PCI/VGA: Allowing the user to select the primary video adapter at boot
>     time
>   drm/nouveau: Implement .be_primary() callback
>   drm/radeon: Implement .be_primary() callback
>   drm/amdgpu: Implement .be_primary() callback
>   drm/i915: Implement .be_primary() callback
>   drm/loongson: Implement .be_primary() callback
>   drm/ast: Register as a VGA client by calling vga_client_register()
>   drm/hibmc: Register as a VGA client by calling vga_client_register()
>   drm/gma500: Register as a VGA client by calling vga_client_register()
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 11 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 ++++-
>  drivers/gpu/drm/ast/ast_drv.c                 | 31 ++++++++++
>  drivers/gpu/drm/gma500/psb_drv.c              | 57 ++++++++++++++++++-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 15 +++++
>  drivers/gpu/drm/i915/display/intel_vga.c      | 15 ++++-
>  drivers/gpu/drm/loongson/loongson_module.c    |  2 +-
>  drivers/gpu/drm/loongson/loongson_module.h    |  1 +
>  drivers/gpu/drm/loongson/lsdc_drv.c           | 10 +++-
>  drivers/gpu/drm/nouveau/nouveau_vga.c         | 11 +++-
>  drivers/gpu/drm/radeon/radeon_device.c        | 10 +++-
>  drivers/pci/vgaarb.c                          | 43 ++++++++++++--
>  drivers/vfio/pci/vfio_pci_core.c              |  2 +-
>  include/linux/vgaarb.h                        |  8 ++-
>  14 files changed, 210 insertions(+), 19 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
