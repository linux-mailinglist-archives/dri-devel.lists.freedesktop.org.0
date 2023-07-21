Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9871575C130
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D3B10E624;
	Fri, 21 Jul 2023 08:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BA210E16D;
 Fri, 21 Jul 2023 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689926859; x=1721462859;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=/x2E+8YwVi4rEKlaO6bbN2NXNezaRPCtMGgsNvrAxPQ=;
 b=W9fD+JON+alEHWoPYszQXDVsfrkIZkEtf4uLl/QwYL6/RYOuE2A9dH/4
 5pE1d6bqSjAL8ZFFS45gWhwxavT5jPSLGF2uudsvEbR+4gW+lxe1tivRN
 yzcXfNFPcVpWVsSibhsyuVovIhf7FEn+yJiq2GDTfpLE4qNGoDLotiqOU
 lh8Hga0efTbmZT/I8CVRdgHRQqFu43WAPjap0d/x9jO5UP2ET42I4bl28
 a3YGHMtO7mmGmBzIB8yqW/8ATBAafWp9HBYUK3nwgTvO0ZpbBwaKounua
 oLJEOPWriPUfZhA8JyOyJmFMgSykQGednU0xq+i+uY9mYTCvuhoucxcl+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397854996"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="397854996"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 01:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="790112254"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="790112254"
Received: from ijarvine-mobl2.ger.corp.intel.com ([10.251.223.59])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 01:07:32 -0700
Date: Fri, 21 Jul 2023 11:07:26 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 05/11] drm/amdgpu: Use RMW accessors for changing LNKCTL
In-Reply-To: <20230720215550.GA554900@bhelgaas>
Message-ID: <eff193b-31ea-5c36-cbc-6b15a477f3b1@linux.intel.com>
References: <20230720215550.GA554900@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1112654154-1689926049=:1785"
Content-ID: <a15c9e5c-5a8d-6b73-c89c-5e25d229313e@linux.intel.com>
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:18:14 +0000
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
Cc: =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?ISO-8859-15?Q?Jonas_Dre=DFler?= <verdre@v0yd.nl>,
 "Rafael J . Wysocki" <rafael@kernel.org>, amd-gfx@lists.freedesktop.org,
 Dean Luick <dean.luick@cornelisnetworks.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Ken Wang <Qingqing.Wang@amd.com>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1112654154-1689926049=:1785
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <3ed5b531-8771-dc6a-eeed-b45f4e5ea5ef@linux.intel.com>

On Thu, 20 Jul 2023, Bjorn Helgaas wrote:

> On Mon, Jul 17, 2023 at 03:04:57PM +0300, Ilpo Järvinen wrote:
> > Don't assume that only the driver would be accessing LNKCTL. ASPM
> > policy changes can trigger write to LNKCTL outside of driver's control.
> > And in the case of upstream bridge, the driver does not even own the
> > device it's changing the registers for.
> > 
> > Use RMW capability accessors which do proper locking to avoid losing
> > concurrent updates to the register value.
> > 
> > Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> > Fixes: 62a37553414a ("drm/amdgpu: add si implementation v10")
> > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Cc: stable@vger.kernel.org
> 
> Do we have any reports of problems that are fixed by this patch (or by
> others in the series)?  If not, I'm not sure it really fits the usual
> stable kernel criteria:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?id=v6.4

I was on the edge with this. The answer to your direct question is no, 
there are no such reports so it would be okay to leave stable out I think. 
This applies to all patches in this series.

Basically, this series came to be after Lukas noted the potential 
concurrency issues with how LNKCTL is unprotected when reviewing 
(internally) my bandwidth controller series. Then I went to look around 
all LNKCTL usage and realized existing things might alreary have similar 
issues.

Do you want me to send another version w/o cc stable or you'll take care 
of that?

