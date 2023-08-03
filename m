Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95076FAE9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F051410E685;
	Fri,  4 Aug 2023 07:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD16010E0CB;
 Thu,  3 Aug 2023 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691071930; x=1722607930;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=NsxrA53UgZ7A/dLW9sZ979+1bM+DyTg3FTRgoUO9Eik=;
 b=AngfhjRbPf0qegcp1dSS1yk7U/MdB1CncMsIG+trNmJAYBoz5K/p8mWk
 7yMFFPYBOaz50w7Fkw1KqhbJbH1zv734wKDrNnD16H4t6xUeQmDw80R94
 0OVpLi4SoDPny5ySwDdyV6NNaZU9fMbMIQ5N6/Q/tdEkdV6S+e9x2+aJ2
 AOlwC86wjtQW4FgJiyrX8xfnG+MTOizEcaimcNSgnb13UIC1wCpeypHgi
 i4qE9VIG1d2rIDGddAanqFlS2ZczvpL7LVMkI+SDCqDIPDac4wlwyXRHQ
 z5hLSHEFs4w15gxYgYqlcaGKXlgJNYpVn6z1F+ZUt4quxJ51KbJUbpqwv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350178092"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="350178092"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 07:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732784452"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="732784452"
Received: from eozturk-mobl.ger.corp.intel.com ([10.249.38.219])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 07:12:04 -0700
Date: Thu, 3 Aug 2023 17:12:02 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v5 05/11] drm/amdgpu: Use RMW accessors for changing LNKCTL
In-Reply-To: <CADnq5_MUyjAZoRBDvdBFDYdiA6nwsaup+MKM+ajo7HKTtez9DQ@mail.gmail.com>
Message-ID: <5aebcbcf-9e76-e9f5-ae76-74b8d4f8f6e8@linux.intel.com>
References: <20230720215550.GA554900@bhelgaas>
 <eff193b-31ea-5c36-cbc-6b15a477f3b1@linux.intel.com>
 <CADnq5_MUyjAZoRBDvdBFDYdiA6nwsaup+MKM+ajo7HKTtez9DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1571245239-1691071929=:1954"
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:40 +0000
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
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, linux-pci@vger.kernel.org,
 =?ISO-8859-15?Q?Jonas_Dre=DFler?= <verdre@v0yd.nl>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, amd-gfx@lists.freedesktop.org,
 Ken Wang <Qingqing.Wang@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 stable@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1571245239-1691071929=:1954
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 21 Jul 2023, Alex Deucher wrote:

