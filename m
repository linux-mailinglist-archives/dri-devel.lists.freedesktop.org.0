Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CE82FA77
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 22:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8E110E5DA;
	Tue, 16 Jan 2024 21:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AA510E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 21:33:30 +0000 (UTC)
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
 by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id a42b3ea7-b4b4-11ee-abf4-005056bdd08f;
 Tue, 16 Jan 2024 23:17:24 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 16 Jan 2024 23:17:23 +0200
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 00/10] Make PCI's devres API more consistent
Message-ID: <ZabyY3csP0y-p7lb@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240115144655.32046-2-pstanner@redhat.com>
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

Mon, Jan 15, 2024 at 03:46:11PM +0100, Philipp Stanner kirjoitti:
> ¡Hola!

i? Vim user? :-)

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

Instead of adding pcim_intx(), please provide proper one for
pci_alloc_irq_vectors(). Ideally it would be nice to deprecate
old IRQ management functions in PCI core and delete them in the
future.

-- 
With Best Regards,
Andy Shevchenko


