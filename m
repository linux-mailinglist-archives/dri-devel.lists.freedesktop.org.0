Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506DA838831
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 08:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB4910E890;
	Tue, 23 Jan 2024 07:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151C710E890;
 Tue, 23 Jan 2024 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705995914; x=1737531914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gR1DaQBEiwp7b8LXQ3gqb1TinU2mUqOSau6sGyjnT/I=;
 b=VQVzynBSMuPdGpCDZHbogUt51Z0ZghALnoAxkvXLcb0ibyxYBC5WW2Ss
 a8MWIfKmqmZhm/sDsmHAIQkJ7lisGy+klQ5Fr+K+zLRE7hbUKzZO9Kvbf
 YkPzbpv5kKjNCcBp6DEFCsmx56v8UJs8crjxyYYESPP7sJsYYcaE8ZQbt
 lBxFQmV3dao8vEESFeLgDOISilZEHgQpWuau8EIahyqSRcuGJ3I+ZznTX
 48tXRtKEDZmmeZ2JCmkSGXUNWMG5dAOAfJhmc3nX/CJPsXwjWaUlvBzKE
 VXIHpf8Fm8w+mGfqxxF3sLCPEdglFFFDJkfq59ilZc4VhodHIzB/o6NLT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1336533"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1336533"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 23:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909211748"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="909211748"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 23:45:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 81AD911FB9B;
 Tue, 23 Jan 2024 09:45:03 +0200 (EET)
Date: Tue, 23 Jan 2024 07:45:03 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3 1/2] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <Za9uf3icrVE6Ajbe@kekkonen.localdomain>
References: <20240122114121.56752-2-sakari.ailus@linux.intel.com>
 <20240122181205.GA275751@bhelgaas>
 <CAJZ5v0gUpo6Shz2kQzie4XE23=fiPvD0=2yhjGptw8QbCq2SAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gUpo6Shz2kQzie4XE23=fiPvD0=2yhjGptw8QbCq2SAg@mail.gmail.com>
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-media@vger.kernel.org,
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

Hi Rafael, Björn,

Thanks for the review.

On Mon, Jan 22, 2024 at 07:16:54PM +0100, Rafael J. Wysocki wrote:
> On Mon, Jan 22, 2024 at 7:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Mon, Jan 22, 2024 at 01:41:21PM +0200, Sakari Ailus wrote:
> > > There are two ways to opportunistically increment a device's runtime PM
> > > usage count, calling either pm_runtime_get_if_active() or
> > > pm_runtime_get_if_in_use(). The former has an argument to tell whether to
> > > ignore the usage count or not, and the latter simply calls the former with
> > > ign_usage_count set to false. The other users that want to ignore the
> > > usage_count will have to explitly set that argument to true which is a bit
> > > cumbersome.
> >
> > s/explitly/explicitly/
> >
> > > To make this function more practical to use, remove the ign_usage_count
> > > argument from the function. The main implementation is renamed as
> > > pm_runtime_get_conditional().
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.c
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Acked-by: Takashi Iwai <tiwai@suse.de> # sound/
> > > Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> # drivers/accel/ivpu/
> > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # drivers/gpu/drm/i915/
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com> # drivers/pci/
> >
> > > -EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
> > > +EXPORT_SYMBOL_GPL(pm_runtime_get_conditional);
> >
> > If pm_runtime_get_conditional() is exported, shouldn't it also be
> > documented in Documentation/power/runtime_pm.rst?
> >
> > But I'm dubious about exporting it because
> > __intel_runtime_pm_get_if_active() is the only caller, and you end up
> > with the same pattern there that we have before this series in the PM
> > core.  Why can't intel_runtime_pm.c be updated to use
> > pm_runtime_get_if_active() or pm_runtime_get_if_in_use() directly, and
> > make pm_runtime_get_conditional() static?
> 
> Sounds like a good suggestion to me.

The i915 driver uses both but I guess it's not too much different to check
ignore_usecount separately than passing it to the API function?

I'll add another patch to do this and moving
pm_runtime_get_if_{active,in_use} implementations to runtime.c.

-- 
Regards,

Sakari Ailus
