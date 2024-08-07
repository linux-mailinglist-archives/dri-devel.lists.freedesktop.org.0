Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271994A501
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F110E45A;
	Wed,  7 Aug 2024 10:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPQn9JVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CF010E45A;
 Wed,  7 Aug 2024 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723025139; x=1754561139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F382KCXFF9xxzBLnbQ6DawjYXU1vwugYawBF8UqF1iQ=;
 b=cPQn9JVN1TgkKil4K8nXo0V+w/qet7P5UZC2xWDe76rz1Oafw52NlKeP
 7wPqsPoigo1kS/eYpctsKJD4xRr9eR81n+zCh1T6mmC39ZpUKA3ftUMOl
 QxcxTUpWLY9W7M0wLkJKQPi02s6JKELfIxlZdZtnuo+vvzLnsdhx+Qdnc
 akozvVo2ziRacSH/9sjbMRmILVWfigbAcGYjaBuNf1i9aIVAEIHGVqg22
 sjjOPlJr14s73KBmvGM7ulCf3n57zGgsdn6xk4tflZln482iwCNB2LEwO
 kR8WO8cBKAB/Ox+bJltekVq/dWEE4ooKN8I+BmMu9NMHgs8NdVOBHYDJu w==;
X-CSE-ConnectionGUID: rwAmeNj/QUChM7HKsejPgQ==
X-CSE-MsgGUID: UUhkqoxjSmq0RzqY9nATcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31659893"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="31659893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:05:39 -0700
X-CSE-ConnectionGUID: Q0GiApB+RBuS0+UQ9/UBAg==
X-CSE-MsgGUID: NWyzFcT0SCu8KPzAtlCebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="57495651"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.245])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:05:37 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 0/2] Allow partial memory mapping for cpu memory
Date: Wed,  7 Aug 2024 11:05:19 +0100
Message-ID: <20240807100521.478266-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Hi,

This patch series concludes on the memory mapping fixes and
improvements by allowing partial memory mapping for the cpu
memory as well.

The partial memory mapping by adding an object offset was
implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
Virtual Memory mapping boundaries calculation") for the gtt
memory.

Andi

Andi Shyti (2):
  drm/i915/gem: Do not look for the exact address in node
  drm/i915/gem: Calculate object page offset for partial memory mapping

 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 10 ++++++----
 drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
 drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
 3 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.45.2

