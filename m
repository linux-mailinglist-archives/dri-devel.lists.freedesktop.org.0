Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C120813399
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 15:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1D710E25C;
	Thu, 14 Dec 2023 14:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E808310E306;
 Thu, 14 Dec 2023 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702565525; x=1734101525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qCIz9/wISOFhbzCPePMHPZHVxHo6rggiQe6i5Ba58Hs=;
 b=PrSOwy+b64SS1UMr4q8j1YhbqMT4DZWQ7m0ZWEoXlAY4/n47KFtReg/T
 /K3PtX36Qfrkz/xKd6NqKFnAXbbNxebsWHGx/DYcjcMSabIEB0oVop1CV
 5d4V4FVWMVFqoqoh6L0+Kp6DrCWc/YgPwSE/8gqdA8cO2NeHYFlJanFdQ
 WujTzGPKWykWKxhwve5QGmZSXDTsqpm7UnbNxnZbEXyj4wW8dqfrqH7Ig
 dPApZaDOFaH+SJdrDANkGOz+8C2uIP6Rsv+9tjfFYE6pAby/55s7ijH/w
 4DGHPAThi+FeDB3NPkd3XN6AIxx9hz1WlThEAnUGo6gv3dUOai5WNKuAo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8525600"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="8525600"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1105734919"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="1105734919"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmsmga005.fm.intel.com with ESMTP; 14 Dec 2023 06:52:00 -0800
Date: Thu, 14 Dec 2023 23:04:24 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
 kmap_local_page()
Message-ID: <ZXsZeEw/w+LfaKyH@intel.com>
References: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
 <ZXsA4ojbROLXMkfz@intel.com>
 <2abe6f02-b93e-4207-b9be-e9185c7b69e5@linux.intel.com>
 <c968f151-6445-4ab4-9d2f-c59568665707@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c968f151-6445-4ab4-9d2f-c59568665707@linux.intel.com>
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
Cc: Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 02:35:26PM +0000, Tvrtko Ursulin wrote:
> Date: Thu, 14 Dec 2023 14:35:26 +0000
> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Subject: Re: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
>  kmap_local_page()
> 
> 
> On 14/12/2023 13:45, Tvrtko Ursulin wrote:
> > 
> > Hi Zhao,
> > 
> > On 14/12/2023 13:19, Zhao Liu wrote:
> > > Hi maintainers,
> > > 
> > > Just kindly ping.
> > > May I ask if this refresh version could be merged into the next tree of
> > > the i915?
> > 
> > I certainly spotted your series last week or so but then it slipped my
> > mind to go through it. Should be able to go through it today or
> > tomorrow.
> 
> It all looks good to me. I only needed to queue a re-test in our CI since v3
> failed BAT, but pretty sure it wasn't at fault. Once I am satisfied with the
> results I will merge the series. Thanks for the cleanups and your patience!
> 
> Regards,
> 
> Tvrtko
> 

Thanks for your review!

Regards,
Zhao

