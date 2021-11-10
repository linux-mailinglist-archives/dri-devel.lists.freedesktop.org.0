Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DB44C361
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 15:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A916E49F;
	Wed, 10 Nov 2021 14:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE3D6E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 14:50:41 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 10 Nov 2021 06:50:37 -0800
Received: from vmware.com (unknown [10.21.244.144])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id B1CC4204A2;
 Wed, 10 Nov 2021 06:50:39 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
Date: Wed, 10 Nov 2021 09:50:34 -0500
Message-ID: <20211110145034.487512-1-zackr@vmware.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
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

TTM takes full control over TTM_PL_SYSTEM placed buffers. This makes
driver internal usage of TTM_PL_SYSTEM prone to errors because it
requires the drivers to manually handle all interactions between TTM
which can swap out those buffers whenever it thinks it's the right
thing to do and driver.

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
 include/drm/ttm/ttm_placement.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 76d1b9119a2b..8074d0f6cae5 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -35,6 +35,17 @@
 
 /*
  * Memory regions for data placement.
+ *
+ * Buffers placed in TTM_PL_SYSTEM are considered under TTMs control and can
+ * be swapped out whenever TTMs thinks it is a good idea.
+ * In cases where drivers would like to use TTM_PL_SYSTEM as a valid
+ * placement they need to be able to handle the issues that arise due to the
+ * above manually.
+ *
+ * For BO's which reside in system memory but for which the accelerator
+ * requires direct access (i.e. their usage needs to be synchronized
+ * between the CPU and accelerator via fences) a new, driver private
+ * placement that can handle such scenarios is a good idea.
  */
 
 #define TTM_PL_SYSTEM           0
-- 
2.32.0

