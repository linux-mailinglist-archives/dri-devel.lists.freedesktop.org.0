Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE753178D7B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 10:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8770D6EAFB;
	Wed,  4 Mar 2020 09:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CDD6EAFB;
 Wed,  4 Mar 2020 09:33:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 01:33:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,513,1574150400"; d="scan'208";a="352054757"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 04 Mar 2020 01:33:24 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 04 Mar 2020 11:33:24 +0200
Date: Wed, 4 Mar 2020 11:33:24 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v6] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20200304093324.GI2540@lahna.fi.intel.com>
References: <20200303101052.133631-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303101052.133631-1-kherbst@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 03, 2020 at 11:10:52AM +0100, Karol Herbst wrote:
> Fixes state transitions of Nvidia Pascal GPUs from D3cold into higher dev=
ice
> states.

I think it is good to explain bit more here why this fix is needed.

> v2: convert to pci_dev quirk
>     put a proper technical explanation of the issue as a in-code comment
> v3: disable it only for certain combinations of intel and nvidia hardware
> v4: simplify quirk by setting flag on the GPU itself
> v5: restructure quirk to make it easier to add new IDs
>     fix whitespace issues
>     fix potential NULL pointer access
>     update the quirk documentation
> v6: move quirk into nouveau

This information typically goes under the '---' line.

> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: Mika Westerberg <mika.westerberg@intel.com>

I have few minor comments but regardless,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> Cc: linux-pci@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D205623
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 56 +++++++++++++++++++++++++++
>  drivers/pci/pci.c                     |  8 ++++
>  include/linux/pci.h                   |  1 +
>  3 files changed, 65 insertions(+)
> =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 2cd83849600f..51d3a7ba7731 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -618,6 +618,59 @@ nouveau_drm_device_fini(struct drm_device *dev)
>  	kfree(drm);
>  }
>  =

> +/*
> + * On some Intel PCIe bridge controllers doing a
> + * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappe=
ar.
> + * Skipping the intermediate D3hot step seems to make it work again. Thi=
se is
                                                                        ^^^=
^^
Thise -> This

> + * probably caused by not meeting the expectation the involved AML code =
has
> + * when the GPU is put into D3hot state before invoking it.
> + *
> + * This leads to various manifestations of this issue:
> + *  - AML code execution to power on the GPU hits an infinite loop (as t=
he
> + *    code waits on device memory to change).
> + *  - kernel crashes, as all PCI reads return -1, which most code isn't =
able
> + *    to handle well enough.
> + *
> + * In all cases dmesg will contain at least one line like this:
> + * 'nouveau 0000:01:00.0: Refused to change power state, currently in D3'
> + * followed by a lot of nouveau timeouts.
> + *
> + * In the \_SB.PCI0.PEG0.PG00._OFF code deeper down writes bit 0x80 to t=
he not
> + * documented PCI config space register 0x248 of the Intel PCIe bridge
> + * controller (0x1901) in order to change the state of the PCIe link bet=
ween
> + * the PCIe port and the GPU. There are alternative code paths using oth=
er
> + * registers, which seem to work fine (executed pre Windows 8):
> + *  - 0xbc bit 0x20 (publicly available documentation claims 'reserved')
> + *  - 0xb0 bit 0x10 (link disable)
> + * Changing the conditions inside the firmware by poking into the releva=
nt
> + * addresses does resolve the issue, but it seemed to be ACPI private me=
mory
> + * and not any device accessible memory at all, so there is no portable =
way of
> + * changing the conditions.
> + * On a XPS 9560 that means bits [0,3] on \CPEX need to be cleared.
> + *
> + * The only systems where this behavior can be seen are hybrid graphics =
laptops
> + * with a secondary Nvidia Maxwell, Pascal or Turing GPU. Its unclear wh=
eather
                                                             ^^^         ^^=
^^^^^^
Its -> It's
wheather -> whether

> + * this issue only occurs in combination with listed Intel PCIe bridge
> + * controllers and the mentioned GPUs or other devices as well.
> + *
> + * documentation on the PCIe bridge controller can be found in the
> + * "7th Generation Intel=AE Processor Families for H Platforms Datasheet=
 Volume 2"
> + * Section "12 PCI Express* Controller (x16) Registers"
> + */
> +
> +static void quirk_broken_nv_runpm(struct pci_dev *dev)
> +{
> +	struct pci_dev *bridge =3D pci_upstream_bridge(dev);
> +
> +	if (!bridge || bridge->vendor !=3D PCI_VENDOR_ID_INTEL)
> +		return;
> +
> +	switch (bridge->device) {
> +	case 0x1901:
> +		dev->parent_d3cold =3D 1;

I think it is better to add

		break;

here.

> +	}
> +}
> +
>  static int nouveau_drm_probe(struct pci_dev *pdev,
>  			     const struct pci_device_id *pent)
>  {
> @@ -699,6 +752,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto fail_drm_dev_init;
>  =

> +	quirk_broken_nv_runpm(pdev);
>  	return 0;
>  =

>  fail_drm_dev_init:
> @@ -737,6 +791,8 @@ nouveau_drm_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev =3D pci_get_drvdata(pdev);
>  =

> +	/* revert our workaround */
> +	pdev->parent_d3cold =3D false;
>  	nouveau_drm_device_remove(dev);
>  }
>  =

> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 951099279192..6ece05723fa2 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -860,6 +860,14 @@ static int pci_raw_set_power_state(struct pci_dev *d=
ev, pci_power_t state)
>  	   || (state =3D=3D PCI_D2 && !dev->d2_support))
>  		return -EIO;
>  =

> +	/*
> +	 * Power management can be disabled for certain devices as they don't
> +	 * come back up later on runtime_resume. We rely on platform means to
> +	 * cut power consumption instead (e.g. ACPI).
> +	 */
> +	if (state !=3D PCI_D0 && dev->parent_d3cold)
> +		return 0;
> +
>  	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
>  	if (pmcsr =3D=3D (u16) ~0) {
>  		pci_err(dev, "can't change power state from %s to %s (config space ina=
ccessible)\n",
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 930fab293073..3e5938b91966 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -340,6 +340,7 @@ struct pci_dev {
>  	unsigned int	no_d3cold:1;	/* D3cold is forbidden */
>  	unsigned int	bridge_d3:1;	/* Allow D3 for bridge */
>  	unsigned int	d3cold_allowed:1;	/* D3cold is allowed by user */
> +	unsigned int	parent_d3cold:1;	/* power manage the parent instead */

Just to be consistent with the other comments, start with a capital
letter:

	unsigned int	parent_d3cold:1;	/* Power manage the parent instead */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
