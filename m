Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C567F2CCB0C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 01:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D0E6EB1E;
	Thu,  3 Dec 2020 00:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CFC6EA5D;
 Thu,  3 Dec 2020 00:36:25 +0000 (UTC)
IronPort-SDR: 7mIgqpepACoUzD9JwsiSWTrsgUEAUBr87PsIHQoajInooG41Npkwybsu+0tpSgpI+w+HpUZtsq
 HjLldsra4+sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="160167523"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="160167523"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 16:36:24 -0800
IronPort-SDR: MV6tZMddInp2em9Sb8Se7mfZO7yWaXBIm5njWpMTV/ETkkeguuSQdlZHR3oN0gCAZX6uS0Dx5d
 AHyuKsIhzapQ==
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="550273752"
Received: from jkbrown3-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.212.201.247])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 16:36:24 -0800
Date: Wed, 2 Dec 2020 16:36:24 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20201203003624.GA1517510@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

The commit 6db58901c2aa ("drm/i915/display: return earlier from intel_modeset_init() without display") was not actually a crucial fix, but it allowed a clean pick of the use-after-free one.

Here goes drm-intel-fixes-2020-12-02:

Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

- Program mocs:63 for cache eviction on gen9 (Chris)
- Split the breadcrumb spinlock between global and contexts (Chris)
- Retain default context state across shrinking (Venkata)
- Limit frequency drop to RPe on parking (Chris)
- Return earlier from intel_modeset_init() without display (Jani)
- Defer initial modeset until after GGTT is initialized (Chris).

Thanks,
Rodrigo.

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-12-02

for you to fetch changes up to f2f2b21feadcb1eb08687a8b20dcf6442d22be18:

  drm/i915/display: Defer initial modeset until after GGTT is initialised (2020-12-01 08:36:37 -0800)

----------------------------------------------------------------
Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

- Program mocs:63 for cache eviction on gen9 (Chris)
- Split the breadcrumb spinlock between global and contexts (Chris)
- Retain default context state across shrinking (Venkata)
- Limit frequency drop to RPe on parking (Chris)
- Return earlier from intel_modeset_init() without display (Jani)
- Defer initial modeset until after GGTT is initialized (Chris).

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915/gt: Program mocs:63 for cache eviction on gen9
      drm/i915/gt: Split the breadcrumb spinlock between global and contexts
      drm/i915/gt: Limit frequency drop to RPe on parking
      drm/i915/display: Defer initial modeset until after GGTT is initialised

Jani Nikula (1):
      drm/i915/display: return earlier from intel_modeset_init() without display

Venkata Ramana Nayana (1):
      drm/i915/gt: Retain default context state across shrinking

 drivers/gpu/drm/i915/display/intel_display.c      |  24 ++--
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c       | 168 ++++++++++------------
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h |   6 +-
 drivers/gpu/drm/i915/gt/intel_context.c           |   3 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h     |  12 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c              |  14 +-
 drivers/gpu/drm/i915/gt/intel_rps.c               |   4 +
 drivers/gpu/drm/i915/gt/shmem_utils.c             |   7 +-
 drivers/gpu/drm/i915/i915_request.h               |   6 +-
 9 files changed, 124 insertions(+), 120 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
