Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A172881E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 21:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B03F10E615;
	Thu,  8 Jun 2023 19:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1010E60C;
 Thu,  8 Jun 2023 19:19:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A33B65086;
 Thu,  8 Jun 2023 19:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FB1C433EF;
 Thu,  8 Jun 2023 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686251965;
 bh=mLOUm1pw4C1bDmEn+GaVOq6LXGOEbnXZs3/jiHFU1DM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=q/EIiaYKROJXw5aWMOmXQm05vasG29mD1HvxujqhVsHhdELsZmFIs0ClxmC7WiAX7
 pEDhavxGKH9JK9OGkfCuDp2amYp/WOg5Y2LrhU9MZlXZ4/xE1HV1bRlxnKcomcsWkR
 4+GMU4SgGL7XXun73X7WHdOTucn8cTm3mfXWanYzj/XFv1W3VkrMwp7zrRhjdRhDMH
 eijuUshcLlTMkzqIO6AJlUN8M0rj5t6WiZxBWvhs5IpoMI2a8fcjs2lXu+3ZDTLq/b
 H/mneTO9NcemhZa9tKZIBF6eU2gmVXxy9Y7gPiurzDIX7f5m7Ii+QJJ1K1TBvZu+/w
 Sr+ngLYBLaBsA==
Date: Thu, 8 Jun 2023 14:19:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [Intel-gfx] [PATCH v3 4/4] PCI/VGA: introduce is_boot_device
 function callback to vga_client_register
Message-ID: <20230608191924.GA1210122@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608114322.604887-5-15330273260@189.cn>
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 07:43:22PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> The vga_is_firmware_default() function is arch-dependent, which doesn't
> sound right. At least, it also works on the Mips and LoongArch platforms.
> Tested with the drm/amdgpu and drm/radeon drivers. However, it's difficult
> to enumerate all arch-driver combinations. I'm wrong if there is only one
> exception.
> 
> With the observation that device drivers typically have better knowledge
> about which PCI bar contains the firmware framebuffer, which could avoid
> the need to iterate all of the PCI BARs.
> 
> But as a PCI function at pci/vgaarb.c, vga_is_firmware_default() is
> probably not suitable to make such an optimization for a specific device.
> 
> There are PCI display controllers that don't have a dedicated VRAM bar,
> this function will lose its effectiveness in such a case. Luckily, the
> device driver can provide an accurate workaround.
> 
> Therefore, this patch introduces a callback that allows the device driver
> to tell the VGAARB if the device is the default boot device. This patch
> only intends to introduce the mechanism, while the implementation is left
> to the device driver authors. Also honor the comment: "Clients have two
> callback mechanisms they can use"

s/bar/BAR/ (several)

Nothing here uses the callback.  I don't want to merge this until we
have a user.

