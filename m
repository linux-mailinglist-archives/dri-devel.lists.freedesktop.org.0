Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4595E82FAC5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 22:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D20A10E5F7;
	Tue, 16 Jan 2024 21:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9F10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 21:40:28 +0000 (UTC)
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
 by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id dc7f56ef-b4b7-11ee-abf4-005056bdd08f;
 Tue, 16 Jan 2024 23:40:26 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 16 Jan 2024 23:40:26 +0200
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 09/10] pci: devres: remove legacy pcim_release()
Message-ID: <Zab3yr6J1S-2ujT9@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-11-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-11-pstanner@redhat.com>
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

Mon, Jan 15, 2024 at 03:46:20PM +0100, Philipp Stanner kirjoitti:
> Thanks to preceding cleanup steps, pcim_release() is now not needed
> anymore and can be replaced by pcim_disable_device(), which is the exact
> counterpart to pcim_enable_device().
> This permits removing further parts of the old devres API.
> 
> Replace pcim_release() with pcim_disable_device().
> Remove the now surplus get_dr() function.

...

> +	devm_add_action(&pdev->dev, pcim_disable_device, pdev);

No error check?

> +	return pci_enable_device(pdev);

Maybe

	ret = pci_enable_device(...);
	if (ret)
		return ret;

	return devm_add_action_or_reset(...)?

I could think of side effects of this, so perhaps the commit message and/or
code needs a comment on why the above proposal can _not_ be used?

-- 
With Best Regards,
Andy Shevchenko


