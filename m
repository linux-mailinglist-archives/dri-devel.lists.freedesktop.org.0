Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83364A21CD8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B952E10E7D7;
	Wed, 29 Jan 2025 11:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YAHcztfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99C10E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOqcQk5sbfQYMqiwFwVZu0o4Vgt4WnJhwl3OPDX2fpI=;
 b=YAHcztfyQgRI213DyDuuD9Xe8Wsi6bt2l8F4bXnlyLIb4gjzpLgy7LIykkuQUHTFPQIpVe
 WbVV+rkuABPb3UO8m5N4tPE1BfldGKngpC2EKrzxCvM1Bv62DFi0E8IY1OL+itK2kUm0F4
 I69Q/AfokvqlKCxnEimsRq2L0rqonPI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-MgIZOryTPIy_zJx77YrMCQ-1; Wed, 29 Jan 2025 06:58:19 -0500
X-MC-Unique: MgIZOryTPIy_zJx77YrMCQ-1
X-Mimecast-MFC-AGG-ID: MgIZOryTPIy_zJx77YrMCQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so3083205e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151898; x=1738756698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOqcQk5sbfQYMqiwFwVZu0o4Vgt4WnJhwl3OPDX2fpI=;
 b=kofpthOOtK6dMibtCdv+3eHk5iINbUz6/NqjXnb/gXAyWKILljVJcKoNPEnNKGRNTe
 S5zmqy+uywG/xssC68jmO26QRtcvMpVrLuQfwqF5VeRrTqfpdzCxZaSVG3xqvWwg+a4A
 heI5NfDGZb8CMGkLKUTegaDGaQKjupQsDFzKim45LLWWTnAt2BJY3Eo3hWc31SP0m9bK
 NnMiV9T8Xfg/V8LGTOQU14b7Sujsk1BfTayEELlRDyyCkOAq58pNZStgM0mL64as7l+Z
 7HSPB6ZpZy3LtcrViNoGm0yVHxhqH+gI2LC/0X84h7g+xwBlpsIhd8BU5585GeavzNZ7
 c/Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHt2tpHyzKCp670d4RcQzNjugafliobYPRXDTV6w+uFFfRK+ew3rpmWZXQgJbh2/vm/xq/8jMFvmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwFWr8GZbku7PVNz17EHSH+Vv61NsFUslGWSuyFJSdSIXKELl+
 e4O23D5kTuOmkUX/QLJjAXQs326l1M2fAY6hCM8x4qX13Iv6fI0jM93SOe6htyNSbVwoiXKSRJ5
 LlbxCbX+wZ1QFuuRjxpdf1JI+yvxPHEJ2WAkONTXOUXU/qHSYlj9T20zduh8faEcUDg==
X-Gm-Gg: ASbGncvwGk1Xm7uXl13RPGSUOhXb+ef/WMwpPDSkbb1t283NN2dxEMGqFo1+vxwyNHa
 SK3eXZvGNRtAzWbNpoj4d4fVVPVsZWKt/7pmQNsEYPux2OmJfF2qYj4/aAAJjHewrpENE0lnhiq
 FBeJW6w/kHOmTZDIbBxqQbg7g3XzrANpVx07HMW3JXi9e2ttYe2qWn2VPQcNOzjs77IbfJ2s025
 vAu/gAVFq+Ugi6ra3sX9Td2YqkmpE9ZUyzJNX/389FwEVmOFPUJQaCTk337OJJR8BSlXBy8byyy
 sbz+CXZbbQn9eCMl7kGLNCqBxznQGq57bdNcFxXlNaTQUY/zBpRh52Eg9b2r9gpIbA==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id
 5b1f17b1804b1-438dbe9a124mr27335865e9.9.1738151898334; 
 Wed, 29 Jan 2025 03:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUOJXNPPQ6xLco9EGZUl9hRUezUN+y2Deyf0uuUDDMY6E4w4fKpt4O5zyjSgxt4LyQtnHPOg==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id
 5b1f17b1804b1-438dbe9a124mr27335535e9.9.1738151897999; 
 Wed, 29 Jan 2025 03:58:17 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc33e04sm20207605e9.29.2025.01.29.03.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:17 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Date: Wed, 29 Jan 2025 12:58:02 +0100
Message-ID: <20250129115803.2084769-5-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uSQng3L8DQ1adRViS5pVSq1FnwjTivzp3hvqlwG_8TI_1738151898
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

Let's document how this function is to be used, and why the requirement
for the folio lock might maybe be dropped in the future.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 46956994aaff..caaae8df11a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 }
 #endif
 
+/**
+ * restore_exclusive_pte - Restore a device-exclusive entry
+ * @vma: VMA covering @address
+ * @folio: the mapped folio
+ * @page: the mapped folio page
+ * @address: the virtual address
+ * @ptep: PTE pointer into the locked page table mapping the folio page
+ * @orig_pte: PTE value at @ptep
+ *
+ * Restore a device-exclusive non-swap entry to an ordinary present PTE.
+ *
+ * The folio and the page table must be locked, and MMU notifiers must have
+ * been called to invalidate any (exclusive) device mappings. In case of
+ * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
+ * fault MMU_NOTIFY_EXCLUSIVE is triggered.
+ *
+ * Locking the folio makes sure that anybody who just converted the PTE to
+ * a device-private entry can map it into the device, before unlocking it; so
+ * the folio lock prevents concurrent conversion to device-exclusive.
+ *
+ * TODO: the folio lock does not protect against all cases of concurrent
+ * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
+ * must already use MMU notifiers to sync against any concurrent changes
+ * Maybe the requirement for the folio lock can be dropped in the future.
+ */
 static void restore_exclusive_pte(struct vm_area_struct *vma,
 		struct folio *folio, struct page *page, unsigned long address,
 		pte_t *ptep, pte_t orig_pte)
-- 
2.48.1

