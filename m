Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDFAB3717
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B11910E3F4;
	Mon, 12 May 2025 12:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i9YK9rmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327B410E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bC3rmCqfA5icmQmv1eGXLPySmScZgaTKRTiPQFcrNeg=;
 b=i9YK9rmKA03tZJHhju5UwiDtKhxCCLh15GNUPeCHVL8ljp2O6d39xm97knzg2eSFcRRF2F
 l4SiBFPgdrLlbs+8AgeJxzmAOAK8Lw0bg0xiCjvk7cuNkqZenCoTm4R10LCwSwWei5Euha
 rqgexsVLOtukOYCbPdmNNBBTJ3mbfQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-GOdcCQ9sMK2VMPkrUWKchg-1; Mon, 12 May 2025 08:34:54 -0400
X-MC-Unique: GOdcCQ9sMK2VMPkrUWKchg-1
X-Mimecast-MFC-AGG-ID: GOdcCQ9sMK2VMPkrUWKchg_1747053293
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so17071175e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053293; x=1747658093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bC3rmCqfA5icmQmv1eGXLPySmScZgaTKRTiPQFcrNeg=;
 b=P3i6kXe2Bk0ANtX91zDorZ2Vb67utzuUwQCO3q27DYkpxENjYV0bgh+06w1BrIXmHT
 FYlvwU0QouxJEnp6l7K4UHjixIBVvIA4b23F/kfNjAtcRE7T8dXEShMeBFDkQa9lV0sO
 VfCWvaVa3U+nxoM5JYoVrUpCfhVDP9gadBxhGPQ1yvPI6MahydfVFNZfnu9mOF+R61/e
 MqT8yzJ9m/DapxrJAks3w+5H9LjDTw9rD1ynUMdw3SxKjKTpCVBmQBxSv2x55lI6gJDG
 +BJ69bKYmIAythuGyT0r0GYJU32EsReD4kpZlQfAs9w5g3/uNkG5ffgwBtluYjPK9aMB
 24oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2K00Kpw4Fp7O532By/bryoafDvKt0nuMxJlQ62fUWdoAz4fOIJwEdANW4kZhUDtJhqmeO87jU6JU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY7k7B+GpxiHdqZ5piZI2uCVppJyO0YCZc9odn9z9lokcqkaSo
 e3J5usWupYE/iNHd8V1T2a2yUQu15jbwgwFsX+rXlNTyYzpxxkmg4sRwAa1UJRXbVLtsYunQt+F
 8k9PmHAUjfA9Gn85/JmPm4DC+m28HcWKJ/7UiGeiutouc4USxYQKUH9wAQAM5oe5Wmw==
X-Gm-Gg: ASbGnctwTFLj1qYZzsdUD+H6Plrjp01QU7fgcUWlA0knji7ijubrkVvfZgDSC+XFUC3
 oWGuS9KJ2zXEf/BZZ9A4lpQXd1VG79K7jHApGHmPKyd8t7pgGZhaTao80DHK5TYONKMfNcTpw18
 cLB30uU1A/wqY+uFD1IAMGQJXYJMxIxVKphUrkR3d47FYIone78FZVk2jucfqEiWBqXYB8W4Tdd
 G5SvAOI6hCZWJ3QYp4FRHL8uPIpvDXdvpV5L4RjjpwTWXaaVvWPsR4ClXsyMh0OxDGi55P+lODo
 h+PKwzms7p9d2Zetuh0kmF//3d/ISceqO/a01J97KBQ43SPUOL0KWGWTgB/GjymGe+ZWXwLO
X-Received: by 2002:a05:600c:c0c3:10b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-442d6d71e58mr72191815e9.2.1747053293043; 
 Mon, 12 May 2025 05:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGmemaQ8osM6LIu2Hwsj+bFw5CfMQg914aObUDJRDyOqNqUwk6qAxyXq65jxeriv3mY00DEQ==
X-Received: by 2002:a05:600c:c0c3:10b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-442d6d71e58mr72191505e9.2.1747053292674; 
 Mon, 12 May 2025 05:34:52 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d67d74b5sm125447555e9.2.2025.05.12.05.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:52 -0700 (PDT)
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
Subject: [PATCH v2 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
Date: Mon, 12 May 2025 14:34:24 +0200
Message-ID: <20250512123424.637989-12-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y8Wu6x-AJt5hJrs8LVc-ZN9vhoo9EBkfUWGJS5Fm95U_1747053293
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

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/io-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/io-mapping.c b/mm/io-mapping.c
index f44a6a1347123..d3586e95c12c5 100644
--- a/mm/io-mapping.c
+++ b/mm/io-mapping.c
@@ -24,7 +24,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
 	pgprot_t remap_prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
 				       (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	return remap_pfn_range_notrack(vma, addr, pfn, size, remap_prot);
 }
 EXPORT_SYMBOL_GPL(io_mapping_map_user);
-- 
2.49.0

