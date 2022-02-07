Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635F4AC388
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090B210EC6D;
	Mon,  7 Feb 2022 15:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C5810EC6D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIz72i323mNLi2DkTwdrDXZhWqpT5EG0EiEDO8eaza0=;
 b=YVAMnAG4Zi2k5dW0r52A1CkxDOajbXaa8p/ZpAVPWhT9fZmVMorzVZJHKUH1N1YBXQBc6T
 aflTMZnetUPIC4QSsY5sRCqNrCfvaHcx/WLz2BBKtwbDU2LdtalYseSSKHVcB/UjBPwIOx
 /DpPkDrQvaU8i9H3DfXVihqDCthoCMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-xQCvYTM7OYOhVZ8PDv0x5Q-1; Mon, 07 Feb 2022 10:32:07 -0500
X-MC-Unique: xQCvYTM7OYOhVZ8PDv0x5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BDDF1091DA2;
 Mon,  7 Feb 2022 15:32:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18C485E495;
 Mon,  7 Feb 2022 15:31:55 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 16/30] KVM: x86: SVM: allow to force AVIC to be enabled
Date: Mon,  7 Feb 2022 17:28:33 +0200
Message-Id: <20220207152847.836777-17-mlevitsk@redhat.com>
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

Apparently on some systems AVIC is disabled in CPUID but still usable.

Allow the user to override the CPUID if the user is willing to
take the risk.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/svm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 85035324ed762..b88ca7f07a0fc 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -202,6 +202,9 @@ module_param(tsc_scaling, int, 0444);
 static bool avic;
 module_param(avic, bool, 0444);
 
+static bool force_avic;
+module_param_unsafe(force_avic, bool, 0444);
+
 bool __read_mostly dump_invalid_vmcb;
 module_param(dump_invalid_vmcb, bool, 0644);
 
@@ -4839,10 +4842,14 @@ static __init int svm_hardware_setup(void)
 			nrips = false;
 	}
 
-	enable_apicv = avic = avic && npt_enabled && boot_cpu_has(X86_FEATURE_AVIC);
+	enable_apicv = avic = avic && npt_enabled && (boot_cpu_has(X86_FEATURE_AVIC) || force_avic);
 
 	if (enable_apicv) {
-		pr_info("AVIC enabled\n");
+		if (!boot_cpu_has(X86_FEATURE_AVIC)) {
+			pr_warn("AVIC is not supported in CPUID but force enabled");
+			pr_warn("Your system might crash and burn");
+		} else
+			pr_info("AVIC enabled\n");
 
 		amd_iommu_register_ga_log_notifier(&avic_ga_log_notifier);
 	} else {
-- 
2.26.3