> 
> > Regards,
> > 
> > Tvrtko
> > 
> > > 
> > > Thanks,
> > > Zhao
> > > 
> > > On Sun, Dec 03, 2023 at 09:29:38PM +0800, Zhao Liu wrote:
> > > > Date: Sun, 3 Dec 2023 21:29:38 +0800
> > > > From: Zhao Liu <zhao1.liu@linux.intel.com>
> > > > Subject: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
> > > >   kmap_local_page()
> > > > X-Mailer: git-send-email 2.34.1
> > > > 
> > > > From: Zhao Liu <zhao1.liu@intel.com>
> > > > 
> > > > Hi all,
> > > > 
> > > > I refreshed this v3 by rebasing v2 [1] on the commit 968f35f4ab1c
> > > > ("Merge tag 'v6.7-rc3-smb3-client-fixes' of git://git.samba.org/sfrench/
> > > > cifs-2.6").
> > > > 
> > > > Based on the current code, I rechecked the substitutions in v2 and they
> > > > still stand and are valid, so no code change in v3.
> > > > 
> > > > Thanks for all the review! And sorry v2 was missed, I'll pay more
> > > > attention to this v3.
> > > > 
> > > > 
> > > > Purpose of This Patchset
> > > > ========================
> > > > 
> > > > The purpose of this pacthset is to replace all uses of kmap_atomic() in
> > > > i915 with kmap_local_page() because the use of kmap_atomic() is being
> > > > deprecated in favor of kmap_local_page()[2]. And 92b64bd (mm/highmem:
> > > > add notes about conversions from kmap{,_atomic}()) has declared the
> > > > deprecation of kmap_atomic().
> > > > 
> > > > 
> > > > Motivation for Deprecating kmap_atomic() and Using kmap_local_page()
> > > > ====================================================================
> > > > 
> > > > The main difference between atomic and local mappings is that local
> > > > mappings doesn't disable page faults or preemption (the preemption is
> > > > disabled for !PREEMPT_RT case, otherwise it only disables migration).
> > > > 
> > > > With kmap_local_page(), we can avoid the often unwanted side effect of
> > > > unnecessary page faults and preemption disables.
> > > > 
> > > > 
> > > > Patch summary
> > > > =============
> > > > 
> > > > Patch 1, 4-6 and 8-9 replace kmap_atomic()/kunmap_atomic() with
> > > >          kmap_local_page()/kunmap_local() directly. With these local
> > > >          mappings, the page faults and preemption are allowed.
> > > > 
> > > > Patch 2 and 7 use memcpy_from_page() and memcpy_to_page() to replace
> > > >          kmap_atomic()/kunmap_atomic(). These two variants of memcpy()
> > > >          are based on the local mapping, so page faults and preemption
> > > >          are also allowed in these two interfaces.
> > > > 
> > > > Patch 3 replaces kmap_atomic()/kunmap_atomic() with kmap_local_page()/
> > > >          kunmap_local() and also disable page fault since the
> > > > for special
> > > >          handling (pls see the commit message).
> > > > 
> > > > 
> > > > Reference
> > > > =========
> > > > 
> > > > [1]: https://lore.kernel.org/all/20230329073220.3982460-1-zhao1.liu@linux.intel.com/
> > > > [2]:
> > > > https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> > > > 
> > > > 
> > > > Thanks and Best Regards,
> > > > Zhao
> > > > 
> > > > ---
> > > > Changlog:
> > > > 
> > > > Changes since v2:
> > > > * Rebased on 968f35f4ab1c ("Merge tag 'v6.7-rc3-smb3-client-fixes' of
> > > >    git://git.samba.org/sfrench/cifs-2.6").
> > > > * Removed changelog (of v2) in commit message.
> > > > * Fixed typo in cover letter (Fabio).
> > > > * Added Reviewed-by tags from Ira and Fabio.
> > > > 
> > > > Changes since v1:
> > > > * Dropped hot plug related description in commit message since it has
> > > >    nothing to do with kmap_local_page().
> > > > * Emphasized the motivation for using kmap_local_page() in commit
> > > >    message.
> > > > * Rebased patch 1 on f47e630 (drm/i915/gem: Typecheck page lookups) to
> > > >    keep the "idx" variable of type pgoff_t here.
> > > > * Used memcpy_from_page() and memcpy_to_page() to replace
> > > >    kmap_local_page() + memcpy() in patch 2.
> > > > 
> > > > ---
> > > > Zhao Liu (9):
> > > >    drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
> > > >    drm/i915: Use memcpy_[from/to]_page() in gem/i915_gem_pyhs.c
> > > >    drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
> > > >    drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
> > > >    drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
> > > >    drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
> > > >    drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
> > > >    drm/i915: Use kmap_local_page() in i915_cmd_parser.c
> > > >    drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c
> > > > 
> > > >   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c       | 10 +++++-----
> > > >   drivers/gpu/drm/i915/gem/i915_gem_object.c           |  8 +++-----
> > > >   drivers/gpu/drm/i915/gem/i915_gem_phys.c             | 10 ++--------
> > > >   drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  6 ++++--
> > > >   drivers/gpu/drm/i915/gem/selftests/huge_pages.c      |  6 +++---
> > > >   .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
> > > >   .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  8 ++++----
> > > >   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             |  5 +----
> > > >   drivers/gpu/drm/i915/i915_cmd_parser.c               |  4 ++--
> > > >   9 files changed, 28 insertions(+), 41 deletions(-)
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
