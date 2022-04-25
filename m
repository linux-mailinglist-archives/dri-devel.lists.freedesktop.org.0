Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5550E441
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 17:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C5710EF94;
	Mon, 25 Apr 2022 15:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94610EF6F;
 Mon, 25 Apr 2022 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650900141; x=1682436141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yuex1SZuwd7KSvouvy9hIIRSFGrjlXAAaVD7qPclc3o=;
 b=ad7+yETHEBMFuUmFH+0wU+tDMquNpJb2DuoPetVpkU4uQ9Uc4t4+6+Ap
 9o1eKuNVmxs9UVFuEfN18e63yiEiwbBjnDqyWZvTBRaPC4VUdgKMgmGsu
 sbe23/zUZt/sU8NRiMoM3ULTKvbEomvbNqviJ1kcPh3B70CaY3xGFx1Nq
 r/LkcqIQklxa71QAi7azJoLtpy5tW3fGnNGYqxa3THU3PC2mIv2iv9AaF
 wCkO9g/qxBnAmTHx71XgccCSIPN09/FNB0kEeO6jaA+yPBbdfeq4Jy5FG
 csShVweYs4sTuLuLYwuwCMmWVL6wLDwaYeD4zLt2HkZChrqsgrWQHUe6r g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="262875121"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="262875121"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 08:22:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="512681544"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 08:22:18 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Handle predicate programming
Date: Mon, 25 Apr 2022 20:53:14 +0530
Message-Id: <20220425152317.4275-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can leave SET_PREDICATE_RESULT active at the end of their
batch, causing all the kernel operations from the ring to be noop'ed.
This includes workarounds for memory corruption on dg2, as well as the
usual synchronisation, arbitration, coherency and signaling. The latter
can be used to cause system-wide hangs, prevent TLB invalidates, as
well as runtime-pm leakage due to a never signaled fence which escapes
hangcheck as the context does run.

To avoid the issues caused by allowing userspace to disable kernel
execution, we explicitly clear SET_PREDICATE_RESULT but not before
recording whether predication was active. By tracking if predication was
active at the end of the batch, we can restore it immediately prior to
executing the users next batch, preserving the status of the user's
predication.

And also LRI relative addressing is fixed as part of this series.

Akeem G Abodunrin (1):
  drm/i915/xehpsdv/dg1/tgl: Fix issue with LRI relative addressing

Chris Wilson (2):
  drm/i915/selftests: Skip poisoning SET_PREDICATE_RESULT on dg2
  drm/i915/gt: Clear SET_PREDICATE_RESULT prior to executing the ring

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 54 +++++++++++++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h      |  7 ++
 drivers/gpu/drm/i915/gt/intel_engine_regs.h   |  2 +
 .../drm/i915/gt/intel_execlists_submission.c  | 15 +++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 75 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_lrc.h           |  5 ++
 drivers/gpu/drm/i915/gt/selftest_lrc.c        | 53 ++++++++++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +
 9 files changed, 189 insertions(+), 26 deletions(-)

-- 
2.20.1

