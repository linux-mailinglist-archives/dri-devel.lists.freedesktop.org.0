Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26547A9C0BB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F54B10E8CB;
	Fri, 25 Apr 2025 08:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RaPYGuoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8512A10E8C1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6VKic5wKMEIAlcOpats+61qo+m5NRwuI82rD38neOc=;
 b=RaPYGuoilnrg0DH8gYai3gtNwaZrHvHjoRBR6S8/LzKWN6izZTxakVGzWnP0jBn52xt6pC
 X9/iUWzHfgRIlXRMbBKI+PE5uuhOB5GsTvCTJjQ5cx0VTaunyJ1aU/Sj3de1Tcm2aeI4Q+
 vWhHuOWEmEXXuYi2ThbGSmnUQXHoLp0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-iHSX-RXJMAOOtFObbHVAeA-1; Fri, 25 Apr 2025 04:17:44 -0400
X-MC-Unique: iHSX-RXJMAOOtFObbHVAeA-1
X-Mimecast-MFC-AGG-ID: iHSX-RXJMAOOtFObbHVAeA_1745569063
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43e9a3d2977so14332275e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569063; x=1746173863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6VKic5wKMEIAlcOpats+61qo+m5NRwuI82rD38neOc=;
 b=pgbxgI8Ui2/6jCl4xQJaLNRVLKuOw46cGbmixSh8Plm6l+OuffJGwl0Cr39dLCkmYt
 UJu91AoNq7y0qKsslhOD9qwBEwAf7jGBLD/tX4jrbo28R8ozrXaJQskUAdmj9nHcEa4M
 IMQ0Kuu9kuAatKySBQm2Hhc8Xcpk/w5uS+mtFT0hJAxYe3ay3hzcF/pWCLwujg/QOtBC
 p2UNEGU+KeTlktmkz15iOSE4tCJ0ahWs2eDzjZcJsVj3Sf+awRxuI9BTtfvEUJE8Zuc4
 mIxkLthWkwct3EsL5V3BRm0/XUJPGFIABc2ouHdBBwK4IPjjIAevcSONAFwRm/2mjZby
 JUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSutp/o8FxwtIJVr1tuVGZVfuPwJfUh0hnTTM3HEXCkiUp5mLQpgcc40Bh5zQekiDBZ/eFPixDSfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy1U3zrzUu1UjpAGv/0aockJUC+/Sep4MqTnumuvgtVqtEDFsX
 l1qQHh9LKw0YMXCwaFVlqF/UYKrlmF7xLRzGQcwwrfNEQLI6GnHNQSMh/LIoseyMw8MLhpS+eqX
 BOceuev/MyVvp2INF84fDIxhUNUdigAJesHw6aeT6uHrIvyDGZ5LiEcbgDVNtk7z3uA==
X-Gm-Gg: ASbGncsoAHzuFeUIktoa+ZRuNXLUasnXWPFxLBh4QvSngyUBhndNBOgnTu2gZKs7M+L
 iXNZEtRiar8wcS08i2QuQ5FnZ4cTe03b17OliF1YXoE2i3qxG/bdWtxEJJwCxIfJxyooiOljLnc
 R/1KhGggmbAA9DXQSuykN4w4Q4Iqvf6wgxExKqXKaKDaXAQMrey10WSN/LGl4n03+chfBkJM1Y4
 uPH/yg84ytJukIaVVD+d03hWqx0gPfSAD2jvFUeUnntVx1FCtHuwgDPlALKmvHJFdSYMY0tXPzy
 dEvlNmbEVkaRR5XLGjA8+rLIiAYsThaKjgEG8LaIvup+83jueuvp4iv6QTLKjm/un48VmrA=
X-Received: by 2002:a05:600c:a418:b0:43c:fad6:fa5a with SMTP id
 5b1f17b1804b1-440a66d91cbmr9335315e9.24.1745569063560; 
 Fri, 25 Apr 2025 01:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZBsLQHuNB03USKo+AemF2nPVLejdezBsqoRXAvjTmH+TtvceXr84oTyLSWQmeHt1CNvX3vA==
X-Received: by 2002:a05:600c:a418:b0:43c:fad6:fa5a with SMTP id
 5b1f17b1804b1-440a66d91cbmr9334915e9.24.1745569063186; 
 Fri, 25 Apr 2025 01:17:43 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073ca5467sm1591850f8f.28.2025.04.25.01.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:42 -0700 (PDT)
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
Subject: [PATCH v1 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
Date: Fri, 25 Apr 2025 10:17:15 +0200
Message-ID: <20250425081715.1341199-12-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XadUZvcJq-iz7oUTeRoM4FuNN7OPF5cZlYPRb77QM9E_1745569063
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

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/io-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/io-mapping.c b/mm/io-mapping.c
index 01b3627999304..7266441ad0834 100644
--- a/mm/io-mapping.c
+++ b/mm/io-mapping.c
@@ -21,7 +21,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
 	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
 		return -EINVAL;
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	return remap_pfn_range_notrack(vma, addr, pfn, size,
 		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
 			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
-- 
2.49.0

