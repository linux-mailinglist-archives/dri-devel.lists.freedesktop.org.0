Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA429956AE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484A410E139;
	Tue,  8 Oct 2024 18:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm393imY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329910E139
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412538; x=1759948538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JT/kMTegZkoHlsBIWkFdpOtllJr0mz1LgdCh8oSg2pQ=;
 b=Cm393imY79tWn4yhwYQFDPx1h5LZHHYkOpBLaxvxJFMYvnb8WISW1WYU
 cMqFZCYRzJkFW5jq5VBLcuuKf6fNd1EkyV4VWYD4l7jJuteXbmdqtkHyt
 am94VJnBsxi7XS6S6PQwub7U6cCZZaUfdCEqZIq8F7wYOvyf5D0nCZyeN
 hrvhn0k/WhK4IbEgrtphktS95O6Smth5CX0r1YceGHXvIdmGYsx9a+Tkh
 gWhkwscBxt8z61vttJv5HpUvvVFKuOtDCmTKfVCLEq7PSJNvv2PpqYaUB
 qo+mrnGS9NHkglknwi6LpleT3T4lvbzphpop1SeK/FLuDCV78MUziasSt A==;
X-CSE-ConnectionGUID: qtguJzb0QGaiTV/AZVBwkw==
X-CSE-MsgGUID: XRdp2fkvSZeaKs0h0KHKvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38295325"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38295325"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:37 -0700
X-CSE-ConnectionGUID: jMDKuuGjSZqpnDo8TXaBZw==
X-CSE-MsgGUID: LYmuLAj3T62xJr6Sz72U0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80530898"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.125.110.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] perf: Fix pmu for drivers with bind/unbind
Date: Tue,  8 Oct 2024 13:34:56 -0500
Message-ID: <20241008183501.1354695-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 of my attempt at fixing how i915 interacts with perf events.

v1 - https://lore.kernel.org/all/20240722210648.80892-1-lucas.demarchi@intel.com/

From other people:
1) https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/
2) https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/

WARNING: patches 1, 4 and 5 are NOT intended to be applied as is. More
on this below.

This series basically builds on the idea of the first patch of my
previous series, but extends it in a way that

	a) the other patches are not needed  (at least, not as is) and
	b) driver can rebind just fine - no issues with the new call to
	   perf_pmu_register()

Another difference is that rather than mixing i915 cleanups this just
adds a dummy pmu with no backing HW. Intention for dummy_pmu is for
experimental purpose and to demonstrate changes tha need to be applied
to i915 (and probably amdgpu, and also in the pending xe patch).
If desired to have an example like that in tree, then we should hide it
behind a config option and I'd need to re-check the error handling.

With this set I could run the following test script multiple times with
no issues observed:

	#!/bin/bash

	set -e 

	rand_sleep() {
		sleep $(bc -l  <<< "$(shuf -i 0-3000 -n 1) / 1000")
	}

	test_noperf() {
		echo 0 > /sys/kernel/debug/dummy_pmu/bind

		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
	}

	test_perf_before() {
		echo 0 > /sys/kernel/debug/dummy_pmu/bind

		perf stat --interval-count 2 -e dummy_pmu_0/test-event-1/ -I500
		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
	}

	test_kill_perf_later() {
		echo 0 > /sys/kernel/debug/dummy_pmu/bind

		perf stat -e dummy_pmu_0/test-event-1/ -I500 &
		pid=$!
		rand_sleep
		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
		rand_sleep
		kill $pid
	}

	test_kill_perf_laaaaaaater() {
		echo 0 > /sys/kernel/debug/dummy_pmu/bind

		perf stat -e dummy_pmu_0/test-event-1/ -I500 &
		pid=$!
		rand_sleep
		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
		rand_sleep
		rand_sleep
		rand_sleep
		kill $pid
	}

	test_kill_perf_with_leader() {
		echo 0 > /sys/kernel/debug/dummy_pmu/bind

		perf stat -e '{dummy_pmu_0/test-event-1/,dummy_pmu_0/test-event-2/}:S' -I500 &
		pid=$!
		rand_sleep
		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
		rand_sleep
		rand_sleep
		kill $pid
	}

	N=${1:-1}

	for ((i=0; i<N; i++)); do
		printf "%04u/%04u\n" "$((i+1))" "$N" >&2
		test_noperf
		test_perf_before
		test_kill_perf_later
		test_kill_perf_laaaaaaater
		test_kill_perf_with_leader
		echo >&2
	done

Last patch is optional for a driver and not needed for the fix.

Open topics:

	- If something like the last patch is desirable, should it be
	  done from inside perf_pmu_unregister()?

	- Should we have a dummy_pmu (or whatever name) behind a config,
	  or maybe in Documentation/ ?

thanks,
Lucas De Marchi

Lucas De Marchi (5):
  perf: Add dummy pmu module
  perf: Move free outside of the mutex
  perf: Add pmu get/put
  perf/dummy_pmu: Tie pmu to device lifecycle
  perf/dummy_pmu: Track and disable active events

 include/linux/perf_event.h |  12 +
 kernel/events/Makefile     |   1 +
 kernel/events/core.c       |  39 ++-
 kernel/events/dummy_pmu.c  | 492 +++++++++++++++++++++++++++++++++++++
 4 files changed, 539 insertions(+), 5 deletions(-)
 create mode 100644 kernel/events/dummy_pmu.c

-- 
2.46.2

