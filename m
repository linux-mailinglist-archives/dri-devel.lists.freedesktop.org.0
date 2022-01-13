Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB548D45C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D371E10F2C1;
	Thu, 13 Jan 2022 09:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBD010F2C1;
 Thu, 13 Jan 2022 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642066392; x=1673602392;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FIiIIYhzfU+BNjUU8EuUmgFCxrgJ7iTW6xva1YQmpk4=;
 b=BjImeD/EGR7kcRG4oucApwMI9ynzUVuySq2lyY8bOtY4rujbupKcCvuP
 iU37Aw7gWHkmGU8u/Jvspfwm9BjbruPv3+R9Y3ObovGladsqor+IjyTd0
 alvt0OfBfJDQHq6idDiroYElOcbpFlrf9c7KflV/sLcn99vUDqP8hR7F7
 3dLiDe7o0fs8xlAm5WnWUSiRDvspOgEOa3Q0RG/Wgj5JV7tH3r3O7h693
 omyi/xjEQ0dmXiHqobchZRimFuYPhQ7cg2FvD/zNcEAujYmJ465Btza9d
 ioOhwQDxBEhogHOJL++NSZp5sT51ciokJ1EK0IdO9snpLue2jTPGee4/Z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="231314579"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="231314579"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 01:33:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="691741893"
Received: from guevarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.242.1])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 01:33:05 -0800
Date: Thu, 13 Jan 2022 09:33:03 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Yd/xzyCM87rfrwQT@tursulin-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave and Daniel,

A few fixes for the merge window.

One dealing with runtime PM handling on the PXP unbind path and a few
regarding the newly added TTM backend support.

Regards,

Tvrtko

---

drm-intel-next-fixes-2022-01-13:
- Hold runtime PM wakelock during PXP unbind (Juston Li)
- Three fixes for the TTM backend fault handling (Matthew Auld)
- Make sure to unmap when purging in the TTM backend (Matthew Auld)
The following changes since commit c65fe9cbbfd61dbc12868f9ed4940c80fcb249e8:

  drm/i915/fbc: Remember to update FBC state even when not reallocating CFB (2021-12-27 11:46:48 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-01-13

for you to fetch changes up to 6ef295e34297433c78ea02dfcf1c649a769050bb:

  drm/i915/ttm: ensure we unmap when purging (2022-01-10 14:00:47 +0000)

----------------------------------------------------------------
- Hold runtime PM wakelock during PXP unbind (Juston Li)
- Three fixes for the TTM backend fault handling (Matthew Auld)
- Make sure to unmap when purging in the TTM backend (Matthew Auld)

----------------------------------------------------------------
Juston Li (1):
      drm/i915/pxp: Hold RPM wakelock during PXP unbind

Matthew Auld (4):
      drm/i915: don't call free_mmap_offset when purging
      drm/i915/ttm: only fault WILLNEED objects
      drm/i915/ttm: add unmap_virtual callback
      drm/i915/ttm: ensure we unmap when purging

 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  3 +++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 27 +++++++++++++++++++++-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 18 ++++-----------
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |  5 +++-
 6 files changed, 38 insertions(+), 17 deletions(-)
