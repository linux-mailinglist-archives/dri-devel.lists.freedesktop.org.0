Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285B830FF92
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 22:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0456EE6F;
	Thu,  4 Feb 2021 21:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46496EE6F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 21:50:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE39E64E7B;
 Thu,  4 Feb 2021 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612475421;
 bh=PmEJQCCq9oY53CiWzcFwaIPerZi1rEcWvCOS/uKzoFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=WequWrptF4WjW06B0BSUo7SbQyS+KfQGTGsiwm9iU60B1NVylYXeQTl1fDMqGEAta
 JReU0y9ygCPvABAqgwOcutNNywGESDTlzpSVpa71m4FE3QbAvRkhhat3S6RiIlTcUp
 JTlugHTATg5QaP5m/I3pbdjVLEpFTHshnXMOKWLoRlKOwLXYCMra/+GuRzRq+eo1R5
 NXgth8yVgN34gF7h+9aDUld5QrUiafvq/6NBCwTxrkKWRXbUTpNg+dEM/GObX4l1j2
 XB9A4pGG+h3SKSszPKJM5hdYb33urnHHvJOVqsyf9D4QgjMSmA4NenhdmbdpN2zBhS
 pu0QMV7je4d5Q==
Date: Thu, 4 Feb 2021 15:50:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] PCI: also set up legacy files only after sysfs init
Message-ID: <20210204215019.GA104698@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204165831.2703772-2-daniel.vetter@ffwll.ch>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+cc Oliver, Pali, Krzysztof]

s/also/Also/ in subject

On Thu, Feb 04, 2021 at 05:58:30PM +0100, Daniel Vetter wrote:
> We are already doing this for all the regular sysfs files on PCI
> devices, but not yet on the legacy io files on the PCI buses. Thus far
> now problem, but in the next patch I want to wire up iomem revoke
> support. That needs the vfs up an running already to make so that
> iomem_get_mapping() works.

s/now problem/no problem/
s/an running/and running/
s/so that/sure that/ ?

iomem_get_mapping() doesn't exist; I don't know what that should be.

> Wire it up exactly like the existing code. Note that
> pci_remove_legacy_files() doesn't need a check since the one for
> pci_bus->legacy_io is sufficient.

I'm not sure exactly what you mean by "the existing code."  I could
probably figure it out, but it would save time to mention the existing
function here.

This looks like another instance where we should really apply Oliver's
idea of converting these to attribute_groups [1].

The cover letter mentions options discussed with Greg in [2], but I
don't think the "sysfs_initialized" hack vs attribute_groups was part
of that discussion.

It's not absolutely a show-stopper, but it *is* a shame to extend the
sysfs_initialized hack if attribute_groups could do this more cleanly
and help solve more than one issue.

Bjorn

[1] https://lore.kernel.org/r/CAOSf1CHss03DBSDO4PmTtMp0tCEu5kScn704ZEwLKGXQ=
zBfqaA@mail.gmail.com
[2] https://lore.kernel.org/dri-devel/CAKMK7uGrdDrbtj0OyzqQc0CGrQwc2F3tFJU9=
vLfm2jjufAZ5YQ@mail.gmail.com/

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/pci/pci-sysfs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index fb072f4b3176..0c45b4f7b214 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -927,6 +927,9 @@ void pci_create_legacy_files(struct pci_bus *b)
>  {
>  	int error;
>  =

> +	if (!sysfs_initialized)
> +		return;
> +
>  	b->legacy_io =3D kcalloc(2, sizeof(struct bin_attribute),
>  			       GFP_ATOMIC);
>  	if (!b->legacy_io)
> @@ -1448,6 +1451,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pde=
v)
>  static int __init pci_sysfs_init(void)
>  {
>  	struct pci_dev *pdev =3D NULL;
> +	struct pci_bus *pbus =3D NULL;
>  	int retval;
>  =

>  	sysfs_initialized =3D 1;
> @@ -1459,6 +1463,9 @@ static int __init pci_sysfs_init(void)
>  		}
>  	}
>  =

> +	while ((pbus =3D pci_find_next_bus(pbus)))
> +		pci_create_legacy_files(pbus);
> +
>  	return 0;
>  }
>  late_initcall(pci_sysfs_init);
> -- =

> 2.30.0
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
