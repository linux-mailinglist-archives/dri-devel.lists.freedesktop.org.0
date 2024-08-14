Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA30951C1E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 15:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63B010E488;
	Wed, 14 Aug 2024 13:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TU9/4sPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACC010E48E;
 Wed, 14 Aug 2024 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723643304; x=1755179304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=blm7jAQoSNHeYCs7Wlv7rh0Eni/1qDlqjkgx/wsMrPg=;
 b=TU9/4sPdA3HQkic8Lvw1NfOLWwbBtQ1+Ky2SeVCWm3OgIvUvaUl/OVr2
 tWONOTPTAcWqOy86sVkFGW3vfuGGOKIOTdJBdUQzR+LPHFPshlJ2qq2dp
 tbqKGXSrS3n2wDiwHckOHcOHxfKLTvieEfhw1EchY7mhEOE2hIc++B+6o
 9kCjICUaGNMxGhe7bS45kKSQr1lye20EwO3AC2SyvDtf6r5xLChtgs3Fj
 DbMvQ6P2X2vHmnl4GeLWVmkLjWGaI5wXmLulIVemPMPCjZdTEKqbqRJ+r
 +BqjURjHwbpSSdYlHMd3QogPpRF3lgTqw53SugRf6rliNvXivZs2JOzRr Q==;
X-CSE-ConnectionGUID: Hu4D7IF0TR6AmWPZLiNDWQ==
X-CSE-MsgGUID: 3fpavCQQSxqF7nwHchzzXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32537544"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32537544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:48:24 -0700
X-CSE-ConnectionGUID: FvU1hJn1SEuVv/XTbdkt9w==
X-CSE-MsgGUID: /QtCJ8vNS1KKSpQmb7MCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59153915"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:48:21 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sima <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 0/2] Allow partial memory mapping for cpu memory
Date: Wed, 14 Aug 2024 15:47:46 +0200
Message-ID: <20240814134751.116439-1-andi.shyti@linux.intel.com>
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

I am resending this patch series, not to disregard the previous
discussions, but to ensure it gets tested with the IGTs that
Krzysztof has provided.

This patch series finalizes the memory mapping fixes and
improvements by enabling partial memory mapping for CPU memory as
well.

The concept of partial memory mapping, achieved by adding an
object offset, was implicitly introduced in commit 8bdd9ef7e9b1
("drm/i915/gem: Fix Virtual Memory mapping boundaries
calculation") for GTT memory.

To address a previous discussion with Sima and Matt, this feature
is used by Mesa and is required across all platforms utilizing
Mesa. Although Nirmoy suggested using the Fixes tag to backport
this to previous kernels, I view this as a new feature rather
than a fix.

Lionel, please let me know if you have a different perspective
and believe this should be treated as a bug fix, requiring it
to be backported to stable kernels.

The IGTs have been developed in collaboration with the Mesa team
to replicate the exact Mesa use case[*].

Thanks Chris for the support, thanks Krzysztof for taking care of
the IGT tests, thanks Nirmoy for your reviews and thanks Sima and
Matt for the discussion on this series.

Andi

[*] https://patchwork.freedesktop.org/patch/608232/?series=137303&rev=1

Test-with: 20240814132404.18392-1-krzysztof.niemiec@intel.com

Changelog:
==========
v1 -> v2
 - Added Nirmoy's tags.

Andi Shyti (2):
  drm/i915/gem: Do not look for the exact address in node
  drm/i915/gem: Calculate object page offset for partial memory mapping

 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 10 ++++++----
 drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
 drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
 3 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.45.2

