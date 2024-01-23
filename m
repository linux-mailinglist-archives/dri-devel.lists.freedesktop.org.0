Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4356839A80
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 21:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7636F10E5CD;
	Tue, 23 Jan 2024 20:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF90210E301;
 Tue, 23 Jan 2024 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042654; x=1737578654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YTYq9NKaF9Qyd5spfDIHdzZzMX2Nn0CsEqHbs7SWNQo=;
 b=TGpz2tg40C94NiwCVWqNOjPTdwth3aWQMrjzdaULIaRUxHYDYYUruKP0
 V7GhmyADNQGgIaQQyXJBXoQNo8V6RIjzW8dpi8Lfrv6OSzwrIlqH5WEAu
 BizfB7dlmkcICHmlSnyisbMco5IRcIQxgNSTPCD45K6fB5/6zQELuDx7Q
 vrfeW54txDYYbtfvUZE2TjF9svAE/cEs6SkQmH4nifTv0RzXRx7OgYvst
 QCyfzgJGz2ehxKtG2VNzuYGQxgCE/DZjmkXKQskrrlAqWzoygd/CWdILB
 iB/oj9fp+XD72Q9nsQ2PLLPozfEQEqWYEzwbLxBHO6XzVuygo4Qc3MwM5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23114671"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="23114671"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905365871"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="905365871"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:44:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 7F17811FAD4;
 Tue, 23 Jan 2024 22:44:04 +0200 (EET)
Date: Tue, 23 Jan 2024 20:44:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 1/3] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <ZbAlFKE_fZ_riRVu@kekkonen.localdomain>
References: <20240123095642.97303-2-sakari.ailus@linux.intel.com>
 <20240123172423.GA317147@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123172423.GA317147@bhelgaas>
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

Hi Bjorn,

Thanks for the review.

On Tue, Jan 23, 2024 at 11:24:23AM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 23, 2024 at 11:56:42AM +0200, Sakari Ailus wrote:
> > There are two ways to opportunistically increment a device's runtime PM
> > usage count, calling either pm_runtime_get_if_active() or
> > pm_runtime_get_if_in_use(). The former has an argument to tell whether to
> > ignore the usage count or not, and the latter simply calls the former with
> > ign_usage_count set to false. The other users that want to ignore the
> > usage_count will have to explitly set that argument to true which is a bit
> > cumbersome.
> > 
> > To make this function more practical to use, remove the ign_usage_count
> > argument from the function. The main implementation is renamed as
> > pm_runtime_get_conditional().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.c
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Takashi Iwai <tiwai@suse.de> # sound/
> > Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> # drivers/accel/ivpu/
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # drivers/gpu/drm/i915/
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> # drivers/pci/
> 
> - Previous PM history uses "PM: " in the subject lines (not "pm: ").

Oops. I'm not sure why I used lower case. (Maybe I've written too many
times "media:" prefix to the subject?) I'll fix this in v5.

> 
> - I don't know whether it's feasible, but it would be nice if the
>   intel_pm_runtime_pm.c rework could be done in one shot instead of
>   being split between patches 1/3 and 2/3.
> 
>   Maybe it could be a preliminary patch that uses the existing
>   if_active/if_in_use interfaces, followed by the trivial if_active
>   updates in this patch.  I think that would make the history easier
>   to read than having the transitory pm_runtime_get_conditional() in
>   the middle.

I think I'd merge the two patches. The second patch is fairly small, after
all, and both deal with largely the same code.

> 
> - Similarly, it would be nice if pm_runtime_get_conditional() never
>   had to be published in pm_runtime.h, instead of being temporarily
>   added there by this patch and then immediately made private by 2/3.
>   Maybe that's not practical, I dunno.

-- 
Regards,

Sakari Ailus
