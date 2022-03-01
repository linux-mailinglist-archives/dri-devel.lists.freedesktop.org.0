Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0074C9338
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D6A10E813;
	Tue,  1 Mar 2022 18:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B6610E750
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646159322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQ5F8o9t5z4ZcXInvkxYIfp3g+lZYYUXl20ucNkiV/w=;
 b=GsACPTqRr+tCsgvpwVYaNi6o2m6EiDIP5XxiVsCBazeDE/3fOTx+13qQb6P8AclIgZWg3F
 qAtGtzprc7n/o4Yc/dYtVOpTUDb2flGc1+gshnOtZtz1vOReA49JvDjuX60tMtxVSohzzk
 W44zPPzfTX2sOrTedmwYiQG+3CXckfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-QMX9uoGjOr2nHGcZZobwDA-1; Tue, 01 Mar 2022 13:28:41 -0500
X-MC-Unique: QMX9uoGjOr2nHGcZZobwDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76F7C835DE2;
 Tue,  1 Mar 2022 18:28:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB42D86C41;
 Tue,  1 Mar 2022 18:28:30 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 10/11] KVM: nSVM: implement support for nested AVIC
Date: Tue,  1 Mar 2022 20:26:38 +0200
Message-Id: <20220301182639.559568-11-mlevitsk@redhat.com>
In-Reply-To: <20220301182639.559568-1-mlevitsk@redhat.com>
References: <20220301182639.559568-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This implements initial support of using the AVIC in a nested guest

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/svm.h |   8 +-
 arch/x86/kvm/svm/avic.c    | 640 ++++++++++++++++++++++++++++++++++++-
 arch/x86/kvm/svm/nested.c  | 127 +++++++-
 arch/x86/kvm/svm/svm.c     |  25 ++
 arch/x86/kvm/svm/svm.h     | 133 ++++++++
 arch/x86/kvm/trace.h       | 164 +++++++++-
 arch/x86/kvm/x86.c         |  10 +
 7 files changed, 1096 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index bb2fb78523cee..634c0b80a9dd2 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -222,17 +222,19 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 
 
 /* AVIC */
-#define AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK	(0xFF)
+#define AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK	(0xFFULL)
 #define AVIC_LOGICAL_ID_ENTRY_VALID_BIT			31
 #define AVIC_LOGICAL_ID_ENTRY_VALID_MASK		(1 << 31)
 
+/* TODO: support > 254 L1 APIC ID */
 #define AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK	(0xFFULL)
 #define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK	(0xFFFFFFFFFFULL << 12)
 #define AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK		(1ULL << 62)
 #define AVIC_PHYSICAL_ID_ENTRY_VALID_MASK		(1ULL << 63)
-#define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK		(0xFF)
+#define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK		(0xFFULL)
 
-#define AVIC_DOORBELL_PHYSICAL_ID_MASK			(0xFF)
+/* TODO: support > 254 L1 APIC ID */
+#define AVIC_DOORBELL_PHYSICAL_ID_MASK			(0xFFULL)
 
 #define AVIC_UNACCEL_ACCESS_WRITE_MASK		1
 #define AVIC_UNACCEL_ACCESS_OFFSET_MASK		0xFF0
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 406cdb63646e0..dd13fd3588e2b 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -51,6 +51,423 @@ static u32 next_vm_id = 0;
 static bool next_vm_id_wrapped = 0;
 static DEFINE_SPINLOCK(svm_vm_data_hash_lock);
 
