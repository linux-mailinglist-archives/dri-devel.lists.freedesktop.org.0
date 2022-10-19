Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9B60452B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D626110EACD;
	Wed, 19 Oct 2022 12:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74EA10EACD;
 Wed, 19 Oct 2022 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666182175; x=1697718175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E2p35ATnNVue4S2XAAi/7LxZWtiUvtDcbfvFBxl94qs=;
 b=PPwvozYeDqaAF584r4xpy3U1uTSMD2U8SsG103HQPiir7XfSVi2DtdtS
 kTmTvR/XLSs1gsp+rk4WB0nuf8y0jJMM8ZmzL7ENmxTWLR6DER5JYfe6C
 uXsZ1vJ6lgSUfwh+zuJGJXMu6szMb4QNJffzgwRwsfST1jtd6Gkvpn/tc
 wfyFf8Lbl3eNlgjEbddH3voAxSZ3CfBceyuSduwIeXrEsDWhzk5KUeiSb
 DAOAVOQIgPIdjXuF/OPAmdvYJUdsXPENZerhVQMGmFJVKc6A8oY9sbcA7
 AuCEcIxiSAZWwqDKcjYsliFv/UotXUeBnrc8TkxYw3/uElcjHdEr4DkIo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="332951216"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="332951216"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="662439218"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="662439218"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 19 Oct 2022 05:22:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 15:22:50 +0300
Date: Wed, 19 Oct 2022 15:22:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] ACPI: PCI: Fix device reference counting in
 acpi_get_pci_dev()
Message-ID: <Y0/sGveKPjuUWOhO@intel.com>
References: <12097002.O9o76ZdvQC@kreacher> <Y0+7Ug9Yh6J6uHVr@intel.com>
 <CAJZ5v0gKW9S29xS2+qkcopzYtZKTcM=ZT-Jjc4fnEJfu=oYKaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gKW9S29xS2+qkcopzYtZKTcM=ZT-Jjc4fnEJfu=oYKaw@mail.gmail.com>
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
 Bjorn Helgaas <helgaas@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 01:35:26PM +0200, Rafael J. Wysocki wrote:
> On Wed, Oct 19, 2022 at 11:02 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
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
> Sorry for the disturbance.
> 
> > I've applied both fixes into our fixup branch and things are looking much
> > healthier now.
> 
> Thanks for letting me know.
> 
> I've just added the $subject patch to my linux-next branch as an
> urgent fix and the other one has been applied to the RTC tree.
> 
> > This one caused i915 selftests to eat a lot of POISON_FREE
> > in the CI. While bisecting it locally I didn't have
> > poisoning enabled so I got refcount_t undeflows instead.
> 
> Unfortunately, making no mistakes is generally hard to offer.
> 
> If catching things like this early is better, what about pulling my
> bleeding-edge branch, where all of my changes are staged before going
> into linux-next, into the CI?

Pretty sure we don't have the resources to become the CI for
everyone. So testing random trees is not really possible. And 
the alternative of pulling random trees into drm-tip is probably
a not a popular idea either. We used to pull in the sound tree
since it's pretty closely tied to graphics, but I think we
stopped even that because it eneded up pulling the whole of
-rc1 in at random points in time when we were't expecting it.

Ideally each subsystem would have its own CI, or there should
be some kernel wide thing. But I suppose the progress towards
something like that is glacial.

That said, we do test linux-next to some degree. And looks like
at least one of these could have been caught a bit earlier through
that. Unfortunately no one is really keeping an eye on that so
things tend to slip through. Probably need to figure out something
to make better use of that.

> 
> > https://intel-gfx-ci.01.org/tree/drm-tip/index.html has a lot
> > of colorful boxes to click if you're interested in any of the
> > logs. The fixes are included in the CI_DRM_12259 build. Earlier
> > builds were broken.
> 
> Thanks!

-- 
Ville Syrjälä
Intel
