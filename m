Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B49611BFBA5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8CA6E907;
	Thu, 30 Apr 2020 14:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C896B6E905;
 Thu, 30 Apr 2020 14:01:32 +0000 (UTC)
IronPort-SDR: Z8yObFAyTHGwUQczgxMczfIOKlv8M4qo8gUPveXZ6m1hcByGzvxvsuK5ZlMs1zQlL7yI7h7dKN
 y+NBQ7zjqd2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 07:01:31 -0700
IronPort-SDR: iwJCqdXKV3N3uPb1SwGRNG3Ba1+PqDWFo4EXKAjTy4lCtAeCqFva00J/NO4EKgdAyGC9zm2i1u
 vgWsTjO9s54w==
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="249754898"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 07:01:30 -0700
Date: Thu, 30 Apr 2020 07:00:42 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200430140042.GA270140@intel.com>
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

Here goes drm-intel-fixes-2020-04-30:

- Fix selftest refcnt leak (Xiyu)
- Fix gem vma lock (Chris)
- Fix gt's i915_request.timeline acquire by checking if cacheline is valid (Chris)
- Fix IRQ postinistall fault masks (Matt)

Thanks,
Rodrigo.

The following changes since commit d082119f4277ff4a63e44d293864aa9f2112b217:

  drm/i915/dpcd_bl: Unbreak enable_dpcd_backlight modparam (2020-04-20 10:12:58 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-04-30

for you to fetch changes up to 8598eb781cf68fd6cb67c479f1479ae58bd54fb9:

  drm/i915: Use proper fault mask in interrupt postinstall too (2020-04-28 16:38:03 -0700)

----------------------------------------------------------------
- Fix selftest refcnt leak (Xiyu)
- Fix gem vma lock (Chris)
- Fix gt's i915_request.timeline acquire by checking if cacheline is valid (Chris)
- Fix IRQ postinistall fault masks (Matt)

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gem: Hold obj->vma.lock over for_each_ggtt_vma()
      drm/i915/gt: Check cacheline is valid before acquiring

Matt Roper (1):
      drm/i915: Use proper fault mask in interrupt postinstall too

Xiyu Yang (1):
      drm/i915/selftests: Fix i915_address_space refcnt leak

 drivers/gpu/drm/i915/gem/i915_gem_tiling.c      | 20 ++++++++++++++++++--
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 12 ++++++++----
 drivers/gpu/drm/i915/gt/intel_timeline.c        |  2 ++
 drivers/gpu/drm/i915/i915_irq.c                 |  6 ++----
 drivers/gpu/drm/i915/i915_vma.c                 | 10 ++++++----
 5 files changed, 36 insertions(+), 14 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