+
+static inline struct kvm_vcpu *avic_vcpu_by_l1_apicid(struct kvm *kvm,
+						      int l1_apicid)
+{
+	WARN_ON(l1_apicid == -1);
+	return kvm_get_vcpu_by_id(kvm, l1_apicid);
+}
+
+static void avic_physid_shadow_entry_update_cpu(struct kvm *kvm,
+						struct avic_physid_table *t,
+						int n,
+						int l1_apicid)
+{
+	struct avic_physid_entry_descr *e = &t->entries[n];
+	u64 sentry = READ_ONCE(*e->sentry);
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+	struct kvm_vcpu *new_vcpu = NULL;
+	int l0_apicid;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&kvm_svm->avic.table_entries_lock, flags);
+
+	if (!list_empty(&e->link))
+		list_del_init(&e->link);
+
+	if (l1_apicid != -1)
+		new_vcpu = avic_vcpu_by_l1_apicid(kvm, l1_apicid);
+
+	if (new_vcpu)
+		list_add_tail(&e->link, &to_svm(new_vcpu)->nested.physid_ref_entries);
+
+	/* update the shadow entry */
+	sentry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+	if (new_vcpu && to_svm(new_vcpu)->loaded) {
+		l0_apicid = kvm_cpu_get_apicid(new_vcpu->cpu);
+		physid_entry_set_apicid(&sentry, l0_apicid);
+	}
+	WRITE_ONCE(*e->sentry, sentry);
+	raw_spin_unlock_irqrestore(&kvm_svm->avic.table_entries_lock, flags);
+}
+
+static void avic_physid_shadow_entry_erase(struct kvm *kvm,
+					   struct avic_physid_table *t,
+					   int n)
+{
+	struct avic_physid_entry_descr *e = &t->entries[n];
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+	unsigned long old_hpa;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&kvm_svm->avic.table_entries_lock, flags);
+
+	if (!test_and_clear_bit(n, t->valid_entires))
+		WARN_ON(1);
+
+	/* Release the old APIC backing page */
+	old_hpa = physid_entry_get_backing_table(*e->sentry);
+	kvm_release_pfn_dirty(old_hpa >> PAGE_SHIFT);
+
+	list_del_init(&e->link);
+	WRITE_ONCE(e->gentry, 0);
+	WRITE_ONCE(*e->sentry, 0);
+
+	raw_spin_unlock_irqrestore(&kvm_svm->avic.table_entries_lock, flags);
+}
+
+static void avic_physid_shadow_entry_create(struct kvm *kvm,
+					    struct avic_physid_table *t,
+					    int n,
+					    u64 gentry)
+{
+	struct avic_physid_entry_descr *e = &t->entries[n];
+	struct page *backing_page = NULL;
+	u64 sentry = 0;
+
+	u64 backing_page_gpa = physid_entry_get_backing_table(gentry);
+	int l1_apic_id = physid_entry_get_apicid(gentry);
+
+	if (backing_page_gpa == INVALID_BACKING_PAGE)
+		return;
+
+	backing_page = gfn_to_page(kvm, gpa_to_gfn(backing_page_gpa));
+	if (is_error_page(backing_page)) {
+		/*
+		 * Invalid GPA in the guest entry - ignore the entry
+		 * as if it was not present
+		 */
+		return;
+	}
+
+	physid_entry_set_backing_table(&sentry, page_to_phys(backing_page));
+	e->gentry = gentry;
+	WRITE_ONCE(*e->sentry, sentry);
+
+	if (test_and_set_bit(n, t->valid_entires))
+		WARN_ON(1);
+
+	avic_physid_shadow_entry_update_cpu(kvm, t, n, l1_apic_id);
+}
+
+void avic_physid_shadow_table_update_vcpu_location(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * Update all entries in the shadow PID tables which address this
+	 * vCPU with its new location
+	 */
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
+	struct vcpu_svm *vcpu_svm = to_svm(vcpu);
+	struct avic_physid_entry_descr *e;
+	int nentries = 0;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&kvm_svm->avic.table_entries_lock, flags);
+
+	list_for_each_entry(e, &vcpu_svm->nested.physid_ref_entries, link) {
+		u64 sentry = READ_ONCE(*e->sentry);
+
+		physid_entry_set_apicid(&sentry, cpu);
+		WRITE_ONCE(*e->sentry, sentry);
+		nentries++;
+	}
+
+	trace_kvm_avic_physid_update_vcpu(vcpu->vcpu_id, cpu, nentries);
+	raw_spin_unlock_irqrestore(&kvm_svm->avic.table_entries_lock, flags);
+}
+
+static bool
+avic_physid_shadow_table_setup_write_tracking(struct kvm *kvm,
+					      struct avic_physid_table *t,
+					      bool enable)
+{
+	struct kvm_memory_slot *slot;
+
+	write_lock(&kvm->mmu_lock);
+	slot = gfn_to_memslot(kvm, t->gfn);
+	if (!slot) {
+		write_unlock(&kvm->mmu_lock);
+		return false;
+	}
+
+	if (enable)
+		kvm_slot_page_track_add_page(kvm, slot, t->gfn, KVM_PAGE_TRACK_WRITE);
+	else
+		kvm_slot_page_track_remove_page(kvm, slot, t->gfn, KVM_PAGE_TRACK_WRITE);
+	write_unlock(&kvm->mmu_lock);
+	return true;
+}
+
+static void
+avic_physid_shadow_table_erase(struct kvm *kvm, struct avic_physid_table *t)
+{
+	int i;
+
+	t->nentries = 0;
+	for_each_set_bit(i, t->valid_entires, AVIC_MAX_PHYSICAL_ID_COUNT)
+		avic_physid_shadow_entry_erase(kvm, t, i);
+}
+
+static struct avic_physid_table *
+avic_physid_shadow_table_alloc(struct kvm *kvm, gfn_t gfn)
+{
+	struct avic_physid_entry_descr *e;
+	struct avic_physid_table *t;
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+	u64 *shadow_table_address;
+	int i;
+
+	if (kvm_page_track_write_tracking_enable(kvm))
+		return NULL;
+
+	lockdep_assert_held(&kvm_svm->avic.tables_lock);
+
+	t = kzalloc(sizeof(*t), GFP_KERNEL_ACCOUNT);
+	if (!t)
+		return NULL;
+
+	t->shadow_table = alloc_page(GFP_KERNEL_ACCOUNT|__GFP_ZERO);
+	if (!t->shadow_table)
+		goto err_free_table;
+
+	shadow_table_address = page_address(t->shadow_table);
+	t->shadow_table_hpa = __sme_set(page_to_phys(t->shadow_table));
+
+	for (i = 0; i < ARRAY_SIZE(t->entries); i++) {
+		e = &t->entries[i];
+		e->sentry = &shadow_table_address[i];
+		e->gentry = 0;
+		INIT_LIST_HEAD(&e->link);
+	}
+
+	t->gfn = gfn;
+	t->refcount = 1;
+	avic_physid_shadow_table_setup_write_tracking(kvm, t, true);
+	list_add_tail(&t->link, &kvm_svm->avic.physid_tables);
+	return t;
+
+err_free_table:
+	kfree(t);
+	return NULL;
+}
+
+static void
+avic_physid_shadow_table_free(struct kvm *kvm, struct avic_physid_table *t)
+{
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+
+	lockdep_assert_held(&kvm_svm->avic.tables_lock);
+
+	WARN_ON(t->refcount);
+	avic_physid_shadow_table_setup_write_tracking(kvm, t, false);
+
+	avic_physid_shadow_table_erase(kvm, t);
+
+	hlist_del(&t->hash_link);
+	list_del(&t->link);
+	__free_page(t->shadow_table);
+	kfree(t);
+}
+
+static struct avic_physid_table *
+__avic_physid_shadow_table_get(struct hlist_head *head, gfn_t gfn)
+{
+	struct avic_physid_table *t;
+
+	hlist_for_each_entry(t, head, hash_link)
+		if (t->gfn == gfn) {
+			t->refcount++;
+			return t;
+		}
+	return NULL;
+}
+
+struct avic_physid_table *
+avic_physid_shadow_table_get(struct kvm_vcpu *vcpu, gfn_t gfn)
+{
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
+	struct hlist_head *hlist;
+	struct avic_physid_table *t;
+
+	mutex_lock(&kvm_svm->avic.tables_lock);
+
+	hlist = &kvm_svm->avic.physid_gpa_hash[avic_physid_hash(gfn)];
+	t = __avic_physid_shadow_table_get(hlist, gfn);
+	if (!t) {
+		t = avic_physid_shadow_table_alloc(vcpu->kvm, gfn);
+		if (!t)
+			goto out_unlock;
+		hlist_add_head(&t->hash_link, hlist);
+	}
+out_unlock:
+	mutex_unlock(&kvm_svm->avic.tables_lock);
+	return t;
+}
+
+static void
+__avic_physid_shadow_table_put(struct kvm *kvm, struct avic_physid_table *t)
+{
+	WARN_ON(t->refcount <= 0);
+	if (--t->refcount == 0)
+		avic_physid_shadow_table_free(kvm, t);
+}
+
+void avic_physid_shadow_table_put(struct kvm *kvm, struct avic_physid_table *t)
+{
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+
+	mutex_lock(&kvm_svm->avic.tables_lock);
+	__avic_physid_shadow_table_put(kvm, t);
+	mutex_unlock(&kvm_svm->avic.tables_lock);
+}
+
+static void avic_physid_shadow_table_reload(struct kvm *kvm, struct avic_physid_table *t)
+{
+	trace_kvm_avic_physid_shadow_table_reload(gfn_to_gpa(t->gfn));
+	t->nentries = 0;
+	kvm_make_all_cpus_request(kvm, KVM_REQ_APIC_PAGE_RELOAD);
+}
+
+static void avic_physid_shadow_table_track_write(struct kvm_vcpu *vcpu,
+						 gpa_t gpa,
+						 const u8 *new,
+						 int bytes,
+						 struct kvm_page_track_notifier_node *node)
+{
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
+	struct hlist_head *hlist;
+	struct avic_physid_table *t;
+	gfn_t gfn = gpa_to_gfn(gpa);
+	unsigned int page_offset = offset_in_page(gpa);
+	unsigned int entry_offset = page_offset & 0x7;
+	int first = page_offset / sizeof(u64);
+	int last = (page_offset + bytes - 1) / sizeof(u64);
+	u64 new_entry, old_entry;
+	int l1_apic_id;
+
+	if (WARN_ON_ONCE(bytes == 0))
+		return;
+
+	mutex_lock(&kvm_svm->avic.tables_lock);
+
+	hlist = &kvm_svm->avic.physid_gpa_hash[avic_physid_hash(gfn)];
+	t = __avic_physid_shadow_table_get(hlist, gfn);
+
+	if (!t)
+		goto out_unlock;
+
+	trace_kvm_avic_physid_shadow_table_write(gpa, bytes);
+
+	/* writes outside known entries are ignored */
+	if (first >= t->nentries)
+		goto out_table_put;
+
+	/* more that one entry write - invalidate */
+	if (first != last)
+		goto invalidate;
+
+	/* update the entry with written bytes */
+	old_entry = t->entries[first].gentry;
+	new_entry = old_entry;
+	memcpy(((u8 *)&new_entry) + entry_offset, new, bytes);
+
+	/* if backing page changed, invalidate the whole page*/
+	if (physid_entry_get_backing_table(old_entry) !=
+				physid_entry_get_backing_table(new_entry))
+		goto invalidate;
+
+	/* Update the backing cpu */
+	l1_apic_id = physid_entry_get_apicid(new_entry);
+	avic_physid_shadow_entry_update_cpu(vcpu->kvm, t, first, l1_apic_id);
+	t->entries[first].gentry = new_entry;
+	goto out_table_put;
+invalidate:
+	avic_physid_shadow_table_reload(vcpu->kvm, t);
+out_table_put:
+	__avic_physid_shadow_table_put(vcpu->kvm, t);
+out_unlock:
+	mutex_unlock(&kvm_svm->avic.tables_lock);
+}
+
+static void avic_physid_shadow_table_flush_memslot(struct kvm *kvm,
+						   struct kvm_memory_slot *slot,
+						   struct kvm_page_track_notifier_node *node)
+{
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+	struct avic_physid_table *t, *n;
+	int i;
+
+	mutex_lock(&kvm_svm->avic.tables_lock);
+
+	list_for_each_entry_safe(t, n, &kvm_svm->avic.physid_tables, link) {
+
+		if (gfn_in_memslot(slot, t->gfn)) {
+			avic_physid_shadow_table_reload(kvm, t);
+			continue;
+		}
+
+		for_each_set_bit(i, t->valid_entires, AVIC_MAX_PHYSICAL_ID_COUNT) {
+			u64 gentry = t->entries[i].gentry;
+			gpa_t gpa = physid_entry_get_backing_table(gentry);
+
+			if (gfn_in_memslot(slot, gpa_to_gfn(gpa))) {
+				avic_physid_shadow_table_reload(kvm, t);
+				break;
+			}
+		}
+	}
+	mutex_unlock(&kvm_svm->avic.tables_lock);
+}
+
+void avic_reload_apic_pages(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *vcpu_svm = to_svm(vcpu);
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
+	struct avic_physid_table *t;
+	u64 *gentries;
+	struct kvm_host_map map;
+	int nentries;
+	int i;
+
+	t = vcpu_svm->nested.l2_physical_id_table;
+	if (!t || !is_guest_mode(vcpu) || !avic_nested_active(vcpu))
+		return;
+
+	nentries = vcpu_svm->nested.ctl.avic_physical_id & AVIC_PHYSICAL_ID_TABLE_SIZE_MASK;
+
+	mutex_lock(&kvm_svm->avic.tables_lock);
+
+	trace_kvm_avic_update_physid_table(gfn_to_gpa(t->gfn), t->nentries, nentries);
+
+	avic_physid_shadow_table_erase(vcpu->kvm, t);
+
+	if (kvm_vcpu_map(vcpu, t->gfn, &map))
+		goto out_unlock;
+
+	gentries = (u64 *)map.hva;
+
+	for (i = 0 ; i < nentries ; i++)
+		avic_physid_shadow_entry_create(vcpu->kvm, t, i, gentries[i]);
+
+	t->nentries = nentries;
+out_unlock:
+	kvm_vcpu_unmap(vcpu, &map, false);
+	mutex_unlock(&kvm_svm->avic.tables_lock);
+}
+
+static u32 nested_avic_get_reg(struct kvm_vcpu *vcpu, int reg_off)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	void *nested_apic_regs = svm->nested.l2_apic_access_page.hva;
+
+	if (WARN_ON_ONCE(!nested_apic_regs))
+		return 0;
+
+	return *((u32 *) (nested_apic_regs + reg_off));
+}
+
 /*
  * This is a wrapper of struct amd_iommu_ir_data.
  */
