Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AF6ED458
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 20:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264FD10E5C2;
	Mon, 24 Apr 2023 18:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E2A10E1C4;
 Mon, 24 Apr 2023 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682360876; x=1713896876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tjwJnFe1l2jVTI+afK+YuPF/4gtg96CDiHom4MkWAfM=;
 b=bYoRmYxoWEn/48GAgvzZE65chAJTseq99UeKZX1VUQJHywBEKGoZ/us1
 AE4roBOPAEuBgvgTqOgxeQshK87IctcTiufnor9mwltlmPx/oeZh+t817
 rCbPQgkKDRvXSxFm7H9+NX7QIn9CkGRm2mcjSUk3xIMsh5Upsyx2zNUq+
 rtqYABuNFrw1oc5C6pcRIJFMzT0FWC6nlu6Hjlh4jrmGFnc8bx7WDO3eS
 9Jx64E2jBF4Cmc6+ksxFVlVs3Je9c7ZVad1TEGYhb8PT8c5ILy7KF28J8
 Rc3qpUxqoicP9UCXGr5vUNV0Xu1fidG4l4UCIxXOSp2OUicsgECEELQ66 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411802205"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="411802205"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 11:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="762539844"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="762539844"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 11:27:54 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/i915/mtl: Add PTE encode functions
Date: Mon, 24 Apr 2023 11:29:00 -0700
Message-Id: <20230424182902.3663500-1-fei.yang@intel.com>
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Extract PTE patch from https://patchwork.freedesktop.org/series/116868/
to fix MTL boot issue caused by MOCS/PAT update.

v2: address comment from Matt.

Fei Yang (2):
  drm/i915/mtl: Add PTE encode function
  drm/i915/mtl: workaround coherency issue for Media

 drivers/gpu/drm/i915/display/intel_dpt.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c      | 45 +++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 36 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gtt.h       | 12 +++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +++
 8 files changed, 112 insertions(+), 14 deletions(-)

-- 
2.25.1

