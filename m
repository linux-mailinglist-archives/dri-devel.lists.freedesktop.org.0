Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B415CD4C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7E6F882;
	Thu, 13 Feb 2020 21:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA80A6F87C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:30:50 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p14so3723037pfn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DG+sC065wv/LqT/1QFpUrBb6eJ4oJu7xTukCQgs4qZI=;
 b=beFPM7qyKZAOPM6XrFUgkxr4sKe18G6WJ44lZKteVhn7xUcVt+5lgnlU5reXySx0py
 mj38GDA8/I/oNdPPwpfGsECeogJ5pkenZ8o3juAkAex8W7aWjitOXAlWG1AVn0xFr5kZ
 a/pp5ZXlwA7K70WSGHoHQ7scvR5dgg8vAqgQEZpxoJp75LPVsA8fxCS79/cZcDll7QJf
 +wBCpLCRvtPKLTq0Z+2yvqBopTDgRkaGbAuoZtVzWhBlBjeDALCakqi7hhftDBVtifya
 Hv+wpjNhn9Gw4mQV7gmpOYF27rlm8tfbzi1QvbbWWJR6C5ItSRNVQ7TiTqFyXr80aSnS
 BfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DG+sC065wv/LqT/1QFpUrBb6eJ4oJu7xTukCQgs4qZI=;
 b=t0icvSLaRNlMIzGYjMFlRPo8C6KEJ0s/uozlGRPWycM98F/InsZRLuaLy/JJiizjJ7
 8wsORMmLc+sserdA0jn5UgBFcpVTYwshEqmHLDQbwgwiFFSghvDcH+kjkkhDd6jt8uiY
 NT5obWJl92+/j9F2geywxP9i57235s6wIxp4XJnZzc8sjosc0viLrxtAnhVXTPFVgU29
 iKrzIchwpfLjFEIX9pdFEisgoqdj+l4526yTHSMSQ8RI7OqWygJcDeCjVIk3iZbtbUfq
 h16H1zn01mHx1JFXY9fIwLzUUA2cm4uOS4gTubejSEVaJjb7nBcia/jf+1TwPY/F2rqr
 nR7A==
X-Gm-Message-State: APjAAAUZQqZADrmt+u7d1C6C9MFU4aE4fFGGQnsioM+wb8JRSPtgnMH3
 A49zyT8Yrvx186aF/D1CWTM=
X-Google-Smtp-Source: APXvYqyC4/eQjrcqgMEtd9bRzFz57SaLWVVcql322CjrzbZzBAKrZ5Uy6k+kTxrjDV6fGdkKFachhQ==
X-Received: by 2002:aa7:84cd:: with SMTP id x13mr19792586pfn.130.1581629450470; 
 Thu, 13 Feb 2020 13:30:50 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id s130sm4346683pfc.62.2020.02.13.13.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:30:50 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH 3/3] RFC: KVM: x86: support KVM_CAP_DMA_MEM
Date: Thu, 13 Feb 2020 13:30:36 -0800
Message-Id: <20200213213036.207625-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200213213036.207625-1-olvaffe@gmail.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
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
Cc: wanpengli@tencent.com, joro@8bytes.org, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com, pbonzini@redhat.com,
 vkuznets@redhat.com, jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a memslot has KVM_MEM_DMA set, we want VMX_EPT_IPAT_BIT cleared
for the memslot.  Before that is possible, simply call
kvm_arch_register_noncoherent_dma for the memslot.

SVM does not have the ignore-pat bit.  Guest PAT is always honored.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/x86/include/uapi/asm/kvm.h | 1 +
 arch/x86/kvm/x86.c              | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 503d3f42da16..578b686e3880 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -48,6 +48,7 @@
 #define __KVM_HAVE_XSAVE
 #define __KVM_HAVE_XCRS
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_DMA_MEM
 
 /* Architectural interrupt line count. */
 #define KVM_NR_INTERRUPTS 256
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fb5d64ebc35d..c89a4647fef6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3331,6 +3331,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_GET_TSC_KHZ:
 	case KVM_CAP_KVMCLOCK_CTRL:
 	case KVM_CAP_READONLY_MEM:
+	case KVM_CAP_DMA_MEM:
 	case KVM_CAP_HYPERV_TIME:
 	case KVM_CAP_IOAPIC_POLARITY_IGNORED:
 	case KVM_CAP_TSC_DEADLINE_TIMER:
@@ -10045,6 +10046,11 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	 */
 	if (change != KVM_MR_DELETE)
 		kvm_mmu_slot_apply_flags(kvm, (struct kvm_memory_slot *) new);
+
+	if (change == KVM_MR_CREATE && new->flags & KVM_MEM_DMA)
+		kvm_arch_register_noncoherent_dma(kvm);
+	else if (change == KVM_MR_DELETE && old->flags & KVM_MEM_DMA)
+		kvm_arch_unregister_noncoherent_dma(kvm);
 }
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
