Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF94AC37B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DCC10F21D;
	Mon,  7 Feb 2022 15:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1997112456
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uKkJYp30pF3ErxkQlRiirr2VHEvcBthwFChel8Mbe4=;
 b=RJojYyB1ZqueEeszdYeyqcnRQnZT++waVBKz2M5bmslZy/O/0vlORg/ArwuTA1WiDSYSVd
 3P9YWgpknNU2ZsfRkU2oGtRohl0/1zg9YXF78XzUAvQUG6ylx5+cG+ftk3cz6bMBwmYSVH
 MeFTTpuonGGWR0BCf6d1VEtILwLqKjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-oNiW8xocPHS43XMSda0FrA-1; Mon, 07 Feb 2022 10:31:27 -0500
X-MC-Unique: oNiW8xocPHS43XMSda0FrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DDCF18B9EC3;
 Mon,  7 Feb 2022 15:31:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0398584A2C;
 Mon,  7 Feb 2022 15:31:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 11/30] KVM: x86: SVM: use vmcb01 in avic_init_vmcb
Date: Mon,  7 Feb 2022 17:28:28 +0200
Message-Id: <20220207152847.836777-12-mlevitsk@redhat.com>
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
 Thomas Gleixner <tglx@linutronix.de>" <intel-gfx@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Out of precation use vmcb01 when enabling host AVIC.

No functional change intended.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 4c2d622b3b9f0..c6072245f7fbb 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -167,7 +167,7 @@ int avic_vm_init(struct kvm *kvm)
 
 void avic_init_vmcb(struct vcpu_svm *svm)
 {
-	struct vmcb *vmcb = svm->vmcb;
+	struct vmcb *vmcb = svm->vmcb01.ptr;
 	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
 	phys_addr_t bpa = __sme_set(page_to_phys(svm->avic_backing_page));
 	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic_logical_id_table_page));
-- 
2.26.3