@@ -117,6 +534,8 @@ void avic_vm_destroy(struct kvm *kvm)
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
 	hash_del(&avic->hnode);
 	spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
+
+	kvm_page_track_unregister_notifier(kvm, &avic->write_tracker);
 }
 
 int avic_vm_init(struct kvm *kvm)
@@ -165,6 +584,13 @@ int avic_vm_init(struct kvm *kvm)
 	hash_add(svm_vm_data_hash, &avic->hnode, avic->vm_id);
 	spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
 
+	raw_spin_lock_init(&avic->table_entries_lock);
+	mutex_init(&avic->tables_lock);
+	INIT_LIST_HEAD(&avic->physid_tables);
+
+	avic->write_tracker.track_write = avic_physid_shadow_table_track_write;
+	avic->write_tracker.track_flush_slot = avic_physid_shadow_table_flush_memslot;
+	kvm_page_track_register_notifier(kvm, &avic->write_tracker);
 	return 0;
 
 free_avic:
@@ -317,6 +743,136 @@ static void avic_kick_target_vcpus(struct kvm *kvm, struct kvm_lapic *source,
 	}
 }
 
+static void
+avic_kick_target_vcpu_nested_physical(struct vcpu_svm *svm, int target_l2_apic_id, int *index)
+{
+	u64 gentry;
+	int target_l1_apicid;
+	struct avic_physid_table *t = svm->nested.l2_physical_id_table;
+
+	if (WARN_ON_ONCE(!t))
+		return;
+
+	/*
+	 * This shouldn't normally happen as such condition
+	 * should cause AVIC_IPI_FAILURE_INVALID_TARGET vmexit,
+	 * however guest can change the page under us.
+	 */
+	if (target_l2_apic_id >= t->nentries)
+		return;
+
+	gentry = t->entries[target_l2_apic_id].gentry;
+
+	/* Same reasoning as above  */
+	if (!(gentry & AVIC_PHYSICAL_ID_ENTRY_VALID_MASK))
+		return;
+
+	/*
+	 * This races against the guest updating is_running bit.
+	 * Race itself happens on real hardware as well, and the guest
+	 * should use correct means to avoid it.
+	 * TODO: needs memory barriers
+	 */
+
+	target_l1_apicid = physid_entry_get_apicid(gentry);
+
+	if (target_l1_apicid == -1) {
+		/* is_running is false, need to vmexit to the guest */
+		if (*index == -1)
+			*index = target_l2_apic_id;
+	} else {
+		/* Wake up the target vCPU and hide the VM exit from the guest */
+		struct kvm_vcpu *target = avic_vcpu_by_l1_apicid(svm->vcpu.kvm, target_l1_apicid);
+
+		if (target && target != &svm->vcpu)
+			kvm_vcpu_wake_up(target);
+	}
+
+	trace_kvm_avic_nested_kick_target_vcpu(svm->vcpu.vcpu_id,
+					       target_l2_apic_id,
+					       target_l1_apicid);
+}
+
+static void
+avic_kick_target_vcpus_nested_logical(struct vcpu_svm *svm, unsigned long dest,
+				      int *index)
+{
+	int logical_id;
+	u8 cluster = 0;
+	u64 *logical_id_table = (u64 *)svm->nested.l2_logical_id_table.hva;
+
+	if (WARN_ON_ONCE(!logical_id_table))
+		return;
+
+	if (nested_avic_get_reg(&svm->vcpu, APIC_DFR) == APIC_DFR_CLUSTER) {
+		if (dest >= 0x40)
+			return;
+		cluster = dest & 0x3C;
+		dest &= 0x3;
+	}
+
+	for_each_set_bit(logical_id, &dest, 8) {
+		u64 log_gentry = logical_id_table[cluster | logical_id];
+		int l2_apicid = logid_get_physid(log_gentry);
+
+		/* Should not happen as in this case AVIC should VM exit
+		 * with 'invalid target'
+
+		 * However the guest can change the entry under us,
+		 * thus ignore this case.
+		 */
+		if (l2_apicid != -1)
+			avic_kick_target_vcpu_nested_physical(svm, l2_apicid, index);
+	}
+}
+
+static void
+avic_kick_target_vcpus_nested_broadcast(struct vcpu_svm *svm, int *index)
+{
+	struct avic_physid_table *t = svm->nested.l2_physical_id_table;
+	int l2_apicid;
+
+	/*
+	 * This races against guest changing valid bit in the table and/or
+	 * increasing nentries of the table.
+	 * In both cases the race would happen on real hardware as well
+	 * thus there is no need to take locks.
+	 */
+	for_each_set_bit(l2_apicid, t->valid_entires, AVIC_MAX_PHYSICAL_ID_COUNT)
+		avic_kick_target_vcpu_nested_physical(svm, l2_apicid, index);
+}
+
+
+static int avic_kick_target_vcpus_nested(struct kvm_vcpu *vcpu,
+					struct kvm_lapic *source,
+					u32 icrl, u32 icrh)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+	int dest = GET_APIC_DEST_FIELD(icrh);
+	int index = -1;
+
+	trace_kvm_avic_nested_kick_target_vcpus(vcpu->vcpu_id, icrl, icrh);
+
+	switch (icrl & APIC_SHORT_MASK) {
+	case APIC_DEST_NOSHORT:
+		if (dest == 0xFF)
+			avic_kick_target_vcpus_nested_broadcast(svm, &index);
+		else if (icrl & APIC_DEST_MASK)
+			avic_kick_target_vcpus_nested_logical(svm, dest, &index);
+		else
+			avic_kick_target_vcpu_nested_physical(svm, dest, &index);
+		break;
+	case APIC_DEST_ALLINC:
+	case APIC_DEST_ALLBUT:
+		avic_kick_target_vcpus_nested_broadcast(svm, &index);
+		break;
+	case APIC_DEST_SELF:
+		break;
+	}
+
+	return index;
+}
+
 int avic_incomplete_ipi_interception(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -324,10 +880,18 @@ int avic_incomplete_ipi_interception(struct kvm_vcpu *vcpu)
 	u32 icrl = svm->vmcb->control.exit_info_1;
 	u32 id = svm->vmcb->control.exit_info_2 >> 32;
 	u32 index = svm->vmcb->control.exit_info_2 & 0xFF;
+	int nindex;
 	struct kvm_lapic *apic = vcpu->arch.apic;
 
 	trace_kvm_avic_incomplete_ipi(vcpu->vcpu_id, icrh, icrl, id, index);
 
+	if (is_guest_mode(&svm->vcpu)) {
+		if (WARN_ON_ONCE(!avic_nested_active(vcpu)))
+			return 1;
+		if (WARN_ON_ONCE(!svm->nested.l2_physical_id_table))
+			return 1;
+	}
+
 	switch (id) {
 	case AVIC_IPI_FAILURE_INVALID_INT_TYPE:
 		/*
@@ -339,23 +903,41 @@ int avic_incomplete_ipi_interception(struct kvm_vcpu *vcpu)
 		 * which case KVM needs to emulate the ICR write as well in
 		 * order to clear the BUSY flag.
 		 */
+		if (is_guest_mode(&svm->vcpu)) {
+			nested_svm_vmexit(svm);
+			break;
+		}
+
 		if (icrl & APIC_ICR_BUSY)
 			kvm_apic_write_nodecode(vcpu, APIC_ICR);
 		else
 			kvm_apic_send_ipi(apic, icrl, icrh);
+
 		break;
 	case AVIC_IPI_FAILURE_TARGET_NOT_RUNNING:
 		/*
 		 * At this point, we expect that the AVIC HW has already
 		 * set the appropriate IRR bits on the valid target
 		 * vcpus. So, we just need to kick the appropriate vcpu.
+		 *
+		 * If nested we might also need to reflect the VM exit to
+		 * the guest
 		 */
-		avic_kick_target_vcpus(vcpu->kvm, apic, icrl, icrh);
+		if (!is_guest_mode(&svm->vcpu)) {
+			avic_kick_target_vcpus(vcpu->kvm, apic, icrl, icrh);
+			break;
+		}
+
+		nindex = avic_kick_target_vcpus_nested(vcpu, apic, icrl, icrh);
+		if (nindex != -1) {
+			svm->vmcb->control.exit_info_2 =  ((u64)id << 32) | nindex;
+			nested_svm_vmexit(svm);
+		}
 		break;
 	case AVIC_IPI_FAILURE_INVALID_TARGET:
-		break;
 	case AVIC_IPI_FAILURE_INVALID_BACKING_PAGE:
-		WARN_ONCE(1, "Invalid backing page\n");
+		if (is_guest_mode(&svm->vcpu))
+			nested_svm_vmexit(svm);
 		break;
 	default:
 		pr_err("Unknown IPI interception\n");
@@ -369,6 +951,48 @@ bool avic_has_vcpu_inhibit_condition(struct kvm_vcpu *vcpu)
 	return is_guest_mode(vcpu);
 }
 
+int avic_emulate_doorbell_write(struct kvm_vcpu *vcpu, u64 data)
+{
+	int source_l1_apicid = vcpu->vcpu_id;
+	int target_l1_apicid = data & AVIC_DOORBELL_PHYSICAL_ID_MASK;
+	bool target_running, target_nested;
+	struct kvm_vcpu *target;
+
+	if (data & ~AVIC_DOORBELL_PHYSICAL_ID_MASK)
+		return 1;
+
+	target = avic_vcpu_by_l1_apicid(vcpu->kvm, target_l1_apicid);
+	if (!target)
+		/* Guest bug: targeting invalid APIC ID. */
+		return 0;
+
+	target_running = READ_ONCE(target->mode) == IN_GUEST_MODE;
+	target_nested = is_guest_mode(target);
+
+	trace_kvm_avic_nested_emulate_doorbell(source_l1_apicid, target_l1_apicid,
+					       target_nested, target_running);
+
+	/*
+	 * Target is not in nested mode, thus doorbell doesn't affect it
+	 * if it became just now nested now,
+	 * it means that it processed the doorbell on entry
+	 */
+	if (!target_nested)
+		return 0;
+
+	/*
+	 * If the target vCPU is in guest mode, kick the real doorbell.
+	 * Otherwise we need to wake it up in case it is not scheduled to run.
+	 */
+	if (target_running)
+		wrmsr(MSR_AMD64_SVM_AVIC_DOORBELL,
+		      kvm_cpu_get_apicid(READ_ONCE(target->cpu)), 0);
+	else
+		kvm_vcpu_wake_up(target);
+
+	return 0;
+}
+
 static u32 *avic_get_logical_id_entry(struct kvm_vcpu *vcpu, u32 ldr, bool flat)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
@@ -462,9 +1086,13 @@ static void avic_handle_dfr_update(struct kvm_vcpu *vcpu)
 
 static int avic_unaccel_trap_write(struct kvm_vcpu *vcpu)
 {
+	struct vcpu_svm *svm = to_svm(vcpu);
 	u32 offset = to_svm(vcpu)->vmcb->control.exit_info_1 &
 				AVIC_UNACCEL_ACCESS_OFFSET_MASK;
 
+	if (WARN_ON_ONCE(is_guest_mode(&svm->vcpu)))
+		return 0;
+
 	switch (offset) {
 	case APIC_LDR:
 		if (avic_handle_ldr_update(vcpu))
@@ -522,6 +1150,8 @@ int avic_unaccelerated_access_interception(struct kvm_vcpu *vcpu)
 		     AVIC_UNACCEL_ACCESS_WRITE_MASK;
 	bool trap = is_avic_unaccelerated_access_trap(offset);
 
+	WARN_ON_ONCE(is_guest_mode(&svm->vcpu));
+
 	trace_kvm_avic_unaccelerated_access(vcpu->vcpu_id, offset,
 					    trap, write, vector);
 	if (trap) {
@@ -970,3 +1600,7 @@ void avic_vcpu_unblocking(struct kvm_vcpu *vcpu)
 
 	put_cpu();
 }
+
+/*
+ * TODO: Deal with AVIC errata in regard to flushing TLB on vCPU change
+ */
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 6dffa6c661493..2bbd9b1f35cab 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -359,6 +359,14 @@ void __nested_copy_vmcb_control_to_cache(struct kvm_vcpu *vcpu,
 		memcpy(to->reserved_sw, from->reserved_sw,
 		       sizeof(struct hv_enlightenments));
 	}
+
+	/* copy avic related settings only when it is enabled */
+	if (from->int_ctl & AVIC_ENABLE_MASK) {
+		to->avic_vapic_bar      = from->avic_vapic_bar;
+		to->avic_backing_page   = from->avic_backing_page;
+		to->avic_logical_id     = from->avic_logical_id;
+		to->avic_physical_id    = from->avic_physical_id;
+	}
 }
 
 void nested_copy_vmcb_control_to_cache(struct vcpu_svm *svm,
@@ -507,6 +515,75 @@ void nested_vmcb02_compute_g_pat(struct vcpu_svm *svm)
 	svm->nested.vmcb02.ptr->save.g_pat = svm->vmcb01.ptr->save.g_pat;
 }
 
+
+static bool nested_vmcb02_prepare_avic(struct vcpu_svm *svm)
+{
+	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
+	struct avic_physid_table *t = svm->nested.l2_physical_id_table;
+	gfn_t physid_gfn;
+	int physid_nentries;
+
+	if (!avic_nested_active(&svm->vcpu))
+		return true;
+
+	/*
+	 * TODO Check that GPA of all pages is valid here,
+	 * and #VMEXIT with avic specific VMexit if not
+	 */
+
+	if (kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(svm->nested.ctl.avic_backing_page & AVIC_HPA_MASK),
+			  &svm->nested.l2_apic_access_page))
+		goto error;
+
+	if (kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(svm->nested.ctl.avic_logical_id & AVIC_HPA_MASK),
+			  &svm->nested.l2_logical_id_table))
+		goto error_unmap_backing_page;
+
+	physid_gfn = gpa_to_gfn(svm->nested.ctl.avic_physical_id &
+		     AVIC_HPA_MASK);
+	physid_nentries = svm->nested.ctl.avic_physical_id &
+			AVIC_PHYSICAL_ID_TABLE_SIZE_MASK;
+
+	if (t && t->gfn != physid_gfn) {
+		avic_physid_shadow_table_put(svm->vcpu.kvm, t);
+		svm->nested.l2_physical_id_table = NULL;
+	}
+
+	if (!svm->nested.l2_physical_id_table) {
+		t = avic_physid_shadow_table_get(&svm->vcpu, physid_gfn);
+		if (!t)
+			goto error_unmap_logical_id_table;
+		svm->nested.l2_physical_id_table = t;
+	}
+
+	if (t->nentries < physid_nentries)
+		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, &svm->vcpu);
+
+	/* Everything is setup, we can enable AVIC */
+
+	vmcb02->control.avic_vapic_bar =
+		svm->nested.ctl.avic_vapic_bar & VMCB_AVIC_APIC_BAR_MASK;
+	vmcb02->control.avic_backing_page =
+		pfn_to_hpa(svm->nested.l2_apic_access_page.pfn);
+	vmcb02->control.avic_logical_id =
+		pfn_to_hpa(svm->nested.l2_logical_id_table.pfn);
+	vmcb02->control.avic_physical_id =
+		(svm->nested.l2_physical_id_table->shadow_table_hpa) | physid_nentries;
+
+	vmcb02->control.int_ctl |= AVIC_ENABLE_MASK;
+	return true;
+
+error_unmap_logical_id_table:
+	kvm_vcpu_unmap(&svm->vcpu, &svm->nested.l2_logical_id_table, false);
+error_unmap_backing_page:
+	kvm_vcpu_unmap(&svm->vcpu, &svm->nested.l2_apic_access_page, false);
+error:
+	svm->vcpu.run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+	svm->vcpu.run->internal.suberror = KVM_INTERNAL_ERROR_EMULATION;
+	svm->vcpu.run->internal.ndata = 0;
+	return false;
+}
+
 static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12)
 {
 	bool new_vmcb12 = false;
@@ -566,7 +643,7 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 	const u32 int_ctl_vmcb01_bits =
 		V_INTR_MASKING_MASK | V_GIF_MASK | V_GIF_ENABLE_MASK;
 
-	const u32 int_ctl_vmcb12_bits = V_TPR_MASK | V_IRQ_INJECTION_BITS_MASK;
+	u32 int_ctl_vmcb12_bits = V_TPR_MASK | V_IRQ_INJECTION_BITS_MASK;
 
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 
@@ -575,6 +652,8 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 	 * exit_int_info, exit_int_info_err, next_rip, insn_len, insn_bytes.
 	 */
 
+	if (avic_nested_active(vcpu))
+		int_ctl_vmcb12_bits &= ~V_IRQ_INJECTION_BITS_MASK;
 
 	/* Copied from vmcb01.  msrpm_base can be overwritten later.  */
 	svm->vmcb->control.nested_ctl = svm->vmcb01.ptr->control.nested_ctl;
@@ -748,7 +827,10 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 	if (enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12, true))
 		goto out_exit_err;
 
