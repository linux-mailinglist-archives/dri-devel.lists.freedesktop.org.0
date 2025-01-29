Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47910A21C90
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8C310E7BE;
	Wed, 29 Jan 2025 11:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b8T9JxUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F3F10E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZQr+sWP4JJuuRk9zHd8B8Ps+AYS2S2IVxxQCmOGAGE=;
 b=b8T9JxUr6CwHJkzWGqThYfzmk1D1pNcSFBazeOMP0WDroKCeeC5S/qtws5uZtII4yfWvC0
 8vri2GUsd67M1q/56yTk7PqgBDwuyH772ze8EydLokzWMahVTJiPJMCdtXAn2MuRz8O/hv
 DyC3KGW6l+R7rItqsnzxCdtDghRaJuQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-Awc4vzguM_mvam2IBM6caw-1; Wed, 29 Jan 2025 06:54:18 -0500
X-MC-Unique: Awc4vzguM_mvam2IBM6caw-1
X-Mimecast-MFC-AGG-ID: Awc4vzguM_mvam2IBM6caw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361b090d23so34439145e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151657; x=1738756457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZQr+sWP4JJuuRk9zHd8B8Ps+AYS2S2IVxxQCmOGAGE=;
 b=WLsUOMg+YGQ9Q81pA+dPG8qaTgSJw17o0QW/BpfIMjFvDqsd/oCKo4rr+G+BsQ6tn6
 PzC6y7FxuqSsr+r+jo8SehQPMckS7TwVDX0vZClmuaZVyyhXI34An6yLsbBEQrauyR1Y
 SIQLoUTsCwqUCTHmPLecQCWw3SwbmdHOpQWD+7layuHi+YIIGlLSBpJyaCt4hzFyhYii
 RrMzPXT+TsIPdAohtKcrFfXPWB0DkGkLKgLFu18LTecnpUmZ6HNzdBltWYdlrxQFIk6e
 17CgRWYogjSzsD5c9n6YadSE+RTIeYtNkySjRBkzthv246ee4dRPqA9qrxIwRQHYIcMt
 1STg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5nogWet6SWHKxPhDI65QiC4rS4eRR03/9i5gxYIa3lGwBXBIIS0pSAWtz937qsr5Z9rdHzH9MTG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzJDoT/A3V/St5M0ztlo2UCRGcBY+EokLUgS19wriNdt81BNqI
 1LCFuSdxkwR/po+CZ7qJJe/fW6BnMmIbr/gPs3qB78oRmTjM51R5ATS+eMzKrzxzW3SbfpdvzO5
 NGAme2Pi2+vGiaZX4qKzm3n14HKvejCkal1iRdKnOxi0aikc+QOzzcOHS1m+JPSBMX4yHLOKPMU
 kp
X-Gm-Gg: ASbGnctFKh8TN3rb/ZZ4xZmjruiqIMu7X8h+2aHOQhaXGh7kCEdKruPteAhQytO9xkA
 jj8RDkk01fICiwymznmFp6LYxYI+1m2by78U6k2j6h7ytoXpKEm3MCTskLpFH1tQMQeHVBCEppx
 Dem5a9IeAzMxSj9fyVBx5u4Yj7B4nx9SOiMpT/m1p/ZJixHz/kfIh86wjqNVIvr5LfK+pf8aE/y
 xeFjyTLi7Hm+hs9rvk/pUAvLywfc3CcTt9uNGFfXJmMxxJqJMxFCUw7WSaFq02dKECSBjvy07QW
 M81yIVW7IaX1GSTgiXH0gwLdiGEGmvkHylLHspX0bTcY4WLPUk1NKbypBQNWhzgoUg==
X-Received: by 2002:a05:600c:cce:b0:434:ff9d:a370 with SMTP id
 5b1f17b1804b1-438dc3366f8mr24658455e9.0.1738151657106; 
 Wed, 29 Jan 2025 03:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIkSHUg8u1CZ6d8yOIa8EuB96MLk/b/TKJcDJCOFvAxggFPdf4ivg/UC1RFEcPGInF41YvMw==
X-Received: by 2002:a05:600c:cce:b0:434:ff9d:a370 with SMTP id
 5b1f17b1804b1-438dc3366f8mr24658175e9.0.1738151656750; 
 Wed, 29 Jan 2025 03:54:16 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bad92sm16868229f8f.61.2025.01.29.03.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:15 -0800 (PST)
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
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 stable@vger.kernel.org
Subject: [PATCH v1 01/12] mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
Date: Wed, 29 Jan 2025 12:53:59 +0100
Message-ID: <20250129115411.2077152-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SsJqPizDb0lBrE2oojyCUqPw80xK_2OF4L1WImRTQog_1738151657
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

