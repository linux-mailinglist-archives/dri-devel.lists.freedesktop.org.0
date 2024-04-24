Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2AD8B1436
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA0010E949;
	Wed, 24 Apr 2024 20:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FcNalWWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FA710E949
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 20:12:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DE6FCE1827;
 Wed, 24 Apr 2024 20:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D1BC113CD;
 Wed, 24 Apr 2024 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713989551;
 bh=l1RGYmYQuIqY4fDQ48B8iWBxN7iKGEFcCbhtbIhBmrE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FcNalWWxpCc4o499SxiFn2Cwa8YJLOHHzrNRUz8AXiOhIPU37REbmJfFyL7TcHVOe
 SCbR6x276i0hcxXD6oLp/YQYcj1wPVJNbrBA1pH3sP3B/6RYKWG52mX2WGXDVZW0jj
 dLjfsL0eXY14W7to1URhERVGxMMQtvpy++eJplf4diEk5Na7tvyIkiU4w1nh18q+yJ
 m9sETJCH6vMmsWCd7b8L6yNzcx/lLrsZL5j38+2RikjiXS26tbFHYzH9oaQ7DyLnej
 sJHR1S4R1XLwDkN50wQdvhuYvOemESHhPPE/A5gGnZY4yFTbUO4rDFna4NUTMiMwV3
 M/rsBId6Kx/7Q==
Date: Wed, 24 Apr 2024 15:12:29 -0500
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
Message-ID: <20240424201229.GA503230@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408084423.6697-1-pstanner@redhat.com>
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

On Mon, Apr 08, 2024 at 10:44:12AM +0200, Philipp Stanner wrote:
> ...
> PCI's devres API suffers several weaknesses:
> 
> 1. There are functions prefixed with pcim_. Those are always managed
>    counterparts to never-managed functions prefixed with pci_ – or so one
>    would like to think. There are some apparently unmanaged functions
>    (all region-request / release functions, and pci_intx()) which
>    suddenly become managed once the user has initialized the device with
>    pcim_enable_device() instead of pci_enable_device(). This "sometimes
>    yes, sometimes no" nature of those functions is confusing and
>    therefore bug-provoking. In fact, it has already caused a bug in DRM.
>    The last patch in this series fixes that bug.
> 2. iomappings: Instead of giving each mapping its own callback, the
>    existing API uses a statically allocated struct tracking one mapping
>    per bar. This is not extensible. Especially, you can't create
>    _ranged_ managed mappings that way, which many drivers want.
> 3. Managed request functions only exist as "plural versions" with a
>    bit-mask as a parameter. That's quite over-engineered considering
>    that each user only ever mapps one, maybe two bars.
> 
> This series:
> - add a set of new "singular" devres functions that use devres the way
>   its intended, with one callback per resource.
> - deprecates the existing iomap-table mechanism.
> - deprecates the hybrid nature of pci_ functions.
> - preserves backwards compatibility so that drivers using the existing
>   API won't notice any changes.
> - adds documentation, especially some warning users about the
>   complicated nature of PCI's devres.

There's a lot of good work here; thanks for working on it.

> Philipp Stanner (10):
>   PCI: Add new set of devres functions

This first patch adds some infrastructure and several new exported
interfaces:

  void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar, const char *name)
  void pcim_iounmap_region(struct pci_dev *pdev, int bar)
  int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
  void pcim_release_region(struct pci_dev *pdev, int bar)
  void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
  void __iomem *pcim_iomap_region_range(struct pci_dev *pdev, int bar,
  void pcim_iounmap_region_range(struct pci_dev *pdev, int bar,

>   PCI: Deprecate iomap-table functions

This adds a little bit of infrastructure (add/remove to legacy_table),
reimplements these existing interfaces:

  void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen)
  void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
  int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
  int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
  void pcim_iounmap_regions(struct pci_dev *pdev, int mask)

and adds a couple new exported interfaces:

  void pcim_release_all_regions(struct pci_dev *pdev)
  int pcim_request_all_regions(struct pci_dev *pdev, const char *name)

There's a lot going on in these two patches, so they're hard to
review.  I think it would be easier if you could do the fixes to
existing interfaces first, followed by adding new things, maybe
something like separate patches that:

  - Add pcim_addr_devres_alloc(), pcim_addr_devres_free(),
    pcim_addr_devres_clear().

  - Add pcim_add_mapping_to_legacy_table(),
    pcim_remove_mapping_from_legacy_table(),
    pcim_remove_bar_from_legacy_table().

  - Reimplement pcim_iomap(), pcim_iomap_regions(), pcim_iounmap().

  - Add new interfaces like pcim_iomap_region(),
    pcim_request_region(), etc.

    AFAICS, except for pcim_iomap_range() (used by vbox), these new
    interfaces have no users outside drivers/pci, so ... we might
    defer adding them, or at least defer exposing them via
    include/linux/pci.h, until we have users for them.

>   PCI: Warn users about complicated devres nature
>   PCI: Make devres region requests consistent
>   PCI: Move dev-enabled status bit to struct pci_dev
>   PCI: Move pinned status bit to struct pci_dev
>   PCI: Give pcim_set_mwi() its own devres callback
>   PCI: Give pci(m)_intx its own devres callback
>   PCI: Remove legacy pcim_release()
>   drm/vboxvideo: fix mapping leaks
> 
>  drivers/gpu/drm/vboxvideo/vbox_main.c |   20 +-
>  drivers/pci/devres.c                  | 1011 +++++++++++++++++++++----
>  drivers/pci/iomap.c                   |   18 +
>  drivers/pci/pci.c                     |  123 ++-
>  drivers/pci/pci.h                     |   21 +-
>  include/linux/pci.h                   |   18 +-
>  6 files changed, 999 insertions(+), 212 deletions(-)
> 
> -- 
> 2.44.0
> 
