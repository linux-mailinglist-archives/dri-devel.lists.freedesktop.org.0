Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3DA9C0AE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5910E8C5;
	Fri, 25 Apr 2025 08:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DxbsDDrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C5B10E8C5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xNohxILTOPqd/8P2+09zos3Ls7ebzSxsppSFkARpPU=;
 b=DxbsDDrZjtwcRbh1QASU9f1eDrEivdZ0DNRlLKgXce9wuSiExg6x7suXnT/kG0m2iSaIkB
 QsD+VRmjcexIrT74THrsYe+D+V9LKbN9syAX/c2js/vGy7Gupf1OUpnJqBbd92j1Y4Qp0C
 W5k+sd0BRuLwnvsozJrUpPbhsCEkKz0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-oYqoIkguO-KBjyk9hW6X6A-1; Fri, 25 Apr 2025 04:17:35 -0400
X-MC-Unique: oYqoIkguO-KBjyk9hW6X6A-1
X-Mimecast-MFC-AGG-ID: oYqoIkguO-KBjyk9hW6X6A_1745569054
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912b54611dso957032f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569054; x=1746173854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xNohxILTOPqd/8P2+09zos3Ls7ebzSxsppSFkARpPU=;
 b=OoNidyPF08iBAcABdudVorLGwkjD76rFdIS7EJh6CJj0wZjBI+Xyt/O2isDxORUuU+
 2mWIfYzS+qdBN2K0XUv4nVx0/yW/3T4lGyhsmwgG6hR3LkFbR0d0pmOFT/Dzy56mWZ64
 7wBBGa8uvekv+nC5xFoUkWsiUwzsy1WEeUWUeC04AuOS6maC8xQIwP6R1pxDLDLy7wHI
 qgmDKm7qKMqqF4Y8NYZpfId5ne1h8WIWQAobJ99F2hZAnBzEGM3jbrZ20Q+Cc+6IfmJ4
 htFbCGEqBFfJPHZ0j4HpBhmHxXt57W9nNLZXlBKKvdCA1tHbYnTzYEAWiD5CSgmZCkwr
 ZXSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuhgnBXYEq3nLQocPAX+kAiwKyHn+tElP0Xpcm4w2MoUL5QvBc8Iurmkh35slOGahfNzAdbY+LPug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrYlBjXz98GLCYkADius9/f8c1uV04gCAdirB9lSZRjFWLZCI3
 22Bp+WC/IiXR9OFFCV1PNHqdMIyV9rO68efL7GkdwWprl4S1s+z23S1n2lu3OACrdZlypIvmKuN
 aq9ga3dZqZoj6OiODIvun6WusHjBeH96+1jbv8/nOcFFY2KM2Jaco+Xk0nTGioTNoZg==
X-Gm-Gg: ASbGncvuSpeEWAaj/Ekc1cxR+jnWekDTNaEciqQ3ZXWS5Tmq3hXTiNwt77VF8mFoty2
 r5ptePxJq3HblXJ+IHMu/5lpzpOjvC3ADWId6VIqZABVG4v4un+DM9o4wK0PuPvhcsvB8wGP2O/
 1kb59U+KxUbIOxVqL716sQD/mEc1FRWET90fwtwC5G8+SskHQJTMqtqOqU/eY6/nUzcqX2ZyD3l
 IQl1tfQoDRwkm5hkEA74S3RrAowbEzbDwRg3/Opaq48qGQE/jZ7WQoICnJ9xgisgE+xRKTd7JrD
 Zjc7YCVkvK1c+cIYtHUYh2yYNMAB1oG0PbCWlQHjFucNqIrqtPrLn5q+Ci5gjq/YMp4WG3Q=
X-Received: by 2002:a05:6000:430d:b0:399:7f43:b3a4 with SMTP id
 ffacd0b85a97d-3a074e2f3b3mr903671f8f.24.1745569054445; 
 Fri, 25 Apr 2025 01:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFENsE4+5Cu5ObTVfglloYLU5xkxFPfypsGCDuMGrHDVRAMikMZaqFHaFNkwSVPa60/smc7Mg==
X-Received: by 2002:a05:6000:430d:b0:399:7f43:b3a4 with SMTP id
 ffacd0b85a97d-3a074e2f3b3mr903634f8f.24.1745569054012; 
 Fri, 25 Apr 2025 01:17:34 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073c8cab5sm1648138f8f.10.2025.04.25.01.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:33 -0700 (PDT)
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
Subject: [PATCH v1 07/11] mm: remove VM_PAT
Date: Fri, 25 Apr 2025 10:17:11 +0200
Message-ID: <20250425081715.1341199-8-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7wZf-yPiLXz7q3bQHbU4ISaxi3QXarnl3m_-aUbr8ZA_1745569054
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

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h             | 4 +---
 include/trace/events/mmflags.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9b701cfbef223..a205020e2a58b 100644
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

