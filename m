Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625CA9C0B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37EF10E8C6;
	Fri, 25 Apr 2025 08:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NnS5L8Ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0596410E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uu4FlIS5Nl76bZjUZyw21YomTVSJoQk7KVvTvA60Mww=;
 b=NnS5L8LnbABPF6PKGBAMQRhUTUfmfiXeu+5Gy8QdOwqV18OOazirWV6Fh98eiPERrlK6JY
 Xhg6/uHJoV0nqjWjY88hqq2m2Pa80Dba+Benqaph5/pNk15KQDsohjm3gJnO7ruyu/y9bU
 R3n8tXEYJ1+xRAaP8NZYTdrxM2fB+8I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-y2kzKM7MPm28vFCPpo7fIA-1; Fri, 25 Apr 2025 04:17:29 -0400
X-MC-Unique: y2kzKM7MPm28vFCPpo7fIA-1
X-Mimecast-MFC-AGG-ID: y2kzKM7MPm28vFCPpo7fIA_1745569048
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so9619995e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569048; x=1746173848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uu4FlIS5Nl76bZjUZyw21YomTVSJoQk7KVvTvA60Mww=;
 b=wikhHO1Lgc5+1NwY6J8AFhGaFTslaRvJA3BEecZdIsz52ibqW7WRmewaKGiJPxNwWA
 gIkNau863OXrym8FL9r6f1UiUw+/SJsxw3SwTN4UUm6rrfZ2GDHjdAAwecOJLNnB35+u
 uY4K+wPYeFihD5vS/hVaiq99Bwl9/iR67T9e/XR0ZviU1xAFhGSW1Tp8qeggbUPat63Z
 SIHvPG/gnu9odXgjcICei5XgMNJ1xgO6yyAx2LR9TEcCVy5I4PuNDjIvW8i9YYkNFXTr
 evmFUxUA47jAV85xRBYtCs3YvudeCOo1IEX1W5F/OXAufgYxdliPTSCQPk3FN9/ISaXa
 gakw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM3TURg9qe/e6s4dkcaXZ9xviISyJ4Xo6wKodmZlnVUWT82/4zNGUnabX+xnE5GA9KXCncQLXjp9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHUGm+Toa8NioMXSNPko0UKDgep7+xnK6b85DQTz9aeVylU+MS
 ZTf+11ReSf/mC3L+yjS9jg59XLfX70G5X25Xh6nUG925j8qCfT1i5j3je6xP5ojqxD/rz/4ylSE
 quzVEgPiKih7InJ232cQHvZtD89wJCSOUHD9SbbBRI2tL/IQ7shKWVKQJwSK6lKbZqG79QQWsgA
 ==
X-Gm-Gg: ASbGncuASjV/er6oO/Le2Wkz7kVrezPi1mkuR6DCxyViESRGWA2mDXJlndNEVr5Ag+T
 ib50uVewVy8oROBH3ItVxga8DC4x1plW4/NDu5CU5WoIeeCylYyhr+e/dApzvDKH8CEIvG92jEB
 Rt4x7ekVLmTOQowPkORrxDQSDJzz1AxJyUxopUwaI+uBNhxV47uRKj499saavo4SZ0fxFWuKXNk
 n7qnUH6o1s1NtxcUPhb0aJs/j6KOq/QPr56H3k9hlmsIX1RHRStnkB6wDFHPLDBnYVrnwCbEBjz
 ZCazcRvgUk4mA1wc+hr5fxiJZR5Vo5mZTEfEqXMIA6bXpTl8wwff3Dv4hTq/+yK5qi4C3Co=
X-Received: by 2002:a05:600c:1387:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-440a65d8120mr8181465e9.11.1745569048268; 
 Fri, 25 Apr 2025 01:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv6bx4rw9BX60sw1RHVhWJrGaS8iH8UMCeEA8nv3vLsrOwHOvFftOe6l4h5umdYWufDrsURA==
X-Received: by 2002:a05:600c:1387:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-440a65d8120mr8181055e9.11.1745569047938; 
 Fri, 25 Apr 2025 01:17:27 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4409d2a1dc3sm47748735e9.13.2025.04.25.01.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:27 -0700 (PDT)
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
Subject: [PATCH v1 04/11] mm/memremap: convert to pfnmap_track() +
 pfnmap_untrack()
Date: Fri, 25 Apr 2025 10:17:08 +0200
Message-ID: <20250425081715.1341199-5-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zKvM3Z4dYoUef5bp2HmcwvzSKBp1gImBwnun_EVPCJQ_1745569048
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

Let's use the new, cleaner interface.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 2aebc1b192da9..c417c843e9b1f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 	}
 	mem_hotplug_done();
 
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 	pgmap_array_delete(range);
 }
 
@@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (nid < 0)
 		nid = numa_mem_id();
 
-	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
-			range_len(range));
+	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
+			     &params->pgprot);
 	if (error)
 		goto err_pfn_remap;
 
@@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (!is_private)
 		kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
 	pgmap_array_delete(range);
 	return error;
-- 
2.49.0

