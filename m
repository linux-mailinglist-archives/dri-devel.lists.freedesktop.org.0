Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E097AA93B2E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD2B88EA1;
	Fri, 18 Apr 2025 16:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TOBo4mqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4BA10E22D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oSHBJ91QJdAKIu4mBt0Ub8AELWeuizLkr8G7yPzChl4=; b=TOBo4mqNRrRks7IKKiu6Jripg3
 45P+egdgvxDYGzR40imb7hSJYoIgl9XwXDvy9ZOaBjvDrfdAtZcgqecQn/pgBmB0vbAdQ+6N4khAx
 EZ20r1KcUlqD3R+2kZjWL+Jv6JWpY6e1ciOD3u1vynYj9xTNdBtXRdFksm3RiqJhLGXs4YWEMacrQ
 z+fwVB2vpNjyPcEDLbqo1DtDiCajZ0OBsjDs5enf3F2D286sjQymCGsa3EBtb7DUANnJeADLbWPUa
 SIqrvYZvyIUOEFUpooKiT5n0jyz1F2T+cQgWXjRuvCfoE6Gq2Lh4kpY++dmosHEwzlno/nY/sHEp5
 HAbT7Y4w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5onn-001Hbp-Vz; Fri, 18 Apr 2025 18:42:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 1/4] sync_file: Weakly paper over one use-after-free resulting
 race
Date: Fri, 18 Apr 2025 17:42:43 +0100
Message-ID: <20250418164246.72426-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
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

Xe and probably some other drivers can tear down the internal state
referenced by exported sync file fence which then causes a null pointer
derefences on accessing said fence.

This is somewhat related to DRM scheduler design where sched fence is
supposed to be allowed to outlive the scheduler instance itself, in which
case either the fence->ops, or just the timeline name may go away and the
fact driver has no real visibility if someone had converted the syncobj
into sync file in the meantime.

Bug can be triggered easily from IGT:

 [IGT] xe_sync_file: starting subtest sync_file_race
 ==================================================================
 BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name+0xa1/0xb0 [gpu_sched]
 Read of size 8 at addr ffff888126726020 by task xe_sync_file/2931
 ...
 Call Trace:
  <TASK>
  kasan_report+0xeb/0x130
  drm_sched_fence_get_timeline_name+0xa1/0xb0 [gpu_sched]
  sync_file_ioctl+0x3cb/0xb00
 ...
 Allocated by task 2931:
  __kmalloc_cache_noprof+0x1c2/0x410
  guc_exec_queue_init+0x1a8/0x1240 [xe]
  xe_exec_queue_create+0xe72/0x13b0 [xe]
  xe_exec_queue_create_ioctl+0x10d9/0x1770 [xe]
  drm_ioctl_kernel+0x179/0x300
  drm_ioctl+0x58f/0xcf0
  xe_drm_ioctl+0xe8/0x140 [xe]
 ...
 Freed by task 1689:
  kfree+0x106/0x3e0
  __guc_exec_queue_fini_async+0x144/0x2d0 [xe]
  process_one_work+0x610/0xdf0
  worker_thread+0x7c8/0x14b0

This patch papers over it weakly by guarding one entry points with the
signaled check. Race is still there just the window is smaller.

As an alternative we could remove the timeline description from sched
fence altogether, but the name is unfortunately not the only route to
disaster. There is also the dma fence deadline setting ioctl.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/dma-buf/sync_file.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index d9b1c1b2a72b..cfaa7b5d325e 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -116,6 +116,9 @@ struct dma_fence *sync_file_get_fence(int fd)
 }
 EXPORT_SYMBOL(sync_file_get_fence);
 
+const char *sync_fence_signaled_obj_name = "signaled-timeline";
+const char *sync_fence_signaled_driver_name = "signaled-driver";
+
 /**
  * sync_file_get_name - get the name of the sync_file
  * @sync_file:		sync_file to get the fence from
@@ -136,11 +139,18 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 	} else {
 		struct dma_fence *fence = sync_file->fence;
 
-		snprintf(buf, len, "%s-%s%llu-%lld",
-			 fence->ops->get_driver_name(fence),
-			 fence->ops->get_timeline_name(fence),
-			 fence->context,
-			 fence->seqno);
+		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+			snprintf(buf, len, "%s-%s%llu-%lld",
+				 sync_fence_signaled_driver_name,
+				 sync_fence_signaled_obj_name,
+				 fence->context,
+				 fence->seqno);
+		else
+			snprintf(buf, len, "%s-%s%llu-%lld",
+				 fence->ops->get_driver_name(fence),
+				 fence->ops->get_timeline_name(fence),
+				 fence->context,
+				 fence->seqno);
 	}
 
 	return buf;
@@ -262,6 +272,15 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+		info->status = fence->error ?: 1;
+		info->timestamp_ns = ktime_to_ns(dma_fence_timestamp(fence));
+		strscpy(info->obj_name, sync_fence_signaled_obj_name);
+		strscpy(info->driver_name, sync_fence_signaled_driver_name);
+
+		return info->status;
+	}
+
 	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
 		sizeof(info->obj_name));
 	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
-- 
2.48.0

