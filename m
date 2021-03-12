Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA539339233
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6E6F89D;
	Fri, 12 Mar 2021 15:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CA46F89D;
 Fri, 12 Mar 2021 15:49:13 +0000 (UTC)
IronPort-SDR: Ggr+tdFcyRC7rTL0Nl1tr+FhgHlH+J6qp3zpRHQbZX0MvAL6utq7BUEXpHTx3UImZXvPwqBoMk
 c8FaZ7Kd8h7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="186473777"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="186473777"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:12 -0800
IronPort-SDR: c6rIjH1VeyXNo8qwAVgAotF80NLNWaL+GQCSx0/bCiNPiv40T/J+MOfaxSqC4pTD1z7P1OI3SG
 HNTX4JXO7LNg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="448655387"
Received: from nstrumtz-desk02.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.213.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:10 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 0/6] Default request/fence expiry + watchdog
Date: Fri, 12 Mar 2021 15:46:16 +0000
Message-Id: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

"Watchdog" aka "restoring hangcheck" aka default request/fence expiry - first
post of a somewhat controversial feature so may be somewhat rough in commit
messages, commentary and implementation. So only RFC for now.

I parenthesise the "watchdog" becuase in classical sense watchdog would allow
userspace to ping it and so remain alive.

I parenthesise "restoring hangcheck" because this series, contrary to the old
hangcheck, is not looking at whether the workload is making any progress from
the kernel side either. (Althoguh disclaimer my memory may be leaky - Daniel
suspects old hangcheck had some stricter, more indiscriminatory, angles to it.
But apart from being prone to both false negatives and false positives I can't
remember that myself.)

Short version - ask is to fail any user submissions after a set time period. In
this RFC that time is ten seconds.

Time counts from the moment user submission is "runnable" (implicit and explicit
dependencies have been cleared) and keeps counting regardless of the GPU
contetion caused by other users of the system. So semantics are really a bit
weak but again, I understand this is really wanted by the DRM core.

As an attempt to compensate for this brutish nature, I proposed adding
extendable configurability via a context param as part of the series. That could
allow userspace to pick different semantics (always going more restrictive than
the system default) and so implement interesting things like long desired media
watchdog. Module trickyness of the implementation there.

Test-with: 20210312093329.1639502-1-tvrtko.ursulin@linux.intel.com
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Chris Wilson (1):
  drm/i915: Individual request cancellation

Tvrtko Ursulin (5):
  drm/i915: Restrict sentinel requests further
  drm/i915: Request watchdog infrastructure
  drm/i915: Allow userspace to configure the watchdog
  drm/i915: Fail too long user submissions by default
  drm/i915: Allow configuring default request expiry via modparam

 drivers/gpu/drm/i915/Kconfig.profile          |   8 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  92 ++++++
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   4 +
 drivers/gpu/drm/i915/gt/intel_context_param.h |  11 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
 .../drm/i915/gt/intel_execlists_submission.c  |  11 +-
 .../drm/i915/gt/intel_execlists_submission.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |  21 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/i915_params.c            |   5 +
 drivers/gpu/drm/i915/i915_params.h            |   1 +
 drivers/gpu/drm/i915/i915_request.c           | 129 +++++++-
 drivers/gpu/drm/i915/i915_request.h           |  12 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 275 ++++++++++++++++++
 include/uapi/drm/i915_drm.h                   |   5 +-
 18 files changed, 584 insertions(+), 9 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