> > ---
> >  drivers/gpu/drm/amd/amdgpu/cik.c | 36 +++++++++-----------------------
> >  drivers/gpu/drm/amd/amdgpu/si.c  | 36 +++++++++-----------------------
> >  2 files changed, 20 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
> > index 5641cf05d856..e63abdf52b6c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> > @@ -1574,17 +1574,8 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
> >  			u16 bridge_cfg2, gpu_cfg2;
> >  			u32 max_lw, current_lw, tmp;
> >  
> > -			pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> > -						  &bridge_cfg);
> > -			pcie_capability_read_word(adev->pdev, PCI_EXP_LNKCTL,
> > -						  &gpu_cfg);
> > -
> > -			tmp16 = bridge_cfg | PCI_EXP_LNKCTL_HAWD;
> > -			pcie_capability_write_word(root, PCI_EXP_LNKCTL, tmp16);
> > -
> > -			tmp16 = gpu_cfg | PCI_EXP_LNKCTL_HAWD;
> > -			pcie_capability_write_word(adev->pdev, PCI_EXP_LNKCTL,
> > -						   tmp16);
> > +			pcie_capability_set_word(root, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
> > +			pcie_capability_set_word(adev->pdev, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_HAWD);
> >  
> >  			tmp = RREG32_PCIE(ixPCIE_LC_STATUS1);
> >  			max_lw = (tmp & PCIE_LC_STATUS1__LC_DETECTED_LINK_WIDTH_MASK) >>
> > @@ -1637,21 +1628,14 @@ static void cik_pcie_gen3_enable(struct amdgpu_device *adev)
> >  				msleep(100);
> >  
> >  				/* linkctl */
> > -				pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> > -							  &tmp16);
> > -				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
> > -				tmp16 |= (bridge_cfg & PCI_EXP_LNKCTL_HAWD);
> > -				pcie_capability_write_word(root, PCI_EXP_LNKCTL,
> > -							   tmp16);
> > -
> > -				pcie_capability_read_word(adev->pdev,
> > -							  PCI_EXP_LNKCTL,
> > -							  &tmp16);
> > -				tmp16 &= ~PCI_EXP_LNKCTL_HAWD;
> > -				tmp16 |= (gpu_cfg & PCI_EXP_LNKCTL_HAWD);
> > -				pcie_capability_write_word(adev->pdev,
> > -							   PCI_EXP_LNKCTL,
> > -							   tmp16);
> > +				pcie_capability_clear_and_set_word(root, PCI_EXP_LNKCTL,
> > +								   PCI_EXP_LNKCTL_HAWD,
> > +								   bridge_cfg &
> > +								   PCI_EXP_LNKCTL_HAWD);
> > +				pcie_capability_clear_and_set_word(adev->pdev, PCI_EXP_LNKCTL,
> > +								   PCI_EXP_LNKCTL_HAWD,
> > +								   gpu_cfg &
> > +								   PCI_EXP_LNKCTL_HAWD);
> 
> Wow, there's a lot of pointless-looking work going on here:
> 
>   set root PCI_EXP_LNKCTL_HAWD
>   set GPU  PCI_EXP_LNKCTL_HAWD
> 
>   for (i = 0; i < 10; i++) {
>     read root PCI_EXP_LNKCTL
>     read GPU  PCI_EXP_LNKCTL
> 
>     clear root PCI_EXP_LNKCTL_HAWD
>     if (root PCI_EXP_LNKCTL_HAWD was set)
>       set root PCI_EXP_LNKCTL_HAWD
> 
>     clear GPU  PCI_EXP_LNKCTL_HAWD
>     if (GPU  PCI_EXP_LNKCTL_HAWD was set)
>       set GPU  PCI_EXP_LNKCTL_HAWD
>   }
> 
> If it really *is* pointless, it would be nice to clean it up, but that
> wouldn't be material for this patch, so what you have looks good.

I really don't know if it's needed or not. There's stuff which looks hw 
specific going on besides those things you point out and I've not really 
understood what all that does.

One annoying thing is that this code has been copy-pasted to appear in 
almost identical form in 4 files.

I agree it certainly looks there might be room for cleaning things up here 
but such cleanups look a bit too scary to me w/o hw to test them.

> >  				/* linkctl2 */
> >  				pcie_capability_read_word(root, PCI_EXP_LNKCTL2,
> 
> The PCI_EXP_LNKCTL2 stuff also includes RMW updates.  I don't see any
> uses of PCI_EXP_LNKCTL2 outside this driver that look relevant, so I
> guess we don't care about making the PCI_EXP_LNKCTL2 updates atomic?

Currently no, which is why I left it out from this patchset.

It is going to change soon though as I intend to submit bandwidth 
controller series after this series which will add RMW ops for LNKCTL2.
The LNKCTL2 RMW parts are now in that series rather than in this one.

After adding the bandwidth controller, this driver might be able to use
it instead of tweaking LNKCTL2 directly to alter PCIe link speed (but I 
don't expect myself to be able to test these drivers and it feels too 
risky to make such a change without testing it, unfortunately).


-- 
 i.
--8323329-1112654154-1689926049=:1785--
