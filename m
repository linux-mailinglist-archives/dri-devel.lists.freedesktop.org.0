Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C3548153
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA47310E912;
	Mon, 13 Jun 2022 08:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F710E7FE;
 Mon, 13 Jun 2022 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655108007; x=1686644007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=q+bPSdzQfbFmfqWLyc7xxTr4bad3jJacb5pnIjLpiEI=;
 b=H+cjFnV4kD4F6hwafs/mp4rv5f/w5NYaA6BtTKg7GGuxeOa7AfCiSCdQ
 TkOGaRrEVLiCy4cA14N7TszjQzS6Mb5lg1YOkSaaIAoxxcnBIX8mYYu9t
 uC/yMndSf9yrBsBTPhHoUZKOmAP2DPY6WpETc+kwqV8S6n9padptEoMQs
 Vswl3ocKfBGx4q95Nlt2X8u3D+UUVhVVWn4i4sj2nyhfXDb8W0jtmT/CF
 SnLzUh2tOpSqcyuryKpEmqaACkmkD5YmQJBtTWyeg8FTplWfGSv+9ae2e
 suyfZghUbNwyuQ9NJFJKGRLg3Pou9wHq1l+tsBTmUAfvWJrGA/qzIL0g+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275740266"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275740266"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 01:13:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639603117"
Received: from njascanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 01:13:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] i915: Extract, polish, and document multicast handling
In-Reply-To: <20220611005711.596098-1-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220611005711.596098-1-matthew.d.roper@intel.com>
Date: Mon, 13 Jun 2022 11:13:09 +0300
Message-ID: <87mtehyoa2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
> Multicast/replicated (MCR) registers on Intel hardware are a purely
> GT-specific concept.  Rather than leaving MCR register handling spread
> across several places throughout the driver (intel_uncore.c, intel_gt.c,
> etc.) with confusing combinations of handler functions living in
> different namespaces, let's consolidate it all into a single place
> (intel_gt_mcr.c) and provide a more consistent and clearly-documented
> interface for the rest of the driver to access such registers:

I don't have the time for review, but overall this seems like a nice
cleanup. Ack.

As to documentation, I think usually documenting static functions using
kernel-doc is excessive, and a short regular comment might suffice. On
the other hand, the nice documentation doesn't show up anywhere, because
you also need to bolt it to some .rst!

BR,
Jani.


>
>  * intel_gt_mcr_read -- unicast read from specific instance
>  * intel_gt_mcr_read_any[_fw] -- unicast read from any non-terminated
>    instance
>  * intel_gt_mcr_unicast_write -- unicast write to specific instance
>  * intel_gt_mcr_multicast_write[_fw] -- multicast write to all instances
>
> Matt Roper (2):
>   drm/i915/gt: Move multicast register handling to a dedicated file
>   drm/i915/gt: Cleanup interface for MCR operations
>
>  drivers/gpu/drm/i915/Makefile               |   1 +
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |   3 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c   |  36 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 297 +-----------
>  drivers/gpu/drm/i915/gt/intel_gt.h          |  15 -
>  drivers/gpu/drm/i915/gt/intel_gt_debugfs.c  |   3 +-
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 483 ++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |  34 ++
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |   5 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |   9 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |   3 +-
>  drivers/gpu/drm/i915/i915_drv.h             |   2 -
>  drivers/gpu/drm/i915/intel_uncore.c         | 112 -----
>  drivers/gpu/drm/i915/intel_uncore.h         |   8 -
>  14 files changed, 551 insertions(+), 460 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.h

-- 
Jani Nikula, Intel Open Source Graphics Center
