Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBEF1E642A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 16:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4128D6E588;
	Thu, 28 May 2020 14:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241366E584;
 Thu, 28 May 2020 14:40:19 +0000 (UTC)
IronPort-SDR: 71skjs7t0xKwX8tpnvDMxq7l8XDg2RJYJTWnXp4lsT+TW5ulPACW6YvGjb7Eq6uuf2ou9to8DM
 1ivup0vBDP9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 07:40:18 -0700
IronPort-SDR: btbwKYi2CTmKiySvF9jhms0TA7uJyGwg4z+fW4FpnvCbI6Eu5iSdkLS0y6iHh8F5nrQgGR78F9
 zxBH1ICa0kSg==
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="442970603"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.87.93])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 07:40:14 -0700
Date: Thu, 28 May 2020 17:40:12 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200528144012.GA141827@jlahtine-desk.ger.corp.intel.com>
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

Two bigger fixes to corner case kernel access faults
and three workload scheduling fixups this week.

CI_DINF_191 at:
https://intel-gfx-ci.01.org/tree/drm-intel-next-fixes/combined-alt.html?

I got gvt-next-fixes pull today, I'll pull it next week so it
has time to run through CI.

PS. Update on igt@i915_selftest@live@gt_pm is that subtest was
updated and the added part is failing for now. The granularity
of the kernel selftests is short one level from normal IGT due
to nature of how they integrate to CI.

Regards, Joonas

***

drm-intel-next-fixes-2020-05-28:

One empty list iteration bug (Cc: stable), One use after free fix
and three workload scheduling fixups.

The following changes since commit d96536f0fe699729a0974eb5b65eb0d87cc747e1:

  drm/i915: Fix AUX power domain toggling across TypeC mode resets (2020-05-19 17:54:07 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2020-05-28

for you to fetch changes up to 757a9395f33c51c4e6eff2c7c0fbd50226a58224:

  drm/i915/gem: Avoid iterating an empty list (2020-05-25 15:40:43 +0300)

----------------------------------------------------------------
One empty list iteration bug (Cc: stable), One use after free fix
and three workload scheduling fixups.

----------------------------------------------------------------
Chris Wilson (5):
      drm/i915: Don't set queue-priority hint when supressing the reschedule
      drm/i915/gt: Remove errant assertion in __intel_context_do_pin
      drm/i915: Disable semaphore inter-engine sync without timeslicing
      drm/i915: Avoid using rq->engine after free during i915_fence_release
      drm/i915/gem: Avoid iterating an empty list

 drivers/gpu/drm/i915/gem/i915_gem_context.c |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c   | 15 ++++++++-----
 drivers/gpu/drm/i915/gt/intel_context.c     |  2 --
 drivers/gpu/drm/i915/i915_request.c         | 35 +++++++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_scheduler.c       | 16 ++++++-------
 5 files changed, 52 insertions(+), 20 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
