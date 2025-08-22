Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F11B3281A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 12:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77210E30D;
	Sat, 23 Aug 2025 10:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PBXOOS6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC4F10E046;
 Fri, 22 Aug 2025 22:00:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-321cfa7ad29so2790426a91.1; 
 Fri, 22 Aug 2025 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755900000; x=1756504800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27a5/X7zn8hMoq+43xDaLAEXrC+YLxEOzCiaDSpbx+M=;
 b=PBXOOS6GSPCZTXjdEpImuNMNpco6iV40i6KFeS6DrIV0WGTFlFD2pkJzV5GbGoRSwK
 FTFcEXe5o2mCM1QH0PkUUb0Lp8jj7E7AxYg2WuxhtWBbYaXaur5CoeJwJGaZBTBXloG5
 3uvJIvYBwDWj27/b+DOQz3Mo3DJB7q8tCwkj8zsIxFELzSGyCXIvtLarxSomti2GtufV
 R677HjzVKveECau/AkNo2j1b6C1pTDL8PYwDtLtuY39Jv4i8fNWwA+DPuF3enGyE+xqf
 ptxAvyJU8xpDI//zv5Cq44vx4GPBwLVBHSWhn3QtA9qpEGp33stMI0PcPCtUUB0aynqE
 vC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755900000; x=1756504800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27a5/X7zn8hMoq+43xDaLAEXrC+YLxEOzCiaDSpbx+M=;
 b=U5W0lAuCBh4TFPflc2aNN5C1uFcXSxszYE7sWy5d3T7Yo4YPLxuHuBNpff+KjGmcYg
 bl9Dj3afRQgt4s2Bppgb7DOraNt8h1Yv8NDAZ0sDkJeOc46J5yKkISHPuriwDRwljpFc
 6aTIo3M2xo1BSKuQ/vMtSYiTdQ8trsgydWsUQzgxsSj7vI+AjCM4yFIJKE11gk6AfQ68
 isAw7bj2t5XISZuda+YhY79NEFidAW7+UcW9sxUCmdmrkhH5iAqIigj/0V5v0G7erst/
 v4Lmlk2PgkM6j4GEAmyaz2NjZuVYkQfnf6+pv7JddHCWf+0ZA1UUMRfmgQZE98mwQyxM
 w+6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXulQCj+hRDipZJF+i2ijDs16shIJo8HjBqdDEJhnSflOEmQzX9wwus4lpAjjb3ldk7TQ5/17kQH8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjwrH8gMDJBVUQChKMv3LogJs5EpE7pEeaIoXF8tODPqpeNVh9
 hJMDRpFPFKMUR1kpFTSbPtMjBlYYe1G/QnOi8sAWxOrvQ0DT05G2y0br
X-Gm-Gg: ASbGncuFz7zye80O0G/Cvo4NxuCK/5k6fZ6iB+a2Uqab5tV3wjnZhUMpZRAzv9OLLD2
 DHu4toG1uheRJzVVXxAocy1MtlxlW/4zMpk47fBtrb1XCKn1XXvL5JLEMX4GiJbMj+MH7Q9xlB3
 I2Q0Os3R1R2L0hzs5KSSuQr0vDK/m2qC06ioC2khpCwhgef8w7xNTZ4xyHTtgTmIoooaav3XnHM
 qchUfGA9JtDG6ML3jBNVanneO0hG/7ypAYZUq7sYy4P7gUciUN9fyB6B7u7vEP6mObU5o1xqXLD
 nKqu+oc8imThBKLTstNRd1iHKgwoQAi3KOxQNXgAewk0g11u3FZooZbH5jy59b8RIBnZQMOyQdg
 iPBYkkuNAWiZcmeyw9nBcdmgkuReA70IRVr7xBcNSc10qtjzYyGZl7NOXjGN3ae2o
