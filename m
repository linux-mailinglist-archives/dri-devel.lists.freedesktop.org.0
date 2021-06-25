Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEA3B3D84
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46AA6ECE1;
	Fri, 25 Jun 2021 07:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACD36ECE1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 07:37:24 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id l11so4958016pji.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzgP6h2D/QFeac1VzX61noEzAJ/USmwi4gQaHInAahw=;
 b=LXB8g40vStNBwD+4feBv7G1sswWg7tKXE2UuAUSDoyq52hfi4irDQ/yiXu8Ug+ZDws
 xIzft/b25MjWvtHFPnJ6SklO93ihyo0nBxWHm/9AZX/s3potEvqVSuo/FGmincAfc25Y
 X1yk5o0729qjIfPuIaA+V96KO60J3W+vXFDLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzgP6h2D/QFeac1VzX61noEzAJ/USmwi4gQaHInAahw=;
 b=Mldc/MlDNu15k8xU1m/GqYyM4dFsEKPAnh8ZfjzoV9srPCEw6K5dh0cwLXCEULthHo
 fcl2p1B42O+buQ33kK6alKdEfmKjrabVji8jVz8FGIJ99jhgVH7VM79J5ytm1NHudA4s
 NK6k00m3Jr+lQI9SI35eWrujw9bz5MRCArlLZpxsAwDh0sRRCVNLGGUjYshcQMHmGa9e
 wMFcqJ85zixiCjWCnrLtCrsuGE0gq0+U4Hdvcc01bHKPK0a+OjBOJzlyNTv7oO/SdgR2
 dgOPTpJL7Xpk40MGTOhGahsBDBz25WWiDsUyeAFn9Avmb7wlJMimkfOwltqEI56DavoC
 +gWw==
X-Gm-Message-State: AOAM533vstzN0FdKQpVvUb7mnrBDrtsDoDbHIrHeDLJORL9/QbvSmH6l
 WBV30bbWBwVQBkmBKuywIFQSTA==
X-Google-Smtp-Source: ABdhPJzquQUc1a7oAEf0YGdzW5/tdcjfbVYUNDDWR+jVqhrRl2C1S/KaYW68U6E8tZbflFTo+iOEfA==
X-Received: by 2002:a17:902:e843:b029:109:4dbc:d4ed with SMTP id
 t3-20020a170902e843b02901094dbcd4edmr7948926plg.74.1624606643957; 
 Fri, 25 Jun 2021 00:37:23 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
 by smtp.gmail.com with UTF8SMTPSA id r4sm4766830pja.41.2021.06.25.00.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:37:23 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Nick Piggin <npiggin@gmail.com>
Subject: [PATCH v2 1/5] KVM: do not allow mapping valid but non-refcounted
 pages
Date: Fri, 25 Jun 2021 16:36:12 +0900
Message-Id: <20210625073616.2184426-2-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210625073616.2184426-1-stevensd@google.com>
References: <20210625073616.2184426-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm-ppc@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 Zhi Wang <zhi.a.wang@intel.com>, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Piggin <npiggin@gmail.com>

It's possible to create a region which maps valid but non-refcounted
pages (e.g., tail pages of non-compound higher order allocations). These
host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
of APIs, which take a reference to the page, which takes it from 0 to 1.
When the reference is dropped, this will free the page incorrectly.

Fix this by only taking a reference on the page if it was non-zero,
which indicates it is participating in normal refcounting (and can be
released with put_page).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 virt/kvm/kvm_main.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3dcc2abbfc60..f7445c3bcd90 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2175,6 +2175,13 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
+static int kvm_try_get_pfn(kvm_pfn_t pfn)
+{
+	if (kvm_is_reserved_pfn(pfn))
+		return 1;
+	return get_page_unless_zero(pfn_to_page(pfn));
+}
+
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       unsigned long addr, bool *async,
 			       bool write_fault, bool *writable,
@@ -2224,13 +2231,21 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	 * Whoever called remap_pfn_range is also going to call e.g.
 	 * unmap_mapping_range before the underlying pages are freed,
 	 * causing a call to our MMU notifier.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages, but be allocated without refcounting e.g.,
+	 * tail pages of non-compound higher order allocations, which
+	 * would then underflow the refcount when the caller does the
+	 * required put_page. Don't allow those pages here.
 	 */ 
-	kvm_get_pfn(pfn);
+	if (!kvm_try_get_pfn(pfn))
+		r = -EFAULT;
 
 out:
 	pte_unmap_unlock(ptep, ptl);
 	*p_pfn = pfn;
-	return 0;
+
+	return r;
 }
 
 /*
-- 
2.32.0.93.g670b81a890-goog

