Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894285A107
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275A110E2AB;
	Mon, 19 Feb 2024 10:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYCD5r/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C6410E2A4;
 Mon, 19 Feb 2024 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708338723; x=1739874723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EMBRqBRFw8T7hhFbe2NlzLlqJGZE8btg4vYfiNAbfnk=;
 b=LYCD5r/siOJ/0Ym4nvgeuL5fTizzafofQ+Rq+KePvtyoykSX1+u/oYCE
 jde319A29XoYNBO21Imy7NrJ2KY8NfmkuqliGYaV4QMssvMFITFRCX7ys
 1imKXTAhHCvTKzPBOeH/TtFqq30jvLrjKw2e7KrYg1SjVRh3Ke2BohO42
 bdJzxiQYhW/zjByUtBGu5ocAShQ9fkQZ3Tbh3aIM7/4ihT08/SpmBJmNR
 7iLzS+Nbb+b0CzR2j54bKTiiLb2QbaKLtPZaBk3NIAAM77PE3gg3oI4M0
 mzSwHmxchlWvTuPX3WhTU2GbNjVbu86NcNjxy5RcoIaH61ZnlGsQU+JTN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2273791"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2273791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4709503"
Received: from samathah-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.246.48.149])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:32:00 -0800
Date: Mon, 19 Feb 2024 11:31:57 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 1/2] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <ZdMuHeyV9NoVzRTi@ashyti-mobl2.lan>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-2-andi.shyti@linux.intel.com>
 <20240215165541.GJ718896@mdroper-desk1.amr.corp.intel.com>
 <ZdMquCAXtNdbJHbW@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdMquCAXtNdbJHbW@ashyti-mobl2.lan>
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

On Mon, Feb 19, 2024 at 11:17:33AM +0100, Andi Shyti wrote:
> On Thu, Feb 15, 2024 at 08:55:41AM -0800, Matt Roper wrote:
> > On Thu, Feb 15, 2024 at 02:59:23PM +0100, Andi Shyti wrote:
> > > The hardware should not dynamically balance the load between CCS
> > > engines. Wa_16016805146 recommends disabling it across all
> > 
> > Is this the right workaround number?  When I check the database, this
> > workaround was rejected on both DG2-G10 and DG2-G11, and doesn't even
> > have an entry for DG2-G12.
> > 
> > There are other workarounds that sound somewhat related to load
> > balancing (e.g., part 3 of Wa_14019159160), but what's asked there is
> > more involved than just setting one register bit and conflicts a bit
> > with the second patch of this series.
> 
> thanks for checking it. Indeed the WA I mentioned is limited to
> a specific platform. This recommendation comes in different WA,
> e.g. this one: Wa_14019186972 (3rd point). Will start using that
> as a reference.

actually you are right, I checked with Joonas and I will use
Wa_14019159160.

Thanks,
Andi
