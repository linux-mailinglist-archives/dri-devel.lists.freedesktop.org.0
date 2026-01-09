Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91704D0802D
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747D10E85D;
	Fri,  9 Jan 2026 08:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1rFp5i2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B2610E85D;
 Fri,  9 Jan 2026 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767949000; x=1799485000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+bY4ZztaByWJWs4ekFGdX8CVHginuxJnHVOLvFyJ01s=;
 b=m1rFp5i2XAwddA1gy4CPFuGoS8+nyL0L/3WlkMAjxgt2EAZL+WO0QsyH
 ZOLJsow3zn0Hp0wm1LjTaoJoYMflr9H7D99hH5ySBR0rcyt8pPFu6xFHU
 sAyQJGSc7l2c8FwhLWbia2OyVRSQ5mhcbQAhmnrIDczsi3nk7BDOQi2zM
 uORkQoanzvzfuvqeFk3TMnZkvMLd6xPu9STEoGEahLUq/NU8ao1WquN//
 TOLcHgrp0U4tmLeCOKWC5TQOJSa1V9tNTtWfnu1NPOnUoCKq/L38GSOG+
 lyr1/10SVhz4N+JY4phA+9NnzV3gxwf67SMS78qraUhOb2CExxHO7WIlX A==;
X-CSE-ConnectionGUID: OUppZAVjRFahmjtHdP62Xg==
X-CSE-MsgGUID: XhRVplNfQGCZQISU1RR0fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79625992"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79625992"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:40 -0800
X-CSE-ConnectionGUID: TtOuG+osTcigg4WByXtJdg==
X-CSE-MsgGUID: TjMjEjtYQduqVaWBqtq6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202538619"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:38 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Balbir Singh <balbirs@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 3/7] mm: Split device-private and coherent folios before
 freeing
Date: Fri,  9 Jan 2026 09:54:23 +0100
Message-ID: <20260109085605.443316-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109085605.443316-1-francois.dugast@intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Split device-private and coherent folios into individual pages before
freeing so that any order folio can be formed upon the next use of the
pages.

Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 mm/memremap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index 63c6ab4fdf08..7289cdd6862f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
 			break;
+
+		folio_split_unref(folio);
 		pgmap->ops->folio_free(folio);
 		percpu_ref_put_many(&folio->pgmap->ref, nr);
 		break;
-- 
2.43.0

