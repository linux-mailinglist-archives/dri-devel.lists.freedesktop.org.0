Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63AAB370E
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861F10E3E8;
	Mon, 12 May 2025 12:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DHO+2sU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348E210E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLXTuxdzeoCOS7HE06BqHxnwP6g0cDhZW8Z+d4gkxmw=;
 b=DHO+2sU/t7SO7brZHEemrXNlXAL4g6R9b6gipgl5xMCiFZBWbYfYKSocFnQlNWuYiJ6/FO
 dG63K7ZakAmrfblWCHyyaqU/vFq0LCCwhe+22rCd3oAarcROsObnHWzRZKOZ0jdv0wdEO/
 6NyF4eH5vNKCznec9V9LhsSU94Q/PLc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-gjMpb1DWMACdPXhpuiCkkQ-1; Mon, 12 May 2025 08:34:48 -0400
X-MC-Unique: gjMpb1DWMACdPXhpuiCkkQ-1
X-Mimecast-MFC-AGG-ID: gjMpb1DWMACdPXhpuiCkkQ_1747053287
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a0b7120290so1943033f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053287; x=1747658087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLXTuxdzeoCOS7HE06BqHxnwP6g0cDhZW8Z+d4gkxmw=;
 b=lyD6SLd95Tj0oUuMMIohehQ7j14kn3SyDJd6I056c680DTrJmWrlA63co+5QgJlErw
 Qc3ovN2n66+ues5qqNdWBpjbmiPi1qCUPTInmffERG8JO5cDUtdJgHElGgLiWV1Km4Nc
 e82qtlXlYNs4bUmYgHLaYdFO+SmIxO4uOVc/Twl8qXW9R0JYHeWvQ9q/51ktJXi3sFsF
 XhRo2iL+d3L1ciM3O2hweP0XMKiEepjgvZW3UTjJ3EEFAS4sKi6Mmx2clPFnmcOdmXnX
 eXiPOgCrQlj+ZbiMfsZ/gcaXCtGG3SKx4nUWnw0RbvXD2Fqr8LBH7oCrK/GstQNsmny/
 ZZ1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSURYJ4iiG+Y5dg1EUMERBCIKWS5mrl2OvFwB2pYzkYc4R0FE1oarh0Bk/nWiHyCafLjxDgJ9Uf+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy611KjiGSkgQ/P1XuF0ZxfscIP+p9WlRYB3yGaa1GogNnJABgk
 ulxXHU2CBzfwjYmmZ2KRnNWJlE90ydmzAhbDQgRcf8K7nT8x9uAN72NgciiDC1sfDu2WlKC3qX3
 EgCyHeGmHffGHcLGgq2UW3jyj8nvjVAFWNIUQoE61fbGs+mmgF7DZ8aa0+UbvZdlXVxYUlId82f
 6F
X-Gm-Gg: ASbGncsJv3qS/Z//A3u/OqGr3GqJxQuQSgRP7XUK20eGfeXKVJx/Q4aikVvLOihudRU
 rEe3svi01lVJst3JaeqSflzvr3zA7WvQ0BJ1oUSNmZR7P4YRHjreYZVl1sTecyMQjRwHEDOAkvi
 uffCoNQeArP+3pCS8os0+mBa+RWm0Nos2P6M+jWhyUF5brByJJy2BlyE7DWapQWZBhgcg/nMg2C
 ATolz1NmSwjr+x0rlBhStIh7nfr8PhRVvB8xZgLo00QhW/lkNbBtAwD8sWLzEKUKjfubGXMU0U6
 +XM/zIgJPbVAwXF+CYSd2w45BqqOzuzz931+WvVRnu9lxpmmMabINYLtIoRX9nhqYBBr2acY
X-Received: by 2002:a5d:5f56:0:b0:39e:dce8:1c07 with SMTP id
 ffacd0b85a97d-3a1f64a43a5mr11025575f8f.46.1747053287226; 
 Mon, 12 May 2025 05:34:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXC2JTlHqMNEkDQGwHpsMemWHOSr9CrtHgYnjEcClwN7Gy0FNgR8cW6E5jpqWqORj+so6DMQ==
X-Received: by 2002:a5d:5f56:0:b0:39e:dce8:1c07 with SMTP id
 ffacd0b85a97d-3a1f64a43a5mr11025549f8f.46.1747053286815; 
 Mon, 12 May 2025 05:34:46 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f58ebd43sm12647639f8f.37.2025.05.12.05.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:46 -0700 (PDT)
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 08/11] x86/mm/pat: remove MEMTYPE_*_MATCH
Date: Mon, 12 May 2025 14:34:21 +0200
Message-ID: <20250512123424.637989-9-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HiASU6MLuOm6Q4TGLw-eBQuEwzvZ-tC6-7XHPNZd9fo_1747053287
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

The "memramp() shrinking" scenario no longer applies, so let's remove
that now-unnecessary handling.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype_interval.c | 44 ++++--------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index 645613d59942a..9d03f0dbc4715 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -49,26 +49,15 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
 
 static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
 
-enum {
-	MEMTYPE_EXACT_MATCH	= 0,
-	MEMTYPE_END_MATCH	= 1
-};
-
-static struct memtype *memtype_match(u64 start, u64 end, int match_type)
+static struct memtype *memtype_match(u64 start, u64 end)
 {
 	struct memtype *entry_match;
 
 	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
 
 	while (entry_match != NULL && entry_match->start < end) {
-		if ((match_type == MEMTYPE_EXACT_MATCH) &&
-		    (entry_match->start == start) && (entry_match->end == end))
-			return entry_match;
-
-		if ((match_type == MEMTYPE_END_MATCH) &&
-		    (entry_match->start < start) && (entry_match->end == end))
+		if (entry_match->start == start && entry_match->end == end)
 			return entry_match;
-
 		entry_match = interval_iter_next(entry_match, start, end-1);
 	}
 
@@ -132,32 +121,11 @@ struct memtype *memtype_erase(u64 start, u64 end)
 {
 	struct memtype *entry_old;
 
-	/*
-	 * Since the memtype_rbroot tree allows overlapping ranges,
-	 * memtype_erase() checks with EXACT_MATCH first, i.e. free
-	 * a whole node for the munmap case.  If no such entry is found,
-	 * it then checks with END_MATCH, i.e. shrink the size of a node
-	 * from the end for the mremap case.
-	 */
-	entry_old = memtype_match(start, end, MEMTYPE_EXACT_MATCH);
-	if (!entry_old) {
-		entry_old = memtype_match(start, end, MEMTYPE_END_MATCH);
-		if (!entry_old)
-			return ERR_PTR(-EINVAL);
-	}
-
-	if (entry_old->start == start) {
-		/* munmap: erase this node */
-		interval_remove(entry_old, &memtype_rbroot);
-	} else {
-		/* mremap: update the end value of this node */
-		interval_remove(entry_old, &memtype_rbroot);
-		entry_old->end = start;
-		interval_insert(entry_old, &memtype_rbroot);
-
-		return NULL;
-	}
+	entry_old = memtype_match(start, end);
+	if (!entry_old)
+		return ERR_PTR(-EINVAL);
 
+	interval_remove(entry_old, &memtype_rbroot);
 	return entry_old;
 }
 
-- 
2.49.0