X-Google-Smtp-Source: AGHT+IFfgq+FgRUVzS/dXB0ywpaXJzol3g6ler9CYy/+YGeYcKS1hqdTax7kq94uT6c6IDNSXBEN0Q==
X-Received: by 2002:a17:90b:3943:b0:312:dbcd:b94f with SMTP id
 98e67ed59e1d1-3251d5437bamr5744750a91.11.1755900000064; 
 Fri, 22 Aug 2025 15:00:00 -0700 (PDT)
Received: from fedora ([172.59.161.146]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cbb7b375sm671860a12.29.2025.08.22.14.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 14:59:59 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH] gpu/drm/amd/amdkfd/kdf_queue.c: removal of
 kfd_queue_buffer_put
Date: Fri, 22 Aug 2025 14:59:50 -0700
Message-ID: <20250822215950.243504-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 23 Aug 2025 10:03:57 +0000
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

Removed kfd_queue_buffer_put to call amdgpu_bo_unref directly.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h            |  1 -
 .../drm/amd/amdkfd/kfd_process_queue_manager.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c           | 16 +++++-----------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 67694bcd9464..2bc0365b2ce9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1312,7 +1312,6 @@ void print_queue_properties(struct queue_properties *q);
 void print_queue(struct queue *q);
 int kfd_queue_buffer_get(struct amdgpu_vm *vm, void __user *addr, struct amdgpu_bo **pbo,
 			 u64 expected_size);
-void kfd_queue_buffer_put(struct amdgpu_bo **bo);
 int kfd_queue_acquire_buffers(struct kfd_process_device *pdd, struct queue_properties *properties);
 int kfd_queue_release_buffers(struct kfd_process_device *pdd, struct queue_properties *properties);
 void kfd_queue_unref_bo_va(struct amdgpu_vm *vm, struct amdgpu_bo **bo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 7fbb5c274ccc..b13817e4a829 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -610,7 +610,7 @@ int pqm_update_queue_properties(struct process_queue_manager *pqm,
 		}
 
 		kfd_queue_unref_bo_va(vm, &pqn->q->properties.ring_bo);
-		kfd_queue_buffer_put(&pqn->q->properties.ring_bo);
+		amdgpu_bo_unref(&pqn->q->properties.ring_bo);
 		amdgpu_bo_unreserve(vm->root.bo);
 
 		pqn->q->properties.ring_bo = p->ring_bo;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index a65c67cf56ff..dd529e37c0e6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -224,12 +224,6 @@ int kfd_queue_buffer_get(struct amdgpu_vm *vm, void __user *addr, struct amdgpu_
 	return -EINVAL;
 }
 
-/* FIXME: remove this function, just call amdgpu_bo_unref directly */
-void kfd_queue_buffer_put(struct amdgpu_bo **bo)
-{
-	amdgpu_bo_unref(bo);
-}
-
 int kfd_queue_acquire_buffers(struct kfd_process_device *pdd, struct queue_properties *properties)
 {
 	struct kfd_topology_device *topo_dev;
@@ -343,11 +337,11 @@ int kfd_queue_release_buffers(struct kfd_process_device *pdd, struct queue_prope
 	struct kfd_topology_device *topo_dev;
 	u32 total_cwsr_size;
 
-	kfd_queue_buffer_put(&properties->wptr_bo);
-	kfd_queue_buffer_put(&properties->rptr_bo);
-	kfd_queue_buffer_put(&properties->ring_bo);
-	kfd_queue_buffer_put(&properties->eop_buf_bo);
-	kfd_queue_buffer_put(&properties->cwsr_bo);
+	amdgpu_bo_unref(&properties->wptr_bo);
+	amdgpu_bo_unref(&properties->rptr_bo);
+	amdgpu_bo_unref(&properties->ring_bo);
+	amdgpu_bo_unref(&properties->eop_buf_bo);
+	amdgpu_bo_unref(&properties->cwsr_bo);
 
 	topo_dev = kfd_topology_device_by_id(pdd->dev->id);
 	if (!topo_dev)
-- 
2.50.1

