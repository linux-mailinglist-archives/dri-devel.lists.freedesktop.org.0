Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A86E121B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A7A10E2CB;
	Thu, 13 Apr 2023 16:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B510E2CB;
 Thu, 13 Apr 2023 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681402787; x=1712938787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xghZj6lhFTuvEY8d7KPDafcTF5N9iliZGLVbT79DOCo=;
 b=X35+5cFQ7UIfaIAA3yCnHxbK4b8F9JAosywZANfpJ/bL27yFIdrQJGEu
 sgtW5cGDAYDCngr32lQrf01pQ6/RLFz8oNbaVkPqYmXeufUAklwg36XHS
 +lt9k0Jzk7uiHnxrXCDzpCW0CJlDakD8TiVTssURT7FXnEx/IiB4aI/Rr
 TpyWr06KVycQFjsoEUEzIgvqRkidA1XWr+TiJhKAutuSgz/1tceDaakn6
 7+FiY17yTDgJgDcq/fVu6EXPeGSZpuH5tHeR6G+n8Nz6b9F5vinDeudQs
 crz6xB2oTIvIw/bECzUEJzJo8wm/o3ducvzl8tF7p/2w1/CRjnwPDyrxH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323855261"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="323855261"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="778837886"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="778837886"
Received: from fwillger-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.213.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:19:43 -0700
Date: Thu, 13 Apr 2023 18:19:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <ZDgrhNNSCn2bzdfm@ashyti-mobl2.lan>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
 <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
 <20230413155210.GH4085390@mdroper-desk1.amr.corp.intel.com>
 <8279ae61-f24e-b7f9-464d-86a29562122f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8279ae61-f24e-b7f9-464d-86a29562122f@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 09:03:29AM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 4/13/2023 8:52 AM, Matt Roper wrote:
> > On Thu, Apr 13, 2023 at 03:56:21PM +0200, Andi Shyti wrote:
> > > Hi Tvrtko,
> > > 
> > > (I forgot to CC Daniele)
> > > 
> > > On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
> > > > On 13/04/2023 10:20, Andi Shyti wrote:
> > > > > From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > > 
> > > > > In multitile systems IRQ need to be reset and enabled per GT.
> > > > > 
> > > > > Although in MTL the GUnit misc interrupts register set are
> > > > > available only in GT-0, we need to loop through all the GT's
> > > > > in order to initialize the media engine which lies on a different
> > > > > GT.
> > > > > 
> > > > > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > > ---
> > > > > Hi,
> > > > > 
> > > > > proposing again this patch, apparently GuC needs this patch to
> > > > > initialize the media GT.
> > > > What is the resolution for Matt's concern that this is wrong for MTL?
> > > There are two explanations, one easy and one less easy.
> > > 
> > > The easy one: without this patch i915 doesn't boot on MTL!(*)
> > > 
> > > The second explanation is that in MTL the media engine has it's
> > > own set of misc irq's registers and those are on a different GT
> > > (Daniele pointed this out).
> > Assuming you're talking about MTL_GUC_MGUC_INTR_MASK, that's not true;
> > it's just a single sgunit register (0x1900e8) that has different
> > bitfields for the primary GuC and the media GuC.  So I still think we
> > should avoid looping over GTs; it's actually much simpler to handle
> > things in a single pass since we can just determine the single register
> > value once (all fields) and write it directly, instead of doing two
> > separate RMW updates to the same register to try to avoid clobbering
> > the other GuC's settings.

if we handle exceptions in a single pass wouldn't we have many
exceptions to handle in the long run?

> > For pre-MTL platforms, it's the same register, except that the bitfield
> > now devoted to the media GuC was previously used for something else
> > (scatter/gather).
> 
> It's not just the GuC, the VCS/VECS engine programming is also tied to the
> media GT (via the HAS_ENGINE checks). It looks like we unconditionally
> program VCS 0 and 2, so it'll still work for MTL, but if we get a device
> with more VCS engines it'll break. Maybe we can add a MTL version of the
> function that just programs everything unconditionally? Going forward it
> should be ok to program things for engines that don't exist, but I'm not
> sure we can do that for older platforms that came before the extra engines
> were ever defined in HW.

This is more or less what Tvrtko has suggested, as well. Looks to
me like replicating some code... anyway, I will try and see how
it looks like.

Andi

PS Thanks Matt, Daniele and Tvrtko for the feedback.

> Daniele
> 
> > 
> > 
> > Matt
> > 
> > > I sent this patch not to bypass any review, but to restart the
> > > discussion as this patch was just dropped.
> > > 
> > > Thanks,
> > > Andi
> > > 
> > > 
> > > (*)
> > > [drm] *ERROR* GT1: GUC: CT: No response for request 0x550a (fence 7)
> > > [drm] *ERROR* GT1: GUC: CT: Sending action 0x550a failed (-ETIMEDOUT) status=0X0
> > > [drm] *ERROR* GT1: GUC: Failed to enable usage stats: -ETIMEDOUT
> > > [drm] *ERROR* GT1: GuC initialization failed -ETIMEDOUT
> > > [drm] *ERROR* GT1: Enabling uc failed (-5)
> > > [drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!
