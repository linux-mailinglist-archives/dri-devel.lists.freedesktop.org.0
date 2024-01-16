Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9482F45A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 19:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECCD10E56A;
	Tue, 16 Jan 2024 18:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E27910E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 18:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5B35CE1919;
 Tue, 16 Jan 2024 18:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A09C433C7;
 Tue, 16 Jan 2024 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705430118;
 bh=MnY2gVubEGri9ggkfjnpG/sTnNx4BdvXPjR2PSZ83GE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=iKtlOPFqFaAmH1K/7wOYsOyKeMSUCGDMwgk42s0cLKwHQqKxXxyXfCYNB29supvRu
 lxMM/8gNABx8D8EG1w2Kw6Cn64lBlbWD4PBfKqihB3SXSNxOOazlhcv58mZDz1SrPc
 whI157N2nOgTtOzEIgp332p44e+vjwsXduG5IANcIivFsg79jF77pVzcvclKrhhbNN
 jUQDLi1u+uwWAFjw4ddjRpN2/7hIzFpFmrzbU0Yl5PNucgdthNjRiBUp1xQ5aa/daj
 jUU13N7bJwOO8S4VBFEHMTKci0a4DM4GNNmvw0tRFb6cU/AZyMPuW4JnSy/As8ofsP
 LV9qr1N44b3ZQ==
Date: Tue, 16 Jan 2024 12:35:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 07/10] pci: devres: give mwi its own callback
Message-ID: <20240116183516.GA101535@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-9-pstanner@redhat.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 03:46:18PM +0100, Philipp Stanner wrote:
> managing mwi with devres can easily be done with its own callback,
> without the necessity to store any state about it in a device-related
> struct.

s/managing/Managing/

s/mwi/MWI/ since this is an initialism.  Also in subject (but would be
even better if it could mention an actual function name).

> Remove the mwi state from the devres-struct.
> Make the devres-mwi functions set a separate devres-callback.

Wrap to fill 75 columns (or add blank lines if you intend multiple
paragraphs).

s/devres-struct/struct pci_devres/ to make this greppable.

s/the devres-mwi functions/pcim_set_mwi()/ similarly.

> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 23 +++++++++++------------
>  drivers/pci/pci.h    |  1 -
>  2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index de8cf6f87dd7..911c2037d9fd 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -378,24 +378,26 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
>  }
>  EXPORT_SYMBOL(devm_pci_remap_cfg_resource);
>  
> +static void __pcim_clear_mwi(void *pdev_raw)
> +{
> +	struct pci_dev *pdev = pdev_raw;
> +
> +	pci_clear_mwi(pdev);
> +}
> +
>  /**
>   * pcim_set_mwi - a device-managed pci_set_mwi()
> - * @dev: the PCI device for which MWI is enabled
> + * @pdev: the PCI device for which MWI is enabled
>   *
>   * Managed pci_set_mwi().
>   *
>   * RETURNS: An appropriate -ERRNO error value on error, or zero for success.
>   */
> -int pcim_set_mwi(struct pci_dev *dev)
> +int pcim_set_mwi(struct pci_dev *pdev)
>  {
> -	struct pci_devres *dr;
> -
> -	dr = find_pci_dr(dev);
> -	if (!dr)
> -		return -ENOMEM;
> +	devm_add_action(&pdev->dev, __pcim_clear_mwi, pdev);
>  
> -	dr->mwi = 1;
> -	return pci_set_mwi(dev);
> +	return pci_set_mwi(pdev);
>  }
>  EXPORT_SYMBOL(pcim_set_mwi);
>  
> @@ -405,9 +407,6 @@ static void pcim_release(struct device *gendev, void *res)
>  	struct pci_dev *dev = to_pci_dev(gendev);
>  	struct pci_devres *this = res;
>  
> -	if (this->mwi)
> -		pci_clear_mwi(dev);
> -
>  	if (this->restore_intx)
>  		pci_intx(dev, this->orig_intx);
>  
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 3d9908a69ebf..667bfdd61d5e 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -811,7 +811,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
>  struct pci_devres {
>  	unsigned int orig_intx:1;
>  	unsigned int restore_intx:1;
> -	unsigned int mwi:1;
>  };
>  
>  struct pci_devres *find_pci_dr(struct pci_dev *pdev);
> -- 
> 2.43.0
> 
