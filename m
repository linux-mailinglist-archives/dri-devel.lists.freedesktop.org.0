Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E6651235B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EADA10E380;
	Wed, 27 Apr 2022 20:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A2210E18B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHlSw/zlCfAnRSb3YWptJwBx7kzIW2QjNrqPPy0gN4Q=;
 b=LOi1oidTUTmolTlJ8R2Bdw4O4DL7WnqJz86oirdr0RTjvgDBydcJErVDtFL7gHHMyRbT4S
 UverIAZz2eGuBGdAjfmgLDEQ8PSGTrE0hmsv8eL/xZ8zlDYxfROzgEBu4akIJUD9yFaUQK
 dDRJhBEIn64lUthkm6a2hRahaLLjUeI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-C3yWpEYEMr-GTHr4uc5AKg-1; Wed, 27 Apr 2022 16:03:53 -0400
X-MC-Unique: C3yWpEYEMr-GTHr4uc5AKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 008831C068C1;
 Wed, 27 Apr 2022 20:03:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 850449E84;
 Wed, 27 Apr 2022 20:03:46 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 05/19] x86: KVMGT: use
 kvm_page_track_write_tracking_enable
Date: Wed, 27 Apr 2022 23:03:00 +0300
Message-Id: <20220427200314.276673-6-mlevitsk@redhat.com>
In-Reply-To: <20220427200314.276673-1-mlevitsk@redhat.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows to enable the write tracking only when KVMGT is
actually used and doesn't carry any penalty otherwise.

Tested by booting a VM with a kvmgt mdev device.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/Kconfig             | 3 ---
 arch/x86/kvm/mmu/mmu.c           | 2 +-
 drivers/gpu/drm/i915/Kconfig     | 1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c | 5 +++++
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index e3cbd77061364..41341905d3734 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -126,7 +126,4 @@ config KVM_XEN
 
 	  If in doubt, say "N".
 
-config KVM_EXTERNAL_WRITE_TRACKING
-	bool
-
 endif # VIRTUALIZATION
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index fb744616bf7df..633a3138d68e1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5753,7 +5753,7 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
 	kvm_page_track_register_notifier(kvm, node);
 
-	if (IS_ENABLED(CONFIG_KVM_EXTERNAL_WRITE_TRACKING) || !tdp_enabled)
+	if (!tdp_enabled)
 		mmu_enable_write_tracking(kvm);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 98c5450b8eacc..7d8346f4bae11 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -130,7 +130,6 @@ config DRM_I915_GVT_KVMGT
 	depends on DRM_I915_GVT
 	depends on KVM
 	depends on VFIO_MDEV
-	select KVM_EXTERNAL_WRITE_TRACKING
 	default n
 	help
 	  Choose this option if you want to enable KVMGT support for
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 057ec44901045..4c62ab3ef245d 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1933,6 +1933,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	struct intel_vgpu *vgpu;
 	struct kvmgt_vdev *vdev;
 	struct kvm *kvm;
+	int ret;
 
 	vgpu = mdev_get_drvdata(mdev);
 	if (handle_valid(vgpu->handle))
@@ -1948,6 +1949,10 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	if (__kvmgt_vgpu_exist(vgpu, kvm))
 		return -EEXIST;
 
+	ret = kvm_page_track_write_tracking_enable(kvm);
+	if (ret)
+		return ret;
+
 	info = vzalloc(sizeof(struct kvmgt_guest_info));
 	if (!info)
 		return -ENOMEM;
-- 
2.26.3

