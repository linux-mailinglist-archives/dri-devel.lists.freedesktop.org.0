Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61D97B3C3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 19:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD7710E4DA;
	Tue, 17 Sep 2024 17:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGRWcxAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE24E10E4DA;
 Tue, 17 Sep 2024 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595053; x=1758131053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HSPNFzhTJd15Mp7HTNNVxOD47iliuq38qp2Ft4CjGYQ=;
 b=CGRWcxAkZC/moLgWvFGjfm2nHlxQDYmYxQCbu+0JUbewJdhxo6VaSlp9
 qWHkbaXZ0Z1rhfzWVxrv3ALJs58P5evpPDVwqSLxmFITLw6j/os0VCLZd
 sVQ43hwYfKCqZpFbjFx8lA8doe1LSBPh1zT3+hEX8H3zN4uiqyRQlsWex
 iBq+kdxGpZgIYY0tihdivfRJ9gXkm4HX6NK5m0OGuyB54Hl6oOTjpW3nz
 +xBqiYDQQ/42uesE4z/irh9lhfAMO5mpq0Y3oTTkZBRHS2ySDdxFzq/9x
 iS14xOZUQssWqKoyOAakzaQLPh1Mlo3yf9r0Apzi0oA3XL/kqXZB0kLcj Q==;
X-CSE-ConnectionGUID: 7cwCm/vDQC+2Z+HcS3pB0g==
X-CSE-MsgGUID: iBYxWaMCTj6KbNbaOy7lzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13561341"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13561341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:44:08 -0700
X-CSE-ConnectionGUID: pnTSV40AQd2ZgHsOwtylXQ==
X-CSE-MsgGUID: gi8rXowpR/qUT8ZMU+15AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100104435"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:43:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] drm: revert some framebuffer API tests
Date: Tue, 17 Sep 2024 20:43:50 +0300
Message-Id: <cover.1726594684.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The tests consistently trigger WARNs in drm_framebuffer code. I'm not
sure what the point is with type of belts and suspenders tests. The
warnings *are* the way to flag erroneous API usage.

Warnings in turn trigger failures in CI. Filtering the warnings are
error prone, and, crucially, would also filter actual errors in case the
kunit tests are not run.

I acknowledge there may be complex test cases where you'd end up
triggering warnings somewhere deep, but these are not it. These are
simple.

Revert the tests, back to the drawing board.

BR,
Jani.


Cc: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>


Jani Nikula (2):
  Revert "drm/tests: Add test for drm_framebuffer_free()"
  Revert "drm/tests: Add test for drm_framebuffer_init()"

 drivers/gpu/drm/drm_framebuffer.c            |   1 -
 drivers/gpu/drm/drm_mode_object.c            |   1 -
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 134 -------------------
 3 files changed, 136 deletions(-)

-- 
2.39.2

