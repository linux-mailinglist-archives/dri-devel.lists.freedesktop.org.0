Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520C987878
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 19:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5197D10EBC0;
	Thu, 26 Sep 2024 17:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFpVW3Xz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9236510EBC0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727372419; x=1758908419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5+tRCSCx+zYL3XG5Ci53X7WaHH+/mHH7H6Qm2hWmWiI=;
 b=NFpVW3XzH73ulJnmWClNVYTOW/UxoZqXpgFhx1GxwJaPLgd3Vxt87s3R
 i04R97igVHdQ4oZYwaAUiYfzIA9t/PhRsMgEYE3hZL17RiQDldalfh8oB
 7uExUmQmxlwSWriBsTCacpBz+GNxuzeSxxmzi6M32PuOVTtvEFWC+UC3v
 L1imx2OIu8357FkLePe4Tv1gZQcuNl59x+B5pSpN2kwwrm8BtPilwqsdB
 +zgKG3m3F/UJQU/BcjVsG7jYUYWIPs854RskRreeGDXj/d6pZYbK1RPYs
 zDEq8564HDyhlZZp87kWymwb56RoGzWplqNl0lo2j3YEuaiDYP17QRRQn g==;
X-CSE-ConnectionGUID: z4M7zVQtQ8+jKMKtEM+hrQ==
X-CSE-MsgGUID: VIXqe1fvSuml7/jFKTKW6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26001065"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26001065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:40:19 -0700
X-CSE-ConnectionGUID: N/5HlwNfRm6AH0laOgdcNw==
X-CSE-MsgGUID: zwBDOUFwSbWZnAvuRkkeoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72682152"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:40:19 -0700
Date: Thu, 26 Sep 2024 10:40:18 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: Print bad EDID notices less often
Message-ID: <ZvWcghjXLntdsNAn@tassilo>
References: <20240926164202.2668922-1-ak@linux.intel.com>
 <871q161gu5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q161gu5.fsf@intel.com>
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

> > -static void edid_block_status_print(enum edid_block_status status,
> > +static void edid_block_status_print(struct drm_connector *connector,
> > +				    enum edid_block_status status,
> >  				    const struct edid *block,
> >  				    int block_num)
> >  {
> > +	if (status != EDID_BLOCK_OK &&
> > +		connector &&
> > +		!connector->bad_edid_counter++ &&
> 
> The status print has no business changing anything. Besides, this
> function gets called per EDID block, not per EDID.

In this case it doesn't matter because the counter only
prints once per life time of a connector structure, 
or if it wraps.

I suppose this can be moved into a wrapper.

> 
> > +		!drm_debug_enabled(DRM_UT_KMS))
> 
> If we did that, we might just as well change the pr_* prints to
> drm_dbg_kms() and be done with it.

But that would prevent it always unless debug is set?

I was trying to print it according to counter first. This matches
the existing usage.

-Andi
