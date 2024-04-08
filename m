Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB189CA48
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8F9112876;
	Mon,  8 Apr 2024 17:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAoihO+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDDC112897
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595888; x=1744131888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3El5wWLBGTGhxnGovWk3CBa4Q4d7+OEgVRGblzp7LTk=;
 b=JAoihO+gztsEPQDQmTghKwH7BNZDnyQiQgcS5X24aQGBWt9rDHhyHkNP
 4eX5tTU0A/mstcjpKnZUGfNTeFzFipYZ37eUb/gIjGR3MirTjwfBnoCzZ
 AWFsv/Eo9wnQUcoXwPcl015cry4S4S2WAIL0kR/F9F7E47avNjBz4t4zv
 ihUOQTx43pPL3I1wgfr0DfG26CrqswHZolDtfQtasfD8miOHcYFTLYxo2
 tzPir6QQjf7JVi7GJcwyT4QMo+upEfqZ7udJIXh8dwfjauWITmnvqJnPg
 S1WM28J2uEBZHw5WRg9PRv75cXrNEPhehPgJxp0hQfOCv+cxgDQyv5WNM w==;
X-CSE-ConnectionGUID: quT61l4zQkSS4WGQyNnBnQ==
X-CSE-MsgGUID: n7nPkSUDT7ChwH47BFZjZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793374"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793374"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792330"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792330"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 06/21] drm/sti: Include linux/io.h for devm_ioremap()
Date: Mon,  8 Apr 2024 20:04:11 +0300
Message-ID: <20240408170426.9285-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Include linux/io.h for devm_ioremap().

When built on x86_64 w/ COMPILE_TEST=y:
../drivers/gpu/drm/sti/sti_dvo.c:531:21: error: implicit declaration of function ‘devm_ioremap’ [-Werror=implicit-function-declaration]
  531 |         dvo->regs = devm_ioremap(dev, res->start,
      |                     ^~~~~~~~~~~~
../drivers/gpu/drm/sti/sti_dvo.c:531:19: error: assignment to ‘void *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
  531 |         dvo->regs = devm_ioremap(dev, res->start,
      |                   ^

Cc: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/sti/sti_dvo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index fd1df4ce3852..48a5d49fc131 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/debugfs.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-- 
2.43.2