-	if (nested_svm_vmrun_msrpm(svm))
+	if (!nested_svm_vmrun_msrpm(svm))
+		goto out_exit_err;
+
+	if (nested_vmcb02_prepare_avic(svm))
 		goto out;
 
 out_exit_err:
@@ -763,7 +845,6 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 
 out:
 	kvm_vcpu_unmap(vcpu, &map, true);
-
 	return ret;
 }
 
@@ -874,6 +955,11 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 
 	nested_svm_copy_common_state(svm->nested.vmcb02.ptr, svm->vmcb01.ptr);
 
+	if (avic_nested_active(vcpu)) {
+		kvm_vcpu_unmap(vcpu, &svm->nested.l2_apic_access_page, true);
+		kvm_vcpu_unmap(vcpu, &svm->nested.l2_logical_id_table, true);
+	}
+
 	svm_switch_vmcb(svm, &svm->vmcb01);
 
 	/*
@@ -988,6 +1074,9 @@ int svm_allocate_nested(struct vcpu_svm *svm)
 
 void svm_free_nested(struct vcpu_svm *svm)
 {
+	struct kvm_vcpu *vcpu = &svm->vcpu;
+	struct avic_physid_table *t;
+
 	if (!svm->nested.initialized)
 		return;
 
@@ -1006,6 +1095,15 @@ void svm_free_nested(struct vcpu_svm *svm)
 	 */
 	svm->nested.last_vmcb12_gpa = INVALID_GPA;
 
