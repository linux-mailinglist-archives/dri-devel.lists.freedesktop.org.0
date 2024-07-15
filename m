Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A39318E6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6754E10E2A2;
	Mon, 15 Jul 2024 16:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKg0Ap5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2349210E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721062744; x=1752598744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=scgFjSSIACtSRPD/DAo/8akUXJkptCjN6mKyS8D6w8w=;
 b=gKg0Ap5PsFlFwK7eXqKxwrrLrmKsKjFGGxz1rQfkuKMpd9z943XB+JyL
 TaPcCRkKPnyd5LwR7M5J1uzXT+H6gAA5XYHk3O/hd+WjEe1q8Z0H1ixT6
 TTj5R9rLnqF/Kl+Pm5uT+PnlklPBDxgDK6GqcBoqBZyIo8NgK4EK+Answ
 7IFiL5jDpJf81ShuakekR8cSYO3xYhACQJ2gLzTzSV851mUIYXo9hZlmr
 ExqwIogld1eGwM/WToNoj2px6D/AboyewYqc6e+XY3UhpD8resMMS2uRY
 pnFGrYoS3OeN5B3CItv+zm0LvsgphOw/HcJneGssJ3zLaTGqPucEjgDqL w==;
X-CSE-ConnectionGUID: ESOAPatBQWqaz+PKhu0vRQ==
X-CSE-MsgGUID: 4ZOx4lFFQHOR8/P8Tlh6Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22219980"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="22219980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 09:59:03 -0700
X-CSE-ConnectionGUID: 2LSqT1mxSfeX9a29XVLGtQ==
X-CSE-MsgGUID: Z913iehPRHa3YvOYIub/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49643021"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 09:59:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Fix drm_buddy_print() to work with printk printers
Date: Mon, 15 Jul 2024 18:58:47 +0200
Message-Id: <20240715165847.1374-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

If we try to use printk-based drm_printer, like drm_dbg_printer(),
output from drm_buddy_print() will be split into several lines:

 [drm] chunk_size: 1024KiB, total: 7MiB, free: 7MiB, clear_free: 0MiB
 [drm] order- 2
 [drm] free:        4 MiB
 [drm] , blocks: 1
 [drm] order- 1
 [drm] free:        2 MiB
 [drm] , blocks: 1
 [drm] order- 0
 [drm] free:        1 MiB
 [drm] , blocks: 1

Fix that by using single drm_printf() per line.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 6a8e45e9d0ec..474a4689269b 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -1139,15 +1139,10 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 			count++;
 		}
 
-		drm_printf(p, "order-%2d ", order);
-
 		free = count * (mm->chunk_size << order);
-		if (free < SZ_1M)
-			drm_printf(p, "free: %8llu KiB", free >> 10);
-		else
-			drm_printf(p, "free: %8llu MiB", free >> 20);
-
-		drm_printf(p, ", blocks: %llu\n", count);
+		drm_printf(p, "order-%2d free: %8llu %s, blocks: %llu\n",
+			   order, free >> (free < SZ_1M ? 10 : 20),
+			   free < SZ_1M ? "KiB" : "MiB", count);
 	}
 }
 EXPORT_SYMBOL(drm_buddy_print);
-- 
2.43.0

