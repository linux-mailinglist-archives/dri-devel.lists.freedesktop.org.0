Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF531303E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C520B6E88A;
	Mon,  8 Feb 2021 11:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B54F6E88A;
 Mon,  8 Feb 2021 11:11:01 +0000 (UTC)
IronPort-SDR: 2Ty2/A586oDDu+Gmb5RU41K4qdMkv7yTSI2ricRTD+MOZQ2suYFih21a0TCJnnGNbJyaMOoJg0
 baTYq9UIdfXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="179134980"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="179134980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:11:00 -0800
IronPort-SDR: tQPxxlIxpgU2syF+t+y9/8vgr96RxgVSdqB1ryYM3UPrbvR2D4MYql2e8nyZDkEvcykN4FKdS0
 hOIBPdZZ0vHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="395345985"
Received: from zhangyu-optiplex-7040.bj.intel.com ([10.238.154.148])
 by orsmga008.jf.intel.com with ESMTP; 08 Feb 2021 03:10:56 -0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: zhenyuw@linux.intel.com,
	zhi.a.wang@intel.com
Subject: [PATCH] drm/i915/gvt/kvmgt: Fix the build failure in kvmgt.
Date: Tue,  9 Feb 2021 02:52:10 +0800
Message-Id: <20210208185210.6002-1-yu.c.zhang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 08 Feb 2021 11:11:43 +0000
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, commit 531810caa9f4 ("KVM: x86/mmu: Use
an rwlock for the x86 MMU") replaced KVM's mmu_lock
with type rwlock_t. This will cause a build failure
in kvmgt, which uses the same lock when trying to add/
remove some GFNs to/from the page tracker. Fix it with
write_lock/unlocks in kvmgt.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 60f1a386dd06..b4348256ae95 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1703,7 +1703,7 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 		return -EINVAL;
 	}
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 
 	if (kvmgt_gfn_is_write_protected(info, gfn))
 		goto out;
@@ -1712,7 +1712,7 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 	kvmgt_protect_table_add(info, gfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 	srcu_read_unlock(&kvm->srcu, idx);
 	return 0;
 }
@@ -1737,7 +1737,7 @@ static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
 		return -EINVAL;
 	}
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 
 	if (!kvmgt_gfn_is_write_protected(info, gfn))
 		goto out;
@@ -1746,7 +1746,7 @@ static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
 	kvmgt_protect_table_del(info, gfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 	srcu_read_unlock(&kvm->srcu, idx);
 	return 0;
 }
@@ -1772,7 +1772,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 	struct kvmgt_guest_info *info = container_of(node,
 					struct kvmgt_guest_info, track_node);
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 	for (i = 0; i < slot->npages; i++) {
 		gfn = slot->base_gfn + i;
 		if (kvmgt_gfn_is_write_protected(info, gfn)) {
@@ -1781,7 +1781,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 			kvmgt_protect_table_del(info, gfn);
 		}
 	}
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 }
 
 static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
