Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E0B86053
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 18:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAAD10E323;
	Thu, 18 Sep 2025 16:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xPy3sIcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AA710E078;
 Thu, 18 Sep 2025 16:27:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DAEA440776;
 Thu, 18 Sep 2025 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C47C4CEE7;
 Thu, 18 Sep 2025 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758212839;
 bh=NN989nk/5dfBYdhkrfZLY4quFIfFrDZ/kloAz6j8mI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xPy3sIcH4Ms9Z/SuqOmT3XWicWlCS/HiNDm8oxnShs7ZNLD26K9z8O6Dl9P32VqKl
 cqvzdJsTi758zGHFbrD+LyMGOIjCsYz6Atex6wJAmLSiKv3GlqkNhBpx6m1bXUJgSw
 ioUHKxUU0cjASsM1rh+nppTOx8YDGa4Euurs1Vt8=
Date: Thu, 18 Sep 2025 18:27:16 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Message-ID: <2025091805-sedan-elongated-40cf@gregkh>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-3-badal.nilawar@intel.com>
 <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
 <CY5PR11MB63665FAB1FE8D8CBE17C31CEED0FA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <wuy7xx57puqytyigl2fbosluckauxikgdvcrdvtubbob6olvyl@wlbsiuquprep>
 <7l4emr357ugep2brz67d6mxgudxqpgfkf3gyhr5cp6i6uhku42@jhgdf4cujbis>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7l4emr357ugep2brz67d6mxgudxqpgfkf3gyhr5cp6i6uhku42@jhgdf4cujbis>
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

On Fri, Sep 12, 2025 at 12:19:21AM -0500, Lucas De Marchi wrote:
> On Tue, Sep 09, 2025 at 09:43:02AM -0500, Lucas De Marchi wrote:
> > On Tue, Sep 09, 2025 at 04:50:41AM +0000, Usyskin, Alexander wrote:
> > > > > +static int mei_lb_component_match(struct device *dev, int subcomponent,
> > > > > +				  void *data)
> > > > > +{
> > > > > +	/*
> > > > > +	 * This function checks if requester is Intel %PCI_CLASS_DISPLAY_VGA
> > > > or
> > > > > +	 * %PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is
> > > > the
> > > > > +	 * grand parent of mei_if i.e. late bind MEI device
> > > > > +	 */
> > > > > +	struct device *base = data;
> > > > > +	struct pci_dev *pdev;
> > > > > +
> > > > > +	if (!dev)
> > > > > +		return 0;
> > > > > +
> > > > > +	if (!dev_is_pci(dev))
> > > > > +		return 0;
> > > > > +
> > > > > +	pdev = to_pci_dev(dev);
> > > > > +
> > > > > +	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
> > > > > +		return 0;
> > > > > +
> > > > > +	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
> > > > > +	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
> > > > 
> > > > this doesn't seem right, we should allow other PCI classes. AFAICS this
> > > > check could just be removed and just leave the INTEL_COMPONENT_LB below
> > > > to protect for component match
> > > > 
> > > > Lucas De Marchi
> > > > 
> > > 
> > > The subcomponent is unique only in its own instance of the component framework.
> > > Or I'm wrong here?
> > > We have to ensure that we have Intel display device, not any other device to
> > > subcomponent check to work correctly.
> > 
> > We are matching by child-parent relationship + the component id. So you
> > have both the mei device and another pci device that added that specific
> > subcomponent and both need to have a common parent. Thinking about
> > another device that would match the parent-child relationship:  audio,
> > but audio doesn't add that.
> > 
> > what scenario would cause a false match that I'm not seeing?
> 
> so, I doesn't seem it would fail any, but it's fine as a sanity check.
> This is in fact very similar to mei_pxp_component_match(). If we are
> going to remove the display check, it could be done later on top, making
> sure not to match what it shouldn't.
> 
> So, this looks good to me. I tested this on a Battlemage card
> it's correclty loading the firmware:
> 
> 	xe 0000:03:00.0: [drm:xe_late_bind_init [xe]] Request late binding firmware xe/fan_control_8086_e20b_8086_1100.bin
> 	xe 0000:03:00.0: [drm] Using fan_control firmware from xe/fan_control_8086_e20b_8086_1100.bin version 203.0.0.0
> 	...
> 	mei_lb xe.mei-gscfi.768-e2c2afa2-3817-4d19-9d95-06b16b588a5d: bound 0000:03:00.0 (ops xe_late_bind_component_ops [xe])
> 	xe 0000:03:00.0: [drm:xe_late_bind_work [xe]] Load fan_control firmware
> 	xe 0000:03:00.0: [drm:xe_late_bind_work [xe]] Load fan_control firmware successful
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Greg, does this look ok to you now for us to merge through drm?

No objection from me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
