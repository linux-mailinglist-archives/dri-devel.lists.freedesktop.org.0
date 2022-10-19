Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D35604F0C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769FB10E316;
	Wed, 19 Oct 2022 17:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E310E316;
 Wed, 19 Oct 2022 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201254; x=1697737254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MCt32TjPlGarJR5rG8qyjVG72iAEmUkFwrBifFx18wc=;
 b=UlLMWMY7gRuNmjFvFYFI5u5cley/oziF9LgVRCDQGbqpPTK7SRFPfc/5
 RjQpJFTIJ9HtssRA0PLw8iTO0pfE92+FEie7xbtxiNs6Xo6TBjALSNDMH
 2yawwZWvYgOxT5pP5MPLuaxB4tHbWYorZuxZnZn/vRyg4q98OVzl8sG/i
 2Rv6vAoWt6Ozew4vDFZX9MJc19Ewsm3IPIKvmB/LlqoJtlPg3MdmplKlE
 kLhQKeFPIb8+p7KeMv7m1CVhUG87SU3x8Dd0gcWWKNaKvjQRR6rRBL64F
 EIENeK0mx0CwMCWYnj0odOxgIB7Vif4yY5V6IKlIUa0fRd5xqhJl+yJvc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="307589774"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="307589774"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="607207072"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="607207072"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 19 Oct 2022 10:40:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 20:40:49 +0300
Date: Wed, 19 Oct 2022 20:40:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] ACPI: PCI: Fix device reference counting in
 acpi_get_pci_dev()
Message-ID: <Y1A2oR02JjXqMOiQ@intel.com>
References: <Y0+7Ug9Yh6J6uHVr@intel.com>
 <20221019165326.GA23726@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019165326.GA23726@bhelgaas>
X-Patchwork-Hint: comment
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
Cc: Linux PCI <linux-pci@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Linux ACPI <linux-acpi@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 11:53:26AM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 19, 2022 at 11:54:42AM +0300, Ville Syrjälä wrote:
> > On Tue, Oct 18, 2022 at 07:34:03PM +0200, Rafael J. Wysocki wrote:
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > 
> > > Commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()") failed
> > > to reference count the device returned by acpi_get_pci_dev() as
> > > expected by its callers which in some cases may cause device objects
> > > to be dropped prematurely.
> > > 
> > > Add the missing get_device() to acpi_get_pci_dev().
> > > 
> > > Fixes: 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
> > 
> > FYI this (and the rtc-cmos regression discussed in
> > https://lore.kernel.org/linux-acpi/5887691.lOV4Wx5bFT@kreacher/)
> > took down the entire Intel gfx CI.
> 
> >From 1000 miles away and zero background with the gfx CI, this sounds
> like "our CI system, whose purpose is to find bugs, found one", which
> is a good thing.

Mostly. It's certainly better than it going entirely undetected.

Sadly we found it after rc1 because no one was really looking at
linux-next results. Something we need to improve.

But ideally it would have been found by some other CI system
whose primary job is to prevent bugs in those subsystems, rather
than the one whose primary job is to prevent bugs in gfx drivers.
Also ideally it wouldn't have been me bisecting this :P

The biggest downside of bugs reaching our CI via rc1/etc. is that
it pretty much stops everyone from getting premerge results for
their graphics driver patches since the CI keeps tripping over
the already existing bugs. But I guess you can call this one a
somewhat self inflicted wound and we should just try harder to
keep new code out of our tree until it's known to be healthy.

-- 
Ville Syrjälä
Intel