> On Fri, Jul 21, 2023 at 4:18 AM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Thu, 20 Jul 2023, Bjorn Helgaas wrote:
> >
> > > On Mon, Jul 17, 2023 at 03:04:57PM +0300, Ilpo Järvinen wrote:
> > > > Don't assume that only the driver would be accessing LNKCTL. ASPM
> > > > policy changes can trigger write to LNKCTL outside of driver's control.
> > > > And in the case of upstream bridge, the driver does not even own the
> > > > device it's changing the registers for.
> > > >
> > > > Use RMW capability accessors which do proper locking to avoid losing
> > > > concurrent updates to the register value.
> > > >
> > > > Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> > > > Fixes: 62a37553414a ("drm/amdgpu: add si implementation v10")
> > > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > > Cc: stable@vger.kernel.org
> > >
> > > Do we have any reports of problems that are fixed by this patch (or by
> > > others in the series)?  If not, I'm not sure it really fits the usual
> > > stable kernel criteria:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?id=v6.4
> >
> > I was on the edge with this. The answer to your direct question is no,
> > there are no such reports so it would be okay to leave stable out I think.
> > This applies to all patches in this series.
> >
> > Basically, this series came to be after Lukas noted the potential
> > concurrency issues with how LNKCTL is unprotected when reviewing
> > (internally) my bandwidth controller series. Then I went to look around
> > all LNKCTL usage and realized existing things might alreary have similar
> > issues.
> >
> > Do you want me to send another version w/o cc stable or you'll take care
> > of that?
> >
> > > > ---
> > > >  drivers/gpu/drm/amd/amdgpu/cik.c | 36 +++++++++-----------------------
> > > >  drivers/gpu/drm/amd/amdgpu/si.c  | 36 +++++++++-----------------------
> > > >  2 files changed, 20 insertions(+), 52 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
> > > > index 5641cf05d856..e63abdf52b6c 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> > > > @@ -1574,17 +1574,8 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
> > > >                     u16 bridge_cfg2, gpu_cfg2;
> > > >                     u32 max_lw, current_lw, tmp;
> > > >
> > > > -                   pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> > > > -                                             &bridge_cfg);
> > > > -                   pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL,
> > > > -                                             &gpu_cfg);
> > > > -
> > > > -                   tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
> > > > -                   pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
> > > > -
> > > > -                   tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
> > > > -                   pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL,
> > > > -                                              tmp16);
> > > > +                   pcie_capability_set_word(root, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
> > > > +                   pcie_capability_set_word(adev->pdev, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
> > > >
> > > >                     tmp = RREG32_PCIE(ixPCIE_LC_STATUS1);
> > > >                     max_lw = (tmp & PCIE_LC_STATUS1__LC_DETECTED_LINK_WIDTH_MASK) >>
> > > > @@ -1637,21 +1628,14 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
> > > >                             msleep(100);
> > > >
> > > >                             /* linkctl */
> > > > -                           pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> > > > -                                                     &tmp16);
> > > > -                           tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
> > > > -                           tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
> > > > -                           pcie_capability_write_word(root, PCI_EXP_LNKCTL,
> > > > -                                                      tmp16);
> > > > -
> > > > -                           pcie_capability_read_word(adev->pdev,
> > > > -                                                     PCI_EXP_LNKCTL,
> > > > -                                                     &tmp16);
> > > > -                           tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
> > > > -                           tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
> > > > -                           pcie_capability_write_word(adev->pdev,
> > > > -                                                      PCI_EXP_LNKCTL,
> > > > -                                                      tmp16);
> > > > +                           pcie_capability_clear_and_set_word(root, PCI_EXP_LNKCTL,
> > > > +                                                              PCI_EXP_LNKCTL_HAWD,
> > > > +                                                              bridge_cfg &
> > > > +                                                              PCI_EXP_LNKCTL_HAWD);
> > > > +                           pcie_capability_clear_and_set_word(adev->pdev, PCI_EXP_LNKCTL,
> > > > +                                                              PCI_EXP_LNKCTL_HAWD,
> > > > +                                                              gpu_cfg &
> > > > +                                                              PCI_EXP_LNKCTL_HAWD);
> > >
> > > Wow, there's a lot of pointless-looking work going on here:
> > >
> > >   set root PCI_EXP_LNKCTL_HAWD
> > >   set GPU  PCI_EXP_LNKCTL_HAWD
> > >
> > >   for (i = 0; i < 10; i++) {
> > >     read root PCI_EXP_LNKCTL
> > >     read GPU  PCI_EXP_LNKCTL
> > >
> > >     clear root PCI_EXP_LNKCTL_HAWD
> > >     if (root PCI_EXP_LNKCTL_HAWD was set)
> > >       set root PCI_EXP_LNKCTL_HAWD
> > >
> > >     clear GPU  PCI_EXP_LNKCTL_HAWD
> > >     if (GPU  PCI_EXP_LNKCTL_HAWD was set)
> > >       set GPU  PCI_EXP_LNKCTL_HAWD
> > >   }
> > >
> > > If it really *is* pointless, it would be nice to clean it up, but that
> > > wouldn't be material for this patch, so what you have looks good.
> >
> > I really don't know if it's needed or not. There's stuff which looks hw
> > specific going on besides those things you point out and I've not really
> > understood what all that does.
> >
> > One annoying thing is that this code has been copy-pasted to appear in
> > almost identical form in 4 files.
> >
> > I agree it certainly looks there might be room for cleaning things up here
> > but such cleanups look a bit too scary to me w/o hw to test them.
> >
> > > >                             /* linkctl2 */
> > > >                             pcie_capability_read_word(root, PCI_EXP_LNKCTL2,
> > >
> > > The PCI_EXP_LNKCTL2 stuff also includes RMW updates.  I don't see any
> > > uses of PCI_EXP_LNKCTL2 outside this driver that look relevant, so I
> > > guess we don't care about making the PCI_EXP_LNKCTL2 updates atomic?
> >
> > Currently no, which is why I left it out from this patchset.
> >
> > It is going to change soon though as I intend to submit bandwidth
> > controller series after this series which will add RMW ops for LNKCTL2.
> > The LNKCTL2 RMW parts are now in that series rather than in this one.
> >
> > After adding the bandwidth controller, this driver might be able to use
> > it instead of tweaking LNKCTL2 directly to alter PCIe link speed (but I
> > don't expect myself to be able to test these drivers and it feels too
> > risky to make such a change without testing it, unfortunately).
> 
> Thanks for the background.  It was not clear what the point of this
> patch set was.

Thanks for chimming in!

There are two reasons, one is to fix the existing RMW races and the other 
is the addition of BW controller. The RMW race issue was discovered while 
Lukas was reviewing BW controller's code and it was disjoint/generic 
enough from the BW controller to go into its own patchset.

> This code and the similar code in radeon is just to
> change the link speed of the GPU.  Some older platforms used default
> to slower link on boot so we added this code to renegotiate the link
> to a faster speed when the driver loaded.  If you are adding core
> infrastructure to do that, we can switch to that.  This was just the
> programming sequence I got from the hardware team back when this code
> was written. Most platforms I've seen these days come up at the max
> supported speed of the platform and endpoint so I don't think the code
> actually gets used much anymore.

If I understood the code correctly, it's the device side with these GPUs 
which triggers the actual Link Speed change based on those HW specific 
writes?

With the BW controller, the speed change would be initiated by setting the 
Root Port to do Link retraining.

> Taking a step back, what is the end goal of the bandwidth controller
> changes?  The reason I ask is that today, we look at the currently
> negotiated speed of the link and use that for the baseline in the
> driver.  The driver then enables PCIe dynamic power management where
> the system management unit on the GPU dynamically adjusts the link
> speed, width, and clock on demand based on the PCIe bandwidth
> requirements of the currently executing GPU jobs to save power.  This
> might conflict with software if the goal is for some software
> component to do something similar.

BW controller is mainly done for thermal reasons (a thermal side cooling 
device is provided per root port for thermald/userspace to tap into) but 
it is not to say there couldn't be other usecases.

If there's another actor besides BW controller altering Link Speeds, I 
think what would happen is that BW controller setting Root Port's Target 
Speed would just upper-bound the Link Speed requests from GPU (which makes 
sense at least from thermal point-of-view).


-- 
 i.

--8323329-1571245239-1691071929=:1954--
