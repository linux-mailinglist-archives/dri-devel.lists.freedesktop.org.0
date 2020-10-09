Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC3E288651
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 11:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94D6EC99;
	Fri,  9 Oct 2020 09:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51306EC45
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 09:47:59 +0000 (UTC)
IronPort-SDR: /aGUbohTAHHNs5HGJBCwErqmNZikWiPQXoA97dhkQlkaZ5k2s/QHaIHvHq+6nBwsBSCa3N8iOL
 uVOeR4HoULuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165526437"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165526437"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 02:47:58 -0700
IronPort-SDR: pPywwhoQ8IZ0oqnSyAy7Si9u7fhcqFsuiRTRfdjMWfQODPzT5+PsDTX8QsBMudIyk2KOf3VcKr
 TS88VD5e6ZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="298385120"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 09 Oct 2020 02:47:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Oct 2020 12:47:50 +0300
Date: Fri, 9 Oct 2020 12:47:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 17/17] drm/i915: Properly request PCI BARs
Message-ID: <20201009094750.GQ6112@intel.com>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-18-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009075934.3509076-18-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 09:59:34AM +0200, Daniel Vetter wrote:
> When trying to test my CONFIG_IO_STRICT_DEVMEM changes I realized they
> do nothing for i915. Because i915 doesn't request any regions, like
> pretty much all drm pci drivers. I guess this is some very old
> remnants from the userspace modesetting days, when we wanted to
> co-exist with the fbdev driver. Which usually requested these
> resources.
> =

> But makes me wonder why the pci subsystem doesn't just request
> resource automatically when we map a bar and a pci driver is bound?
> =

> Knowledge about which pci bars we need kludged together from
> intel_uncore.c and intel_gtt.c from i915 and intel-gtt.c over in the
> fake agp driver.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index 54e201fdeba4..ce39049d8919 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1692,10 +1692,13 @@ static int uncore_mmio_setup(struct intel_uncore =
*uncore)
>  	struct pci_dev *pdev =3D i915->drm.pdev;
>  	int mmio_bar;
>  	int mmio_size;
> +	int bar_selection;

Signed bitmasks always make me uneasy. But looks like
that's what it is in the pci api. So meh.

> +	int ret;
>  =

>  	mmio_bar =3D IS_GEN(i915, 2) ? 1 : 0;
> +	bar_selection =3D BIT (2) | BIT(mmio_bar);
                           ^
spurious space			   =


That's also not correct for gen2 I think.

gen2:
0 =3D GMADR
1 =3D MMADR
2 =3D IOBAR

gen3:
0 =3D MMADR
1 =3D IOBAR
2 =3D GMADR
3 =3D GTTADR

gen4+:
0+1 =3D GTTMMADR
2+3 =3D GMADR
4 =3D IOBAR

Maybe we should just have an explicit list of bars like that in a
comment?

I'd also suggest sucking this bitmask calculation into a small helper
so you can reuse it for the release.

>  	/*
> -	 * Before gen4, the registers and the GTT are behind different BARs.
> +	 * On gen3 the registers and the GTT are behind different BARs.
>  	 * However, from gen4 onwards, the registers and the GTT are shared
>  	 * in the same BAR, so we want to restrict this ioremap from
>  	 * clobbering the GTT which we want ioremap_wc instead. Fortunately,
> @@ -1703,6 +1706,8 @@ static int uncore_mmio_setup(struct intel_uncore *u=
ncore)
>  	 * generations up to Ironlake.
>  	 * For dgfx chips register range is expanded to 4MB.
>  	 */
> +	if (INTEL_GEN(i915) =3D=3D 3)
> +		bar_selection |=3D BIT(3);
>  	if (INTEL_GEN(i915) < 5)
>  		mmio_size =3D 512 * 1024;
>  	else if (IS_DGFX(i915))
> @@ -1710,8 +1715,15 @@ static int uncore_mmio_setup(struct intel_uncore *=
uncore)
>  	else
>  		mmio_size =3D 2 * 1024 * 1024;
>  =

> +	ret =3D pci_request_selected_regions(pdev, bar_selection, "i915");
> +	if (ret < 0) {
> +		drm_err(&i915->drm, "failed to request pci bars\n");
> +		return ret;
> +	}
> +
>  	uncore->regs =3D pci_iomap(pdev, mmio_bar, mmio_size);
>  	if (uncore->regs =3D=3D NULL) {
> +		pci_release_selected_regions(pdev, bar_selection);
>  		drm_err(&i915->drm, "failed to map registers\n");
>  		return -EIO;
>  	}
> @@ -1721,9 +1733,18 @@ static int uncore_mmio_setup(struct intel_uncore *=
uncore)
>  =

>  static void uncore_mmio_cleanup(struct intel_uncore *uncore)
>  {
> -	struct pci_dev *pdev =3D uncore->i915->drm.pdev;
> +	struct drm_i915_private *i915 =3D uncore->i915;
> +	struct pci_dev *pdev =3D i915->drm.pdev;
> +	int mmio_bar;
> +	int bar_selection;
> +
> +	mmio_bar =3D IS_GEN(i915, 2) ? 1 : 0;
> +	bar_selection =3D BIT (2) | BIT(mmio_bar);
> +	if (INTEL_GEN(i915) =3D=3D 3)
> +		bar_selection |=3D BIT(3);
>  =

>  	pci_iounmap(pdev, uncore->regs);
> +	pci_release_selected_regions(pdev, bar_selection);
>  }
>  =

>  void intel_uncore_init_early(struct intel_uncore *uncore,
> -- =

> 2.28.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
