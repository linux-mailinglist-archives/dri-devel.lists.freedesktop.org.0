Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662E75B9E6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB49310E1B0;
	Thu, 20 Jul 2023 21:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35E910E1A9;
 Thu, 20 Jul 2023 21:55:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDEA361C7B;
 Thu, 20 Jul 2023 21:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB259C433C8;
 Thu, 20 Jul 2023 21:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689890153;
 bh=/bXS787t6CrBfx1QzszVq51xokDzGgEBIJZxAQSEBpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PckrirTH+R/atkbCgfex4heLW9KXK7s+ISrPtn4IqPCDQOKZUWg1Hku404dLZZsBi
 NuuAgsruXLXuYa229tXINUGekioW5P7Daw5vmq90cy11jXiwkYB9r4Q+5N+La7zPDk
 5WqD3lk4QWHGuFSFJug0czFpUN8scQsR9tJ+IWE8KHhCRC0TUgdK5LmS3cYU52B7qH
 9e5rmBwkikmKUYtCWFxPRDrRYB+UqPcIPK0NqFdydH+LDgmkJl14xxSE3FtpsbiCvI
 9KcFD7+bTSrCTKeTdQWB2g7KwQ6lw6itidOZ0E6XQVL48L8lzxOjEWHZyfxe0A+k0L
 Xv+29EkPDh4uA==
Date: Thu, 20 Jul 2023 16:55:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 05/11] drm/amdgpu: Use RMW accessors for changing LNKCTL
Message-ID: <20230720215550.GA554900@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717120503.15276-6-ilpo.jarvinen@linux.intel.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonas =?iso-8859-1?Q?Dre=DFler?= <verdre@v0yd.nl>,
 "Rafael J . Wysocki" <rafael@kernel.org>, amd-gfx@lists.freedesktop.org,
 Dean Luick <dean.luick@cornelisnetworks.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Ken Wang <Qingqing.Wang@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 03:04:57PM +0300, Ilpo Järvinen wrote:
> Don't assume that only the driver would be accessing LNKCTL. ASPM
> policy changes can trigger write to LNKCTL outside of driver's control.
> And in the case of upstream bridge, the driver does not even own the
> device it's changing the registers for.
> 
> Use RMW capability accessors which do proper locking to avoid losing
> concurrent updates to the register value.
> 
> Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> Fixes: 62a37553414a ("drm/amdgpu: add si implementation v10")
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: stable@vger.kernel.org

Do we have any reports of problems that are fixed by this patch (or by
others in the series)?  If not, I'm not sure it really fits the usual
stable kernel criteria:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?id=v6.4

> ---
>  drivers/gpu/drm/amd/amdgpu/cik.c | 36 +++++++++-----------------------
>  drivers/gpu/drm/amd/amdgpu/si.c  | 36 +++++++++-----------------------
>  2 files changed, 20 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
> index 5641cf05d856..e63abdf52b6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> @@ -1574,17 +1574,8 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
>  			u16 bridge_cfg2, gpu_cfg2;
>  			u32 max_lw, current_lw, tmp;
>  
> -			pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> -						  &bridge_cfg);
> -			pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL,
> -						  &gpu_cfg);
> -
> -			tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
> -			pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
> -
> -			tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
> -			pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL,
> -						   tmp16);
> +			pcie_capability_set_word(root, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
> +			pcie_capability_set_word(adev->pdev, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
>  
>  			tmp = RREG32_PCIE(ixPCIE_LC_STATUS1);
>  			max_lw = (tmp & PCIE_LC_STATUS1__LC_DETECTED_LINK_WIDTH_MASK) >>
> @@ -1637,21 +1628,14 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
>  				msleep(100);
>  
>  				/* linkctl */
> -				pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> -							  &tmp16);
> -				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
> -				tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
> -				pcie_capability_write_word(root, PCI_EXP_LNKCTL,
> -							   tmp16);
> -
> -				pcie_capability_read_word(adev->pdev,
> -							  PCI_EXP_LNKCTL,
> -							  &tmp16);
> -				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
> -				tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
> -				pcie_capability_write_word(adev->pdev,
> -							   PCI_EXP_LNKCTL,
> -							   tmp16);
> +				pcie_capability_clear_and_set_word(root, PCI_EXP_LNKCTL,
> +								   PCI_EXP_LNKCTL_HAWD,
> +								   bridge_cfg &
> +								   PCI_EXP_LNKCTL_HAWD);
> +				pcie_capability_clear_and_set_word(adev->pdev, PCI_EXP_LNKCTL,
> +								   PCI_EXP_LNKCTL_HAWD,
> +								   gpu_cfg &
> +								   PCI_EXP_LNKCTL_HAWD);

Wow, there's a lot of pointless-looking work going on here:

  set root PCI_EXP_LNKCTL_HAWD
  set GPU  PCI_EXP_LNKCTL_HAWD

  for (i = 0; i < 10; i++) {
    read root PCI_EXP_LNKCTL
    read GPU  PCI_EXP_LNKCTL

    clear root PCI_EXP_LNKCTL_HAWD
    if (root PCI_EXP_LNKCTL_HAWD was set)
      set root PCI_EXP_LNKCTL_HAWD

    clear GPU  PCI_EXP_LNKCTL_HAWD
    if (GPU  PCI_EXP_LNKCTL_HAWD was set)
      set GPU  PCI_EXP_LNKCTL_HAWD
  }

If it really *is* pointless, it would be nice to clean it up, but that
wouldn't be material for this patch, so what you have looks good.

>  				/* linkctl2 */
>  				pcie_capability_read_word(root, PCI_EXP_LNKCTL2,

The PCI_EXP_LNKCTL2 stuff also includes RMW updates.  I don't see any
uses of PCI_EXP_LNKCTL2 outside this driver that look relevant, so I
guess we don't care about making the PCI_EXP_LNKCTL2 updates atomic?

Bjorn
