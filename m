Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF728871E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 12:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610D6ECB2;
	Fri,  9 Oct 2020 10:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBFD6ECB2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 10:42:01 +0000 (UTC)
IronPort-SDR: oGSwBpxAtSSU8ohxtN2ikp3ZdZ6ClTFEhLu6kxaJKsKyNwPleuGaUNAb1//M5ULHExDD0rXBzR
 WE3hqa5s3G9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="144789955"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="144789955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 03:42:01 -0700
IronPort-SDR: D5eqKzTjS4VWkdDx7L10EJhvpJmbWpaNFT2AjYNswUUzxVgophba1dI0Vl4ciDLSRhrLHR2HwJ
 Z2f9ybtMlUDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316996829"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 09 Oct 2020 03:41:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Oct 2020 13:41:54 +0300
Date: Fri, 9 Oct 2020 13:41:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 17/17] drm/i915: Properly request PCI BARs
Message-ID: <20201009104154.GR6112@intel.com>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-18-daniel.vetter@ffwll.ch>
 <20201009094750.GQ6112@intel.com>
 <CAKMK7uH3o3hnRkTDqr93PR=wuRejpty+AbyMacoEFDDb6OgJeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH3o3hnRkTDqr93PR=wuRejpty+AbyMacoEFDDb6OgJeQ@mail.gmail.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 12:01:39PM +0200, Daniel Vetter wrote:
> On Fri, Oct 9, 2020 at 11:47 AM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Oct 09, 2020 at 09:59:34AM +0200, Daniel Vetter wrote:
> > > When trying to test my CONFIG_IO_STRICT_DEVMEM changes I realized they
> > > do nothing for i915. Because i915 doesn't request any regions, like
> > > pretty much all drm pci drivers. I guess this is some very old
> > > remnants from the userspace modesetting days, when we wanted to
> > > co-exist with the fbdev driver. Which usually requested these
> > > resources.
> > >
> > > But makes me wonder why the pci subsystem doesn't just request
> > > resource automatically when we map a bar and a pci driver is bound?
> > >
> > > Knowledge about which pci bars we need kludged together from
> > > intel_uncore.c and intel_gtt.c from i915 and intel-gtt.c over in the
> > > fake agp driver.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Kees Cook <keescook@chromium.org>
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> > > Cc: Jan Kara <jack@suse.cz>
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: linux-pci@vger.kernel.org
> > > ---
> > >  drivers/gpu/drm/i915/intel_uncore.c | 25 +++++++++++++++++++++++--
> > >  1 file changed, 23 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i9=
15/intel_uncore.c
> > > index 54e201fdeba4..ce39049d8919 100644
> > > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > > @@ -1692,10 +1692,13 @@ static int uncore_mmio_setup(struct intel_unc=
ore *uncore)
> > >       struct pci_dev *pdev =3D i915->drm.pdev;
> > >       int mmio_bar;
> > >       int mmio_size;
> > > +     int bar_selection;
> >
> > Signed bitmasks always make me uneasy. But looks like
> > that's what it is in the pci api. So meh.
> =

> Yeah it's surprising.
> =

> > > +     int ret;
> > >
> > >       mmio_bar =3D IS_GEN(i915, 2) ? 1 : 0;
> > > +     bar_selection =3D BIT (2) | BIT(mmio_bar);
> >                            ^
> > spurious space
> >
> > That's also not correct for gen2 I think.
> >
> > gen2:
> > 0 =3D GMADR
> > 1 =3D MMADR
> > 2 =3D IOBAR
> >
> > gen3:
> > 0 =3D MMADR
> > 1 =3D IOBAR
> > 2 =3D GMADR
> > 3 =3D GTTADR
> >
> > gen4+:
> > 0+1 =3D GTTMMADR
> > 2+3 =3D GMADR
> > 4 =3D IOBAR
> >
> > Maybe we should just have an explicit list of bars like that in a
> > comment?
> >
> > I'd also suggest sucking this bitmask calculation into a small helper
> > so you can reuse it for the release.
> =

> tbh I just hacked this up for testing. Given how almost no other drm
> driver does this, I'm wondering whether we should or not.
> =

> Also the only reason why I didn't just use the pci_request_regions
> helper is to avoid the vga ioport range, since that's managed by
> vgaarbiter.

VGA io range isn't part of any bar. Or do you mean just the io decode
enable bit in the pci command register? That should be just a matter
or pci_enable_device() vs. pci_enable_device_mem() I think. So nothing
to do with which bars we've requested IIRC.

> =

> So I think if we go for this for real we should:
> - register the vga ioport range in the vgaarbiter
> - have a pci_request_iomem_regions helper that grabs all mem bars
> - roll that out to all drm pci drivers
> =

> Or something like that. The other complication is when we resize the
> iobar. So not really sure what to do here.

We resize it?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
