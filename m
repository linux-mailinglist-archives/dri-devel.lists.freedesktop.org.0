Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21131F6FC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 11:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805276E8BD;
	Fri, 19 Feb 2021 10:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F284D6E8B3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 10:05:58 +0000 (UTC)
IronPort-SDR: sjtIvyYVJbB/m5y465espc34rdT6I4FUAcw0k9b3e5jb1gjosLK0//FxN0JUSfTyOkgGi/0lQ0
 2KS/l3jcs34Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170932817"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="170932817"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 02:05:58 -0800
IronPort-SDR: HLH91WE/COvjVEqV0kdM0Uveqdd1MB/olymwX+A6V0ib5XOKmY/Chio8k36YnVzEHR9pFsR/8F
 dsEF+f/E0+Yw==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="513624304"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 02:05:57 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Subject: [RFC v4 1/3] kvm: Add a notifier for create and destroy VM events
Date: Fri, 19 Feb 2021 01:55:21 -0800
Message-Id: <20210219095523.2621884-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219095523.2621884-1-vivek.kasireddy@intel.com>
References: <20210219095523.2621884-1-vivek.kasireddy@intel.com>
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
Cc: dongwon.kim@intel.com, daniel.vetter@ffwll.ch,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 daniel.vetter@intel.com, linux-media@vger.kernel.org, christian.koenig@amd.com,
 stevensd@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After registering with this notifier, other drivers that are dependent
on KVM can get notified whenever a VM is created or destroyed. This
also provides a way for sharing the KVM instance pointer with other
drivers.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/kvm_host.h |  5 +++++
 virt/kvm/kvm_main.c      | 20 ++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f3b1013fb22c..fc1a688301a0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -88,6 +88,9 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 
+#define KVM_EVENT_CREATE_VM 0
+#define KVM_EVENT_DESTROY_VM 1
+
 /*
  * error pfns indicate that the gfn is in slot but faild to
  * translate it to pfn on host.
@@ -1494,5 +1497,7 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
+int kvm_vm_register_notifier(struct notifier_block *nb);
+int kvm_vm_unregister_notifier(struct notifier_block *nb);
 
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5f260488e999..8a0e8bb02a5f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -101,6 +101,8 @@ DEFINE_MUTEX(kvm_lock);
 static DEFINE_RAW_SPINLOCK(kvm_count_lock);
 LIST_HEAD(vm_list);
 
+static struct blocking_notifier_head kvm_vm_notifier;
+
 static cpumask_var_t cpus_hardware_enabled;
 static int kvm_usage_count;
 static atomic_t hardware_enable_failed;
@@ -148,12 +150,20 @@ static void kvm_io_bus_destroy(struct kvm_io_bus *bus);
 __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
-#define KVM_EVENT_CREATE_VM 0
-#define KVM_EVENT_DESTROY_VM 1
 static void kvm_uevent_notify_change(unsigned int type, struct kvm *kvm);
 static unsigned long long kvm_createvm_count;
 static unsigned long long kvm_active_vms;
 
+inline int kvm_vm_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&kvm_vm_notifier, nb);
+}
+
+inline int kvm_vm_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&kvm_vm_notifier, nb);
+}
+
 __weak void kvm_arch_mmu_notifier_invalidate_range(struct kvm *kvm,
 						   unsigned long start, unsigned long end)
 {
@@ -808,6 +818,8 @@ static struct kvm *kvm_create_vm(unsigned long type)
 
 	preempt_notifier_inc();
 
+	blocking_notifier_call_chain(&kvm_vm_notifier,
+				     KVM_EVENT_CREATE_VM, kvm);
 	return kvm;
 
 out_err:
@@ -886,6 +898,8 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	preempt_notifier_dec();
 	hardware_disable_all();
 	mmdrop(mm);
+	blocking_notifier_call_chain(&kvm_vm_notifier,
+				     KVM_EVENT_DESTROY_VM, kvm);
 }
 
 void kvm_get_kvm(struct kvm *kvm)
@@ -4968,6 +4982,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	r = kvm_vfio_ops_init();
 	WARN_ON(r);
 
+	BLOCKING_INIT_NOTIFIER_HEAD(&kvm_vm_notifier);
+
 	return 0;
 
 out_unreg:
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
