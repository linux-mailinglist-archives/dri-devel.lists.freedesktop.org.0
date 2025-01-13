Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9249A0B80F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2548710E67D;
	Mon, 13 Jan 2025 13:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBLHwvGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B38110E67A;
 Mon, 13 Jan 2025 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736774699; x=1768310699;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6lg1blOounFHBdTC/qCOhvdJYsSUPYUUFVjDjRUcGe8=;
 b=DBLHwvGxQFhQwHTFLNCcNf1kvgQFuPX6n0je6MjESRzIiZPHgTZz7T1A
 MVx+xTUQfLBbpcq/UHnkdi8ornluRntrjbFmJGFY2d1fiP/0Hnkf9HZt1
 OZuZVnDd3rynYjWbx8YTiaybABvAqTVOQuYlHYrQ9kGns1Euupqxto083
 rD4ZvWHAS+RovnOPdj8u+buIExdz6uHn+y0+qKQit4ph5AXEujvjP3aqq
 hc3BRzX5TTQoEbow/xRqrZ0baMVGqYUszCr9ufiKqyM046aA9wBS4s5j6
 4yBxT/9hTQCj71x4YV7VoJygVwJ9NKoVEcFg3fqZYmNdERB1EC76qn9Jk g==;
X-CSE-ConnectionGUID: nViWGp3NR+uYzArNIeMwPA==
X-CSE-MsgGUID: Hy5Ry2hRScaQ/xHgrlIAOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48417179"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48417179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:24:58 -0800
X-CSE-ConnectionGUID: 99pWCOJNRCaDJvNOne7SVw==
X-CSE-MsgGUID: d+eSyepDTaecWA6qAgLZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105352710"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:24:56 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 13/27] mm: export access_remote_vm symbol for debugger use
Date: Mon, 13 Jan 2025 15:25:53 +0200
Message-ID: <20250113132553.373422-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Export access_remote_vm as GPL symbol to allow debuggers (eudebug)
to access and modify memory in target VMs by tracking VM_BIND
operations. While access_process_vm() is already exported, it would
require maintaining task references in the debugger.

Since the mm reference is already present in the userptr's mm notifier
implementation, exporting access_remote_vm allows that existing reference
to be used directly without needing to obtain and maintain additional
task references just for memory access.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 mm/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memory.c b/mm/memory.c
index 398c031be9ba..9b7c71c83db5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6690,6 +6690,7 @@ int access_remote_vm(struct mm_struct *mm, unsigned long addr,
 {
 	return __access_remote_vm(mm, addr, buf, len, gup_flags);
 }
+EXPORT_SYMBOL_GPL(access_remote_vm);
 
 /*
  * Access another process' address space.
-- 
2.43.0