+	t = svm->nested.l2_physical_id_table;
+	if (t) {
+		avic_physid_shadow_table_put(vcpu->kvm, t);
+		svm->nested.l2_physical_id_table = NULL;
+	}
+
+	kvm_vcpu_unmap(vcpu, &svm->nested.l2_apic_access_page, true);
+	kvm_vcpu_unmap(vcpu, &svm->nested.l2_logical_id_table, true);
+
 	svm->nested.initialized = false;
 }
 
@@ -1116,6 +1214,20 @@ static int nested_svm_intercept(struct vcpu_svm *svm)
 		vmexit = NESTED_EXIT_DONE;
 		break;
 	}
+	case SVM_EXIT_AVIC_UNACCELERATED_ACCESS: {
+		/*
+		 * Unaccelerated AVIC access is always reflected
+		 * and there is no intercept bit for it
+		 */
+		vmexit = NESTED_EXIT_DONE;
+		break;
+	}
+	case SVM_EXIT_AVIC_INCOMPLETE_IPI:
+		/*
+		 * Doesn't have an intercept bit, host needs to intercept
+		 * and in some cases reflect to the guest
+		 */
+		break;
 	default: {
 		if (vmcb12_is_intercept(&svm->nested.ctl, exit_code))
 			vmexit = NESTED_EXIT_DONE;
@@ -1332,6 +1444,13 @@ static void nested_copy_vmcb_cache_to_control(struct vmcb_control_area *dst,
 	dst->pause_filter_count   = from->pause_filter_count;
 	dst->pause_filter_thresh  = from->pause_filter_thresh;
 	/* 'clean' and 'reserved_sw' are not changed by KVM */
+
+	if (from->int_ctl & AVIC_ENABLE_MASK) {
+		dst->avic_vapic_bar      = from->avic_vapic_bar;
+		dst->avic_backing_page   = from->avic_backing_page;
+		dst->avic_logical_id     = from->avic_logical_id;
+		dst->avic_physical_id    = from->avic_physical_id;
+	}
 }
 
 static int svm_get_nested_state(struct kvm_vcpu *vcpu,
@@ -1553,7 +1672,7 @@ static bool svm_get_nested_state_pages(struct kvm_vcpu *vcpu)
 		if (CC(!load_pdptrs(vcpu, vcpu->arch.cr3)))
 			return false;
 
-	if (!nested_svm_vmrun_msrpm(svm)) {
+	if (!nested_svm_vmrun_msrpm(svm) || !nested_vmcb02_prepare_avic(svm)) {
 		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		vcpu->run->internal.suberror =
 			KVM_INTERNAL_ERROR_EMULATION;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 08ccf0db91f72..0d6b715375a69 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1228,6 +1228,8 @@ static int svm_vcpu_create(struct kvm_vcpu *vcpu)
 
 	svm->guest_state_loaded = false;
 
+	INIT_LIST_HEAD(&svm->nested.physid_ref_entries);
+
 	return 0;
 
 error_free_vmsa_page:
@@ -1317,15 +1319,29 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		sd->current_vmcb = svm->vmcb;
 		indirect_branch_prediction_barrier();
 	}
+
+	svm->loaded = true;
+
 	if (kvm_vcpu_apicv_active(vcpu))
 		avic_vcpu_load(vcpu, cpu);
+
+	if (svm->nested.initialized && svm->avic_enabled)
+		avic_physid_shadow_table_update_vcpu_location(vcpu, cpu);
 }
 
 static void svm_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	struct vcpu_svm *svm = to_svm(vcpu);
+
 	if (kvm_vcpu_apicv_active(vcpu))
 		avic_vcpu_put(vcpu);
 
+
+	svm->loaded = false;
+
+	if (svm->nested.initialized && svm->avic_enabled)
+		avic_physid_shadow_table_update_vcpu_location(vcpu, -1);
+
 	svm_prepare_host_switch(vcpu);
 
 	++vcpu->stat.host_state_reload;
@@ -2705,6 +2721,8 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 	u32 ecx = msr->index;
 	u64 data = msr->data;
 	switch (ecx) {
+	case MSR_AMD64_SVM_AVIC_DOORBELL:
+		return avic_emulate_doorbell_write(vcpu, data);
 	case MSR_AMD64_TSC_RATIO:
 		if (!msr->host_initiated && !svm->tsc_scaling_enabled)
 			return 1;
@@ -3972,6 +3990,9 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 			kvm_request_apicv_update(vcpu->kvm, false,
 						 APICV_INHIBIT_REASON_X2APIC);
 	}
+
+	svm->avic_enabled = enable_apicv && guest_cpuid_has(vcpu, X86_FEATURE_AVIC);
+
 	init_vmcb_after_set_cpuid(vcpu);
 }
 
@@ -4581,6 +4602,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.enable_nmi_window = svm_enable_nmi_window,
 	.enable_irq_window = svm_enable_irq_window,
 	.update_cr8_intercept = svm_update_cr8_intercept,
+	.reload_apic_pages = avic_reload_apic_pages,
 	.refresh_apicv_exec_ctrl = avic_refresh_apicv_exec_ctrl,
 	.check_apicv_inhibit_reasons = avic_check_apicv_inhibit_reasons,
 	.apicv_post_state_restore = avic_apicv_post_state_restore,
@@ -4696,6 +4718,9 @@ static __init void svm_set_cpu_caps(void)
 		if (tsc_scaling)
 			kvm_cpu_cap_set(X86_FEATURE_TSCRATEMSR);
 
+		if (enable_apicv)
+			kvm_cpu_cap_set(X86_FEATURE_AVIC);
+
 		/* Nested VM can receive #VMEXIT instead of triggering #GP */
 		kvm_cpu_cap_set(X86_FEATURE_SVME_ADDR_CHK);
 	}
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 469d9fc6e5f15..8ebda12995abe 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -18,6 +18,7 @@
 #include <linux/kvm_types.h>
 #include <linux/kvm_host.h>
 #include <linux/bits.h>
