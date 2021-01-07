Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E392EE78A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBFB6E4B7;
	Thu,  7 Jan 2021 21:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0A6E4B7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 21:17:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB48623441;
 Thu,  7 Jan 2021 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610054279;
 bh=5uoZNAJGLvzV9shzy8WW8XkIqE6H2k9ymeZVJrOtI2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ofjJMoRrimEABG4LRevwmiB41Ps4MRs38jGoi36wqXyh0ztgxlE33oPjaXvjh6rHE
 wPttEqAFZ6h3AWNUiJa5r5nrUlo62dnEGh0LKEdRdjXqNUQKmv311SKXiQPda9Zag4
 GHFQpxrlpVZdPDYB1Cf0nrjsmd0AkSxsZaWguM0rjEsuUVTjNAzsd42SjdCFT4JBqp
 hfqY8/NR0LbT8qUp2XpGwD7+0QyP8CEwcNseC6wV4Pt6G6ZJcylNgkWKingruevsXr
 OJAL2+xlCM0KsQwXPKX1b91RGVkW9uimIq56efrdjV3Ntvmqyc6xqlMeOqpIsmKwja
 Rtol1IwF0trQg==
Date: Thu, 7 Jan 2021 15:17:57 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nirmoy Das <nirmoy.das@amd.com>
Subject: Re: [PATCH 2/4] PCI: Add pci_rebar_bytes_to_size()
Message-ID: <20210107211757.GA1391831@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107175017.15893-3-nirmoy.das@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 devspam@moreofthesa.me.uk, linux-pci@vger.kernel.org, bhelgaas@google.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 06:50:15PM +0100, Nirmoy Das wrote:
> Users of pci_resize_resource() need a way to calculate bar size
> from desired bytes. Add a helper function and export it so that
> modular drivers can use it.

s/bar/BAR/

> Signed-off-by: Darren Salt <devspam@moreofthesa.me.uk>
> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci.c   | 2 +-
>  include/linux/pci.h | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index ef80ed451415..16216186b51c 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1648,7 +1648,7 @@ static void pci_restore_rebar_state(struct pci_dev =
*pdev)
>  		pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
>  		bar_idx =3D ctrl & PCI_REBAR_CTRL_BAR_IDX;
>  		res =3D pdev->resource + bar_idx;
> -		size =3D ilog2(resource_size(res)) - 20;
> +		size =3D pci_rebar_bytes_to_size(resource_size(res));
>  		ctrl &=3D ~PCI_REBAR_CTRL_BAR_SIZE;
>  		ctrl |=3D size << PCI_REBAR_CTRL_BAR_SHIFT;
>  		pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 9999040cfad9..77fed01523e0 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1226,6 +1226,12 @@ void pci_update_resource(struct pci_dev *dev, int =
resno);
>  int __must_check pci_assign_resource(struct pci_dev *dev, int i);
>  int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resou=
rce_size_t add_size, resource_size_t align);
>  void pci_release_resource(struct pci_dev *dev, int resno);
> +static inline int pci_rebar_bytes_to_size(u64 bytes)
> +{
> +	bytes =3D roundup_pow_of_two(bytes);
> +	return max(ilog2(bytes), 20) - 20;

This isn't returning a "size", is it?  It looks like it's returning
the log2 of the number of MB the BAR will be, i.e., the encoding used
by the Resizable BAR Control register "BAR Size" field.  Needs a brief
comment to that effect and/or a different function name.

> +}
> +
>  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
>  int __must_check pci_resize_resource(struct pci_dev *dev, int i, int siz=
e);
>  int pci_select_bars(struct pci_dev *dev, unsigned long flags);
> -- =

> 2.29.2
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
