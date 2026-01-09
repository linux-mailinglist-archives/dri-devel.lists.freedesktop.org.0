Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D39D0A37F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386810E2AC;
	Fri,  9 Jan 2026 13:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LvyvyYLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20C210E118
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767964094;
 bh=jDpuwzGYtEA+/0Kp6S4tjwGQYYIqoNefNx4Y/98k1e0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LvyvyYLiCmuy6z7uqCe/UsBvzNyOMndpnv0ND7RL6WFT/2vRNwAaL1b3UTOAUqd8z
 LpOsccSVCZ8VYqJKa0hPiSzK3dCHDu8zmv7GMQo+m/DGNfR/BPA1sD8YN0aSKjDFit
 chQVBcqMy/yaW42M7nUwnF9RKl5GLB2ekYipkmxiVdjPeoVOrLdrQgW/FDAIqLTheS
 YD0w0zmd019ViGJmqYsJIdbfWfYhh3s8oaNQSMSqAME5jIgxGSd0AvHwXpsbeKzQAU
 2oko1QhcK/244fT6OmEkDO1hz3v/gn5NH4WCpqrzPpU4OmJkxxQYXUcAy1kGqLvtrg
 ZsbfEmSGYjjRw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8452017E1406;
 Fri,  9 Jan 2026 14:08:13 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v1 2/9] drm/gpuvm: Validate BOs in the extobj list when VM is
 resv protected
Date: Fri,  9 Jan 2026 14:07:54 +0100
Message-ID: <20260109130801.1239558-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130801.1239558-1-boris.brezillon@collabora.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
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

When the VM is protected with the root object resv, evicted extobjs
are not inserted in the evict list. Make sure we record when the extobj
list contains evicted BOs that are not already in the evict list so we
can validate those when drm_gpuvm_validate() is called.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 23 ++++++++++++++++++++++-
 include/drm/drm_gpuvm.h     |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0bb115b6b59c..95f0a1c843ad 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1505,6 +1505,22 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
 			drm_gpuvm_bo_list_del_init(vm_bo, evict, false);
 	}
 
+	if (READ_ONCE(gpuvm->extobj.check_evicted)) {
+		list_for_each_entry_safe(vm_bo, next, &gpuvm->extobj.list,
+					 list.entry.extobj) {
+			dma_resv_assert_held(vm_bo->obj->resv);
+
+			if (!vm_bo->evicted)
+				continue;
+
+			ret = ops->vm_bo_validate(vm_bo, exec);
+			if (ret)
+				break;
+		}
+
+		WRITE_ONCE(gpuvm->extobj.check_evicted, false);
+	}
+
 	return ret;
 }
 
@@ -1940,9 +1956,14 @@ drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
 	/* Can't add external objects to the evicted list directly if not using
 	 * internal spinlocks, since in this case the evicted list is protected
 	 * with the VM's common dma-resv lock.
+	 * In that case, we flag the extobj list has containing evicted objects,
+	 * which will force a scan on the next drm_gpuvm_validate_locked()
+	 * call.
 	 */
-	if (drm_gpuvm_is_extobj(gpuvm, obj) && !lock)
+	if (drm_gpuvm_is_extobj(gpuvm, obj) && !lock) {
+		WRITE_ONCE(gpuvm->extobj.check_evicted, true);
 		return;
+	}
 
 	if (evict)
 		drm_gpuvm_bo_list_add(vm_bo, evict, lock);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 655bd9104ffb..6061c361dc90 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -310,6 +310,12 @@ struct drm_gpuvm {
 		 * @extobj.lock: spinlock to protect the extobj list
 		 */
 		spinlock_t lock;
+
+		/**
+		 * @extobj.check_evicted: true if the list contains evicted BOs
+		 * that are not already in the evict list
+		 */
+		bool check_evicted;
 	} extobj;
 
 	/**
-- 
2.52.0

