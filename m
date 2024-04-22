Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A508AD1E1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1DC10F712;
	Mon, 22 Apr 2024 16:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f062FH+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437C510F98B;
 Mon, 22 Apr 2024 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713803281; x=1745339281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L+B5dd2ITsEvtL/InMl+d+eOIxITm6YJHF2AkFELy1w=;
 b=f062FH+CCRCWPq+5Ex/bzxdcm200ewsfXMRogKBfYxPFLpbUReY06V6l
 lseLP7XV+wiCdypbdZ8m45CqWOu4WPHM0AKKkE2wVymMwOjqlMRgqeEKr
 4kXxk4eOZOklWNGLXOCG6PiPt56+RS7fbK9Tu9/knWzkW0LW9g30R7Nm2
 YpI9AlC7B2D78s/uW2l+5OcdBc8oi8xZ5UKzlK+r98+n1OSnWy21GMIOm
 SwH8QWtGwIqMsnLxVfXDT8y7z0jEmjHGOkO1ZkvqYbV1WwTshOzmvwa5x
 zFafkj3rSTxuvFCQvHa4SoqhI2VxblE6QNIz+822nnVwQFUU7t9+q9VIg g==;
X-CSE-ConnectionGUID: klfmmJaLRfa33ttrDkxbqw==
X-CSE-MsgGUID: khxWQdblR0aYF+dZSR48wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13136918"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="13136918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:28:01 -0700
X-CSE-ConnectionGUID: pWO+h2tzRHqjElP6HmYpDw==
X-CSE-MsgGUID: l8lyRpC9Qc6f1sKBEueEkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="47347741"
Received: from unknown (HELO intel.com) ([10.247.119.74])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:27:55 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [CI 0/2] Force CCS mode to the maximum
Date: Mon, 22 Apr 2024 18:27:29 +0200
Message-ID: <20240422162731.7046-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

There has been a regression apparently caused by the CCS mode
forced to be 1[*]. But, because I think the kernel approach is
correct and there might be something hardcoded in userspace, I
want to show that with this series we won't see the regression.

What this series does is to force CCS mode to 4 (or to the
maximum). This way we will understand whether the issue comes
because of disabling the automatic load balancing or by forcing
it to use only one CCS.

Thanks gnattu for your report, i will appreciate if you can give
this a try.

Andi

[*] https://gitlab.freedesktop.org/drm/intel/-/issues/10895

Andi Shyti (2):
  Revert "drm/i915/gt: Do not generate the command streamer for all the
    CCS"
  drm/i915/gt: Force ccs_mode 4

 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 17 -----------------
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 12 ++++++++----
 2 files changed, 8 insertions(+), 21 deletions(-)

-- 
2.43.0

