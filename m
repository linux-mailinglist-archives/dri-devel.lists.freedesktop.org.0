Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D84CA20A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86C210F04E;
	Wed,  2 Mar 2022 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04BB10E45E;
 Wed,  2 Mar 2022 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646216541; x=1677752541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8cpTuTjmJmddJ1eX0bdJQn6xkooDGll48emWrxVVM8=;
 b=eVZ9OahDeIvQit8zWQklY1KgGxrG6RuX1oPhCaL1YVscUCpwfgHq7ekJ
 HzCMDwt9k8NVvSRpK8rIFSLRCj9Tb832egbTOSsO/62BwVOmSVfdl/qq6
 4IE33EmKtPEdzgGcCvwE4Yq4t/fLGAMArUIT9hMIyNvFskfYjRs39q3ic
 mAfZ9OlfYnf5SP4gQCU/zcZ0fjzDwFti5q4obNhhCiBo2m8UZTX/H2SJg
 CJXa2U162DxPTEYquQNvdg9+5GLJSyshKfcg9vIbh5aWOzjq26KcGvJxY
 Ht7mNETZy2G60rJjth8iPC2fK1+sjLrGpewaOXxqZ5JZtAfbMBT/fRDsS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="339798888"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="339798888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:22:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="493494420"
Received: from ccrisan-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.224])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:22:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] vm- and vma cleanups
Date: Wed,  2 Mar 2022 11:21:57 +0100
Message-Id: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 niranjana.vishwanathapura@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch of the series addresses a vm open count bug by
removing the vm open count.

The second patch removes the vma refcount that is no longer needed;
the vma is kept a live by taking the vm refcount and object lock.

Finally the last patch removes some unnecessary code. There should be
no functional changes.

Thomas Hellström (3):
  drm/i915: Remove the vm open count
  drm/i915: Remove the vma refcount
  drm/i915/gem: Remove some unnecessary code

 drivers/gpu/drm/i915/display/intel_dpt.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 29 ++-----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |  5 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 30 +++----
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 54 ++++++++----
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 56 ++++--------
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 86 +++++++++----------
 drivers/gpu/drm/i915/i915_gem.c               | 55 ++++++------
 drivers/gpu/drm/i915/i915_vma.c               | 69 +++++++++------
 drivers/gpu/drm/i915/i915_vma.h               | 14 ---
 drivers/gpu/drm/i915/i915_vma_resource.c      |  2 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |  6 ++
 drivers/gpu/drm/i915/i915_vma_types.h         |  8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 16 files changed, 216 insertions(+), 212 deletions(-)

-- 
2.34.1

