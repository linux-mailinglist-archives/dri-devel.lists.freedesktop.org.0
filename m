Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C3AE28F8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 14:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618F310E029;
	Sat, 21 Jun 2025 12:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7D710E029
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 12:29:34 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 760EC2C62E1F;
 Sat, 21 Jun 2025 14:29:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 58EE73A6357; Sat, 21 Jun 2025 14:29:33 +0200 (CEST)
Date: Sat, 21 Jun 2025 14:29:33 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: David Airlie <airlied@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andi Kleen <ak@linux.intel.com>, Ahmed Salem <x0rw3ll@gmail.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is
 present
Message-ID: <aFalrV1500saBto5@wunner.de>
References: <f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de>
 <b73fbb3e3f03d842f36e6ba2e6a8ad0bb4b904fd.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b73fbb3e3f03d842f36e6ba2e6a8ad0bb4b904fd.camel@decadent.org.uk>
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

On Sat, Jun 21, 2025 at 02:07:40PM +0200, Ben Hutchings wrote:
> On Sat, 2025-06-21 at 11:40 +0200, Lukas Wunner wrote:
> > Since commit 172efbb40333 ("AGP: Try unsupported AGP chipsets on x86-64 by
> > default"), the AGP driver for AMD Opteron/Athlon64 CPUs attempts to bind
> > to any PCI device.
> > 
> > On modern CPUs exposing an AMD IOMMU, this results in a message with
> > KERN_CRIT severity:
> > 
> >   pci 0000:00:00.2: Resources present before probing
> > 
> > The driver used to bind only to devices exposing the AGP Capability, but
> > that restriction was removed by commit 6fd024893911 ("amd64-agp: Probe
> > unknown AGP devices the right way").
> 
> That didn't remove any restriction as the probe function still started
> by checking for an AGP capability.  The change I made was that the
> driver would actually bind to devices with the AGP capability instead of
> starting to use them without binding.

The message above would not be emitted without your change.

The check for the AGP capability in agp_amd64_probe() is too late
to prevent the message.  That's because the message is emitted
before ->probe() is even called.

Thanks,

Lukas
