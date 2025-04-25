Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD0CA9C0A8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B078210E8BF;
	Fri, 25 Apr 2025 08:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gaTPr6u9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D4D10E8BF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCYBdpwfjCOhXvT2DzVINMJSRWNfDi2B6w/Q4Y3NEy8=;
 b=gaTPr6u93hTPOdilhUwA8IRG+rBHnk2WkHpg9FIUNk1KqK2eUClCrTzx8Lw+ugK0imrKbp
 qeeLQkkTKxL4lXPWlzwM9MpXbOED34GSEevSbbLZ9TNmowwII8pMl6clCPLAsXjRwc3j6K
 gLNKR3YwoJSaiKamPpfpgCJod78jXnA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-dVYFRa0LPg603RaHgtzm_Q-1; Fri, 25 Apr 2025 04:17:27 -0400
X-MC-Unique: dVYFRa0LPg603RaHgtzm_Q-1
X-Mimecast-MFC-AGG-ID: dVYFRa0LPg603RaHgtzm_Q_1745569046
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39d917b105bso998915f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569046; x=1746173846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCYBdpwfjCOhXvT2DzVINMJSRWNfDi2B6w/Q4Y3NEy8=;
 b=daD/0aWjegfkhug/w2piU1KcMNDkDgCbsMomKWRXR2PBBoxD3K3rpch06e7r6BtOuG
 ddiENmbDAcFGDKimrYj1lw7Jco8+ZgdBFejh+HbPAFFQiSnOMg9KxifPyTrDSC9hS19x
 jY0TPrtCZ4GI3VU1XLjUFWyFyNnMAFqtSfh4VkgZ3LtlbmzeHfEEv43mXRYOWWM+0beR
 P5AyKV0/iN2zZRmGSxdE7ekE6MQVCwchgCvnrIQbf5rUIv/5YXTxqJn6473W3sp0Ng8A
 g7BK9Q2TN0oY6oNxZ40RNp6BWhQT4qtE7Pf0gAUrooqyK9DjpQmazzyB2dgbUdvRmHgP
 fGeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9LPQL5qsytB0NWye4N1R85Xy+V2Pu5hqJBWh+LLvWf748jx9NHYc9hBQUsHnP9x5H7WXdLtn+8F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx8+oFf/qLV9ky/ml4YF5JVIJCaLrq3vCSt1NimYqbinngx9/u
 /pNeMkAQYI4uozDvg9U7TbHbP4KcnYFhExJUOWw5Dgo/lzj/zBouU7wE/jvezN1e36nYZbeDWzs
 zLx6qvDTHhq2Xc7XQpFtnGsQ5PQAmlp3+6XeHp4c8nrydBwRJYugSUkLaiA2aMsWbig==
X-Gm-Gg: ASbGncsQ2WugxyH+2riZWYesCHsEJtJ9ws1kPnlMK9TUMCpLScZwfb0SxGyHwBxQpB2
 pWeKV+mg7/zZeTryxlzHUmzaKyKkt9qD/uParhGQGlq+DOICyHzYP5WBH/s7Pg5PfinMPPeWEmJ
 j3sYMlX7zNq9mGpWl6L7SuZL/ASPtvboYvFCMzkAGTC490V05PcGYzClvVvklBBWGCmYrXuywCK
 RjLtWrLwvZXgchg9KZoV93gBIu1pamllTYrOEZD39tVDfak5JstVZADkIbzg9x1Ks1Ibu2o/eaj
 JNOOt0sriRXNx0xn0S1guexuG1vSKi1H/r73pTKAGS12TvYw7DUpP2az+vFFiqQWSXex328=
X-Received: by 2002:a05:6000:2903:b0:39e:cbc7:ad33 with SMTP id
 ffacd0b85a97d-3a074e1eb67mr881005f8f.21.1745569045869; 
 Fri, 25 Apr 2025 01:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrgRXf9wKgkj7MYbnIuzIHmMlVWh7AZlbAu3PZR/ooKrImfXiUSMtbZSGOay0ZI4PJDGOvtg==
X-Received: by 2002:a05:6000:2903:b0:39e:cbc7:ad33 with SMTP id
 ffacd0b85a97d-3a074e1eb67mr880983f8f.21.1745569045483; 
 Fri, 25 Apr 2025 01:17:25 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073c8ca72sm1597057f8f.4.2025.04.25.01.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:25 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 03/11] x86/mm/pat: introduce pfnmap_track() and
 pfnmap_untrack()
Date: Fri, 25 Apr 2025 10:17:07 +0200
Message-ID: <20250425081715.1341199-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1DUyQoJOCXuD2gEHCNezun5PXzRP92b0l4iI1ZftqFc_1745569046
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's provide variants of track_pfn_remap() and untrack_pfn() that won't
mess with VMAs, to replace the existing interface step-by-step.

Add some documentation.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 14 ++++++++++++++
 include/linux/pgtable.h   | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 193e33251b18f..c011d8dd8f441 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1068,6 +1068,20 @@ int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size, pgprot_t *prot
 	return 0;
 }
 
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
+{
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+
+	return reserve_pfn_range(paddr, size, prot, 0);
+}
+
+void pfnmap_untrack(unsigned long pfn, unsigned long size)
+{
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+
+	free_pfn_range(paddr, size);
+}
+
 /*
  * untrack_pfn is called while unmapping a pfnmap for a region.
  * untrack can be called for a specific region indicated by pfn and size or
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 91aadfe2515a5..898a3ab195578 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1506,6 +1506,16 @@ static inline int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
 	return 0;
 }
 
+static inline int pfnmap_track(unsigned long pfn, unsigned long size,
+		pgprot_t *prot)
+{
+	return 0;
+}
+
+static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
+{
+}
+
 /*
  * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
  * tables copied during copy_page_range(). Will store the pfn to be
@@ -1570,6 +1580,29 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
  */
 int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
 		pgprot_t *prot);
+
+/**
+ * pfnmap_track - track a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range
+ * @prot: the pgprot to track
+ *
+ * Tracking a pfnmap range involves conditionally reserving a pfn range and
+ * sanitizing the pgprot -- see pfnmap_sanitize_pgprot().
+ *
+ * Returns 0 on success and -EINVAL on error.
+ */
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
+
+/**
+ * pfnmap_untrack - untrack a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range
+ *
+ * Untrack a pfn range previously tracked through pfnmap_track(), for example,
+ * un-doing any reservation.
+ */
+void pfnmap_untrack(unsigned long pfn, unsigned long size);
 extern int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn);
 extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
-- 
2.49.0

