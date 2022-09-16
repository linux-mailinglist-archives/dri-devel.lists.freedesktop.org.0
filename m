Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A155BB117
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818D910E05A;
	Fri, 16 Sep 2022 16:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41110E05A;
 Fri, 16 Sep 2022 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663346017; x=1694882017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=awQXyXe7RaRNxe2Ud1hzc3gBoZjo4YYHsV8PNKB/o3g=;
 b=MqZlvMtOzCO8dZtLGMRiXRWn9U5v7XAwESvk2ic0H0BBpbdn8FQ8XAjk
 Y08aiGR/n7Z2F+Pj0fkPtf22QxMfnoznZaoLV/e2YfxmWWzJqgzqOovgd
 qe21oTmFEtItDhKkASQTCXhCnRKp0o/YredBxhMdxBLOE95KHuyCcxBSv
 SexrMahQsdoshPWBhO2P+XqvmPEfRE8RH3uh0H8MF2K+FmDcep3R7V/yk
 ITUWdtWLpFLROtVdiuPp+Pi1GJM0QaIoUTUJjgd10SWCH7lzcDz2sxv9F
 FkE+h0puwHXNJCk5Nx8EfUKq9j7PAs9fmmr98WzeQGBFQepBF0ct7zSfH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282056261"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="282056261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 09:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="721479896"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 16 Sep 2022 09:33:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 19:33:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/atomic: Lockless blocking commits
Date: Fri, 16 Sep 2022 19:33:27 +0300
Message-Id: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I've talked about making blocking commits lockless a few
times in the past, so here's finally an attempt at it.
The main benefit I see from this is that TEST_ONLY commits
no longer getting blocked on the mutexes by parallel blocking
commits.

I have a small test here that spools up two threads,
one does just TEST_ONLY commits in a loop, the other
does either blocking or non-blocking page flips. Results
came out as follows on a snb machine here:

test-only-vs-non-blocking:
-85319 TEST_ONLY commits in 2000000 usecs, 23 usecs / commit
+87144 TEST_ONLY commits in 2000006 usecs, 22 usecs / commit

test-only-vs-blocking:
-219 TEST_ONLY commits in 2001768 usecs, 9140 usecs / commit
+82442 TEST_ONLY commits in 2000011 usecs, 24 usecs / commit

Now, I have no idea if anyone actually cares about lack
of parallelism due to locked blocking commits or not. Hence
Cc'd some compositor folks as well. I guess this is more of
an RFC at this point.

Also curious to see if CI goes up in smoke or not...

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Jonas Ådahl <jadahl@gmail.com>

Ville Syrjälä (4):
  drm/atomic: Treat a nonblocking commit following a blocking commit as
    blocking commit
  drm/i915: Don't reuse commit_work for the cleanup
  drm/atomic: Allow lockless blocking commits
  drm/i915: Make blocking commits lockless

 drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++++--
 drivers/gpu/drm/drm_atomic_helper.c           | 19 +++++++----
 drivers/gpu/drm/drm_atomic_uapi.c             | 11 +++++--
 drivers/gpu/drm/i915/display/intel_display.c  | 15 +++------
 .../drm/i915/display/intel_display_types.h    |  1 +
 include/drm/drm_atomic.h                      |  8 +++++
 6 files changed, 64 insertions(+), 22 deletions(-)

-- 
2.35.1

