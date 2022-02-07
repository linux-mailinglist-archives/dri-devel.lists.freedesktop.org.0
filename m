Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9BC4AC34D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37D510E87A;
	Mon,  7 Feb 2022 15:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD7910E6B8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWkaPZigKR8ZVYYpYKUmXEITXI5Ito7CWFDFszKolT0=;
 b=OossA3NuOzdxv0fIgilC/NcvtzLoNQ824eOm3PtDbj9IpVSeSA6uvd0mUGIS+AhJ55SBaC
 VS1c8FvWbErVUEoUTLQFD/DmVa8N/s7cEST+f3BZJGm+h7gkbct6amvQ6qCYzSBDSc8akZ
 a+NUd0RPpENh+ecapiiPu5l1Em9INQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-X643oSf_OgSyyqZjBs80qQ-1; Mon, 07 Feb 2022 10:29:18 -0500
X-MC-Unique: X643oSf_OgSyyqZjBs80qQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 931A61091DA0;
 Mon,  7 Feb 2022 15:29:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCEA384A2C;
 Mon,  7 Feb 2022 15:29:07 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 02/30] KVM: x86: nSVM: fix potential NULL derefernce on nested
 migration
Date: Mon,  7 Feb 2022 17:28:19 +0200
Message-Id: <20220207152847.836777-3-mlevitsk@redhat.com>
In-Reply-To: <20220207152847.836777-1-mlevitsk@redhat.com>
References: <20220207152847.836777-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 "Chang S. Bae" <chang.seok.bae@intel.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 "open list:X86 ARCHITECTURE 32-BIT AND 64-BIT" <linux-kernel@vger.kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Tony Luck <tony.luck@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>,
 "open list:INTEL GVT-g DRIVERS Intel GPU Virtualization"
 <intel-gvt-dev@lists.freedesktop.org>,
 "open list:INTEL DRM DRIVERS excluding Poulsbo, Moorestow..., 
 Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
 Daniel Vetter <daniel@ffwll.ch>, \"H. Peter Anvin\" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 stable@vger.kernel.org" <intel-gfx@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turns out that due to review feedback and/or rebases
I accidentally moved the call to nested_svm_load_cr3 to be too early,
before the NPT is enabled, which is very wrong to do.

KVM can't even access guest memory at that point as nested NPT
is needed for that, and of course it won't initialize the walk_mmu,
which is main issue the patch was addressing.

Fix this for real.

Fixes: 232f75d3b4b5 ("KVM: nSVM: call nested_svm_load_cr3 on nested state load")
Cc: stable@vger.kernel.org

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1218b5a342fc8..39d280e7e80ef 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1457,18 +1457,6 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	    !__nested_vmcb_check_save(vcpu, &save_cached))
 		goto out_free;
 
-	/*
-	 * While the nested guest CR3 is already checked and set by
-	 * KVM_SET_SREGS, it was set when nested state was yet loaded,
-	 * thus MMU might not be initialized correctly.
-	 * Set it again to fix this.
-	 */
-
-	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
-				  nested_npt_enabled(svm), false);
-	if (WARN_ON_ONCE(ret))
-		goto out_free;
-
 
 	/*
 	 * All checks done, we can enter guest mode. Userspace provides
@@ -1494,6 +1482,20 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
 	nested_vmcb02_prepare_control(svm);
+
+	/*
+	 * While the nested guest CR3 is already checked and set by
+	 * KVM_SET_SREGS, it was set when nested state was yet loaded,
+	 * thus MMU might not be initialized correctly.
+	 * Set it again to fix this.
+	 */
+
+	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
+				  nested_npt_enabled(svm), false);
+	if (WARN_ON_ONCE(ret))
+		goto out_free;
+
+
 	kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 	ret = 0;
 out_free:
-- 
2.26.3

