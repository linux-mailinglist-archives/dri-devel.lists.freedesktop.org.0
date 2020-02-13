Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4315CD4B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BFE6F87C;
	Thu, 13 Feb 2020 21:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7F6F882
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:30:49 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id j17so2983156pjz.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0Qk0TKZRTg/mLnbV7CXwa6mF9/yA20wbSwGRZs+mxc=;
 b=i9fHxcvIxRp3lVOHLfQH4rR4UhTLEFc6bVpa9CoCBTAihjGmfk+b19JWOCgs1J9jY/
 gtncrN3EmtmiVdyQUu6ppCd3CLF1Gbt4fm+Mb0UiSEjvMXuaXZIVxWvYvzIZelMN7veS
 in51Dm4g+9MPeTTZvfrz7BQ5GWExlW7PBVXy+pjIZW28SluaO/mK0G5Sw1Zu1spk/gI2
 Yzm5My7i4czV+QZJkPTbTsZWw6/gyAXenTj7R1tQRYaMLusonHiIpJycp9cFe+DEAMXF
 HcQHGHXiVr2H/KiHv5Jalu4+qfJNxHdata6nRtOJ4E29Ko+Ar9QWuvb1qzsgCmLIvNYv
 oQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0Qk0TKZRTg/mLnbV7CXwa6mF9/yA20wbSwGRZs+mxc=;
 b=DU9/Jz76Gd4G8h6qNt+oHKo98995mxFhi3nFVU3cI85Ucr5HuW0tNGJ/cikIJYBMd2
 xvW67+cqE6jJz3Uyk92s1dGlVjw1cHjCdlkgeUVQ8dCygrUJ7th628sB7cdxnfHngirl
 C2a8OCj6nIXnZ1mMfdbEhKcHTpQ76ewp1xeJl40ZQRl4rg2uKsf0mVUfZrOlIki333RD
 73YXwhFYkCTuniNxq8E+oBr7tmnPItOuAgsQZwWEWoz573GboGggb1pRj2w3FbPZOAzi
 eA4hx98DmaJmvp34YR120UGJQPlyEEqnG2EsogKKCfg4jCPT9eO7xso5I9voikGXJejB
 qn3w==
X-Gm-Message-State: APjAAAW/mN8E2iDj7kthXwV2yVoanZNq5d8eK4LNOQfOoaa8z7+AxJQb
 IS1NX9pomwy5vDOiHTWaAQg=
X-Google-Smtp-Source: APXvYqxP0Vd2xQ+l4UJVv5u++WttsTxvF1HxO1K3cWRSywOF3Cea0zyMRd9RzdsOYypYZd4UyQ5eTg==
X-Received: by 2002:a17:90a:ca12:: with SMTP id
 x18mr7332600pjt.66.1581629448915; 
 Thu, 13 Feb 2020 13:30:48 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id s130sm4346683pfc.62.2020.02.13.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:30:48 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH 2/3] RFC: KVM: add KVM_MEM_DMA
Date: Thu, 13 Feb 2020 13:30:35 -0800
Message-Id: <20200213213036.207625-3-olvaffe@gmail.com>
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

When the flag is set, it means the the userspace wants to do DMA
with the memory and the guest will use an appropriate memory type to
access the memory.  The kernel should be prepared to honor the
guest's memory type.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 Documentation/virt/kvm/api.rst | 17 +++++++++++------
 include/uapi/linux/kvm.h       |  2 ++
 virt/kvm/kvm_main.c            |  6 +++++-
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 97a72a53fa4b..e6a27e6e45c2 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1237,6 +1237,7 @@ yet and must be cleared on entry.
   /* for kvm_memory_region::flags */
   #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
   #define KVM_MEM_READONLY	(1UL << 1)
+  #define KVM_MEM_DMA		(1UL << 2)
 
 This ioctl allows the user to create, modify or delete a guest physical
 memory slot.  Bits 0-15 of "slot" specify the slot id and this value
@@ -1264,12 +1265,16 @@ It is recommended that the lower 21 bits of guest_phys_addr and userspace_addr
 be identical.  This allows large pages in the guest to be backed by large
 pages in the host.
 
-The flags field supports two flags: KVM_MEM_LOG_DIRTY_PAGES and
-KVM_MEM_READONLY.  The former can be set to instruct KVM to keep track of
-writes to memory within the slot.  See KVM_GET_DIRTY_LOG ioctl to know how to
-use it.  The latter can be set, if KVM_CAP_READONLY_MEM capability allows it,
-to make a new slot read-only.  In this case, writes to this memory will be
-posted to userspace as KVM_EXIT_MMIO exits.
+The flags field supports these flags: KVM_MEM_LOG_DIRTY_PAGES,
+KVM_MEM_READONLY, and KVM_MEM_DMA.  KVM_MEM_LOG_DIRTY_PAGES can be set to
+instruct KVM to keep track of writes to memory within the slot.  See
+KVM_GET_DIRTY_LOG ioctl to know how to use it.  KVM_MEM_READONLY can be set,
+if KVM_CAP_READONLY_MEM capability allows it, to make a new slot read-only.
+In this case, writes to this memory will be posted to userspace as
+KVM_EXIT_MMIO exits.  KVM_MEM_DMA can be set, if KVM_CAP_DMA_MEM capability
+allows it, to make a new slot support DMA.  It is the userspace's
+responsibility to make sure userspace_addr points at a DMA-able memory and the
+guest's responsibility to map guest_phys_addr with the proper memory type.
 
 When the KVM_CAP_SYNC_MMU capability is available, changes in the backing of
 the memory region are automatically reflected into the guest.  For example, an
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 4b95f9a31a2f..578292e4b072 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -109,6 +109,7 @@ struct kvm_userspace_memory_region {
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
+#define KVM_MEM_DMA		(1UL << 2)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
@@ -1010,6 +1011,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_NISV_TO_USER 177
 #define KVM_CAP_ARM_INJECT_EXT_DABT 178
 #define KVM_CAP_S390_VCPU_RESETS 179
+#define KVM_CAP_DMA_MEM 180
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70f03ce0e5c1..a4b6c782a168 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -940,6 +940,9 @@ static int check_memory_region_flags(const struct kvm_userspace_memory_region *m
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
+#ifdef __KVM_HAVE_DMA_MEM
+	valid_flags |= KVM_MEM_DMA;
+#endif
 
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
@@ -1047,7 +1050,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		else { /* Modify an existing slot. */
 			if ((mem->userspace_addr != old.userspace_addr) ||
 			    (npages != old.npages) ||
-			    ((new.flags ^ old.flags) & KVM_MEM_READONLY))
+			    ((new.flags ^ old.flags) &
+			     (KVM_MEM_READONLY | KVM_MEM_DMA)))
 				goto out;
 
 			if (base_gfn != old.base_gfn)
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