I'm not sure why the device driver should know whether its device is
the default boot device.

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/i915/display/intel_vga.c   |  3 +--
>  drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
>  drivers/gpu/drm/radeon/radeon_device.c     |  2 +-
>  drivers/pci/vgaarb.c                       | 22 ++++++++++++++++++----
>  drivers/vfio/pci/vfio_pci_core.c           |  2 +-
>  include/linux/vgaarb.h                     |  8 +++++---
>  7 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5c7d40873ee2..7a096f2d5c16 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3960,7 +3960,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  	/* this will fail for cards that aren't VGA class devices, just
>  	 * ignore it */
>  	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> -		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
> +		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
>  
>  	px = amdgpu_device_supports_px(ddev);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 286a0bdd28c6..98d7d4dffe9f 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -115,7 +115,6 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
>  
>  int intel_vga_register(struct drm_i915_private *i915)
>  {
> -
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>  	int ret;
>  
> @@ -127,7 +126,7 @@ int intel_vga_register(struct drm_i915_private *i915)
>  	 * then we do not take part in VGA arbitration and the
>  	 * vga_client_register() fails with -ENODEV.
>  	 */
> -	ret = vga_client_register(pdev, intel_vga_set_decode);
> +	ret = vga_client_register(pdev, intel_vga_set_decode, NULL);
>  	if (ret && ret != -ENODEV)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index f8bf0ec26844..162b4f4676c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -92,7 +92,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
>  		return;
>  	pdev = to_pci_dev(dev->dev);
>  
> -	vga_client_register(pdev, nouveau_vga_set_decode);
> +	vga_client_register(pdev, nouveau_vga_set_decode, NULL);
>  
>  	/* don't register Thunderbolt eGPU with vga_switcheroo */
>  	if (pci_is_thunderbolt_attached(pdev))
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index afbb3a80c0c6..71f2ff39d6a1 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1425,7 +1425,7 @@ int radeon_device_init(struct radeon_device *rdev,
>  	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
>  	/* this will fail for cards that aren't VGA class devices, just
>  	 * ignore it */
> -	vga_client_register(rdev->pdev, radeon_vga_set_decode);
> +	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
>  
>  	if (rdev->flags & RADEON_IS_PX)
>  		runtime = true;
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index b0bf4952a95d..d3dab61e0ef2 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -53,6 +53,7 @@ struct vga_device {
>  	bool bridge_has_one_vga;
>  	bool is_firmware_default;	/* device selected by firmware */
>  	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
> +	bool (*is_boot_device)(struct pci_dev *pdev);
>  };
>  
>  static LIST_HEAD(vga_list);
> @@ -614,10 +615,17 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>  	if (boot_vga && boot_vga->is_firmware_default)
>  		return false;
>  
> -	if (vga_is_firmware_default(pdev)) {
> -		vgadev->is_firmware_default = true;
> +	/*
> +	 * Ask the device driver first, if registered. Fallback to the
> +	 * default implement if the callback is non-exist.
> +	 */
> +	if (vgadev->is_boot_device)
> +		vgadev->is_firmware_default = vgadev->is_boot_device(pdev);
> +	else
> +		vgadev->is_firmware_default = vga_is_firmware_default(pdev);
> +
> +	if (vgadev->is_firmware_default)
>  		return true;
> -	}
>  
>  	/*
>  	 * A legacy VGA device has MEM and IO enabled and any bridges
> @@ -954,6 +962,10 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>   * @set_decode callback: If a client can disable its GPU VGA resource, it
>   * will get a callback from this to set the encode/decode state.
>   *
> + * @is_boot_device: callback to the device driver, query if a client is the
> + * default boot device, as the device driver typically has better knowledge
> + * if specific device is the boot device. But this callback is optional.
> + *
>   * Rationale: we cannot disable VGA decode resources unconditionally, some
>   * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
>   * to control things like backlights etc. Hopefully newer multi-GPU laptops do
> @@ -969,7 +981,8 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>   * Returns: 0 on success, -1 on failure
>   */
>  int vga_client_register(struct pci_dev *pdev,
> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
> +		bool (*is_boot_device)(struct pci_dev *pdev))
>  {
>  	int ret = -ENODEV;
>  	struct vga_device *vgadev;
> @@ -981,6 +994,7 @@ int vga_client_register(struct pci_dev *pdev,
>  		goto bail;
>  
>  	vgadev->set_decode = set_decode;
> +	vgadev->is_boot_device = is_boot_device;
>  	ret = 0;
>  
>  bail:
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index a5ab416cf476..2a8873a330ba 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2067,7 +2067,7 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = vga_client_register(pdev, vfio_pci_set_decode);
> +	ret = vga_client_register(pdev, vfio_pci_set_decode, NULL);
>  	if (ret)
>  		return ret;
>  	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index d36225c582ee..66fe80ffad76 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -50,7 +50,8 @@ struct pci_dev *vga_default_device(void);
>  void vga_set_default_device(struct pci_dev *pdev);
>  int vga_remove_vgacon(struct pci_dev *pdev);
>  int vga_client_register(struct pci_dev *pdev,
> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool state));
> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
> +		bool (*is_boot_device)(struct pci_dev *pdev));
>  #else /* CONFIG_VGA_ARB */
>  static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
>  		unsigned int decodes)
> @@ -76,7 +77,8 @@ static inline int vga_remove_vgacon(struct pci_dev *pdev)
>  	return 0;
>  }
>  static inline int vga_client_register(struct pci_dev *pdev,
> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool state))
> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
> +		bool (*is_boot_device)(struct pci_dev *pdev))
>  {
>  	return 0;
>  }
> @@ -114,7 +116,7 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
>  
>  static inline void vga_client_unregister(struct pci_dev *pdev)
>  {
> -	vga_client_register(pdev, NULL);
> +	vga_client_register(pdev, NULL, NULL);
>  }
>  
>  #endif /* LINUX_VGA_H */
> -- 
> 2.25.1
> 
