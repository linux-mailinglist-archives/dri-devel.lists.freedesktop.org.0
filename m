Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2145AACB01B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A8E10E1EF;
	Mon,  2 Jun 2025 14:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="odmJ29Tg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344C10E1EF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2F4D438BB;
 Mon,  2 Jun 2025 14:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AD1C4AF09;
 Mon,  2 Jun 2025 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748872826;
 bh=wNC7AaKe9Ra7Pe5UYUQ6T8kl4WJKtgV4gm/y/d9HwYA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=odmJ29TgLSk1eGgj/iJAPiRUO858mVI2Tt41Em+yUgfpwQafnTSb0TYyzYTji7Gfm
 hqF4QIi+Ql3uxYhMBXD91tvYIYfQ0/PDKDJK6SKMnh9hjY7kOqmhwIdmtAmmfVf8Sb
 qj03+/Ou5TEWeF8opqLH9BZjMJO+2cXnEFhjWrVwxCwY16Km0zvogqhjoH1/EBama/
 aX41571aA3F335y3HaJwIR/5t1O8XN+chx2jx6C0vgeCVrokOeyOwvtDkBxdTbVo7V
 k7przZP19XGI0Jr+fxT4GAhMjOiYqxUkZDZry3pMwxqmu3sYOYGxpee2p/31RnZLsj
 1m6i0Io8ggCfA==
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
Subject: Re: [RFC PATCH 20/30] vfio/pci: Do TSM Unbind before zapping bars
In-Reply-To: <20250529053513.1592088-21-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-21-yilun.xu@linux.intel.com>
Date: Mon, 02 Jun 2025 19:30:15 +0530
Message-ID: <yq5ar002jlao.fsf@kernel.org>
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

> When device is TSM Bound, some of its MMIO regions are controlled by
> secure firmware. E.g. TDX Connect would require these MMIO regions
> mappeed in S-EPT and never unmapped until device Unbound. Zapping bars
> irrespective of TSM Bound state may cause unexpected secure firmware
> errors. It is always safe to do TSM Unbind first, transiting the device
> to shared, then do whatever needed as before.
>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_config.c |  4 +++
>  drivers/vfio/pci/vfio_pci_core.c   | 41 +++++++++++++++++++-----------
>  drivers/vfio/pci/vfio_pci_priv.h   |  3 +++
>  3 files changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index 7ac062bd5044..4ffe661c9e59 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -590,6 +590,7 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>  
>  		if (!new_mem) {
> +			vfio_pci_tsm_unbind(vdev);
>  			vfio_pci_zap_and_down_write_memory_lock(vdev);
>  			vfio_pci_dma_buf_move(vdev, true);
>

For a secure device mmio range instead of vfio_pci_zap_and_down_write_memory_lock()
-> unmap_mapping_range() we want the vfio_pci_dma_buf_move right? Also
is that expected to get called twice as below?

vfio_pci_tsm_unbind-> pci_tsm_unbind -> tdx_tsm_unbind ->
tsm_handler->disable_mmio() -> vfio_pci_core_tsm_disable_mmio -> vfio_pci_dma_buf_move(vdev, true);

-aneesh
