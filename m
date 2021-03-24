Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16833477F4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999616E9E8;
	Wed, 24 Mar 2021 12:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FDD6E9E8;
 Wed, 24 Mar 2021 12:13:46 +0000 (UTC)
IronPort-SDR: aAHBAFxmcvCoRXOlkplTMKEF4CWWY6an4AAHbXGyZuNxX57wnxmlMTt0QBKSZbmpTSimctWDSi
 Ksk3rcRStR6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386143"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386143"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:45 -0700
IronPort-SDR: 72s3DQ8MQE9deQacsmB9gKTu5jdw66Ndt1OjbUa2OiwRmDQjgMkNmvgxuD5Gvpkodbwx8D2MTN
 ONAb1ob2uc8w==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277107"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:44 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/7] Default request/fence expiry + watchdog
Date: Wed, 24 Mar 2021 12:13:28 +0000
Message-Id: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

"Watchdog" aka "restoring hangcheck" aka default request/fence expiry - second
post of a somewhat controversial feature, now upgraded to patch status.

I quote the "watchdog" becuase in classical sense watchdog would allow userspace
to ping it and so remain alive.

I quote "restoring hangcheck" because this series, contrary to the old
hangcheck, is not looking at whether the workload is making any progress from
the kernel side either. (Although disclaimer my memory may be leaky - Daniel
suspects old hangcheck had some stricter, more indiscriminatory, angles to it.
But apart from being prone to both false negatives and false positives I can't
remember that myself.)

Short version - ask is to fail any user submissions after a set time period. In
this RFC that time is twelve seconds.

Time counts from the moment user submission is "runnable" (implicit and explicit
dependencies have been cleared) and keeps counting regardless of the GPU
contetion caused by other users of the system.

So semantics are really a bit weak, but again, I understand this is really
really wanted by the DRM core even if I am not convinced it is a good idea.

There are some dangers with doing this - text borrowed from a patch in the
series:

  This can have an effect that workloads which used to work fine will
  suddenly start failing. Even workloads comprised of short batches but in
  long dependency chains can be terminated.

  And becuase of lack of agreement on usefulness and safety of fence error
  propagation this partial execution can be invisible to userspace even if
  it is "listening" to returned fence status.

  Another interaction is with hangcheck where care needs to be taken timeout
  is not set lower or close to three times the heartbeat interval. Otherwise
  a hang in any application can cause complete termination of all
  submissions from unrelated clients. Any users modifying the per engine
  heartbeat intervals therefore need to be aware of this potential denial of
  service to avoid inadvertently enabling it.

  Given all this I am personally not convinced the scheme is a good idea.
  Intuitively it feels object importers would be better positioned to
  enforce the time they are willing to wait for something to complete.

v2:
 * Dropped context param.
 * Improved commit messages and Kconfig text.

v3:
 * Log timeouts.
 * Bump timeout to 20s to see if it helps Tigerlake.
 * Fix sentinel assert.

v4:
 * A round of review feedback applied.

Chris Wilson (1):
  drm/i915: Individual request cancellation

Tvrtko Ursulin (6):
  drm/i915: Extract active lookup engine to a helper
  drm/i915: Restrict sentinel requests further
  drm/i915: Handle async cancellation in sentinel assert
  drm/i915: Request watchdog infrastructure
  drm/i915: Fail too long user submissions by default
  drm/i915: Allow configuring default request expiry via modparam

 drivers/gpu/drm/i915/Kconfig.profile          |  14 ++
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  73 ++++---
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   4 +
 drivers/gpu/drm/i915/gt/intel_context_param.h |  11 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
 .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
 .../drm/i915/gt/intel_execlists_submission.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |  28 +++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/i915_params.c            |   5 +
 drivers/gpu/drm/i915/i915_params.h            |   1 +
 drivers/gpu/drm/i915/i915_request.c           | 129 ++++++++++-
 drivers/gpu/drm/i915/i915_request.h           |  16 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 201 ++++++++++++++++++
 17 files changed, 479 insertions(+), 45 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