+#include <linux/hash.h>
 
 #include <asm/svm.h>
 #include <asm/sev-common.h>
@@ -86,13 +87,34 @@ struct kvm_sev_info {
 };
 
 
+#define AVIC_PHYSID_HASH_SHIFT 8
+#define AVIC_PHYSID_HASH_SIZE (1 << AVIC_PHYSID_HASH_SHIFT)
+
 struct kvm_svm_avic {
 	u32 vm_id;
 	struct page *logical_id_table_page;
 	struct page *physical_id_table_page;
 	struct hlist_node hnode;
+
+	raw_spinlock_t table_entries_lock;
+	struct mutex tables_lock;
+
+	/* List of all shadow tables */
+	struct list_head physid_tables;
+
+	/* GPA hash table to find a shadow table via its GPA */
+	struct hlist_head physid_gpa_hash[AVIC_PHYSID_HASH_SIZE];
+
+	struct kvm_page_track_notifier_node write_tracker;
 };
 
+
+static __always_inline unsigned int avic_physid_hash(gfn_t gfn)
+{
+	return hash_64(gfn, AVIC_PHYSID_HASH_SHIFT);
+}
+
+
 struct kvm_svm {
 	struct kvm kvm;
 	struct kvm_svm_avic avic;
@@ -142,6 +164,45 @@ struct vmcb_ctrl_area_cached {
 	u64 virt_ext;
 	u32 clean;
 	u8 reserved_sw[32];
+
+	u64 avic_vapic_bar;
+	u64 avic_backing_page;
+	u64 avic_logical_id;
+	u64 avic_physical_id;
+};
+
+struct avic_physid_entry_descr {
+	struct list_head link;
+
+	/* cached value of guest entry */
+	u64  gentry;
+
+	/* shadow table entry pointer*/
+	u64 *sentry;
+};
+
+struct avic_physid_table {
+	/* List of all tables member */
+	struct list_head link;
+
+	/* GPA hash of all tables member */
+	struct hlist_node hash_link;
+
+	/* GPA of the table in guest memory*/
+	gfn_t gfn;
+
+	/* Number of entries that we shadow and which are valid*/
+	int nentries;
+	DECLARE_BITMAP(valid_entires, AVIC_MAX_PHYSICAL_ID_COUNT);
+
+	struct avic_physid_entry_descr entries[AVIC_MAX_PHYSICAL_ID_COUNT];
+
+	/* Guest visible shadow table */
+	struct page *shadow_table;
+	hpa_t shadow_table_hpa;
+
+	/* Number of vCPUs which are in nested mode and use this table  */
+	int refcount;
 };
 
 struct svm_nested_state {
@@ -177,6 +238,13 @@ struct svm_nested_state {
 	 * on its side.
 	 */
 	bool force_msr_bitmap_recalc;
+
+	/* All AVIC shadow PID table entry descriptors that refernce this vCPU */
+	struct list_head physid_ref_entries;
+
+	struct kvm_host_map l2_apic_access_page;
+	struct kvm_host_map l2_logical_id_table;
+	struct avic_physid_table *l2_physical_id_table;
 };
 
 struct vcpu_sev_es_state {
@@ -234,11 +302,13 @@ struct vcpu_svm {
 	/* cached guest cpuid flags for faster access */
 	bool nrips_enabled                : 1;
 	bool tsc_scaling_enabled          : 1;
+	bool avic_enabled                 : 1;
 
 	u32 ldr_reg;
 	u32 dfr_reg;
 	struct page *avic_backing_page;
 	u64 *avic_physical_id_cache;
+	bool loaded;
 
 	/*
 	 * Per-vcpu list of struct amd_svm_iommu_ir:
@@ -598,6 +668,69 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu);
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
 void avic_ring_doorbell(struct kvm_vcpu *vcpu);
 bool avic_has_vcpu_inhibit_condition(struct kvm_vcpu *vcpu);
+int avic_emulate_doorbell_write(struct kvm_vcpu *vcpu, u64 data);
+void avic_reload_apic_pages(struct kvm_vcpu *vcpu);
+
+struct avic_physid_table *
+avic_physid_shadow_table_get(struct kvm_vcpu *vcpu, gfn_t gfn);
+void avic_physid_shadow_table_put(struct kvm *kvm, struct avic_physid_table *t);
+
+void avic_physid_shadow_table_update_vcpu_location(struct kvm_vcpu *vcpu,
+						   int cpu);
+
+static inline bool avic_nested_active(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *vcpu_svm = to_svm(vcpu);
+
+	if (!vcpu_svm->avic_enabled)
+		return false;
+
+	if (!nested_npt_enabled(vcpu_svm))
+		return false;
+
+	return vcpu_svm->nested.ctl.int_ctl & AVIC_ENABLE_MASK;
+}
+
+#define INVALID_BACKING_PAGE	(~(u64)0)
+
+static inline u64 physid_entry_get_backing_table(u64 entry)
+{
+	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_VALID_MASK))
+		return INVALID_BACKING_PAGE;
+	return entry & AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK;
+}
+
+static inline int physid_entry_get_apicid(u64 entry)
+{
+	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_VALID_MASK))
+		return -1;
+	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
+		return -1;
+
+	return entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+}
+
+static inline int logid_get_physid(u64 entry)
+{
+	if (!(entry & AVIC_LOGICAL_ID_ENTRY_VALID_BIT))
+		return -1;
+	return entry & AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK;
+}
+
+static inline void physid_entry_set_backing_table(u64 *entry, u64 value)
+{
+	*entry |= (AVIC_PHYSICAL_ID_ENTRY_VALID_MASK | value);
+}
+
+static inline void physid_entry_set_apicid(u64 *entry, int value)
+{
+	WARN_ON(!(*entry & AVIC_PHYSICAL_ID_ENTRY_VALID_MASK));
+
+	if (value == -1)
+		*entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+	else
+		*entry |= (AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK | value);
+}
 
 /* sev.c */
 
diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
index 193f5ba930d12..3d1e6e948461b 100644
--- a/arch/x86/kvm/trace.h
+++ b/arch/x86/kvm/trace.h
@@ -1383,7 +1383,7 @@ TRACE_EVENT(kvm_apicv_accept_irq,
 );
 
 /*
- * Tracepoint for AMD AVIC
+ * Tracepoints for AMD AVIC
  */
 TRACE_EVENT(kvm_avic_incomplete_ipi,
 	    TP_PROTO(u32 vcpu, u32 icrh, u32 icrl, u32 id, u32 index),
@@ -1457,6 +1457,168 @@ TRACE_EVENT(kvm_avic_ga_log,
 		  __entry->vmid, __entry->vcpuid)
 );
 
+TRACE_EVENT(kvm_avic_update_shadow_entry,
+	    TP_PROTO(u64 gpa, u64 hpa, u64 old_entry, u64 new_entry),
+	    TP_ARGS(gpa, hpa, old_entry, new_entry),
+
+	TP_STRUCT__entry(
+		__field(u64, gpa)
+		__field(u64, hpa)
+		__field(u64, old_entry)
+		__field(u64, new_entry)
+	),
+
+	TP_fast_assign(
+		__entry->gpa = gpa;
+		__entry->hpa = hpa;
+		__entry->old_entry = old_entry;
+		__entry->new_entry = new_entry;
+	),
+
+	TP_printk("gpa 0x%llx hpa 0x%llx entry 0x%llx -> 0x%llx",
+		  __entry->gpa, __entry->hpa, __entry->old_entry, __entry->new_entry)
+);
+
+TRACE_EVENT(kvm_avic_update_physid_table,
+	    TP_PROTO(u64 gpa, int nentries, int new_nentires),
+	    TP_ARGS(gpa, nentries, new_nentires),
+
+	TP_STRUCT__entry(
+		__field(u64, gpa)
+		__field(int, nentries)
+		__field(int, new_nentires)
+	),
+
+	TP_fast_assign(
+		__entry->gpa = gpa;
+		__entry->nentries = nentries;
+		__entry->new_nentires = new_nentires;
+	),
+
+	TP_printk("table at gpa 0x%llx, nentires %d -> %d",
+		  __entry->gpa, __entry->nentries, __entry->new_nentires)
+);
+
+TRACE_EVENT(kvm_avic_physid_shadow_table_reload,
+	    TP_PROTO(u64 gpa),
+	    TP_ARGS(gpa),
+
+	TP_STRUCT__entry(
+		__field(u64, gpa)
+	),
+
+	TP_fast_assign(
+		__entry->gpa = gpa;
+	),
+
+	TP_printk("gpa 0x%llx",
+		  __entry->gpa)
+);
+
+TRACE_EVENT(kvm_avic_physid_shadow_table_write,
+	    TP_PROTO(u64 gpa, int bytes),
+	    TP_ARGS(gpa, bytes),
+
+	TP_STRUCT__entry(
+		__field(u64, gpa)
+		__field(int, bytes)
+	),
+
+	TP_fast_assign(
+		__entry->gpa = gpa;
+		__entry->bytes = bytes;
+	),
+
+	TP_printk("gpa 0x%llx, write of %d bytes",
+		  __entry->gpa, __entry->bytes)
+);
+
+TRACE_EVENT(kvm_avic_physid_update_vcpu,
+	    TP_PROTO(int vcpu_id, int cpu_id, int n),
+	    TP_ARGS(vcpu_id, cpu_id, n),
+
+	TP_STRUCT__entry(
+		__field(int, vcpu_id)
+		__field(int, cpu_id)
+		__field(int, n)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id = vcpu_id;
+		__entry->cpu_id = cpu_id;
+		__entry->n = n;
+	),
+
+	TP_printk("vcpu %d cpu %d (%d entries)",
+		  __entry->vcpu_id, __entry->cpu_id, __entry->n)
+);
+
+TRACE_EVENT(kvm_avic_nested_emulate_doorbell,
+	    TP_PROTO(int source_l1_apicid, int target_l1_apicid, bool target_nested,
+			    bool target_running),
+	    TP_ARGS(source_l1_apicid, target_l1_apicid, target_nested,
+			    target_running),
+
+	TP_STRUCT__entry(
+		__field(int, source_l1_apicid)
+		__field(int, target_l1_apicid)
+		__field(bool, target_nested)
+		__field(bool, target_running)
+	),
+
+	TP_fast_assign(
+		__entry->source_l1_apicid = source_l1_apicid;
+		__entry->target_l1_apicid = target_l1_apicid;
+		__entry->target_nested = target_nested;
+		__entry->target_running = target_running;
+	),
+
+	TP_printk("source %d target %d (nested: %d, running %d)",
+		  __entry->source_l1_apicid, __entry->target_l1_apicid,
+		  __entry->target_nested, __entry->target_running)
+);
+
+TRACE_EVENT(kvm_avic_nested_kick_target_vcpu,
+	    TP_PROTO(int source_l1_apic_id, int target_l2_apic_id, int target_l1_apic_id),
+	    TP_ARGS(source_l1_apic_id, target_l2_apic_id, target_l1_apic_id),
+
+	TP_STRUCT__entry(
+		__field(int, source_l1_apic_id)
+		__field(int, target_l2_apic_id)
+		__field(int, target_l1_apic_id)
+	),
+
+	TP_fast_assign(
+		__entry->source_l1_apic_id = source_l1_apic_id;
+		__entry->target_l2_apic_id = target_l2_apic_id;
+		__entry->target_l1_apic_id = target_l1_apic_id;
+	),
+
+	TP_printk("source l1 apic id: %d target l2 apic id: %d target l1 apic_id: %d",
+		  __entry->source_l1_apic_id, __entry->target_l2_apic_id,
+		  __entry->target_l1_apic_id)
+);
+
+TRACE_EVENT(kvm_avic_nested_kick_target_vcpus,
+	    TP_PROTO(int source_l1_apic_id, u32 icrl, u32 icrh),
+	    TP_ARGS(source_l1_apic_id, icrl, icrh),
+
+	TP_STRUCT__entry(
+		__field(int, source_l1_apic_id)
+		__field(u32, icrl)
+		__field(u32, icrh)
+	),
+
+	TP_fast_assign(
+		__entry->source_l1_apic_id = source_l1_apic_id;
+		__entry->icrl = icrl;
+		__entry->icrh = icrh;
+	),
+
+	TP_printk("source %d icrl 0x%x icrh 0x%x",
+		  __entry->source_l1_apic_id, __entry->icrl, __entry->icrh)
+);
+
 TRACE_EVENT(kvm_hv_timer_state,
 		TP_PROTO(unsigned int vcpu_id, unsigned int hv_timer_in_use),
 		TP_ARGS(vcpu_id, hv_timer_in_use),
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1a6cfc27c3b35..48a1916bc71c7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12909,6 +12909,16 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_pi_irte_update);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_unaccelerated_access);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_incomplete_ipi);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_ga_log);
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_update_shadow_entry);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_update_physid_table);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_physid_shadow_table_reload);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_physid_shadow_table_write);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_physid_update_vcpu);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_nested_emulate_doorbell);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_nested_kick_target_vcpu);
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_avic_nested_kick_target_vcpus);
+
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_apicv_update_request);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_apicv_accept_irq);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_vmgexit_enter);
-- 
2.26.3

