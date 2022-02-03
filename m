Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3BA4A8CE2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F5E10E226;
	Thu,  3 Feb 2022 20:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4824C10E185;
 Thu,  3 Feb 2022 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643918649; x=1675454649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWCBb5BDnUZ8M1t5Kc98dfQQt6hh5FJM+UtM7zgggyo=;
 b=YgArp5FQYOjVaC8G/lU+3D1vsaqmdO5G79dIDwQcWK5+Cnd5sLE0BGSg
 2AYLgDIsRhjPbtcP7m9KrmGsjqXIkILW45OLYJJ1koLdvVMY9wLuDpN5y
 3L75/ViAcU7O1ye9kpUeTA3CLs2cvd7NsOSXqCxwgQCm8hudS6UN5J1tB
 fFVch9jEo/rjpv0WwiarqO3Q6/YdLY9f9YydWzG50kMsTtVKzIylktq38
 R63ygSXivULwTGT6OH2SKghIX7EHyWvdB9q89mOrCvdACtaaPkd64Kjg/
 oaH/DNvwRGlsVeTuIVkJCJaQxNpiEwTEd7A+81X4dnNj2H3iA5aAef/JS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="311545990"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="311545990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:04:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="538894379"
Received: from gearygra-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.lan)
 ([10.212.225.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:04:08 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/4] Use drm_clflush* instead of clflush
Date: Thu,  3 Feb 2022 12:03:59 -0800
Message-Id: <20220203200403.378958-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series re-work a few i915 functions to use drm_clflush_virt_range
instead of calling clflush or clflushopt directly. This will prevent errors
when building for non-x86 architectures.

v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added
more patches to convert additional clflush/clflushopt to use drm_clflush*.
(Michael Cheng)

v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran 

v4: Remove extra memory barriers

Michael Cheng (4):
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c  |  8 +++-----
 drivers/gpu/drm/i915/gt/intel_engine.h          | 13 ++++---------
 .../drm/i915/gt/intel_execlists_submission.c    | 17 +++++------------
 3 files changed, 12 insertions(+), 26 deletions(-)

-- 
2.25.1

