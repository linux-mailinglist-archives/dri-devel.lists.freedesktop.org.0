Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EE878A9E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 23:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BAD112932;
	Mon, 11 Mar 2024 22:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PPek5Isx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC8112CC6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 22:15:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 176C1CE131D;
 Mon, 11 Mar 2024 22:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237E0C433C7;
 Mon, 11 Mar 2024 22:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710195313;
 bh=bgdC0mJstQ1eno0f2EP+4ez6XIDUdcKeIs+d0Nm+Yz0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PPek5Isx03UQi4OcxnweJPdHuRntpxKlCwWZ+1iSRDZ4swl9x8aeTlCbK7J8C6GUg
 stKGJSbO/bY/TT6OTW53HHlF4uvI6BcGFnWjLQL9DhwqQcNCPbZ0F822OjNIXnjWUf
 81b1moEi66FT+ldpYGdFZazTQ66I0txaBnApYHK0dm3/+nXg3JBZrSCOHkWylP4YwU
 V9resfOfk9143rrXdAw8BGuaqKrcLelRagmxtt9nFH3GjfvbWoLGx1JRWHzWRFEOFx
 rKZ3vSd7IR3ges1/5NFg+jJeG80s8h1ps30EUOqPauOuOX88sYgHggTADATNtryxJD
 MFGdnS//mXQYA==
Date: Mon, 11 Mar 2024 17:15:11 -0500
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
Subject: Re: [PATCH v4 00/10] Make PCI's devres API more consistent
Message-ID: <20240311221511.GA821021@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1e0044a364b218fea285b1c9e80d925ad4c9d90.camel@redhat.com>
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

On Mon, Mar 11, 2024 at 12:45:15PM +0100, Philipp Stanner wrote:
> Gentle ping because the Merge Window opened 8-)

Thanks; I'll look at this for v6.10.  It's too late to add significant
changes for the v6.9 merge window since it's already open.

Bjorn

> On Fri, 2024-03-01 at 12:29 +0100, Philipp Stanner wrote:
> > This v4 now can (hopefully) be applied to linux-next, but not to
> > mainline/master.
> > 
> > Changes in v4:
> >   - Rebase against linux-next
> > 
> > Changes in v3:
> >   - Use the term "PCI devres API" at some forgotten places.
> >   - Fix more grammar errors in patch #3.
> >   - Remove the comment advising to call (the outdated) pcim_intx() in
> > pci.c
> >   - Rename __pcim_request_region_range() flags-field "exclusive" to
> >     "req_flags", since this is what the int actually represents.
> >   - Remove the call to pcim_region_request() from patch #10. (Hans)
> > 
> > Changes in v2:
> >   - Make commit head lines congruent with PCI's style (Bjorn)
> >   - Add missing error checks for devm_add_action(). (Andy)
> >   - Repair the "Returns: " marks for docu generation (Andy)
> >   - Initialize the addr_devres struct with memset(). (Andy)
> >   - Make pcim_intx() a PCI-internal function so that new drivers
> > won't
> >     be encouraged to use the outdated pci_intx() mechanism.
> >     (Andy / Philipp)
> >   - Fix grammar and spelling (Bjorn)
> >   - Be more precise on why pcim_iomap_table() is problematic (Bjorn)
> >   - Provide the actual structs' and functions' names in the commit
> >     messages (Bjorn)
> >   - Remove redundant variable initializers (Andy)
> >   - Regroup PM bitfield members in struct pci_dev (Andy)
> >   - Make pcim_intx() visible only for the PCI subsystem so that
> > new    
> >     drivers won't use this outdated API (Andy, Myself)
> >   - Add a NOTE to pcim_iomap() to warn about this function being
> > the    onee
> >     xception that does just return NULL.
> >   - Consistently use the term "PCI devres API"; also in Patch #10
> > (Bjorn)
> > 
> > 
> > ¡Hola!
> > 
> > PCI's devres API suffers several weaknesses:
> > 
> > 1. There are functions prefixed with pcim_. Those are always managed
> >    counterparts to never-managed functions prefixed with pci_ – or so
> > one
> >    would like to think. There are some apparently unmanaged functions
> >    (all region-request / release functions, and pci_intx()) which
> >    suddenly become managed once the user has initialized the device
> > with
> >    pcim_enable_device() instead of pci_enable_device(). This
> > "sometimes
> >    yes, sometimes no" nature of those functions is confusing and
> >    therefore bug-provoking. In fact, it has already caused a bug in
> > DRM.
> >    The last patch in this series fixes that bug.
> > 2. iomappings: Instead of giving each mapping its own callback, the
> >    existing API uses a statically allocated struct tracking one
> > mapping
> >    per bar. This is not extensible. Especially, you can't create
> >    _ranged_ managed mappings that way, which many drivers want.
> > 3. Managed request functions only exist as "plural versions" with a
> >    bit-mask as a parameter. That's quite over-engineered considering
> >    that each user only ever mapps one, maybe two bars.
> > 
> > This series:
> > - add a set of new "singular" devres functions that use devres the
> > way
> >   its intended, with one callback per resource.
> > - deprecates the existing iomap-table mechanism.
> > - deprecates the hybrid nature of pci_ functions.
> > - preserves backwards compatibility so that drivers using the
> > existing
> >   API won't notice any changes.
> > - adds documentation, especially some warning users about the
> >   complicated nature of PCI's devres.
> > 
> > 
> > Note that this series is based on my "unify pci_iounmap"-series from
> > a
> > few weeks ago. [1]
> > 
> > I tested this on a x86 VM with a simple pci test-device with two
> > regions. Operates and reserves resources as intended on my system.
> > Kasan and kmemleak didn't find any problems.
> > 
> > I believe this series cleans the API up as much as possible without
> > having to port all existing drivers to the new API. Especially, I
> > think
> > that this implementation is easy to extend if the need for new
> > managed
> > functions arises :)
> > 
> > Greetings,
> > P.
> > 
> > Philipp Stanner (10):
> >   PCI: Add new set of devres functions
> >   PCI: Deprecate iomap-table functions
> >   PCI: Warn users about complicated devres nature
> >   PCI: Make devres region requests consistent
> >   PCI: Move dev-enabled status bit to struct pci_dev
> >   PCI: Move pinned status bit to struct pci_dev
> >   PCI: Give pcim_set_mwi() its own devres callback
> >   PCI: Give pci(m)_intx its own devres callback
> >   PCI: Remove legacy pcim_release()
> >   drm/vboxvideo: fix mapping leaks
> > 
> >  drivers/gpu/drm/vboxvideo/vbox_main.c |   20 +-
> >  drivers/pci/devres.c                  | 1013 +++++++++++++++++++++--
> > --
> >  drivers/pci/iomap.c                   |   18 +
> >  drivers/pci/pci.c                     |  123 ++-
> >  drivers/pci/pci.h                     |   21 +-
> >  include/linux/pci.h                   |   18 +-
> >  6 files changed, 1001 insertions(+), 212 deletions(-)
> > 
> 
