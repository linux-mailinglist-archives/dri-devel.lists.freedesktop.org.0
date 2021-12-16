Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB24477490
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEC410FF21;
	Thu, 16 Dec 2021 14:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6800010FF0E;
 Thu, 16 Dec 2021 14:28:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 07/17] drm/i915: Ensure i915_vma tests do not get -ENOSPC
 with the locking changes.
Date: Thu, 16 Dec 2021 15:27:39 +0100
Message-Id: <20211216142749.1966107-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we require locking to evict, multiple vmas from the same object
might not be evicted. This is expected and required, because execbuf will
move to short-term pinning by using the lock only. This will cause these
tests to fail, because they create a ton of vma's for the same object.

Unbind manually to prevent spurious -ENOSPC in those mock tests.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 1f10fe36619b..5c5809dfe9b2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -691,7 +691,11 @@ static int igt_vma_rotate_remap(void *arg)
 					}
 
 					i915_vma_unpin(vma);
-
+					err = i915_vma_unbind(vma);
+					if (err) {
+						pr_err("Unbinding returned %i\n", err);
+						goto out_object;
+					}
 					cond_resched();
 				}
 			}
@@ -848,6 +852,11 @@ static int igt_vma_partial(void *arg)
 
 				i915_vma_unpin(vma);
 				nvma++;
+				err = i915_vma_unbind(vma);
+				if (err) {
+					pr_err("Unbinding returned %i\n", err);
+					goto out_object;
+				}
 
 				cond_resched();
 			}
@@ -882,6 +891,12 @@ static int igt_vma_partial(void *arg)
 
 		i915_vma_unpin(vma);
 
+		err = i915_vma_unbind(vma);
+		if (err) {
+			pr_err("Unbinding returned %i\n", err);
+			goto out_object;
+		}
+
 		count = 0;
 		list_for_each_entry(vma, &obj->vma.list, obj_link)
 			count++;
-- 
2.34.1

