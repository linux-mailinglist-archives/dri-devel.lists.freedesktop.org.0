Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B72EE7A7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE7E6E4B7;
	Thu,  7 Jan 2021 21:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430216E4B7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 21:32:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD44A235DD;
 Thu,  7 Jan 2021 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610055162;
 bh=2Gw67ighF9gjZ9mw0RGh6CWP9hvRpTNaH/97IY+bSZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=CrKdDYhXy0UMx0fPLaKrkzGnFaHTKSyCL5I4t6v6wImCfmzRjkx0Y+z6iVVqQ8CjF
 2W1wMoWLhXYZbRh/C7z3OvuzJWbBymwSMiNLtpFmk17gTZl3FFmNgxdYGx1Yf/XXxK
 2rtJtumStwMfhLx2o3Vs0x7WiyT9ql2JMxDM9MfNlNEqvQerGqri7wBDnILsmFsPkM
 Cd8ylwszvOkpquzTDwuNoz28IEn7yvvakoyN9YzGlb7tNyDUAY5V3VbuFSiu6RYWqU
 UAR4N37u7m9PfMTVI0vkhTSON1x9dS8Z70JUve1ucPWbdW5V92ICEULrFetDifrEHb
 OnU9bSzFBLWuQ==
Date: Thu, 7 Jan 2021 15:32:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nirmoy Das <nirmoy.das@amd.com>
Subject: Re: [PATCH 4/4] PCI: Add a REBAR size quirk for Sapphire RX 5600 XT
 Pulse
Message-ID: <20210107213240.GA1392833@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107175017.15893-5-nirmoy.das@amd.com>
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
Cc: kernel test robot <lkp@intel.com>, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, devspam@moreofthesa.me.uk,
 linux-pci@vger.kernel.org, bhelgaas@google.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 06:50:17PM +0100, Nirmoy Das wrote:
> RX 5600 XT Pulse advertises support for BAR0 being 256MB, 512MB,
> or 1GB, but it also supports 2GB, 4GB, and 8GB. Add a rebar
> size quirk so that CPU can fully access the BAR0.

This isn't quite accurate.  The CPU can fully access BAR 0 no matter
what.  I think the problem you're solving is that without this quirk,
BAR 0 isn't big enough to cover the VRAM.

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

IIRC, these Reported-by lines are from the "cap =3D=3D 0x3f0" problem.  It
would make sense to include these if this patch fixed that problem in
something that had already been merged.  But this *hasn't* been
merged, so these lines only make sense to someone who trawls through
the mailing list to find the previous version.

I don't really think it's worthwhile to include them.  It's the same
as giving credit to reviewers, which we typically don't do except via
a Reviewed-by tag (which I think is too strong for this case) or a
"v2" changes note after the "---" line.  That doesn't get included in
the git history, but is easily findable via the Link: tags as below.

If you merge these via a non-PCI tree, please include the "Link:"
lines in the PCI patches, e.g.,

  Link: https://lore.kernel.org/r/20210107175017.15893-5-nirmoy.das@amd.com

for this one.  Obviously the link is different for each patch and will
change if you repost the series.

I'm not sure why you put the amd patch in the middle of the series.
Seems like it would be slightly prettier and just as safe to put it at
the end.

> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Let me know if you want me to take the series.

> ---
>  drivers/pci/pci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 16216186b51c..b061bbd4afb1 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3577,7 +3577,14 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *p=
dev, int bar)
>  		return 0;
>  =

>  	pci_read_config_dword(pdev, pos + PCI_REBAR_CAP, &cap);
> -	return (cap & PCI_REBAR_CAP_SIZES) >> 4;
> +	cap =3D (cap & PCI_REBAR_CAP_SIZES) >> 4;
> +
> +	/* Sapphire RX 5600 XT Pulse has an invalid cap dword for BAR 0 */
> +	if (pdev->vendor =3D=3D PCI_VENDOR_ID_ATI && pdev->device =3D=3D 0x731f=
 &&
> +	    bar =3D=3D 0 && cap =3D=3D 0x700)
> +		cap =3D 0x3f00;

I think this is structured wrong.  It should be like this so it's
easier to match with the spec:

  cap &=3D PCI_REBAR_CAP_SIZES;

  if (... && cap =3D=3D 0x7000)
    cap =3D 0x3f000;

  return cap >> 4;

> +
> +	return cap;
>  }
>  EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
>  =

> -- =

> 2.29.2
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