We only have two FOLL_SPLIT_PMD users. While uprobe refuses hugetlb
early, make_device_exclusive_range() can end up getting called on
hugetlb VMAs.

Right now, this means that with a PMD-sized hugetlb page, we can end
up calling split_huge_pmd(), because pmd_trans_huge() also succeeds
with hugetlb PMDs.

For example, using a modified hmm-test selftest one can trigger:

[  207.017134][T14945] ------------[ cut here ]------------
[  207.018614][T14945] kernel BUG at mm/page_table_check.c:87!
[  207.019716][T14945] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  207.021072][T14945] CPU: 3 UID: 0 PID: ...
[  207.023036][T14945] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
[  207.024834][T14945] RIP: 0010:page_table_check_clear.part.0+0x488/0x510
[  207.026128][T14945] Code: ...
[  207.029965][T14945] RSP: 0018:ffffc9000cb8f348 EFLAGS: 00010293
[  207.031139][T14945] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: ffffffff8249a0cd
[  207.032649][T14945] RDX: ffff88811e883c80 RSI: ffffffff8249a357 RDI: ffff88811e883c80
[  207.034183][T14945] RBP: ffff888105c0a050 R08: 0000000000000005 R09: 0000000000000000
[  207.035688][T14945] R10: 00000000ffffffff R11: 0000000000000003 R12: 0000000000000001
[  207.037203][T14945] R13: 0000000000000200 R14: 0000000000000001 R15: dffffc0000000000
[  207.038711][T14945] FS:  00007f2783275740(0000) GS:ffff8881f4980000(0000) knlGS:0000000000000000
[  207.040407][T14945] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  207.041660][T14945] CR2: 00007f2782c00000 CR3: 0000000132356000 CR4: 0000000000750ef0
[  207.043196][T14945] PKRU: 55555554
[  207.043880][T14945] Call Trace:
[  207.044506][T14945]  <TASK>
[  207.045086][T14945]  ? __die+0x51/0x92
[  207.045864][T14945]  ? die+0x29/0x50
[  207.046596][T14945]  ? do_trap+0x250/0x320
[  207.047430][T14945]  ? do_error_trap+0xe7/0x220
[  207.048346][T14945]  ? page_table_check_clear.part.0+0x488/0x510
[  207.049535][T14945]  ? handle_invalid_op+0x34/0x40
[  207.050494][T14945]  ? page_table_check_clear.part.0+0x488/0x510
[  207.051681][T14945]  ? exc_invalid_op+0x2e/0x50
[  207.052589][T14945]  ? asm_exc_invalid_op+0x1a/0x20
[  207.053596][T14945]  ? page_table_check_clear.part.0+0x1fd/0x510
[  207.054790][T14945]  ? page_table_check_clear.part.0+0x487/0x510
[  207.055993][T14945]  ? page_table_check_clear.part.0+0x488/0x510
[  207.057195][T14945]  ? page_table_check_clear.part.0+0x487/0x510
[  207.058384][T14945]  __page_table_check_pmd_clear+0x34b/0x5a0
[  207.059524][T14945]  ? __pfx___page_table_check_pmd_clear+0x10/0x10
[  207.060775][T14945]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[  207.061940][T14945]  ? __pfx___lock_acquire+0x10/0x10
[  207.062967][T14945]  pmdp_huge_clear_flush+0x279/0x360
[  207.064024][T14945]  split_huge_pmd_locked+0x82b/0x3750
...

Before commit 9cb28da54643 ("mm/gup: handle hugetlb in the generic
follow_page_mask code"), we would have ignored the flag; instead, let's
simply refuse the combination completely in check_vma_flags(): the
caller is likely not prepared to handle any hugetlb folios.

We'll teach make_device_exclusive_range() separately to ignore any hugetlb
folios as a future-proof safety net.

Fixes: 9cb28da54643 ("mm/gup: handle hugetlb in the generic follow_page_mask code")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 3883b307780e..61e751baf862 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1283,6 +1283,9 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 	if ((gup_flags & FOLL_LONGTERM) && vma_is_fsdax(vma))
 		return -EOPNOTSUPP;
 
+	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
+		return -EOPNOTSUPP;
+
 	if (vma_is_secretmem(vma))
 		return -EFAULT;
 
-- 
2.48.1

