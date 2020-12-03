Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236F2CD81F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 14:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0304A6E9B8;
	Thu,  3 Dec 2020 13:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8886E0C6;
 Thu,  3 Dec 2020 13:47:07 +0000 (UTC)
IronPort-SDR: Q/XjP2j90MhnwoKteiWUk8UZ+QJNceGkmgmgha9wDP533xTkNFUBlRdPN3ATJHzWvWROb3uVFB
 XfzCwfupncUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="191423565"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="191423565"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 05:47:07 -0800
IronPort-SDR: V6nooksqB85zL8OhDDjZez9e2+sodtVNFUUHz09vMLDhy4HIcQ269ykdaC+zuvNsCqjindO7pY
 KtA6FLYDqvfw==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="435393736"
Received: from snaskar-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.71.168])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 05:47:06 -0800
Date: Thu, 3 Dec 2020 05:47:05 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes v2
Message-ID: <20201203134705.GA1575873@intel.com>
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

Please ignore the pull request I had sent yesterday and use only this one.

I had missed one patch: 14d1eaf08845 ("drm/i915/gt: Protect context lifetime with RCU").

Also, please notice that the commit 6db58901c2aa ("drm/i915/display: return earlier from
+intel_modeset_init() without display") was not actually a crucial fix, but it
+allowed a clean pick of the use-after-free one.

Here goes drm-intel-fixes-2020-12-03:
Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

- Program mocs:63 for cache eviction on gen9 (Chris)
- Protect context lifetime with RCU (Chris)
- Split the breadcrumb spinlock between global and contexts (Chris)
- Retain default context state across shrinking (Venkata)
- Limit frequency drop to RPe on parking (Chris)
- Return earlier from intel_modeset_init() without display (Jani)
- Defer initial modeset until after GGTT is initialized (Chris)

Thanks,
Rodrigo.

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-12-03

for you to fetch changes up to ccc9e67ab26feda7e62749bb54c05d7abe07dca9:

  drm/i915/display: Defer initial modeset until after GGTT is initialised (2020-12-02 17:05:58 -0800)

----------------------------------------------------------------
Fixes for GPU hang, null dereference, suspend-resume, power consumption, and use-after-free.

- Program mocs:63 for cache eviction on gen9 (Chris)
- Protect context lifetime with RCU (Chris)
- Split the breadcrumb spinlock between global and contexts (Chris)
- Retain default context state across shrinking (Venkata)
- Limit frequency drop to RPe on parking (Chris)
- Return earlier from intel_modeset_init() without display (Jani)
- Defer initial modeset until after GGTT is initialized (Chris)

----------------------------------------------------------------
Chris Wilson (5):
      drm/i915/gt: Program mocs:63 for cache eviction on gen9
      drm/i915/gt: Protect context lifetime with RCU
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
 drivers/gpu/drm/i915/gt/intel_context.c           |  15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h     |  23 ++-
 drivers/gpu/drm/i915/gt/intel_mocs.c              |  14 +-
 drivers/gpu/drm/i915/gt/intel_rps.c               |   4 +
 drivers/gpu/drm/i915/gt/shmem_utils.c             |   7 +-
 drivers/gpu/drm/i915/i915_request.h               |   6 +-
 9 files changed, 143 insertions(+), 124 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
