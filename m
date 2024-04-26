Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259E8B4205
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 00:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700F911AB0D;
	Fri, 26 Apr 2024 22:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YkQiD92S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E402111AB0D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 22:01:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A986B61FFD;
 Fri, 26 Apr 2024 22:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA96C113CD;
 Fri, 26 Apr 2024 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714168913;
 bh=0B4jfDu2o+/5GzQbm1NwCKmPp21jrNU2xpT2BElWQ/o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YkQiD92SVD+lguuWqk55xM5wzAVUM8eb1Xt4led/G7bUpt7IYsdxSUWCy7uPIQM+A
 CdpkSoyD4tvHAnWI4ErE8OF35yA85h7QNTs/evGc8mNFTSx4Nqf79MwE3WbSBmLonq
 +P4clbd9mC7z1aRMOPBRXNKZse7Y6VgAw9pD2jQZM40jC0VzXkx/aHGrjFgSmZrRiW
 VRQ1pqpyUL5RTq/5/4taMm0aZiUL9lTbxBN95Ws17krnL+6n73xw9qY8VYUCmgqGG3
 QWsFicZCDcg1o2KrPT3B0S4odVPe8W7JpqODcHBdiVE9pF5BNrUmBPvBpwEQbb7jCi
 +e35ur+Gws8Ig==
Date: Fri, 26 Apr 2024 17:01:50 -0500
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
Subject: Re: [PATCH v6 00/10] Make PCI's devres API more consistent
Message-ID: <20240426220150.GA608828@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77ee27e2f155abd340b166e2856181577fdf08cc.camel@redhat.com>
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

On Fri, Apr 26, 2024 at 10:07:02AM +0200, Philipp Stanner wrote:
> On Wed, 2024-04-24 at 15:12 -0500, Bjorn Helgaas wrote:
> > On Mon, Apr 08, 2024 at 10:44:12AM +0200, Philipp Stanner wrote:
> > > ...
> > > PCI's devres API suffers several weaknesses:
> > > 
> > > 1. There are functions prefixed with pcim_. Those are always
> > > managed
> > >    counterparts to never-managed functions prefixed with pci_ – or
> > > so one
> > >    would like to think. There are some apparently unmanaged
> > > functions
> > >    (all region-request / release functions, and pci_intx()) which
> > >    suddenly become managed once the user has initialized the device
> > > with
> > >    pcim_enable_device() instead of pci_enable_device(). This
> > > "sometimes
> > >    yes, sometimes no" nature of those functions is confusing and
> > >    therefore bug-provoking. In fact, it has already caused a bug in
> > > DRM.
> > >    The last patch in this series fixes that bug.
> > > 2. iomappings: Instead of giving each mapping its own callback, the
> > >    existing API uses a statically allocated struct tracking one
> > > mapping
> > >    per bar. This is not extensible. Especially, you can't create
> > >    _ranged_ managed mappings that way, which many drivers want.
> > > 3. Managed request functions only exist as "plural versions" with a
> > >    bit-mask as a parameter. That's quite over-engineered
> > > considering
> > >    that each user only ever mapps one, maybe two bars.
> > > 
> > > This series:
> > > - add a set of new "singular" devres functions that use devres the
> > > way
> > >   its intended, with one callback per resource.
> > > - deprecates the existing iomap-table mechanism.
> > > - deprecates the hybrid nature of pci_ functions.
> > > - preserves backwards compatibility so that drivers using the
> > > existing
> > >   API won't notice any changes.
> > > - adds documentation, especially some warning users about the
> > >   complicated nature of PCI's devres.
> > 
> > There's a lot of good work here; thanks for working on it.
> 
> Thanks!
> Good to get some more feedback from you
> 
> > 
> > > Philipp Stanner (10):
> > >   PCI: Add new set of devres functions
> > 
> > This first patch adds some infrastructure and several new exported
> > interfaces:
> > 
> >   void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> > const char *name)
> >   void pcim_iounmap_region(struct pci_dev *pdev, int bar)
> >   int pcim_request_region(struct pci_dev *pdev, int bar, const char
> > *name)
> >   void pcim_release_region(struct pci_dev *pdev, int bar)
> >   void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
> >   void __iomem *pcim_iomap_region_range(struct pci_dev *pdev, int
> > bar,
> >   void pcim_iounmap_region_range(struct pci_dev *pdev, int bar,
> > 
> > >   PCI: Deprecate iomap-table functions
> > 
> > This adds a little bit of infrastructure (add/remove to
> > legacy_table),
> > reimplements these existing interfaces:
> > 
> >   void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned
> > long maxlen)
> >   void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
> >   int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char
> > *name)
> >   int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
> >   void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
> > 
> > and adds a couple new exported interfaces:
> > 
> >   void pcim_release_all_regions(struct pci_dev *pdev)
> >   int pcim_request_all_regions(struct pci_dev *pdev, const char
> > *name)
> > 
> > There's a lot going on in these two patches, so they're hard to
> > review.  I think it would be easier if you could do the fixes to
> > existing interfaces first,
> 
> I agree that the patches can be further split into smaller chunks to
> make them more atomic and easier to review. I can do that.
> 
> BUT I'd need some more details about what you mean by "do the fixes
> first" – which fixes?
> The later patches at least in part rely on the new better functions
> being available.
> 
> > followed by adding new things, maybe
> > something like separate patches that:
> > 
> >   - Add pcim_addr_devres_alloc(), pcim_addr_devres_free(),
> >     pcim_addr_devres_clear().
> > 
> >   - Add pcim_add_mapping_to_legacy_table(),
> >     pcim_remove_mapping_from_legacy_table(),
> >     pcim_remove_bar_from_legacy_table().
> > 
> >   - Reimplement pcim_iomap(), pcim_iomap_regions(), pcim_iounmap().

This is the part I meant by "fixes", but maybe it's not so much a fix
as it is reimplementing based on different infrastructure.  The diffs
in "PCI: Deprecate iomap-table functions" for pcim_iomap() and
pcim_iounmap() are fairly straightforward and only depend on the
above.

pcim_iomap_regions() is a bit more complicated and probably needs
pcim_iomap_region() but not necessarily __pcim_request_region() and
__pcim_request_region_range().

This would be a pretty small patch and defer making them deprecated
until replacements are added.

> >   - Add new interfaces like pcim_iomap_region(),
> >     pcim_request_region(), etc.
> > 
> >     AFAICS, except for pcim_iomap_range() (used by vbox), these new
> >     interfaces have no users outside drivers/pci, so ... we might
> >     defer adding them, or at least defer exposing them via
> >     include/linux/pci.h, until we have users for them.
> 
> Dropping (the export of) functions like pcim_request_region_range() or
> pcim_request_all_regions() is not a problem.
> 
> What I quite fundamentally have to disagree with, however, is not to
> export the functions 
> 
>  * pcim_request_region()
>  * pcim_iomap_region()
> 
> the main point of this series is to deprecate that hybrid nature of
> those existing pci_* functions. You can only deprecate something when
> you provide users with new, better alternatives.

Right.  But the new alternatives are only better when there are actual
examples in the tree for people to look at.  If there are no users,
more interfaces are at best confusing and at worst dead code.

Bjorn
