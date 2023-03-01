Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEAC6A6B4F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 12:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1CD10E230;
	Wed,  1 Mar 2023 11:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C6810E22F;
 Wed,  1 Mar 2023 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677668594; x=1709204594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nB4CrVqPefTxfzqx4xQmBpzV/GLY5cJNmXZ4WJAkHJg=;
 b=Vo219gDj1j/kxMCY+5Vqw0ZfW9vQHU62pAQhkfz+agxvb6fafe0IznhL
 PCrRKb04Rr0wJPp5LgvAbJWGh9wO1WItFluQ/EzanFCA4yGvB/x6aBOZ+
 /Yf5aZlNqDB0etIzNcrB7HSwb6qsjCzgfPgeUatBD8+E3vK7m/FnKoFBj
 qGLFyKlhl/VmCARV3Ymyldb1xvcCva531bCHljTJ6qrOu1sXz5/XGX8L8
 pL3+O9N09Pnxo8/km6kdcKXsutIIKOuZFJGIzXzjpWX6cqIuApNVpyRGh
 lDCbApKCAt3cPqxKp+rrVBFj7W+amuryInBm7DTAoteVeCE4BjIi444UT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="361960098"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="361960098"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:03:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003630902"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003630902"
Received: from unknown (HELO intel.com) ([10.252.57.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:03:08 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Some debugfs refactoring and improvements
Date: Wed,  1 Mar 2023 12:02:56 +0100
Message-Id: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi@etezian.org>, Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

These two patches aim to enhance the multi-GT capabilities of the
debugfs.

The first patch reorganizes the file structure, while the second
patch extends the functionality of the original files in the
upper directories to operate on all tiles with a single write,
providing an or'ed value among them in the read case.

Andi

Changelog
=========
v1 -> v2
 - add patch 2 for multiplexing
 - improve commit log in patch 1.

Andi Shyti (2):
  drm/i915/gt: Create per-tile debugfs files
  drm/i915/debugfs: Enable upper layer interfaces to act on all gt's

 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  5 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |  2 +
 drivers/gpu/drm/i915/i915_debugfs.c           | 38 +++++++++++++++++--
 5 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.39.1

