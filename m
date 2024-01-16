Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D170A82F486
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 19:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AD210E03F;
	Tue, 16 Jan 2024 18:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEBA10E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 18:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 18815CE1A5A;
 Tue, 16 Jan 2024 18:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23771C433F1;
 Tue, 16 Jan 2024 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705430678;
 bh=hQkulcNIkuAvuM+4UOBSRVqqf8pRQ1TkYnDyipqHu9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=M4Z0AZN/db2RgMT7oCsZe7mx3q9it8JCiTGD84rVdIBh8RyqAfHjYeVKi0zVvADQw
 hjyVJKrG2LyryU4fZjmzcDdKGx+sFlEMYCam0MrfEZTVG1Q277dhC+QDiYL1woLucz
 /YpkUvebvEkTkc+y8isyvUe42CAfc4L9AqvDFRh9jNVQzA56BAJ2CU+ErVhOSp5GDQ
 EVoUmUDVLQxgcRKzIhiBfCFT2HhI0+jq+MOFXF3Yj0YmIcWV8qYcC8u+vFfWIqJ/Ne
 wB+s9FfDOvm3uXSXkIgunCgCVYb1VBSpOha2FqRzBSWGKOwWZBwkNHjKtTndCFB00z
 auD9dqR0gWeNw==
Date: Tue, 16 Jan 2024 12:44:36 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 01/10] pci: add new set of devres functions
Message-ID: <20240116184436.GA101781@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-3-pstanner@redhat.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 03:46:12PM +0100, Philipp Stanner wrote:
> PCI's devres API is not extensible to ranged mappings and has
> bug-provoking features. Improve that by providing better alternatives.

I guess "ranged mappings" means a mapping that doesn't cover an entire
BAR?  Maybe there's a way to clarify?

> When the original devres API for PCI was implemented, priority was given
> to the creation of a set of "pural functions" such as
> pcim_request_regions(). These functions have bit masks as parameters to
> specify which BARs shall get mapped. Most users, however, only use those
> to mapp 1-3 BARs.
> A complete set of "singular functions" does not exist.

s/mapp/map/

Rewrap to fill 75 columns or add blank lines between paragraphs.  Also
below.

> As functions mapping / requesting multiple BARs at once have (almost) no
> mechanism in C to return the resources to the caller of the plural
> function, the devres API utilizes the iomap-table administrated by the
> function pcim_iomap_table().
> 
> The entire PCI devres implementation was strongly tied to that table
> which only allows for mapping whole, complete BARs, as the BAR's index
> is used as table index. Consequently, it's not possible to, e.g., have a
> pcim_iomap_range() function with that mechanism.
> 
> An additional problem is that pci-devres has been ipmlemented in a sort
> of "hybrid-mode": Some unmanaged functions have managed counterparts
> (e.g.: pci_iomap() <-> pcim_iomap()), making their managed nature
> obvious to the programmer. However, the region-request functions in
> pci.c, prefixed with pci_, behave either managed or unmanaged, depending
> on whether pci_enable_device() or pcim_enable_device() has been called
> in advance.

s/ipmlemented/implemented/

> This hybrid API is confusing and should be more cleanly separated by
> providing always-managed functions prefixed with pcim_.
> 
> Thus, the existing devres API is not desirable because:
> 	a) The vast majority of the users of the plural functions only
> 	   ever sets a single bit in the bit mask, consequently making
> 	   them singular functions anyways.
> 	b) There is no mechanism to request / iomap only part of a BAR.
> 	c) The iomap-table mechanism is over-engineered, complicated and
> 	   can by definition not perform bounds checks, thus, provoking
> 	   memory faults: pcim_iomap_table(pdev)[42]

Not sure what "pcim_iomap_table(pdev)[42]" means.

> 	d) region-request functions being sometimes managed and
> 	   sometimes not is bug-provoking.

Indent with spaces (not tabs) so it still looks good when "git log"
adds spaces to indent.

> + * Legacy struct storing addresses to whole mapped bars.

s/bar/BAR/ (several places).

> +	/* A region spaning an entire bar. */
> +	PCIM_ADDR_DEVRES_TYPE_REGION,
> +
> +	/* A region spaning an entire bar, and a mapping for that whole bar. */
> +	PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING,
> +
> +	/*
> +	 * A mapping within a bar, either spaning the whole bar or just a range.
> +	 * Without a requested region.

s/spaning/spanning/ (several places).

> +	if (start == 0 || len == 0) /* that's an unused BAR. */

s/that/That/

> +	/*
> +	 * Ranged mappings don't get added to the legacy-table, since the table
> +	 * only ever keeps track of whole BARs.
> +	 */
> +

Spurious blank line.

> +	devres_add(&pdev->dev, res);
> +	return mapping;
> +}
> +EXPORT_SYMBOL(pcim_iomap_range);

Bjorn
