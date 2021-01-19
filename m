Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81722FBAF3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 16:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7156E2D7;
	Tue, 19 Jan 2021 15:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10F56E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 15:20:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01D6B23110;
 Tue, 19 Jan 2021 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611069643;
 bh=yf0s5Hnc71ZDmBnzFPUIWJfODcCah0cMw3TOXpxitO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OPWVYTJT0MTCcxZuwblNq7+3b1gj+nFAHJTjvYu2HvxCc6I0hXTJ1f99Hx6kObw9S
 3T2zTE+1KLE5UAjzDJOua6M3j09lPQu2AAaG1L6v07ro43OEJU5gr+mMkZZEm9L8xP
 K02wA0GlOA5PZ2VRAsLSociEkRhvBkyr0kwkafUk=
Date: Tue, 19 Jan 2021 16:20:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7 12/17] PCI: Revoke mappings like devmem
Message-ID: <YAb4yD4IbpQ3qhJG@kroah.com>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
 <20201127164131.2244124-13-daniel.vetter@ffwll.ch>
 <CAKMK7uGrdDrbtj0OyzqQc0CGrQwc2F3tFJU9vLfm2jjufAZ5YQ@mail.gmail.com>
 <YAbtZBU5PMr68q9E@kroah.com>
 <CAKMK7uGHSgetm7mDso6_vj+aGrR4u+ChwHb3k0QvgG0K6X2fPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGHSgetm7mDso6_vj+aGrR4u+ChwHb3k0QvgG0K6X2fPg@mail.gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 03:34:47PM +0100, Daniel Vetter wrote:
> On Tue, Jan 19, 2021 at 3:32 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jan 19, 2021 at 09:17:55AM +0100, Daniel Vetter wrote:
> > > On Fri, Nov 27, 2020 at 5:42 PM Daniel Vetter <daniel.vetter@ffwll.ch=
> wrote:
> > > >
> > > > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > > > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > > > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this =
is
> > > > the default for all driver uses.
> > > >
> > > > Except there's two more ways to access PCI BARs: sysfs and proc mmap
> > > > support. Let's plug that hole.
> > > >
> > > > For revoke_devmem() to work we need to link our vma into the same
> > > > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > > > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > > > mapping we need to adjust vma->vm_file->f_mapping. The cleanest way=
 is
> > > > to adjust this at at ->open time:
> > > >
> > > > - for sysfs this is easy, now that binary attributes support this. =
We
> > > >   just set bin_attr->mapping when mmap is supported
> > > > - for procfs it's a bit more tricky, since procfs pci access has on=
ly
> > > >   one file per device, and access to a specific resources first nee=
ds
> > > >   to be set up with some ioctl calls. But mmap is only supported for
> > > >   the same resources as sysfs exposes with mmap support, and otherw=
ise
> > > >   rejected, so we can set the mapping unconditionally at open time
> > > >   without harm.
> > > >
> > > > A special consideration is for arch_can_pci_mmap_io() - we need to
> > > > make sure that the ->f_mapping doesn't alias between ioport and iom=
em
> > > > space. There's only 2 ways in-tree to support mmap of ioports: gene=
ric
> > > > pci mmap (ARCH_GENERIC_PCI_MMAP_RESOURCE), and sparc as the single
> > > > architecture hand-rolling. Both approach support ioport mmap throug=
h a
> > > > special pfn range and not through magic pte attributes. Aliasing is
> > > > therefore not a problem.
> > > >
> > > > The only difference in access checks left is that sysfs PCI mmap do=
es
> > > > not check for CAP_RAWIO. I'm not really sure whether that should be
> > > > added or not.
> > > >
> > > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: Kees Cook <keescook@chromium.org>
> > > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > > Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> > > > Cc: Jan Kara <jack@suse.cz>
> > > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Cc: linux-samsung-soc@vger.kernel.org
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > > Cc: linux-pci@vger.kernel.org
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > --
> > > > v2:
> > > > - Totally new approach: Adjust filp->f_mapping at open time. Note t=
hat
> > > >   this now works on all architectures, not just those support
> > > >   ARCH_GENERIC_PCI_MMAP_RESOURCE
> > > > ---
> > > >  drivers/pci/pci-sysfs.c | 4 ++++
> > > >  drivers/pci/proc.c      | 1 +
> > > >  2 files changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > > index d15c881e2e7e..3f1c31bc0b7c 100644
> > > > --- a/drivers/pci/pci-sysfs.c
> > > > +++ b/drivers/pci/pci-sysfs.c
> > > > @@ -929,6 +929,7 @@ void pci_create_legacy_files(struct pci_bus *b)
> > > >         b->legacy_io->read =3D pci_read_legacy_io;
> > > >         b->legacy_io->write =3D pci_write_legacy_io;
> > > >         b->legacy_io->mmap =3D pci_mmap_legacy_io;
> > > > +       b->legacy_io->mapping =3D iomem_get_mapping();
> > > >         pci_adjust_legacy_attr(b, pci_mmap_io);
> > > >         error =3D device_create_bin_file(&b->dev, b->legacy_io);
> > > >         if (error)
> > > > @@ -941,6 +942,7 @@ void pci_create_legacy_files(struct pci_bus *b)
> > > >         b->legacy_mem->size =3D 1024*1024;
> > > >         b->legacy_mem->attr.mode =3D 0600;
> > > >         b->legacy_mem->mmap =3D pci_mmap_legacy_mem;
> > > > +       b->legacy_io->mapping =3D iomem_get_mapping();
> > >
> > > Unlike the normal pci stuff below, the legacy files here go boom
> > > because they're set up much earlier in the boot sequence. This only
> > > affects HAVE_PCI_LEGACY architectures, which aren't that many. So what
> > > should we do here now:
> > > - drop the devmem revoke for these
> > > - rework the init sequence somehow to set up these files a lot later
> > > - redo the sysfs patch so that it doesn't take an address_space
> > > pointer, but instead a callback to get at that (since at open time
> > > everything is set up). Imo rather ugly
> > > - ditch this part of the series (since there's not really any takers
> > > for the latter parts it might just not make sense to push for this)
> > > - something else?
> > >
> > > Bjorn, Greg, thoughts?
> >
> > What sysfs patch are you referring to here?
> =

> Currently in linux-next:
> =

> commit 74b30195395c406c787280a77ae55aed82dbbfc7 (HEAD ->
> topic/iomem-mmap-vs-gup, drm/topic/iomem-mmap-vs-gup)
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri Nov 27 17:41:25 2020 +0100
> =

>    sysfs: Support zapping of binary attr mmaps
> =

> Or the patch right before this one in this submission here:
> =

> https://lore.kernel.org/dri-devel/20201127164131.2244124-12-daniel.vetter=
@ffwll.ch/

Ah.  Hm, a callback in the sysfs file logic seems really hairy, so I
would prefer that not happen.  If no one really needs this stuff, why
not just drop it like you mention?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
