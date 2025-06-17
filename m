Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2EADDCAF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2F610E0A6;
	Tue, 17 Jun 2025 19:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="XOzGSRoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Tue, 17 Jun 2025 19:53:10 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C03010E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:53:10 +0000 (UTC)
Received: from localhost (unknown [5.228.116.177])
 by mail.ispras.ru (Postfix) with ESMTPSA id BD70C552F52E;
 Tue, 17 Jun 2025 19:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BD70C552F52E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1750189668;
 bh=Ky902UmEJ2rxlwfcpu5ICzPaQwIKBWouHsS2V00UnZU=;
 h=Date:From:To:Cc:Subject:From;
 b=XOzGSRoQedoSyNgwuYswoFa9hiFGpmMHTrZX0tWFC6BpC5axO37pXAr1AqrvpAkJB
 baWWxB0GBAuvvTjVHrCdRcxo63zfWolg6KWXH2xVOoVVjVdmOMZraEhGTgQAZe1I+v
 v0pv66CjUrvxAZjaamGS4RbcRxzN+WAxxon8JJ8c=
Date: Tue, 17 Jun 2025 22:47:48 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Lukas Wunner <lukas@wunner.de>, Ben Hutchings <ben@decadent.org.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-pci@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 lvc-project@linuxtesting.org
Subject: amd-iommu / agpgart-amd64 problem: Resources present before probing
Message-ID: <wpoivftgshz5b5aovxbkxl6ivvquinukqfvb5z6yi4mv7d25ew@edtzr2p74ckg>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hello,

there is a 

  [    0.579232] pci 0000:00:00.2: Resources present before probing

error message observed after

  commit 3be5fa236649da6404f1bca1491bf02d4b0d5cce
  Author: Lukas Wunner <lukas@wunner.de>
  Date:   Fri Apr 25 11:24:21 2025 +0200
  
      Revert "iommu/amd: Prevent binding other PCI drivers to IOMMU PCI devices"


After tracking this down I've found that it's agpgart-amd64 driver trying
to bind to the IOMMU device:

  00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Family 17h-19h IOMMU
          Subsystem: Lenovo Device 3803
          Flags: bus master, fast devsel, latency 0, IRQ 25
          Capabilities: <access denied>

IOMMU device itself has no pci_driver attached to it but has a pci_dev,
and its struct device already has some devres associated with it.

agpgart-amd64 driver booting with 'agp_try_unsupported=1' (turns out it's
a default behavior) traverses the devices on the PCI bus and tries to
attach:


static const struct pci_device_id agp_amd64_pci_promisc_table[] = {
	{ PCI_DEVICE_CLASS(0, 0) },
	{ }
};

...

int __init agp_amd64_init(void)
{
...
		/* Look for any AGP bridge */
		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
		err = driver_attach(&agp_amd64_pci_driver.driver);
		if (err == 0 && agp_bridges_found == 0) {
			pci_unregister_driver(&agp_amd64_pci_driver);
			err = -ENODEV;
		}


IOMMU device is busy at the moment but, to my mind, lack of pci_driver
associated with it leads driver core trying to bind it, too.

But registering a pci_driver for IOMMU device is no good.

Initial commit cbbc00be2ce3 ("iommu/amd: Prevent binding other PCI drivers
to IOMMU PCI devices") was added in 2015, not sure whether the problem
manifested before that. At least the commit message doesn't state that
it tried to fix such kind of a bug.

The problem on itself is no harm at the end as driver core handles the
error and skips the device. But it still indicates a logical bug.


The partial revert of the revert does work, obviously. Though it badly
contradicts the intention to hide priv_flags manipulation in the PCI core.

So I wonder whether agpgart-amd64 should be somehow fixed instead... to
skip IOMMU device from its wildcard promiscuous PCI ID table? Or drop this
'try_unsupported' feature entirely? 

Would be glad to hear your thoughts on this.

Found by Linux Verification Center (linuxtesting.org).

--
Thanks,
Fedor
