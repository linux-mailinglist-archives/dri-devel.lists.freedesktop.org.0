Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7482FA89
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 22:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9972110E5E9;
	Tue, 16 Jan 2024 21:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi
 [62.142.5.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA2710E5E9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 21:34:46 +0000 (UTC)
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
 by fgw22.mail.saunalahti.fi (Halon) with ESMTP
 id 10895911-b4b7-11ee-a9de-005056bdf889;
 Tue, 16 Jan 2024 23:34:44 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 16 Jan 2024 23:34:44 +0200
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 06/10] pci: move pinned status bit to pci_dev struct
Message-ID: <Zab2dC6HVmk2gEwn@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-8-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-8-pstanner@redhat.com>
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

Mon, Jan 15, 2024 at 03:46:17PM +0100, Philipp Stanner kirjoitti:
> The bit describing whether the PCI device is currently pinned is stored
> in the PCI devres struct. To clean up and simplify the pci-devres API,

"PCI devres", 'pci-devres', ...
Shouldn't these (and across entire series) be consistent terms?
E.g., "PCI devres API".

> it's better if this information is stored in the pci_dev struct, because

pci_dev struct --> struct pci_dev

> it allows for checking that device's pinned-status directly through the
> device struct.
> This will later permit simplifying  pcim_enable_device().

> Move the 'pinned' boolean bit to struct pci_dev.

...

>  	u8		pm_cap;		/* PM capability offset */
>  	unsigned int	enabled:1;	/* Whether this dev is enabled */
> +	unsigned int	pinned:1;	/* Whether this dev is pinned */
>  	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
>  	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
>  					   can be generated */

First of all, I think it's better to group PM stuff, like

	u8		pm_cap;		/* PM capability offset */
	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
					   can be generated */
	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
	unsigned int	enabled:1;	/* Whether this dev is enabled */
	unsigned int	pinned:1;	/* Whether this dev is pinned */

Second, does this layout anyhow related to the HW layout? (For example,
PME bits and their location in some HW register vs. these bitfields)
If so, but not sure, it might be good to preserve (to some extent) the
order.

-- 
With Best Regards,
Andy Shevchenko


