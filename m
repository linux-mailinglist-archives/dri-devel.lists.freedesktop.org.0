Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C05187C1
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 17:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D341410EAFC;
	Tue,  3 May 2022 15:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AC610EAFC;
 Tue,  3 May 2022 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651590116; x=1683126116;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7+GjncC3bHhwbX5qOKUFyO/rz6H6hBo3bmmBM3sSdQU=;
 b=lH6zmUpZh1wZUTTHk/FdGrdZOPrZftsPSZGzi9qc5/RatiCm72EO2KoY
 U0iu+IdnAjAxn9kx2DDSU0yx2rzoG/an1RXR+ZB47j9zifWGqOeY3244b
 3Qf4JyGz6TsRbeTFW8lDDDGmMQ39Jd9qLyFCMdHzhrIg2gf9Zeqe7+qvd
 0J38Tcu72OGeiymvdAUNBU7AnKc6Gt0hrYPdLSdEL3/IiNyQ27LqzxgYx
 QzOzWM79ubbNV963qTscYwlWyieH5OL8XgBDSnMVr0YCnigoZ1/zzl9Px
 mPtK2I+b+nS446GWt7zUKg8Fvzl1FQ+YlZbYFGbELmogkBLoz5+xBDdQ1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248042195"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="248042195"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 08:01:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="562237192"
Received: from doshaugh-mobl.ger.corp.intel.com (HELO [10.213.236.211])
 ([10.213.236.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 08:01:54 -0700
Message-ID: <14104cc9-cc10-ea0d-bdae-89101d63dba1@linux.intel.com>
Date: Tue, 3 May 2022 16:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH 00/11] i915: Introduce Ponte Vecchio
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <0524db05-4d9e-4522-4d80-10ffe4c4207c@linux.intel.com>
 <YnFCgtBB+wUY2Up2@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YnFCgtBB+wUY2Up2@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/05/2022 15:56, Matt Roper wrote:
> On Tue, May 03, 2022 at 09:21:04AM +0100, Tvrtko Ursulin wrote:
>>
>> On 02/05/2022 17:34, Matt Roper wrote:
>>> Ponte Vecchio (PVC) is a new GPU based on the Xe_HPC architecture.  As a
>>> compute-focused platform, PVC has compute engines and enhanced copy
>>> engines, but no render engine (there is no geometry pipeline) and no
>>> display.
>>>
>>> This is just a handful of early enablement patches, including some
>>> initial support for the new copy engines (although we're not yet adding
>>> those to the platform's engine list or exposing them to userspace just
>>> yet).
>>
>> IMO lets hold off merging this until next week if that sounds acceptable?
>> This week I need to do a final pull for final bits of DG2 and I would like
>> to keep it as small as possible.
> 
> I was wondering if we should try to apply patch #1 quickly, just to get
> the IS_PONTEVECCHIO definition into the tree early and minimize the
> cross-tree merge hassles down the road?  Although I guess PVC might not
> be as big a problem as some platforms since no display means that we
> won't have a huge split of patches between -next and -gt-next that both
> need the basic defines present.

Okay, that sounds fair.

Regards,

Tvrtko

> 
> 
> Matt
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Ayaz A Siddiqui (1):
>>>     drm/i915/pvc: Define MOCS table for PVC
>>>
>>> John Harrison (1):
>>>     drm/i915/pvc: Reduce stack usage in reset selftest with extra blitter
>>>       engine
>>>
>>> Lucas De Marchi (2):
>>>     drm/i915/pvc: skip all copy engines from aux table invalidate
>>>     drm/i915/pvc: read fuses for link copy engines
>>>
>>> Matt Roper (5):
>>>     drm/i915/pvc: Add forcewake support
>>>     drm/i915/pvc: Read correct RP_STATE_CAP register
>>>     drm/i915/pvc: Engines definitions for new copy engines
>>>     drm/i915/pvc: Interrupt support for new copy engines
>>>     drm/i915/pvc: Reset support for new copy engines
>>>
>>> Stuart Summers (2):
>>>     drm/i915/pvc: add initial Ponte Vecchio definitions
>>>     drm/i915/pvc: Remove additional 3D flags from PIPE_CONTROL
>>>
>>>    drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  20 ++-
>>>    drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  92 +++++++++++
>>>    drivers/gpu/drm/i915/gt/intel_engine_types.h  |  10 +-
>>>    drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  12 +-
>>>    drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  16 ++
>>>    drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  56 ++++---
>>>    drivers/gpu/drm/i915/gt/intel_gt_types.h      |   1 +
>>>    drivers/gpu/drm/i915/gt/intel_mocs.c          |  24 ++-
>>>    drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
>>>    drivers/gpu/drm/i915/gt/intel_workarounds.c   |  13 +-
>>>    drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   9 +-
>>>    drivers/gpu/drm/i915/gvt/cmd_parser.c         |   2 +-
>>>    drivers/gpu/drm/i915/i915_drv.h               |   6 +
>>>    drivers/gpu/drm/i915/i915_pci.c               |  23 +++
>>>    drivers/gpu/drm/i915/i915_reg.h               |   9 ++
>>>    drivers/gpu/drm/i915/intel_device_info.c      |   1 +
>>>    drivers/gpu/drm/i915/intel_device_info.h      |   5 +-
>>>    drivers/gpu/drm/i915/intel_uncore.c           | 150 +++++++++++++++++-
>>>    drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +
>>>    19 files changed, 417 insertions(+), 38 deletions(-)
>>>
> 
