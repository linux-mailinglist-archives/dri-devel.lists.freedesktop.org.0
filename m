Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E92CCB69
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 02:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68556EB28;
	Thu,  3 Dec 2020 01:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA56EB23;
 Thu,  3 Dec 2020 01:07:34 +0000 (UTC)
IronPort-SDR: bku1fUXW8mMl47H9BPOJGlS5CsxYO4GGpvDsq2XwAtBNjgvybUnfUEJAem2KMDNrm935vHC/XL
 FqGnmuU8NrVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="191337388"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="191337388"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 17:07:33 -0800
IronPort-SDR: vqF1pvKJpSRtdsUThKbKGmeubCBg4YOt0rhlmgYXiP4I+TTnNZR7qOhzNL9XlftB7icznu2P4e
 MWoqCBS4RekA==
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="373712438"
Received: from jkbrown3-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.212.201.247])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 17:07:32 -0800
Date: Wed, 2 Dec 2020 17:07:31 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <20201203010731.GC1454199@intel.com>
References: <20201203003624.GA1517510@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203003624.GA1517510@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 02, 2020 at 04:36:24PM -0800, Rodrigo Vivi wrote:
> Hi Dave and Daniel,
> 
> Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.
> 
> The commit 6db58901c2aa ("drm/i915/display: return earlier from intel_modeset_init() without display") was not actually a crucial fix, but it allowed a clean pick of the use-after-free one.
> 
> Here goes drm-intel-fixes-2020-12-02:
> 
> Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.
> 
> - Program mocs:63 for cache eviction on gen9 (Chris)
> - Split the breadcrumb spinlock between global and contexts (Chris)

Please ignore this for now. I was informed that I missed one patch
that helps this one here. So I'm going to push a new fixes branch now
and will prepare another pull request tomorrow.

> - Retain default context state across shrinking (Venkata)
> - Limit frequency drop to RPe on parking (Chris)
> - Return earlier from intel_modeset_init() without display (Jani)
> - Defer initial modeset until after GGTT is initialized (Chris).
> 
> Thanks,
> Rodrigo.
> 
> The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:
> 
>   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-12-02
> 
> for you to fetch changes up to f2f2b21feadcb1eb08687a8b20dcf6442d22be18:
> 
>   drm/i915/display: Defer initial modeset until after GGTT is initialised (2020-12-01 08:36:37 -0800)
> 
> ----------------------------------------------------------------
> Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.
> 
> - Program mocs:63 for cache eviction on gen9 (Chris)
> - Split the breadcrumb spinlock between global and contexts (Chris)
> - Retain default context state across shrinking (Venkata)
> - Limit frequency drop to RPe on parking (Chris)
> - Return earlier from intel_modeset_init() without display (Jani)
> - Defer initial modeset until after GGTT is initialized (Chris).
> 
> ----------------------------------------------------------------
> Chris Wilson (4):
>       drm/i915/gt: Program mocs:63 for cache eviction on gen9
>       drm/i915/gt: Split the breadcrumb spinlock between global and contexts
>       drm/i915/gt: Limit frequency drop to RPe on parking
>       drm/i915/display: Defer initial modeset until after GGTT is initialised
> 
> Jani Nikula (1):
>       drm/i915/display: return earlier from intel_modeset_init() without display
> 
> Venkata Ramana Nayana (1):
>       drm/i915/gt: Retain default context state across shrinking
> 
>  drivers/gpu/drm/i915/display/intel_display.c      |  24 ++--
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c       | 168 ++++++++++------------
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h |   6 +-
>  drivers/gpu/drm/i915/gt/intel_context.c           |   3 +-
>  drivers/gpu/drm/i915/gt/intel_context_types.h     |  12 +-
>  drivers/gpu/drm/i915/gt/intel_mocs.c              |  14 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c               |   4 +
>  drivers/gpu/drm/i915/gt/shmem_utils.c             |   7 +-
>  drivers/gpu/drm/i915/i915_request.h               |   6 +-
>  9 files changed, 124 insertions(+), 120 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
