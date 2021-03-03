Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A232E3C3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0E16EB12;
	Fri,  5 Mar 2021 08:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701656EA25;
 Thu,  4 Mar 2021 15:20:13 +0000 (UTC)
Message-Id: <20210303132711.645314577@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=P7h+Ao9vOsNudD955CeMK9tU9n4YH9q4LoCgy/oWh2E=;
 b=2uXV0ePRVVVN5aKy2Fo0e96bYkFzUnbSPbDA9mnjFGs+bbvURtfkKgZsQJOXfsFhfOqAx3
 OKSUQ7A2lNXYMCPR5mt7GR8WB0thYvCiB4N4KF25U224lG1bd10Wr84gbQIvOPtxPz3S61
 OTBC7TJIKKNT+7owvCTNX96McxO5XIkAJM607UjWjAXvuDuzKj/vkGN/mMIFPVgKtW7FiY
 sMDkWETXLSLQCzV0BfhUq6uLpZrsKcZbHLAlqzznBehEpom/zQ1YITugOutFHAyMs86+RS
 kQNSvVUTjxm2uWu56Y8iErhFOW+/7R5MUYLuWMVdNNi/wd0eYJsJQIPIhJonBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=P7h+Ao9vOsNudD955CeMK9tU9n4YH9q4LoCgy/oWh2E=;
 b=yQ29yECbLb01f6/UnQLUET487mIC0cSmmm0evPuZXcme37cSI8DlyGVW46Rppt1VI46dBD
 FPkb1BDl/xOp+sAQ==
Date: Wed, 03 Mar 2021 14:20:26 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 3/7] highmem: Remove kmap_atomic_prot()
References: <20210303132023.077167457@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Gleixner <tglx@linutronix.de>

No more users.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 include/linux/highmem-internal.h |   14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -88,16 +88,11 @@ static inline void __kunmap_local(void *
 	kunmap_local_indexed(vaddr);
 }
 
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_atomic(struct page *page)
 {
 	preempt_disable();
 	pagefault_disable();
-	return __kmap_local_page_prot(page, prot);
-}
-
-static inline void *kmap_atomic(struct page *page)
-{
-	return kmap_atomic_prot(page, kmap_prot);
+	return __kmap_local_page_prot(page, kmap_prot);
 }
 
 static inline void *kmap_atomic_pfn(unsigned long pfn)
@@ -184,11 +179,6 @@ static inline void *kmap_atomic(struct p
 	return page_address(page);
 }
 
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	return kmap_atomic(page);
-}
-
 static inline void *kmap_atomic_pfn(unsigned long pfn)
 {
 	return kmap_atomic(pfn_to_page(pfn));

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
