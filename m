Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3B900C87
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 21:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ED810E051;
	Fri,  7 Jun 2024 19:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UH8xLEXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3BD10E051
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 19:40:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D190B616E0;
 Fri,  7 Jun 2024 19:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084A0C4AF07;
 Fri,  7 Jun 2024 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717789252;
 bh=F0KItqGXcVwfO0z1QHr5qTaW5Ud/D4JEVYpZ2Lqxfl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UH8xLEXVRzW8+12jdeSBfdtWZiqO6qS8a6ifk4z13FcdXJ1LkQrKPDxObnswKpsGZ
 ZlDrb2dF84B1UYD78OKpJ8Ss+lL8g7tZAlTPY6uxOLqtPHmlqbybcW+JSxsSa+S1km
 uVg+EhpfXLIpuftxRc/qwA4F3JIldk9yeiS8b3nbG4wW54IQoRnvnVY3oOCsX5hLUx
 oE0w6WhLBFp2g7Zy7OE7KE/22Yxxlf8Ev5ftg9cmZ0V8nOQHI3jtKoArenpBAMdlVF
 gA1S4ChgHCwBAMtusNe/ZQUrUcgkGHmbprMRYLWtGBOFmorUhr/MAoE6icp7qnd6IL
 2+ESRMzvTRgYQ==
Date: Fri, 7 Jun 2024 14:40:50 -0500
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
Subject: Re: [PATCH v7 00/13] Make PCI's devres API more consistent
Message-ID: <20240607194050.GA857440@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605081605.18769-2-pstanner@redhat.com>
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

On Wed, Jun 05, 2024 at 10:15:52AM +0200, Philipp Stanner wrote:
> Hello Bjorn,
> 
> I tried to meet your requests from the last feedback round as much as
> possible. Especially, I removed a lot of code, made almost all
> interfaces private and cut the series into smaller chunks where
> possible.
> 
> Splitting it even smaller is unfortunately not possible because of the
> Linux kernel build chain's rule on dead / unused code.
> 
> See also the changelog below.
> 
> Please tell me if that's enough to move forward here.
> 
> Regards,
> P.
> 
> 
> Changes in v7:
>   - Split the entire series in smaller, more atomic chunks / patches
>     (Bjorn)
>   - Remove functions (such as pcim_iomap_region_range()) that do not yet
>     have a user (Bjorn)
>   - Don't export interfaces publicly anymore, except for
>     pcim_iomap_range(), needed by vboxvideo (Bjorn)
>   - Mention the actual (vboxvideo) bug in "PCI: Warn users..." commit
>     (Bjorn)
>   - Drop docstring warnings on PCI-internal functions (Bjorn)
>   - Rework docstring warnings
>   - Fix spelling in a few places. Rewrapp paragraphs (Bjorn)
> 
> Changes in v6:
>   - Restructure the cleanup in pcim_iomap_regions_request_all() so that
>     it doesn't trigger a (false positive) test robot warning. No
>     behavior change intended. (Dan Carpenter)
> 
> Changes in v5:
>   - Add Hans's Reviewed-by to vboxvideo patch (Hans de Goede)
>   - Remove stable-kernel from CC in vboxvideo patch (Hans de Goede)
> 
> Changes in v4:
>   - Rebase against linux-next
> 
> Changes in v3:
>   - Use the term "PCI devres API" at some forgotten places.
>   - Fix more grammar errors in patch #3.
>   - Remove the comment advising to call (the outdated) pcim_intx() in pci.c
>   - Rename __pcim_request_region_range() flags-field "exclusive" to
>     "req_flags", since this is what the int actually represents.
>   - Remove the call to pcim_region_request() from patch #10. (Hans)
> 
> Changes in v2:
>   - Make commit head lines congruent with PCI's style (Bjorn)
>   - Add missing error checks for devm_add_action(). (Andy)
>   - Repair the "Returns: " marks for docu generation (Andy)
>   - Initialize the addr_devres struct with memset(). (Andy)
>   - Make pcim_intx() a PCI-internal function so that new drivers won't
>     be encouraged to use the outdated pci_intx() mechanism.
>     (Andy / Philipp)
>   - Fix grammar and spelling (Bjorn)
>   - Be more precise on why pcim_iomap_table() is problematic (Bjorn)
>   - Provide the actual structs' and functions' names in the commit
>     messages (Bjorn)
>   - Remove redundant variable initializers (Andy)
>   - Regroup PM bitfield members in struct pci_dev (Andy)
>   - Make pcim_intx() visible only for the PCI subsystem so that new    
>     drivers won't use this outdated API (Andy, Myself)
>   - Add a NOTE to pcim_iomap() to warn about this function being the    onee
>     xception that does just return NULL.
>   - Consistently use the term "PCI devres API"; also in Patch #10 (Bjorn)
> 
> 
> ¡Hola!
> 
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
> 
> 
> Note that this series is based on my "unify pci_iounmap"-series from a
> few weeks ago. [1]
> 
> I tested this on a x86 VM with a simple pci test-device with two
> regions. Operates and reserves resources as intended on my system.
> Kasan and kmemleak didn't find any problems.
> 
> I believe this series cleans the API up as much as possible without
> having to port all existing drivers to the new API. Especially, I think
> that this implementation is easy to extend if the need for new managed
> functions arises :)
> 
> Greetings,
> P.
> 
> Philipp Stanner (13):
>   PCI: Add and use devres helper for bit masks
>   PCI: Add devres helpers for iomap table
>   PCI: Reimplement plural devres functions
>   PCI: Deprecate two surplus devres functions
>   PCI: Make devres region requests consistent
>   PCI: Warn users about complicated devres nature

Applied the above to pci/devres for v6.11 with minor comment and
whitespace tweaks.  Will watch for updates for the ones below to 
consolidate "enabled" and "enable_cnt".

>   PCI: Move dev-enabled status bit to struct pci_dev
>   PCI: Move pinned status bit to struct pci_dev
>   PCI: Give pcim_set_mwi() its own devres callback
>   PCI: Give pci(m)_intx its own devres callback
>   PCI: Remove legacy pcim_release()
>   PCI: Add pcim_iomap_range()
>   drm/vboxvideo: fix mapping leaks
> 
>  drivers/gpu/drm/vboxvideo/vbox_main.c |  20 +-
>  drivers/pci/devres.c                  | 897 +++++++++++++++++++++-----
>  drivers/pci/iomap.c                   |  16 +
>  drivers/pci/pci.c                     | 107 ++-
>  drivers/pci/pci.h                     |  23 +-
>  include/linux/pci.h                   |   6 +-
>  6 files changed, 864 insertions(+), 205 deletions(-)
> 
> -- 
> 2.45.0
> 
