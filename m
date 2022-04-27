Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D551236D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDC410E4AA;
	Wed, 27 Apr 2022 20:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E504810E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89RuVlFWNENo513LfTx1J681fautsCwvIr9MnyyPgbQ=;
 b=OVXMqeJxiX/AL37/H2WLnWWD/EnO+HFQ1PbKmvmOiaeFEBUpO12VTkKp3N2XiHEQDbm1xh
 UGJSnEgqXLEiUTbi0w5BjY/zE+OP/DOwvEq3aU+WT3ojnCJr1fwidVG5s1qBja4G2laYAY
 fVb0OQ2gF62iRhjvYQ5EeEMGSZQgrI4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-UNDZGWhRO4GsZn6rKZitjg-1; Wed, 27 Apr 2022 16:04:31 -0400
X-MC-Unique: UNDZGWhRO4GsZn6rKZitjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E063802809;
 Wed, 27 Apr 2022 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AB0D9E89;
 Wed, 27 Apr 2022 20:04:23 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 10/19] KVM: x86: nSVM: implement AVIC's physid/logid
 table access helpers
Date: Wed, 27 Apr 2022 23:03:05 +0300
Message-Id: <20220427200314.276673-11-mlevitsk@redhat.com>
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

This implements a few helpers that help manipulate the AVIC's
physical and logical id table entries.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/svm.h | 45 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 6fcb164a6ee4a..dfca4c06e2071 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -628,6 +628,51 @@ void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
 void avic_ring_doorbell(struct kvm_vcpu *vcpu);
 unsigned long avic_vcpu_get_apicv_inhibit_reasons(struct kvm_vcpu *vcpu);
 
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
+	*entry &= ~AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK;
+	*entry |= (AVIC_PHYSICAL_ID_ENTRY_VALID_MASK | value);
+}
+
+static inline void physid_entry_set_apicid(u64 *entry, int value)
+{
+	WARN_ON(!(*entry & AVIC_PHYSICAL_ID_ENTRY_VALID_MASK));
+
+	*entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+
+	if (value == -1)
+		*entry &= ~(AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
+	else
+		*entry |= (AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK | value);
+}
+
+
 /* sev.c */
 
 #define GHCB_VERSION_MAX	1ULL
-- 
2.26.3

