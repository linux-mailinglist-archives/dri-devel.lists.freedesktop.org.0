Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E8A2F8F2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCC310E613;
	Mon, 10 Feb 2025 19:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iMPn+tH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DD810E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxIo4/a9ZeK4nnisZvQU6AU2gxtpzJDN86Rrv62j7Tk=;
 b=iMPn+tH9G3FTpgC/rPymOg1on9OC9SCUJvtz1LitdmiybXPFY/ai+T5CDMa/sYBG8dFaDu
 2L0RBt4HbbZnprfGeKJISs1ykaWSH39JG+BkZpmTGliQZq12T/aYyZlIT/0u2Pr/F9Xzh4
 YaPD/ITZuj4fwHdwpDhN/jiHWcDgxXo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-rQpZ8CZwO8CziwM338Jufw-1; Mon, 10 Feb 2025 14:39:10 -0500
X-MC-Unique: rQpZ8CZwO8CziwM338Jufw-1
X-Mimecast-MFC-AGG-ID: rQpZ8CZwO8CziwM338Jufw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dcc9653a7so1362117f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216349; x=1739821149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxIo4/a9ZeK4nnisZvQU6AU2gxtpzJDN86Rrv62j7Tk=;
 b=lZoBXBsgC1+DebRv+F6itjRTKGwW0wVYf4FMCcpUNI/iMwO96mir2yPZrklE/x2MBX
 kd61FUPuSzfgftroT24GoP2StUdRwhccERVoCArUPErst53Rkb8Rxn8o1v2UAAsqmOpz
 aglErGjKEewZ63oUH5RahmImVL8mVuIDLEmbp4Qb/1EiBmOTZ0YTwhZiwBQSslNGBvcM
 6M//LDXK0UsRSh2wzwBXDU+NVrqmDkrkJxafknPw/51n05L9QRWR5JrrEIQg/YrRg6lU
 oMYPuhmnTBG6G3fRckaoHB8TX0W9jXMCT1hnfDA4ri/n2P43azsNrLSvOdOcKidL8l8z
 IZrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuf8z2hfimmppZsFE99YN8MaAhLg8Ccqqg38xYrcmu7yt2TjIeMJX7RLl8tWmpAPYaRt+G7+kSIlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9mSqAOog4UtiMLBw3yDP20/i5cDEQIZg3bt2zkqm1h4ODYiQY
 K0wJ8JUbrFd+QnYi263FjwD2SJLFT0Qkeuo9L144OaNhwyW0G6yrZeaGF4PpJXzqRCkm9qwYi1o
 /u8JXL+woZzpY0vD7Z7oKyN1SkN7WuE3I73Q7PnFjxTFA0yVXm+voFDZcmsdg70dWZw==
X-Gm-Gg: ASbGncuCslaEIw+VCEkURNepnagNTH+K8bjWEKzOyspLTVJZSrAuFDkG7/b5C8qXeU2
 WWT6dB1IIiS8lYM56h3XozrN7nqJDfpYgZKtdTQFaoafy1F+D1t/8ut2Wpcfc5levOgDwpTx937
 Zbn3rnxVhyW/qByi8EoBZMb+SDKIH+WAMNXCFaMZxYDJdFkpp2SS6kGIcfTEpfNYZ5D5POJx7zs
 HgfoEB7Pt+3hjG3LUperEfMOzG1Zn1q3mFcIQionjIzTcT9GhuuwFxzHa1S7cWXjoXYm00XWAyS
 r0Ffi2kYjCf5ICmk6GaviLP8Gh9TvqNrqUPlcrqGYJzHwtfFHUScNB5IRxrUpu0iZg==
X-Received: by 2002:a05:6000:1448:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38dc9343f89mr13325614f8f.33.1739216349527; 
 Mon, 10 Feb 2025 11:39:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOm3YA+KmUhyhlND1SLmjpOJWvwKHSp1MsMH3YdrdBRb69cVHv165Q1M/eFn8bTRexW9yPlw==
X-Received: by 2002:a05:6000:1448:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38dc9343f89mr13325571f8f.33.1739216349113; 
 Mon, 10 Feb 2025 11:39:09 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dca0b4237sm10326047f8f.85.2025.02.10.11.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:39:07 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 17/17] mm/rmap: avoid -EBUSY from make_device_exclusive()
Date: Mon, 10 Feb 2025 20:37:59 +0100
Message-ID: <20250210193801.781278-18-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CC_V9KPWuMtt1ZDQWOOOJbD1xncuQUXla3yo4AKGxZA_1739216349
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

Failing to obtain the folio lock, for example because the folio is
concurrently getting migrated or swapped out, can easily make the callers
fail: for example, the hmm selftest can sometimes be observed to fail
because of this. Instead of forcing the caller to retry, let's simply
retry in this to-be-expected case.

Similarly, avoid spurious failures simply because we raced with someone
(e.g., swapout) modifying the page table such that our folio_walk fails.

Simply unconditionally lock the folio, and retry GUP if our folio_walk
fails. Note that the folio_walk repeatedly failing is not something we
expect.

Note that we might want to avoid grabbing the folio lock at some point;
for now, keep that as is and only unconditionally lock the folio.

With this change, the hmm selftests don't fail simply because the folio
is already locked. While this fixes the selftests in some cases, it's
likely not something that deserves a "Fixes:".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index e2a543f639ce3..0f760b93fc0a2 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2435,6 +2435,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	struct page *page;
 	swp_entry_t entry;
 	pte_t swp_pte;
+	int ret;
 
 	mmap_assert_locked(mm);
 	addr = PAGE_ALIGN_DOWN(addr);
@@ -2448,6 +2449,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * fault will trigger a conversion to an ordinary
 	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
 	 */
+retry:
 	page = get_user_page_vma_remote(mm, addr,
 					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
 					&vma);
@@ -2460,9 +2462,10 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 
-	if (!folio_trylock(folio)) {
+	ret = folio_lock_killable(folio);
+	if (ret) {
 		folio_put(folio);
-		return ERR_PTR(-EBUSY);
+		return ERR_PTR(ret);
 	}
 
 	/*
@@ -2488,7 +2491,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		mmu_notifier_invalidate_range_end(&range);
 		folio_unlock(folio);
 		folio_put(folio);
-		return ERR_PTR(-EBUSY);
+		goto retry;
 	}
 
 	/* Nuke the page table entry so we get the uptodate dirty bit. */
-- 
2.48.1

