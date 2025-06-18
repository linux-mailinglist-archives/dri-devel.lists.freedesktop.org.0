Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE2ADE307
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F3710E2C2;
	Wed, 18 Jun 2025 05:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A9310E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 05:27:14 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 0635F200A291;
 Wed, 18 Jun 2025 07:27:10 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id DF26F20D68D; Wed, 18 Jun 2025 07:27:09 +0200 (CEST)
Date: Wed, 18 Jun 2025 07:27:09 +0200
From: Lukas Wunner <lukas@wunner.de>
To: linux-pci@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Bjorn Helgaas <helgaas@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>
Subject: Re: amd-iommu / agpgart-amd64 problem: Resources present before
 probing
Message-ID: <aFJOLZ88KIH5WBy2@wunner.de>
References: <wpoivftgshz5b5aovxbkxl6ivvquinukqfvb5z6yi4mv7d25ew@edtzr2p74ckg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wpoivftgshz5b5aovxbkxl6ivvquinukqfvb5z6yi4mv7d25ew@edtzr2p74ckg>
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

On Tue, Jun 17, 2025 at 10:47:48PM +0300, Fedor Pchelkin wrote:
> Hello,
> 
> there is a 
> 
>   [    0.579232] pci 0000:00:00.2: Resources present before probing
> 
> error message observed after
> 
>   commit 3be5fa236649da6404f1bca1491bf02d4b0d5cce
>   Author: Lukas Wunner <lukas@wunner.de>
>   Date:   Fri Apr 25 11:24:21 2025 +0200
>   
>       Revert "iommu/amd: Prevent binding other PCI drivers to IOMMU PCI devices"

For the record, the reporter of the above-quoted issue appears to be
working for an OFAC sanctioned entity:

https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50890

This prohibits me from two-way engagement with the reporter:

https://www.linuxfoundation.org/blog/navigating-global-regulations-and-open-source-us-ofac-sanctions

   "Reviewing an unsolicited patch from a contributor in a sanctioned
    region should generally be fine, but actively engaging them to
    better understand their issue, diagnose the problem, or help
    improve a patch or modify code would likely cross the line.
    If the contributor is linked to a sanctioned entity or region,
    in general, it is best to keep communications strictly one-way.
    If a patch is received and you improve it and submit it upstream,
    that should be fine, but going back and forth in communications
    with the SDN developer likely would not."

Hence I am removing the reporter and the lvc-project@linuxtesting.org
address (hosted by ispras.ru) from the To: and Cc: headers.

I note that prior to 6fd024893911, the amd64-agp.c driver was only bound
to devices with a PCI_CAP_ID_AGP capability.

agp_amd64_probe() does check for presence of the capability, but that's
too late to avoid the error message emitted by really_probe().

What we could do however is to first check for presence of a device with
PCI_CAP_ID_AGP, and only if one is found would we try to bind to any
device.  That should avoid the message on any halfway modern system.

Thoughts?

Thanks,

Lukas
