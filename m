Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ACE82FA4C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 22:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4759110E5F5;
	Tue, 16 Jan 2024 21:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DF210E5F5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 21:29:34 +0000 (UTC)
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
 by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id 56bdf0cf-b4b6-11ee-abf4-005056bdd08f;
 Tue, 16 Jan 2024 23:29:33 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 16 Jan 2024 23:29:32 +0200
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 04/10] pci: devres: make devres region requests consistent
Message-ID: <Zab1PKqs4UHI5ilz@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-6-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-6-pstanner@redhat.com>
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

Mon, Jan 15, 2024 at 03:46:15PM +0100, Philipp Stanner kirjoitti:
> Now that pure managed region request functions are available, the
> implementation of the hybrid-functions which are only sometimes managed
> can be made more consistent and readable by wrapping those
> always-managed functions.
> 
> Implement a new pcim_ function for exclusively requested regions.
> Have the pci_request / release functions call their pcim_ counterparts.
> Remove the now surplus region_mask from the devres struct.

...

> +	if (pci_is_managed(pdev)) {
> +		if (exclusive == IORESOURCE_EXCLUSIVE)
> +			return pcim_request_region_exclusive(pdev, bar, res_name);
> +		else

Redundant 'else'

> +			return pcim_request_region(pdev, bar, res_name);
> +	}

-- 
With Best Regards,
Andy Shevchenko


