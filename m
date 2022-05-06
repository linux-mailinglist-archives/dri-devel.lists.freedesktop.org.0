Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A451D71A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 13:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C1410E141;
	Fri,  6 May 2022 11:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1305E10E068;
 Fri,  6 May 2022 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651838036; x=1683374036;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/9nHGkA6SXdKtLhlMWeNYArYpUy8qSmumOoQAJsugts=;
 b=SjuMdvVf1EEpsQLhdPEEKneopHPE0XHDCfxlY34AEqTev5b43FL6qd9i
 HaDNTseqTP1Y6tab3/Z6qXsmw+X7q4KScIPREtDiK6Si/QvBaIVzlOqsa
 2BfGmWhdyskhS6ZyE4QW5kOP+GUVZqX3TQ+MvTcxg4mqZPUcSUQWgj/OX
 f1ZpTRBaqCILVaaX5QyYEjyOUwF+nIAEqK/scx9/J2NdTsdPdWSQfU1d5
 SlB3CwMNHwXTY5B+gR8axPcwOvXt78YHajcWL45nKcWg5R2+VDB2gzysw
 g2iV682Jqo3VV3MDw2NSHY99Y3XnK5576TLV/Pc8RjAg9uh2F/+XYhc/H Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="255932623"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="255932623"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 04:53:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585943817"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 04:53:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v7 6/7] drm/i915/gt: Create per-tile RPS
 sysfs interfaces
In-Reply-To: <20220318233938.149744-7-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-7-andi.shyti@linux.intel.com>
Date: Fri, 06 May 2022 14:53:50 +0300
Message-ID: <87y1zekhbl.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 19 Mar 2022, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> +#define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
> +	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
> +	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)

Consider this macro...

> +
> +#define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
> +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
> +#define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
> +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
> +
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(RP0_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(RP1_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(RPn_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);

...and the static keyword here.

All of the dev_attr_rps_* attributes become non-static, as the static
only applies to the dev_attr_gt_* attributes:

  CHECK   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:468:8: warning: symbol 'dev_attr_rps_act_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:469:8: warning: symbol 'dev_attr_rps_cur_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:470:8: warning: symbol 'dev_attr_rps_boost_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:471:8: warning: symbol 'dev_attr_rps_RP0_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:472:8: warning: symbol 'dev_attr_rps_RP1_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:473:8: warning: symbol 'dev_attr_rps_RPn_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:474:8: warning: symbol 'dev_attr_rps_max_freq_mhz' was not declared. Should it be static?
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:475:8: warning: symbol 'dev_attr_rps_min_freq_mhz' was not declared. Should it be static?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
