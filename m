Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4613B25E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 05:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F96E9DA;
	Thu, 24 Jun 2021 03:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79BB6E9E8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 03:59:54 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id i6so4073517pfq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 20:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmGok1KP9mkQUahLNaNswnkRk+BZZNd8A6VDpCy6mq0=;
 b=Puw+zuEB547BUNk23be4KLF8wOVKHFDwynxb4lruaPyNnXdjflBU2IzSDSn7Mmy/gI
 GmMEkygbtUT0U9MSVI1A6lkcjDvFwvTTnQG/iiZY4thta8fK1I/CMV1Jn3JYfI6nzDB9
 oH6xXVSDsNDRtnT8PT8KZIDcpOdIdD4cCiLRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cmGok1KP9mkQUahLNaNswnkRk+BZZNd8A6VDpCy6mq0=;
 b=qfQrhPtrVsBW95gARAoy9IlFo8jzhQweK7uydV3fJ0FimNlk/COJVlOTe/RiHhUQwo
 6+v04W/+E7ARgInMobBzUjJorKqAMnE0xKZ/Oy3IwaOx/EOw7CiTbi3zX2gkF8jr32uy
 XB9J83nimoFW3kpi0TXPP2uaRLKGGagHu9PiEicdep0OAHKuRNGV++fd/eCcJISTjwho
 N7kec/mqTG9jyI5VEahBDl7+h4sy5BCAc+qZjwPGG9QRBqkKoMAx1WzKdqMHf2cwMaJ3
 GZlV1AawTFKIi+6N9JeROzSUd/RLBuNJCKuxmtTGjkxo2gQHRfaO58ySqA7pQGVg8sEI
 JPRQ==
X-Gm-Message-State: AOAM532zwgEy2alQkP+I7DbvOKggmfC7qftb11xmQy3nCUTqbOmA4u2n
 lss/sRXx9HC4oRys7XC2X7lq4A==
X-Google-Smtp-Source: ABdhPJwdqYHO15pKuqB3WHvaFPDIGe3ZMDHFKd80sEGqz3qF8TpcI89MlzrarjtQsVeWDyea1kRTqQ==
X-Received: by 2002:a63:d0d:: with SMTP id c13mr2893248pgl.384.1624507190102; 
 Wed, 23 Jun 2021 20:59:50 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id a6sm1134854pfo.212.2021.06.23.20.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:49 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 5/6] KVM: mmu: remove over-aggressive warnings
Date: Thu, 24 Jun 2021 12:57:48 +0900
Message-Id: <20210624035749.4054934-6-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 David Stevens <stevensd@chromium.org>, James Morse <james.morse@arm.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Remove two warnings that require ref counts for pages to be non-zero, as
mapped pfns from follow_pfn may not have an initialized ref count.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/x86/kvm/mmu/mmu.c | 7 -------
 virt/kvm/kvm_main.c    | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8fa4a4a411ba..19249ad4b5b8 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -546,13 +546,6 @@ static int mmu_spte_clear_track_bits(u64 *sptep)
 
 	pfn = spte_to_pfn(old_spte);
 
-	/*
-	 * KVM does not hold the refcount of the page used by
-	 * kvm mmu, before reclaiming the page, we should
-	 * unmap it from mmu first.
-	 */
-	WARN_ON(!kvm_is_reserved_pfn(pfn) && !page_count(pfn_to_page(pfn)));
-
 	if (is_accessed_spte(old_spte))
 		kvm_set_pfn_accessed(pfn);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 898e90be4d0e..671361f30476 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -168,7 +168,7 @@ bool kvm_is_zone_device_pfn(kvm_pfn_t pfn)
 	 * the device has been pinned, e.g. by get_user_pages().  WARN if the
 	 * page_count() is zero to help detect bad usage of this helper.
 	 */
-	if (!pfn_valid(pfn) || WARN_ON_ONCE(!page_count(pfn_to_page(pfn))))
+	if (!pfn_valid(pfn) || !page_count(pfn_to_page(pfn)))
 		return false;
 
 	return is_zone_device_page(pfn_to_page(pfn));
-- 
2.32.0.93.g670b81a890-goog

