Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9110317286
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 22:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3186ECE8;
	Wed, 10 Feb 2021 21:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C456ECE8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 21:40:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 567E564EDF;
 Wed, 10 Feb 2021 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612993254;
 bh=f44NPsIKdvVz4sgR73Jy/yomvy3TJguxverZulfIkv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LDqSvUKK/dUgih+SoexCs2NpBSymHqLD605AiZy5maqEI/6AXrW+0vdTCv29oBcMY
 YCFOw/3wWb5caauRzNrqcxwD3sCdCJqnzWaAH63oGNWvDmcMwvcbp1ctcxDIx58LX3
 uYloZZbhn4lEJKGkImgCuUFSGFdF/tLpU9VsdRNoacSf8dmHkmo0BKK7UNh4w4lkJu
 /XENEBx69/iQ83muLFq1rWDQ9od8Owbknpii8zdqtmgbKMkvaJXWRb5syq+u/1u2rS
 ZCC/XOr8dUuEvj/3xCBcOgyFQxtUgHARvza/bW3yo2UMR9/W7LVDY0BaJBHaMhQIgN
 OY6ZR9sRLKOqg==
Date: Wed, 10 Feb 2021 15:40:53 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] PCI: Also set up legacy files only after sysfs init
Message-ID: <20210210214053.GA610964@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
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
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 02:36:32PM +0100, Daniel Vetter wrote:
> We are already doing this for all the regular sysfs files on PCI
> devices, but not yet on the legacy io files on the PCI buses. Thus far
> no problem, but in the next patch I want to wire up iomem revoke
> support. That needs the vfs up and running already to make sure that
> iomem_get_mapping() works.
> =

> Wire it up exactly like the existing code in
> pci_create_sysfs_dev_files(). Note that pci_remove_legacy_files()
> doesn't need a check since the one for pci_bus->legacy_io is
> sufficient.
> =

> An alternative solution would be to implement a callback in sysfs to
> set up the address space from iomem_get_mapping() when userspace calls
> mmap(). This also works, but Greg didn't really like that just to work
> around an ordering issue when the kernel loads initially.
> =

> v2: Improve commit message (Bjorn)
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I wish we weren't extending a known-racy mechanism to do this, but at
least we're not *adding* a brand new race.

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
