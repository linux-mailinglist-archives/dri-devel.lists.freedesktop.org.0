Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579A16D017E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24E010E1DB;
	Thu, 30 Mar 2023 10:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BC810E1DB;
 Thu, 30 Mar 2023 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680173001; x=1711709001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ygo93piNDua7J8VtxEGX71H4GSn6S2H4oKkR/7x2I1U=;
 b=TUSo7Ml3SHfSTk9LAMSPO86Qb29cDvwv7xoZfrtyEg0r1DFkpah9sneU
 aDoiDmmNE6B8l3Z/DcRmADCgaaqOCV1wZotwMUfDGegQAZ5fa0wsEyQaN
 sNTYyhcNyFm1ReS3ZN7+taYCr6UbXnCWZpcVyCtK80jHo0F1TwUAb04la
 PgcLSpzpQNbwYzUeq858ZIhrM0hJvdyBteqmNmFLljNdHDiAjXAkES2LF
 o1/toS91kdti0AdW2KaL1SBFGD2eh6TXGh4+QXtIccROdqKuAlF8y/Cd4
 dBBz6NUyhICPJdA0fyKWHTgJBOJDlvAtSk/8rtIWJPHFZXbIS+d/59UIA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406096321"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="406096321"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="687197227"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="687197227"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] log2: make is_power_of_2() more generic
Date: Thu, 30 Mar 2023 13:42:39 +0300
Message-Id: <20230330104243.2120761-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

is_power_of_2() only works for types <= sizeof(unsigned long) and it's
also not a constant expression. There are a number of places in kernel
where is_power_of_2() is called on u64, which fails on 32-bit
builds. Try to remedy that. While at it, make it a constant expression
when possible.

I admit I've only lightly tested this, and I haven't tried it with
allmodconfig.


Jani Nikula (4):
  log2: add helper __IS_POWER_OF_2()
  log2: have is_power_of_2() support bigger types than unsigned long
  log2: allow use of is_power_of_2() in constant expressions
  drm/i915/reg: use is_power_of_2() from log2.h

 drivers/gpu/drm/i915/i915_reg_defs.h |  7 +------
 include/linux/log2.h                 | 25 ++++++++++++++++++++-----
 2 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.39.2

