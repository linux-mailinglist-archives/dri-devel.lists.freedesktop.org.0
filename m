Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2894CCFE7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 09:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB7C10F87E;
	Fri,  4 Mar 2022 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4560310F87F;
 Fri,  4 Mar 2022 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646382424; x=1677918424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k/l22rbIGwJ2DhiyPxPT89FIGEamXhm9awdcJtaiQfo=;
 b=gfEfZ+zNSHiOiLPy5BzZpzUA9cpQ90egZwu3/a3yZI8CvG2b97m5OGAF
 upPvwcfS/vygoxOpAtwpJernnRlVoarMirKCFjy4NUpE05/R3R0en0W/7
 1fPIKm8hfzcDKibDI0CXjGSifxES3bOq86xnQL3m1wfjCWUzw2I2qb9H1
 Vp91nEju6Kh8KvuVk7+mL77Y23w8HLL/oqgnK3qHxKlNvnFXwOzvXFrge
 JNrk62IBwTBEqMEpVneRYmBJxL0A8CyEJEDFJmF783dugkskn3ETonhnW
 Y87jvrjs7tBK7F/Xn7lYc3x3cWgwFxz4x4IvVa+NxsgGyi8ABbvLIi1p0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233887204"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="233887204"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 00:26:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="810380328"
Received: from mmazarel-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.59])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 00:26:50 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] vm- and vma cleanups
Date: Fri,  4 Mar 2022 09:26:38 +0100
Message-Id: <20220304082641.308069-1-thomas.hellstrom@linux.intel.com>
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

v3:
- Documentation fixes
- Added R-Bs

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
 drivers/gpu/drm/i915/i915_vma.c               | 80 ++++++++++-------
 drivers/gpu/drm/i915/i915_vma.h               | 14 ---
 drivers/gpu/drm/i915/i915_vma_resource.c      |  2 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |  6 ++
 drivers/gpu/drm/i915/i915_vma_types.h         |  8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 16 files changed, 222 insertions(+), 217 deletions(-)

-- 
2.34.1

