Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44325AF5CC4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D14C10E0F0;
	Wed,  2 Jul 2025 15:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B697D10E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:24:08 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id E67242C06841;
 Wed,  2 Jul 2025 17:24:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id CEC83402D97; Wed,  2 Jul 2025 17:24:06 +0200 (CEST)
Date: Wed, 2 Jul 2025 17:24:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, David Airlie <airlied@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andi Kleen <ak@linux.intel.com>, Ahmed Salem <x0rw3ll@gmail.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is
 present
Message-ID: <aGVPFh8bxWpeD4OP@wunner.de>
References: <f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de>
 <b73fbb3e3f03d842f36e6ba2e6a8ad0bb4b904fd.camel@decadent.org.uk>
 <aFalrV1500saBto5@wunner.de>
 <279f63810875f2168c591aab0f30f8284d12fe02.camel@decadent.org.uk>
 <aFa8JJaRP-FUyy6Y@wunner.de>
 <9077aab5304e1839786df9adb33c334d10c69397.camel@decadent.org.uk>
 <98012c55-1e0d-4c1b-b650-5bb189d78009@redhat.com>
 <aFwIu0QveVuJZNoU@wunner.de>
 <eb98477c-2d5c-4980-ab21-6aed8f0451c9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb98477c-2d5c-4980-ab21-6aed8f0451c9@redhat.com>
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

On Wed, Jun 25, 2025 at 08:43:45PM +0200, Hans de Goede wrote:
> On 25-Jun-25 4:33 PM, Lukas Wunner wrote:
> > So how do you know that all of these unsupported devices have
> > PCI_CLASS_BRIDGE_HOST?
> 
> The top of the driver says
> 
>  * This is a GART driver for the AMD Opteron/Athlon64 on-CPU northbridge.
>  * It also includes support for the AMD 8151 AGP bridge
> 
> Note this only talks about north bridges.
> 
> Also given the age of AGP, I would expect the agp_amd64_pci_table[]
> to be pretty much complete and the need for probing for unknown AGP
> capable bridges is likely a relic which can be disabled by default.
> 
> Actually the amd64-agp code is weird in that has support for
> unknown AGP bridges enabled by default in the first place.
> 
> The global probe unknown AGP bridges bool which is called
> agp_try_unsupported_boot is false by default.
> 
> As discussed in the thread with my patch, we should probably
> just change the AMD specific agp_try_unsupported to default
> to false too.

Since the breaking change (causing the annoying message) was introduced
in this cycle, I think we should err on the side of caution and avoid
the risk of creating new regressions, if at all possible.

However if you are willing to deal with potential fallout, I would like
to encourage you to set "agp_try_unsupported = 0" (which the Kconfig
help text suggests is already the case) as a patch for the next cycle.

If you could give v2 of my (just submitted) patch a spin and respond
with a Tested-by on success, I'd be grateful.  I think this could go
in either through drm-misc-fixes or pci/for-linus (since the offending
commit went in through the pci tree).

Thanks!

Lukas
