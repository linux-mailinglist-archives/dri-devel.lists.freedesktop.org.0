Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78A951C26
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 15:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A810E48D;
	Wed, 14 Aug 2024 13:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCbqQ/i9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE910E48B;
 Wed, 14 Aug 2024 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723643348; x=1755179348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blm7jAQoSNHeYCs7Wlv7rh0Eni/1qDlqjkgx/wsMrPg=;
 b=cCbqQ/i9HVFv9QTnxJZ3aQ2Vpfw0dNLxlzbqDA3yLdlBeSBrQIJ7LVNc
 +6q7F772B1qhzc8dZP0vBTSWr08sS8EZy/t2yE4DlaCv5l3eUZI8WvdoM
 ZJUhcwe0NJ342fHX+TpRYMm+Y5fc32OkRTPyBAHppRwT5g97diHAIMEJN
 mWxxiE1I2IBsFPZJOIEVThFn3iqWkvAVUUoDivOSVK9rCR0+5QpmHNLx5
 xsCbSawBv3GH8+0fbmdfPRffXhKoBS63Rvq5tAsfkr4DbKgSqPg8Ky8xG
 kbPznrp2XW+p2GlRRW0ofg5a78ySLa4c3ibgkz6SBwWM50PmUxWSdO/Al w==;
X-CSE-ConnectionGUID: 1Cd8Ek0EQQK3gEJI74Ql5Q==
X-CSE-MsgGUID: QYz7OQP2Qze1Fs2CVizESQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22017025"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="22017025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:49:08 -0700
X-CSE-ConnectionGUID: 0JTmcDGcTk2hxXgkYkIrRQ==
X-CSE-MsgGUID: yOjNM77FSyuRTSOnfW+FvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63900883"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.62])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:49:04 -0700
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
Date: Wed, 14 Aug 2024 15:48:35 +0200
Message-ID: <20240814134837.116498-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814134837.116498-1-andi.shyti@linux.intel.com>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
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

