Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9D8FD826
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 23:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A871810E072;
	Wed,  5 Jun 2024 21:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4EuZVOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839610E072
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 21:11:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42D8DCE1997;
 Wed,  5 Jun 2024 21:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FF0C32782;
 Wed,  5 Jun 2024 21:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717621875;
 bh=wZzPNrqVuLZwQrAHvo0+wEV3M1B5Giym8LAI8+pNTNQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=P4EuZVOlBj5OzFkbL9tg8GhIEyFUWBZ4laZp0oWFeyS3gR5zJMJhieUEMfl2JKci5
 OUDNB2B76jObgGDMm1TQfcoRSPz8voYRFBtdksaRVek009KvsclDOSYXnJ8zbo1vEz
 wrnUfaUhtb1Xuyf15ZJPXKwQPgpSS1Hg03FH1P5Il/1WClDDLcC6w55KgdYbuBSj9G
 tOU7G2ErlkxnCIHcn1cBlJXTVVJ+8BJnFOH1TQqlLlt9yBprnRJx+KYVS+MzBWpkrj
 T554imcxRI694A1jdkM1IF6P7LCNr27bNFwsEFqGfb0nqbt3hi5R3z66ABAi2oKLZw
 ONZ9KrapjbK2g==
Date: Wed, 5 Jun 2024 16:11:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 07/13] PCI: Move dev-enabled status bit to struct
 pci_dev
Message-ID: <20240605211111.GA779780@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605081605.18769-9-pstanner@redhat.com>
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

On Wed, Jun 05, 2024 at 10:15:59AM +0200, Philipp Stanner wrote:
> The bit describing whether the PCI device is currently enabled is stored
> in struct pci_devres. Besides this struct being subject of a cleanup
> process, struct pci_device is in general the right place to store this
> information, since it is not devres-specific.
> 
> Move the 'enabled' boolean bit to struct pci_dev.

I think this (and the similar 'pinned' patch) appeared in v6.

It sounds plausible to have this in struct pci_dev, but it's confusing
to have both:

  pci_dev.enabled
  pci_dev.enable_cnt, used by pci_is_enabled()

I haven't looked hard enough to see whether both are required.  If
they are, I think we should rename "enabled" to something descriptive
enough to make it obviously different from "enable_cnt".

> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 11 ++++-------
>  drivers/pci/pci.c    | 17 ++++++++++-------
>  drivers/pci/pci.h    |  1 -
>  include/linux/pci.h  |  1 +
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 572a4e193879..ea590caf8995 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -398,7 +398,7 @@ static void pcim_release(struct device *gendev, void *res)
>  	if (this->restore_intx)
>  		pci_intx(dev, this->orig_intx);
>  
> -	if (this->enabled && !this->pinned)
> +	if (!this->pinned)
>  		pci_disable_device(dev);
>  }
>  
> @@ -441,14 +441,11 @@ int pcim_enable_device(struct pci_dev *pdev)
>  	dr = get_pci_dr(pdev);
>  	if (unlikely(!dr))
>  		return -ENOMEM;
> -	if (dr->enabled)
> -		return 0;
>  
>  	rc = pci_enable_device(pdev);
> -	if (!rc) {
> +	if (!rc)
>  		pdev->is_managed = 1;
> -		dr->enabled = 1;
> -	}
> +
>  	return rc;
>  }
>  EXPORT_SYMBOL(pcim_enable_device);
> @@ -466,7 +463,7 @@ void pcim_pin_device(struct pci_dev *pdev)
>  	struct pci_devres *dr;
>  
>  	dr = find_pci_dr(pdev);
> -	WARN_ON(!dr || !dr->enabled);
> +	WARN_ON(!dr || !pdev->enabled);
>  	if (dr)
>  		dr->pinned = 1;
>  }
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8dd711b9a291..04accdfab7ce 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2011,6 +2011,9 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	u16 cmd;
>  	u8 pin;
>  
> +	if (dev->enabled)
> +		return 0;
> +
>  	err = pci_set_power_state(dev, PCI_D0);
>  	if (err < 0 && err != -EIO)
>  		return err;
> @@ -2025,7 +2028,7 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	pci_fixup_device(pci_fixup_enable, dev);
>  
>  	if (dev->msi_enabled || dev->msix_enabled)
> -		return 0;
> +		goto success_out;
>  
>  	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
>  	if (pin) {
> @@ -2035,6 +2038,8 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  					      cmd & ~PCI_COMMAND_INTX_DISABLE);
>  	}
>  
> +success_out:
> +	dev->enabled = true;
>  	return 0;
>  }
>  
> @@ -2193,6 +2198,9 @@ static void do_pci_disable_device(struct pci_dev *dev)
>  {
>  	u16 pci_command;
>  
> +	if (!dev->enabled)
> +		return;
> +
>  	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
>  	if (pci_command & PCI_COMMAND_MASTER) {
>  		pci_command &= ~PCI_COMMAND_MASTER;
> @@ -2200,6 +2208,7 @@ static void do_pci_disable_device(struct pci_dev *dev)
>  	}
>  
>  	pcibios_disable_device(dev);
> +	dev->enabled = false;
>  }
>  
>  /**
> @@ -2227,12 +2236,6 @@ void pci_disable_enabled_device(struct pci_dev *dev)
>   */
>  void pci_disable_device(struct pci_dev *dev)
>  {
> -	struct pci_devres *dr;
> -
> -	dr = find_pci_dr(dev);
> -	if (dr)
> -		dr->enabled = 0;
> -
>  	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
>  		      "disabling already-disabled device");
>  
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 9fd50bc99e6b..e223e0f7dada 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -823,7 +823,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
>   * then remove them from here.
>   */
>  struct pci_devres {
> -	unsigned int enabled:1;
>  	unsigned int pinned:1;
>  	unsigned int orig_intx:1;
>  	unsigned int restore_intx:1;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 16493426a04f..110548f00b3b 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -367,6 +367,7 @@ struct pci_dev {
>  					   this is D0-D3, D0 being fully
>  					   functional, and D3 being off. */
>  	u8		pm_cap;		/* PM capability offset */
> +	unsigned int	enabled:1;	/* Whether this dev is enabled */
>  	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
>  	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
>  					   can be generated */
> -- 
> 2.45.0
> 
