Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1351DBE0
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 17:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5701410EDB7;
	Fri,  6 May 2022 15:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DD910ED97;
 Fri,  6 May 2022 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651850508; x=1683386508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wuykpPoNfAIf4Hp8U3B0Rs7Q+RbsaElRmgqxx5o336c=;
 b=lgNhnoAcDrXzkhikZ0STULTgB+IYtwR0BpLw87TaSyTc5m/yRULKjXaK
 pxuarQKoFv8dqBvq6mPtFNRXJ9pILfxCzpseCpZiNa/Zpw2VAZpixb7sp
 oYUy61yAjU6jUWpYVd80DpbT0S+CKNVCdbvqFvCNtKj/i+5LJ4oojLhVl
 USgVagOZ6u5GLpmlW2aVysK3lSEt4PHTuyTE8XYSMgfjfEhoyzPfOBMhR
 IQiG8gJtACDNn1U0S4hZCvOE1K78TrEaVWhVDs0D+Sv7rwxLkTB0mrqnB
 swrFRQ2/5QflprX0BhyZvKWjqyu2loaBYNR8xm8SAu1Y0LBtiDUn7PP7z w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="331484003"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="331484003"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="563857792"
Received: from hbourgeo-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.81])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:21:45 -0700
Date: Fri, 6 May 2022 17:21:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 6/7] drm/i915/gt: Create per-tile RPS
 sysfs interfaces
Message-ID: <YnU9BT9K2oK1rIi7@intel.intel>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-7-andi.shyti@linux.intel.com>
 <87y1zekhbl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1zekhbl.fsf@intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Fri, May 06, 2022 at 02:53:50PM +0300, Jani Nikula wrote:
> On Sat, 19 Mar 2022, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > +#define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
> > +	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
> > +	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
> 
> Consider this macro...
> 
> > +
> > +#define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
> > +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
> > +#define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
> > +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
> > +
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(RP0_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(RP1_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(RPn_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
> 
> ...and the static keyword here.
> 
> All of the dev_attr_rps_* attributes become non-static, as the static
> only applies to the dev_attr_gt_* attributes:

right! Missed that! Thanks, will send the fix.

Thanks,
Andi

>   CHECK   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:468:8: warning: symbol 'dev_attr_rps_act_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:469:8: warning: symbol 'dev_attr_rps_cur_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:470:8: warning: symbol 'dev_attr_rps_boost_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:471:8: warning: symbol 'dev_attr_rps_RP0_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:472:8: warning: symbol 'dev_attr_rps_RP1_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:473:8: warning: symbol 'dev_attr_rps_RPn_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:474:8: warning: symbol 'dev_attr_rps_max_freq_mhz' was not declared. Should it be static?
> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:475:8: warning: symbol 'dev_attr_rps_min_freq_mhz' was not declared. Should it be static?
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
