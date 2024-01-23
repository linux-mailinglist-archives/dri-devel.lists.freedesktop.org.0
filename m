Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD1839C68
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 23:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6BE10E91D;
	Tue, 23 Jan 2024 22:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061B10E918;
 Tue, 23 Jan 2024 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706049634; x=1737585634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z/gVOBIyuGeHrB0qusJzDPUINYJVDgoRszKTN0NH9s0=;
 b=Nn4MyCJLYA5vk0CvgCQOoCpMQDtmqjYqxK07x7oQ8yKu4V/tKp+SrnNP
 EN2o/6S0zsM3zEi2V7uZ1QkKxpQW35sto0H2OXqcDjgAL6av+w1AknTF4
 ROBTHRvus95ThpYdJ1LbLRn9GbiiQujFo/er2bhNYiCrIYXMKHWRw63vv
 iqaL+epJUjvkXkliTXqaEsGb08Mqr99arSlzBBs4rAdMb0P++eR1V5WQB
 xDeVq007OUv4ofH8f7xjWPiJ0JqdzPqqvS7a6ZL+ltGc/kloYbDDgORPs
 cn0L33uuXO0/huU6lXRhxOed4zfIr7YHSUjtc+1LceCP15H5uPfd03uSl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="573953"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="573953"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 14:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876490218"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="876490218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 14:40:27 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 596D411FB8E;
 Wed, 24 Jan 2024 00:40:25 +0200 (EET)
Date: Tue, 23 Jan 2024 22:40:25 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 1/3] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <ZbBAWROxRKE8Y8VU@kekkonen.localdomain>
References: <ZbAlFKE_fZ_riRVu@kekkonen.localdomain>
 <20240123214801.GA330312@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123214801.GA330312@bhelgaas>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 03:48:01PM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 23, 2024 at 08:44:04PM +0000, Sakari Ailus wrote:
> > On Tue, Jan 23, 2024 at 11:24:23AM -0600, Bjorn Helgaas wrote:
> > ...
> 
> > > - I don't know whether it's feasible, but it would be nice if the
> > >   intel_pm_runtime_pm.c rework could be done in one shot instead of
> > >   being split between patches 1/3 and 2/3.
> > > 
> > >   Maybe it could be a preliminary patch that uses the existing
> > >   if_active/if_in_use interfaces, followed by the trivial if_active
> > >   updates in this patch.  I think that would make the history easier
> > >   to read than having the transitory pm_runtime_get_conditional() in
> > >   the middle.
> > 
> > I think I'd merge the two patches. The second patch is fairly small, after
> > all, and both deal with largely the same code.
> 
> I'm not sure which two patches you mean, but the fact that two patches
> deal with largely the same code is not necessarily an argument for
> merging them.  From a reviewing perspective, it's nice if a patch like

Patches 1 and 2. The third patch introduces a new Runtime PM API function.

> 1/3, where it's largely mechanical and easy to review, is separated
> from patches that make more substantive changes.
> 
> That's why I think it'd be nice if the "interesting"
> intel_pm_runtime_pm.c changes were all in the same patch, and ideally,
> if that patch *only* touched intel_pm_runtime_pm.c.

I don't think squashing the second patch to the first really changes this
meaningfully: the i915 driver simply needs both
pm_runtime_get_if_{active,in_use}, and this is what the patch does to other
drivers already. Making the pm_runtime_get_conditional static would also
fit for the first patch if the desire is to not to introduce it at all.

-- 
Sakari Ailus
