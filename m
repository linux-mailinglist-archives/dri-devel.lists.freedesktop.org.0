Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8CAE2B6D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 21:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8890B10E2E6;
	Sat, 21 Jun 2025 19:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B434610E2E6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 19:21:47 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id D826B2020E5A;
 Sat, 21 Jun 2025 21:21:45 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id C52381EFFA; Sat, 21 Jun 2025 21:21:45 +0200 (CEST)
Date: Sat, 21 Jun 2025 21:21:45 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ahmed Salem <x0rw3ll@gmail.com>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <aFcGSaxeaDphIhUU@wunner.de>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
 <aFZ_YJH30f1WDneD@wunner.de>
 <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
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

On Sat, Jun 21, 2025 at 07:15:31PM +0300, Ahmed Salem wrote:
> On 25/06/21 11:46AM, Lukas Wunner wrote:
> > On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> > > --- a/drivers/char/agp/amd64-agp.c
> > > +++ b/drivers/char/agp/amd64-agp.c
> > > @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
> > >  
> > >  		/* Look for any AGP bridge */
> > >  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> > > -		err = driver_attach(&agp_amd64_pci_driver.driver);
> > > -		if (err == 0 && agp_bridges_found == 0) {
> > > +		if ((int *)agp_amd64_pci_driver.probe != 0) {
> > >  			pci_unregister_driver(&agp_amd64_pci_driver);
> > >  			err = -ENODEV;
> > > +		} else {
> > > +			err = driver_attach(&agp_amd64_pci_driver.driver);
> > > +			if (err == 0 && agp_bridges_found == 0) {
> > > +				pci_unregister_driver(&agp_amd64_pci_driver);
> > > +				err = -ENODEV;
> > > +			}
> > 
> > Is the "probe" member in agp_amd64_pci_driver overwritten with a
> > zero pointer anywhere?  I don't see that it is, so it seems the
> > else-branch is never entered.
> 
> That is a great question. I thought since pci_register_driver calls the
> probe function, it would return with or without a zero, saving that
> value in the .probe member.

You'd have to add parentheses and parameters, i.e.

  agp_amd64_pci_driver.probe(...)

to invoke the probe hook directly.  However, that wouldn't be an
acceptable approach, one needs to go through the API of the
driver core and not do things behind the driver core's back.


> > I had already prepared a fix for this, but waited for 0-day to
> > crunch through it.  I've just submitted it, so that's what I had
> > in mind:
> > 
> > https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/
> 
> That one I've seen even prior to catching this one, and this is
> originally what I had in mind based on what commit 6fd024893911
> ("amd64-agp: Probe unknown AGP devices the right way") removed (i.e.
> !pci_find_capability) when you suggested checking for caps beforehand,
> but I figured "why make other calls when .probe already does it right
> off the bat?"

Right, it is somewhat silly, but this driver is for 20+ year old hardware
which is likely no longer in heavy use, the driver itself isn't actively
maintained anymore and might be dropped in a few years, so this approach
seemed like the least ugly and most acceptable option.

The real crime was to probe *any* PCI device and even make that the
default.  I think vfio_pci is probably the only other driver that
probes *any* PCI device and it does that only if requested by user
space I believe.  We'd risk regressing users if we changed the
"probe everything by default" behavior, so that's not a good option.

Thanks,

Lukas
