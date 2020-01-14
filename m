Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BBC13A921
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 13:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640E6E3A0;
	Tue, 14 Jan 2020 12:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BCD6E393
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 12:19:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 04:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,432,1571727600"; d="scan'208";a="248031177"
Received: from wagnerst-mobl.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.51.171])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2020 04:19:31 -0800
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/syncobj: Add documentation for timeline syncobj
Date: Tue, 14 Jan 2020 14:19:28 +0200
Message-Id: <20200114121928.251434-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.25.0.rc2
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Christian Koenig <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've added a set of new APIs to manipulate syncobjs holding timelines
of dma_fence. This adds a bit of documentation about how this works.

v2: Small language nits (Lionel)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Christian Koenig <Christian.Koenig@amd.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
---
 drivers/gpu/drm/drm_syncobj.c | 87 +++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 669c93fe2500..42d46414f767 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -43,27 +43,66 @@
  *  - Signal a syncobj (set a trivially signaled fence)
  *  - Wait for a syncobj's fence to appear and be signaled
  *
+ * The syncobj userspace API also provides operations to manipulate a syncobj
+ * in terms of a timeline of struct &dma_fence_chain rather than a single
+ * struct &dma_fence, through the following operations:
+ *
+ *   - Signal a given point on the timeline
+ *   - Wait for a given point to appear and/or be signaled
+ *   - Import and export from/to a given point of a timeline
+ *
  * At it's core, a syncobj is simply a wrapper around a pointer to a struct
  * &dma_fence which may be NULL.
  * When a syncobj is first created, its pointer is either NULL or a pointer
  * to an already signaled fence depending on whether the
  * &DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to
  * &DRM_IOCTL_SYNCOBJ_CREATE.
- * When GPU work which signals a syncobj is enqueued in a DRM driver,
- * the syncobj fence is replaced with a fence which will be signaled by the
- * completion of that work.
- * When GPU work which waits on a syncobj is enqueued in a DRM driver, the
- * driver retrieves syncobj's current fence at the time the work is enqueued
- * waits on that fence before submitting the work to hardware.
- * If the syncobj's fence is NULL, the enqueue operation is expected to fail.
- * All manipulation of the syncobjs's fence happens in terms of the current
- * fence at the time the ioctl is called by userspace regardless of whether
- * that operation is an immediate host-side operation (signal or reset) or
- * or an operation which is enqueued in some driver queue.
- * &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be used to
- * manipulate a syncobj from the host by resetting its pointer to NULL or
+ *
+ * If the syncobj is considered as a binary (its state is either signaled or
+ * unsignaled) primitive, when GPU work is enqueued in a DRM driver to signal
+ * the syncobj, the syncobj's fence is replaced with a fence which will be
+ * signaled by the completion of that work.
+ * If the syncobj is considered as a timeline primitive, when GPU work is
+ * enqueued in a DRM driver to signal the a given point of the syncobj, a new
+ * struct &dma_fence_chain pointing to the DRM driver's fence and also
+ * pointing to the previous fence that was in the syncobj. The new struct
+ * &dma_fence_chain fence replace the syncobj's fence and will be signaled by
+ * completion of the DRM driver's work and also any work associated with the
+ * fence previously in the syncobj.
+ *
+ * When GPU work which waits on a syncobj is enqueued in a DRM driver, at the
+ * time the work is enqueued, it waits on the syncobj's fence before
+ * submitting the work to hardware. That fence is either :
+ *
+ *    - The syncobj's current fence if the syncobj is considered as a binary
+ *      primitive.
+ *    - The struct &dma_fence associated with a given point if the syncobj is
+ *      considered as a timeline primitive.
+ *
+ * If the syncobj's fence is NULL or not present in the syncobj's timeline,
+ * the enqueue operation is expected to fail.
+ *
+ * With binary syncobj, all manipulation of the syncobjs's fence happens in
+ * terms of the current fence at the time the ioctl is called by userspace
+ * regardless of whether that operation is an immediate host-side operation
+ * (signal or reset) or or an operation which is enqueued in some driver
+ * queue. &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be used
+ * to manipulate a syncobj from the host by resetting its pointer to NULL or
  * setting its pointer to a fence which is already signaled.
  *
+ * With a timeline syncobj, all manipulation of the synobj's fence happens in
+ * terms of a u64 value referring to point in the timeline. See
+ * dma_fence_chain_find_seqno() to see how a given point is found in the
+ * timeline.
+ *
+ * Note that applications should be careful to always use timeline set of
+ * ioctl() when dealing with syncobj considered as timeline. Using a binary
+ * set of ioctl() with a syncobj considered as timeline could result incorrect
+ * synchronization. The use of binary syncobj is supported through the
+ * timeline set of ioctl() by using a point value of 0, this will reproduce
+ * the behavior of the binary set of ioctl() (for example replace the
+ * syncobj's fence when signaling).
+ *
  *
  * Host-side wait on syncobjs
  * --------------------------
@@ -87,6 +126,16 @@
  * synchronize between the two.
  * This requirement is inherited from the Vulkan fence API.
  *
+ * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncobj
+ * handles as well as an array of u64 points and does a host-side wait on all
+ * of syncobj fences at the given points simultaneously.
+ *
+ * &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the ability to wait for a given
+ * fence to materialize on the timeline without waiting for the fence to be
+ * signaled by using the &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag. This
+ * requirement is inherited from the wait-before-signal behavior required by
+ * the Vulkan timeline semaphore API.
+ *
  *
  * Import/export of syncobjs
  * -------------------------
@@ -120,6 +169,18 @@
  * Because sync files are immutable, resetting or signaling the syncobj
  * will not affect any sync files whose fences have been imported into the
  * syncobj.
+ *
+ *
+ * Import/export of timeline points in timeline syncobjs
+ * -----------------------------------------------------
+ *
+ * &DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to transfer a struct
+ * &dma_fence_chain of a syncobj at a given u64 point to another u64 point
+ * into another syncobj.
+ *
+ * Note that if you want to transfer a struct &dma_fence_chain from a given
+ * point on a timeline syncobj from/into a binary syncobj, you can use the
+ * point 0 to mean take/replace the fence in the syncobj.
  */
 
 #include <linux/anon_inodes.h>
-- 
2.25.0.rc2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
