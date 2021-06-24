Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914E3B3601
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA96EC9F;
	Thu, 24 Jun 2021 18:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92996EABA;
 Thu, 24 Jun 2021 11:42:50 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id p9so4512364pgb.1;
 Thu, 24 Jun 2021 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=UhPwCKz4xBakQQigMlpP/gU41+hzbpM8YRJNgrKv6O4=;
 b=t31VnJiTsxItJNeq7rCSt7OrhubYQjPInGwxS6i1vZcLD09YhtO7gbcC6yO0KhAuXD
 RMNK1+v4V64bLEWRl+uFQJxvO1OFOEUDB1cdjW7SCwjkzIAwx6kCwo+BFaUOwSBFxqwm
 KF14xx23G+PzVLnKBSxDToMDnayKV5w+2zzBDlSLDFjw04AEwsQJB5ALW2r4/++L3OKb
 Y99mu3t2yWWYdgnN6Jbc1YzGJEOeoaeDo24+jGjvAiXYbKelivBMh2/9F1XYtnHZ8Kb0
 gAIR7RWubhD3jnU73jhUW2+khX+sz10qzFL5QCRSUp9UUKI+z+pRuE/7R3jTuKwE1dBy
 waHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=UhPwCKz4xBakQQigMlpP/gU41+hzbpM8YRJNgrKv6O4=;
 b=FezKJUv5OxgZSEZxN8SzAQvfAGaw1Fu0SFGDIf5rxHqf2kSvwan6KzCGBkxM43qsCr
 L4PRh3yX7+EuOJBlQd5i80N+PRDaHFotvxTR+YjPYzhuVFQIGgvaQuOHJC7cd7/RmUE2
 aFSJvmqvE8dMYfYlVHosNvdAUmjD45u2F5Py+2r55UjuJlYbGaLoABXs9nsMUMJLx/xm
 MdTwbNdshPTWs1o0Zj91s3TEvl5eNINUVhcEtzIrBCqjY3b7OqknU6hby+NqRE4upu9r
 m1E2DuVUfNdIPqYEBGDafp4OqFJkcHrM4EyrVToK1K82Gbglt4UKGkIFOuxlxeiDVv5o
 ASUg==
X-Gm-Message-State: AOAM533xVwZnITWsUMSiU9EUHoDzTzS2peClZRw8D0fWIVp/8grS2ipm
 oMIccmkS7U7YrkKrrCfNrTE=
X-Google-Smtp-Source: ABdhPJyUktZmu2l7dyBNUjkdVcrHb1vguGlN8KJEIqyrGuksmppmmrU30UVZa2RBb657vluXrYRKpA==
X-Received: by 2002:a63:2503:: with SMTP id l3mr4358509pgl.237.1624534970415; 
 Thu, 24 Jun 2021 04:42:50 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z18sm2539194pfe.214.2021.06.24.04.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 04:42:50 -0700 (PDT)
Date: Thu, 24 Jun 2021 21:42:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
In-Reply-To: <1624530624.8jff1f4u11.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1624534759.nj0ylor2eh.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Jun 2021 18:47:09 +0000
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Stevens <stevensd@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Morse <james.morse@arm.com>, kvm-ppc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Excerpts from Nicholas Piggin's message of June 24, 2021 8:34 pm:
> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>> KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
>> follow_pte in gfn_to_pfn. However, the resolved pfns may not have
>> assoicated struct pages, so they should not be passed to pfn_to_page.
>> This series removes such calls from the x86 and arm64 secondary MMU. To
>> do this, this series modifies gfn_to_pfn to return a struct page in
>> addition to a pfn, if the hva was resolved by gup. This allows the
>> caller to call put_page only when necessated by gup.
>>=20
>> This series provides a helper function that unwraps the new return type
>> of gfn_to_pfn to provide behavior identical to the old behavior. As I
>> have no hardware to test powerpc/mips changes, the function is used
>> there for minimally invasive changes. Additionally, as gfn_to_page and
>> gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
>> easily changed over to only use pfns.
>>=20
>> This addresses CVE-2021-22543 on x86 and arm64.
>=20
> Does this fix the problem? (untested I don't have a POC setup at hand,
> but at least in concept)

This one actually compiles at least. Unfortunately I don't have much=20
time in the near future to test, and I only just found out about this
CVE a few hours ago.

---


It's possible to create a region which maps valid but non-refcounted
pages (e.g., tail pages of non-compound higher order allocations). These
host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
of APIs, which take a reference to the page, which takes it from 0 to 1.
When the reference is dropped, this will free the page incorrectly.

Fix this by only taking a reference on the page if it was non-zero,
which indicates it is participating in normal refcounting (and can be
released with put_page).

---
 virt/kvm/kvm_main.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6a6bc7af0e28..46fb042837d2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2055,6 +2055,13 @@ static bool vma_is_valid(struct vm_area_struct *vma,=
 bool write_fault)
 	return true;
 }
=20
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
@@ -2104,13 +2111,21 @@ static int hva_to_pfn_remapped(struct vm_area_struc=
t *vma,
 	 * Whoever called remap_pfn_range is also going to call e.g.
 	 * unmap_mapping_range before the underlying pages are freed,
 	 * causing a call to our MMU notifier.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages, but be allocated without refcounting e.g.,
+	 * tail pages of non-compound higher order allocations, which
+	 * would then underflow the refcount when the caller does the
+	 * required put_page. Don't allow those pages here.
 	 */=20
-	kvm_get_pfn(pfn);
+	if (!kvm_try_get_pfn(pfn))
+		r =3D -EFAULT;
=20
 out:
 	pte_unmap_unlock(ptep, ptl);
 	*p_pfn =3D pfn;
-	return 0;
+
+	return r;
 }
=20
 /*
--=20
2.23.0

