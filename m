Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429E446942
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13D86EB25;
	Fri,  5 Nov 2021 19:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E86ED12
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 19:40:47 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 5 Nov 2021 12:40:41 -0700
Received: from vmware.com (unknown [10.21.244.23])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 3CD64205E7;
 Fri,  5 Nov 2021 12:40:46 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/6] drm/ttm: Clarify that the TTM_PL_SYSTEM buffers need
 to stay idle
Date: Fri, 5 Nov 2021 15:38:47 -0400
Message-ID: <20211105193845.258816-7-zackr@vmware.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105193845.258816-1-zackr@vmware.com>
References: <20211105193845.258816-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM was designed to allow TTM_PL_SYSTEM buffer to be fenced but over
the years the code that was meant to handle it was broken and new
changes can not deal with buffers which have been placed in TTM_PL_SYSTEM
buf do not remain idle.
CPU buffers which need to be fenced and shared with accelerators should
be placed in driver specific placements that can explicitly handle
CPU/accelerator buffer fencing.
Currently, apart, from things silently failing nothing is enforcing
that requirement which means that it's easy for drivers and new
developers to get this wrong. To avoid the confusion we can document
this requirement and clarify the solution.

This came up during a discussion on dri-devel:
https://lore.kernel.org/dri-devel/232f45e9-8748-1243-09bf-56763e6668b3@amd.com

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/ttm/ttm_placement.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 76d1b9119a2b..89dfb58ff199 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -35,6 +35,16 @@
 
 /*
  * Memory regions for data placement.
+ *
+ * Due to the fact that TTM_PL_SYSTEM BO's can be accessed by the hardware
+ * and are not directly evictable they're handled slightly differently
+ * from other placements. The most important and driver visible side-effect
+ * of that is that TTM_PL_SYSTEM BO's are not allowed to be fenced and have
+ * to remain idle. For BO's which reside in system memory but for which
+ * the accelerator requires direct access (i.e. their usage needs to be
+ * synchronized between the CPU and accelerator via fences) a new, driver
+ * private placement should be introduced that can handle such scenarios.
+ *
  */
 
 #define TTM_PL_SYSTEM           0
-- 
2.32.0

