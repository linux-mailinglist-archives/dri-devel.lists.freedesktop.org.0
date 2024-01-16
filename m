Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581D82FAA9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 22:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14A110E5FE;
	Tue, 16 Jan 2024 21:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E2410E5FE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 21:37:45 +0000 (UTC)
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
 by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id 7afc7402-b4b7-11ee-abf4-005056bdd08f;
 Tue, 16 Jan 2024 23:37:43 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 16 Jan 2024 23:37:39 +0200
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 08/10] pci: devres: give pci(m)_intx its own callback
Message-ID: <Zab3I9o_BXRjYm4j@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-10-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-10-pstanner@redhat.com>
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

Mon, Jan 15, 2024 at 03:46:19PM +0100, Philipp Stanner kirjoitti:
> pci_intx() is one of the functions that have "hybrid mode" (i.e.,
> sometimes managed, sometimes not). Providing a separate pcim_intx()
> function with its own device resource and cleanup callback allows for
> removing further large parts of the legacy pci-devres implementation.
> 
> As in the region-request-functions, pci_intx() has to call into its
> managed counterpart for backwards compatibility.
> 
> Implement pcim_intx() with its own device resource.
> Make pci_intx() call pcim_intx() in the managed case.
> Remove the legacy devres struct from pci.h.

...

> +	/*
> +	 * This is done for backwards compatibility, because the old pci-devres
> +	 * API had a mode in which this function became managed if the dev had
> +	 * been enabled with pcim_enable_device() instead of pci_enable_device().
> +	 */
> +	if (pci_is_managed(pdev)) {
> +		if (pcim_intx(pdev, enable) != 0)
> +			WARN_ON_ONCE(1);

		WARN_ON_ONCE(pcim_intx(pdev, enable));

?

> +		return;
> +	}

...

> +	if (new != pci_command)

	if (new == pci_command)
		return;

?

>  		pci_write_config_word(pdev, PCI_COMMAND, new);

-- 
With Best Regards,
Andy Shevchenko


