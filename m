Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA384BAB2E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7C10E7B8;
	Thu, 17 Feb 2022 20:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3810E7B8;
 Thu, 17 Feb 2022 20:40:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 523F561E06;
 Thu, 17 Feb 2022 20:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D99EC340E8;
 Thu, 17 Feb 2022 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645130401;
 bh=gMwTMyNiKF2SJFRozKPAoW+wbNbKhGmor9hG8jl8CGc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jUl9xkZ4uiN5A1eww37AsO3qJEch+3jqmtFDPhIyhp3mXeZNhabJbFwM5bB2wYqX+
 5vFrGrFysgZYCNDE3LilbfzgF8DvDbx5IcmsRwEr2UuPWrS7rP0KkhoNDf5Vr78941
 9tzLH8KMntNkpiGUCeC0uWRpgPZ32o92aa497xciBKx2OGNfma4QhofkO6LXHB/HaF
 kZZ6/T5g8366MKV3WHHtcbgFA3ixcBSRnwPOd8u8fi/huKJH8jy6KqVLYIFj8Mimpx
 l+sJB4eAs/5vzXmi6FCPjXIDLEtNhDWaQeRWlecsopZN3Wb0jCkfXtIbeFE7ssqgaP
 BdZUKUOG2flOA==
Date: Thu, 17 Feb 2022 14:40:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 05/12] PCI: Detect root port of internal USB4 devices
 by `usb4-host-interface`
Message-ID: <20220217204000.GA302508@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygo1eoVe8D0b80QF@lahna>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Andreas Noever <andreas.noever@gmail.com>,
 Alexander.Deucher@amd.com, Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 12:56:58PM +0200, Mika Westerberg wrote:
> On Mon, Feb 14, 2022 at 09:52:02AM +0100, Lukas Wunner wrote:
> > On Mon, Feb 14, 2022 at 09:34:26AM +0200, Mika Westerberg wrote:
> > > On Fri, Feb 11, 2022 at 03:45:46PM -0600, Bjorn Helgaas wrote:
> > > > My expectation is that "USB" (like "PCI" and "PCIe") tells me
> > > > something about how a device is electrically connected and how
> > > > software can operate it.  It doesn't really tell me anything about
> > > > whether those electrical connections are permanent, made through an
> > > > internal slot, or made through an external connector and cable.
> > > 
> > > It is used to identify "tunneled" ports (whether PCIe, USB 3.x or
> > > DisplayPort). Tunnels are created by software (in Linux it is the
> > > Thunderbolt driver) and are dynamic in nature. The USB4 links go over
> > > USB Type-C cable which also is something user can plug/unplug freely.
> > > 
> > > I would say it is reasonable expectation that anything behind these
> > > ports can be assumed as "removable".
> > 
> > USB gadgets may be soldered to the mainboard.  Those cannot be
> > unplugged freely.  It is common practice to solder USB Ethernet
> > or USB FTDI serial ports and nothing's preventing a vendor to solder
> > USB4/Thunderbolt gadgets.
> 
> Right, that's why I say it is "reasonable expectation" that anything
> behind these ports can be assumed "removable" :) Of course they don't
> have to be but if we assume that in the driver where this actually
> matters we should be on the safe side, no?

Spec citations help maintain things over the long term.  Reasonable
expectations that are part of today's folklore but are not written
down and shared leads to things that work today but not tomorrow.

Bjorn
