Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E551FA9C0B7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E7810E8D3;
	Fri, 25 Apr 2025 08:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h/JKD8sN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DD410E8C9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXejfGAknVxklqhHCW/V9liutcQQAQcJcrhEqzVyY78=;
 b=h/JKD8sNeMheMSLSli8r2DtuVz2osJDmqHn4tk0QHZjzo89VqusVQPqDzpLyzSO/whL7yC
 lyFrkJsr0RH6A5/zv3WaimApKLGcHlRcfxRQ9GdMyF+WEiF8V5kVSAETlmtSWsKJa0W0Yt
 yDI61RNXErmv91E2TjCMdwWx1t+BfrA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-aqzfgIsCNTyIBcnFHuExNQ-1; Fri, 25 Apr 2025 04:17:37 -0400
X-MC-Unique: aqzfgIsCNTyIBcnFHuExNQ-1
X-Mimecast-MFC-AGG-ID: aqzfgIsCNTyIBcnFHuExNQ_1745569056
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39c30f26e31so1170391f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569056; x=1746173856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXejfGAknVxklqhHCW/V9liutcQQAQcJcrhEqzVyY78=;
 b=Vxr9v2H1kb+ApFLtaCQTdRZI7jl+zQxYraIxM+uRSReWHx2ou9ROhgHPLzE29sDlWY
 GZnGFuOtaAYKCPmNdIqScnYtAfEtzwU8Eth7NsSQkOJQLvjvhAUN+POtivxQhmQ8UK8E
 iuwWF3CSKs/PiXbkMh4ya1igYpjzSUdYPzyoh6s96v753kSpK7WRjIRemiKv8UqjhPvu
 G1IR9aL7vmNj09hE5ftkF4DL4yN90NjHIEhBxfUJa5WqajMVJgTOmC4lqNpiXMwf56iF
 fPtWTvxDpo/e83Qr3YHxwZVlxOVjIEJSxHH6tgKaWGc6EUEfJNt+XwdyH7pT8uz7GRAX
 RiXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8+F0+kIQ0lUXj6kWovqVV4sLFYTPCP/g+VjwLfaToN19qzx5nN4aUNKteVYeVCNyRsHiuRB0xpSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx0OsCPMUm8cooWafKFxa521e/tFO24w4vLV29OXLF+A4MwVA2
 GqJnEKB80n9Ul7yh68PHYM7ICHqH4T018Nqc6IH2BTpWDQ2eiUaw7+ONUBvzMuo750/7p/aqR9W
 jJc/wpo6ev4Y+KA8k2YaqqgXYxKnXcaA7nkKBPtXoibvqk74a7pK9+VxwgfjX2M0Ltw==
X-Gm-Gg: ASbGncuHqfHHx0Jlc9X/UwPlDxsbU9sezBgGBtvc2iSZUv4eBin408CqOeHdlWPNru8
 7Bi2qLZNAUEWWp70tlS2Y3hCAh99UANxOf/4pzroL2BfzgiFio/ljuR4I/kb+Ab0F5U4YbnS1Os
 SrJeeHCn7pK86uf2F+q+qZWKUVchRgRYSmWqcnbK8+phVIqBeqf2C12DqCA24ehImrZinnO0P3M
 YG8s4nXmqCSMwnJVmvpHEHxx1nTfcW2rCijBNNdny9drFGNQAvsJHR0QxngTMgyAfejVZ7xm9PO
 q39p7Q2ZL+dU6M1f66KrbgJGUVSwVb2VrqFW/fMNwX4qXVRt8IlOUXtXZMGZ2d7r8Y27cvo=
X-Received: by 2002:a05:6000:4028:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-3a074e0e4d1mr832152f8f.1.1745569056495; 
 Fri, 25 Apr 2025 01:17:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1X+NuNfEcvtfeCEnq/l8/EdxH0+aUnwVbo8Kq4KyW0RucKtS6876psW/EjwOajf1KdVRgA==
X-Received: by 2002:a05:6000:4028:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-3a074e0e4d1mr832108f8f.1.1745569056044; 
 Fri, 25 Apr 2025 01:17:36 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073ca52e5sm1657353f8f.36.2025.04.25.01.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:35 -0700 (PDT)
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
Subject: [PATCH v1 08/11] x86/mm/pat: remove strict_prot parameter from
 reserve_pfn_range()
Date: Fri, 25 Apr 2025 10:17:12 +0200
Message-ID: <20250425081715.1341199-9-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kht2y__bIwMkjHWrhZaXrYGhxy_FjOheI6F9INgW0cY_1745569056
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

Always set to 0, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 668ebf0065157..57e3ced4c28cb 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -858,8 +858,7 @@ int memtype_kernel_map_sync(u64 base, unsigned long size,
  * Reserved non RAM regions only and after successful memtype_reserve,
  * this func also keeps identity mapping (if any) in sync with this new prot.
  */
-static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
-				int strict_prot)
+static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot)
 {
 	int is_ram = 0;
 	int ret;
@@ -895,8 +894,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 		return ret;
 
 	if (pcm != want_pcm) {
-		if (strict_prot ||
-		    !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
+		if (!is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
 			memtype_free(paddr, paddr + size);
 			pr_err("x86/PAT: %s:%d map pfn expected mapping type %s for [mem %#010Lx-%#010Lx], got %s\n",
 			       current->comm, current->pid,
@@ -906,10 +904,6 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 			       cattr_name(pcm));
 			return -EINVAL;
 		}
-		/*
-		 * We allow returning different type than the one requested in
-		 * non strict case.
-		 */
 		pgprot_set_cachemode(vma_prot, pcm);
 	}
 
@@ -959,7 +953,7 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
 {
 	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
 
-	return reserve_pfn_range(paddr, size, prot, 0);
+	return reserve_pfn_range(paddr, size, prot);
 }
 
 void pfnmap_untrack(unsigned long pfn, unsigned long size)
-- 
2.49.0

