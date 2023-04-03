Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9016D4426
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FAB10E167;
	Mon,  3 Apr 2023 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986F110E167
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680523857; x=1712059857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aWuHZkgqcOVKspUJD+VoD396+Is3g8Yc59C9B+IRX2A=;
 b=Mw3zS5raKsxn4MgPGmoivtApVxcaez+yuG1XFUPkOX/SPl3vULWBePbF
 QRnxZKf7n5aMYbqWg3UVxLLCp4VSH3Hjo2L60uw2gww2fEbcv7MYAneHB
 IbVCXywlnk0xIqiOkoHnrMtGan0vNaw+eUJqoEmhYoAc0WlPhaovFZxnK
 PIUCN0CblsnoraJMWmML7aiFuKwogIfIb2L7nKn2tfxrfBViYzF+vH5EX
 +yndfZZoPFx/Taj5J80raJcIQaMLVC/WnV9axVxAXcWHZ9e2FnoHE0sXk
 +LQ16FuQPCoaWovYdmWncbL4X6wOpplXw8cpnVXpvjJzR5wGwBlY42gK6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="404633751"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="404633751"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 05:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="679433918"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="679433918"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 05:10:54 -0700
Date: Mon, 3 Apr 2023 14:10:52 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] accel/ivpu: Remove D3hot delay for Meteorlake
Message-ID: <20230403121052.GA2992314@linux.intel.com>
References: <20230331114027.2803100-1-stanislaw.gruszka@linux.intel.com>
 <20230331192604.GA3246007@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331192604.GA3246007@bhelgaas>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-pci@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 02:26:04PM -0500, Bjorn Helgaas wrote:
> On Fri, Mar 31, 2023 at 01:40:27PM +0200, Stanislaw Gruszka wrote:
> > From: Karol Wachowski <karol.wachowski@linux.intel.com>
> > 
> > VPU on MTL has hardware optimizations and does not require 10ms
> > D0 - D3hot transition delay imposed by PCI specification.
> 
> PCIe r6.0, sec 5.9.
> 
> > The delay removal is traditionally done by adding PCI ID to
> > quirk_remove_dhot_delay() in drivers/pci/quirks.c . But since
> 
> quirk_remove_d3hot_delay()
> 
> > we do not need that optimization before driver probe and we
> > can better specify in the ivpu driver on what (future) hardware
> > use the optimization, we do not use quirk_remove_dhot_delay()
> 
> Again.
I Will fix the commit message in v2.

> > for that.
> > 
> > Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/accel/ivpu/ivpu_drv.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index 3be4a5a2b07a..cf9925c0a8ad 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -442,6 +442,10 @@ static int ivpu_pci_init(struct ivpu_device *vdev)
> >  	/* Clear any pending errors */
> >  	pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
> >  
> > +	/* VPU MTL does not require PCI spec 10m D3hot delay */
> > +	if (ivpu_is_mtl(vdev))
> > +		pdev->d3hot_delay = 0;
> 
> d3hot_delay is used after a D0->D3hot transition, after a D3hot->D0
> transition, and after the D0->D3hot and D3hot->D0 transitions in
> pci_pm_reset().
> 
> I assume this device can tolerate removing *all* of those delays,
> right?
Yes.

Regards
Stanislaw
