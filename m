Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD498AB370C
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E041A10E3E7;
	Mon, 12 May 2025 12:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PJL8UPKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6815D10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/UT1PJepYZyksnYsraxL/8N12b3Ge+B9agKxkMscSY=;
 b=PJL8UPKncSwGas8xlfq2EDVpd6DRcq48GijPImt5u3GVjTjkmueFxlvfC3AQIz96gPGLgr
 pNd7tFBaUzG4vjTKU8rYHVIgKQKogN4YdVDH52KnBBpPV6XP2qHFFtz97xCmEQWzFPnXia
 u2DE3cGFSLbZuwxaTE6thewKwVciPF8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-9oGsm_iFPm-lhAzk5oPn_A-1; Mon, 12 May 2025 08:34:43 -0400
X-MC-Unique: 9oGsm_iFPm-lhAzk5oPn_A-1
X-Mimecast-MFC-AGG-ID: 9oGsm_iFPm-lhAzk5oPn_A_1747053282
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d007b2c79so26213225e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053282; x=1747658082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/UT1PJepYZyksnYsraxL/8N12b3Ge+B9agKxkMscSY=;
 b=agZriqDKM/Y3b1AdZ53cWeeew0eMDKfn7gpdGZzPm1diufDkTx06+FjH4VjvRAy5k4
 Y6DheSdzhFWF4yBE3vaH2jHJfWZk9aRzDjkE+Ps70JAFic3UQOYTsA7lUI/j/yxyoB9H
 AFBYKl8QVJn4DwgKCAt8ycv7SzkjgnjYf7TV9MapAULgdw7mh00dN8CrOaLrrM3q7+qO
 ZvGxl/64M3xdAGJJcroJTqZ15vLeaKVqdcIjbcetUvSKQXwGTBjI2BIwHDhviTFEIx67
 fQEL2edKJRJWLhgq/go87oLo4KFmYHf7+0iK/YoxOPGplTq+s3xF6iGN/OOk4tZEmmir
 StPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPRVwQNFVRy5PIoGv6dJjPKGWiMFV1g1CIDQzcDpJb/5+nXzfurVY68XQoDDVGAAElzSGaYKs8+O0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTLsPluSqZcJK5SxHwGlmO/euCrBlbUjcIrCFRRiZnEkga7vsy
 eBWzmR0900bvTwQpD/jZmNS/lcU7RFqzHZXucCvp0cNrdEvwj7LoJqQ/zmubiGunsoLeklldIG5
 4tILEDIzzET/nlLacYrWU7QrJmkwUdlUyMXjUyogjLQ5CnpbEk9Dzciwg74MKXRxtMw==
X-Gm-Gg: ASbGncuCtIveXmCTyD5H4vZIivXclsMgAQ7bopC2kxr/RkV2J+Dx4OeghWvw38lK92D
 Se46MWYsUIoMyJy1kaiC823WPeOIadC8bThnHaWAbb8hz+Oj11OzBjLEji3xJ4z7fi/sNX806+/
 RmjE9wxNbz7rYvGuvdqOF6mJ0J0teO5TTbF7x10dVrlPOdTBuYlerrC1Rzxb1kBEWoD7EL30A05
 trxk5huw104fYVpcK8FqNyNj95r8RS9qFjMnfcNmBiG6fPLMDAaIk+VDP55gFfbi0eWfiZ+pKNt
 C1x+Et1kkAq4yiZfP5Ru2dtsM0p2j5E4VL4NNig/2XK5GMbmrQNvdwLL97/274Kz1VR64j80
X-Received: by 2002:a05:600c:5297:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-442d6d0a9dfmr115315395e9.3.1747053282332; 
 Mon, 12 May 2025 05:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFywN6624bTf4LyaE2Qvs6JUb4DihepKIjEJxodQ9QeZ2Wkqkhy5X7PHmdPSSD8j6qE1uzKzw==
X-Received: by 2002:a05:600c:5297:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-442d6d0a9dfmr115314985e9.3.1747053281990; 
 Mon, 12 May 2025 05:34:41 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d773f794sm82894295e9.0.2025.05.12.05.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:41 -0700 (PDT)
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
Subject: [PATCH v2 06/11] mm: remove VM_PAT
Date: Mon, 12 May 2025 14:34:19 +0200
Message-ID: <20250512123424.637989-7-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O7ewAllKX0HbRVGyYS27O3CnI1ihll5nmUNkMucVqIE_1747053282
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

It's unused, so let's remove it.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h             | 4 +---
 include/trace/events/mmflags.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 38e16c984b9a6..c4efa9b17655e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -357,9 +357,7 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-#if defined(CONFIG_X86)
-# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
-#elif defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64)
 # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
 # define VM_GROWSUP	VM_ARCH_1
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 15aae955a10bf..aa441f593e9a6 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -172,9 +172,7 @@ IF_HAVE_PG_ARCH_3(arch_3)
 	__def_pageflag_names						\
 	) : "none"
 
-#if defined(CONFIG_X86)
-#define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
-#elif defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64)
 #define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
 #elif defined(CONFIG_PARISC)
 #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
-- 
2.49.0

