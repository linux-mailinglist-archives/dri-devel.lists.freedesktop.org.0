Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77063135A37
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 14:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3176E423;
	Thu,  9 Jan 2020 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D1589FE3;
 Thu,  9 Jan 2020 13:35:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 05:35:04 -0800
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; d="scan'208";a="218365494"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.9.128])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 05:35:01 -0800
Date: Thu, 9 Jan 2020 15:34:58 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200109133458.GA15558@jlahtine-desk.ger.corp.intel.com>
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

Hi Dave & Daniel,

Happy New Year, now back from the holiday break.

A bunch of important fixes. Further fixes for the power/perf
regressions caused by the past security fixes. Then fix for
user reported GPU hang regression. Revert to avoid screen flicker
caused by HDA audio. Then missing two W/A and uninitialized uAPI
variable fix.

There's one further fix which I didn't include in this PR as the
CI results won't make it in time. So at least that will be in next
weeks PR.

Regards, Joonas

***

drm-intel-fixes-2020-01-09-1:

- Fix GitLab issue #446 causing GPU hangs: Do not restore invalid RS state
- Fix GitLab issue #846: Restore coarse power gating that was disabled
  by initial RC66 context corruption security fixes.
- Revert f6ec9483091f ("drm/i915: extend audio CDCLK>=2*BCLK constraint to more platforms")
  to avoid screen flicker
- Fix to fill in unitialized uabi_instance in virtual engine uAPI
- Add two missing W/As for ICL and EHL

The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-01-09-1

for you to fetch changes up to 2b2c4a83d69dc9f2b46b8e791f5b8c2451c267bd:

  drm/i915/dp: Disable Port sync mode correctly on teardown (2020-01-07 15:11:40 +0200)

----------------------------------------------------------------
- Fix GitLab issue #446 causing GPU hangs: Do not restore invalid RS state
- Fix GitLab issue #846: Restore coarse power gating that was disabled
  by initial RC66 context corruption security fixes.
- Revert f6ec9483091f ("drm/i915: extend audio CDCLK>=2*BCLK constraint to more platforms")
  to avoid screen flicker
- Fix to fill in unitialized uabi_instance in virtual engine uAPI
- Add two missing W/As for ICL and EHL

----------------------------------------------------------------
Chris Wilson (3):
      drm/i915/gt: Mark up virtual engine uabi_instance
      drm/i915/gt: Do not restore invalid RS state
      drm/i915/gt: Restore coarse power gating

Kai Vehmanen (1):
      drm/i915: Limit audio CDCLK>=2*BCLK constraint back to GLK only

Manasi Navare (1):
      drm/i915/dp: Disable Port sync mode correctly on teardown

Matt Roper (2):
      drm/i915: Add Wa_1408615072 and Wa_1407596294 to icl,ehl
      drm/i915: Add Wa_1407352427:icl,ehl

 drivers/gpu/drm/i915/display/intel_audio.c      |  4 ++--
 drivers/gpu/drm/i915/display/intel_display.c    |  7 +-----
 drivers/gpu/drm/i915/gt/intel_lrc.c             |  2 ++
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 31 +++++++++----------------
 drivers/gpu/drm/i915/i915_drv.h                 |  6 +++--
 drivers/gpu/drm/i915/i915_reg.h                 |  8 ++++++-
 drivers/gpu/drm/i915/intel_pm.c                 | 11 +++++++++
 7 files changed, 38 insertions(+), 31 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
