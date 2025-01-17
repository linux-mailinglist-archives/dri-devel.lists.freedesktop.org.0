Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753CA154FF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA39910EB46;
	Fri, 17 Jan 2025 16:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Th4T4TQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA4410EB42
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737132876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zfWkf7jOcC7c4frzq8TYfAfSdx5PYW2q8JcVYRysSAg=;
 b=Th4T4TQU3g6Y14aaBsGwycBKf05ZL1yMgpBkh8nC7sthK6fIV02rsB7QGfB8SpgpPW2S5o
 2oGrhQ0FrbyIBY+9MNanxltjuf/QOROvsT3IffpyQJMB/gtabcF3g8ZJsOBlYXW3orKFGI
 0RcER2ZnPBuJsGacMSbmaVgKG4FkyEo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-_ODZTNY2OFO5c11PLmwNxg-1; Fri, 17 Jan 2025 11:54:34 -0500
X-MC-Unique: _ODZTNY2OFO5c11PLmwNxg-1
X-Mimecast-MFC-AGG-ID: _ODZTNY2OFO5c11PLmwNxg
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e49efd59so1037123f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737132872; x=1737737672;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zfWkf7jOcC7c4frzq8TYfAfSdx5PYW2q8JcVYRysSAg=;
 b=v37OBswlie8FCeDu0qefclZYFC5nD5KoOPIEcne3nOrm2UIOttCz2w+lyIi14MmNpl
 9bItGt5ZhZn15cnaBLh7dQIU6olZIIWG9J3z+X7+J7SMvx8xPyqsB9gYZ3CzPkFzFf3m
 /2j63p3J90qis1yVScxdnzAoGuSTQ1/14nvxg/ZvZqelMRfcd0O5HW/tgc9ROP0dKhBu
 n6jnPV7c97k/HcX/3gZLA8jn5qkyODW+XKdRmi5qO4SB8udHnx0Og7Oy85GThrUJNLse
 eFy1Zgm9Xq/eRSatfuiMGkWHvaMfL1zdQGHqBiDpEdGE5asrfMZUSlAtlkPyJj67Juwg
 jULg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMjC9rCBf76nyMSC7G8p2oCsn89YXWQnjAM9IcDFLB0YnFLHMAFj+XGzekyOiIFsJPp8S/gYxQL3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnVJ2ESlv6t+gdnsnRSCW9kiUE3cKo36dcz/V+yPv4GWdPcFZO
 mgsrli1pcMhMhkf+Rt28CSp5DOHfaLyJZtNq6+E+xYynyEOeAFA1RINWTZmzikqeu86wa7xajel
 a1gMEWfAa6YVgXJNM1BRlIiEBIlDL5robXOA8+4V0dpDdQmwplDyQyXl4STpcipngQQ==
X-Gm-Gg: ASbGncvt+Hp5J7KK5wr8a64AsBNSViRCTqbG+TYgTWyLURKJTEUc81wGcENv67Fo+K8
 lUiJNEBdIJLEO3MUqDEtjcjMJhT64/zzXDdwg59SbFUje8XFl2/JlSftmIKDHK6F6c8QHmsiM/6
 HrFIDaOLZylaVCdTRcdZIaZ6Ls22sGFMKLLz6cXHiC/zaMgBqoY0lMDtTYG4xA2nFoqBrH6TEkw
 TxqA1uvuCrDxrrnHdVJu+tJd+Qzlki6RzSoO/7FKF1/qgeSae3WSrA=
X-Received: by 2002:a05:6000:1a8d:b0:385:f062:c2df with SMTP id
 ffacd0b85a97d-38bf566e6bdmr3418355f8f.11.1737132872487; 
 Fri, 17 Jan 2025 08:54:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg0R28RcG9stznVMWx+t2/tR2M8SYvFLBFVP0r4Z9nONoGED1bYXW9AWTUZf5tixAjGwa1WQ==
X-Received: by 2002:a05:6000:1a8d:b0:385:f062:c2df with SMTP id
 ffacd0b85a97d-38bf566e6bdmr3418326f8f.11.1737132872094; 
 Fri, 17 Jan 2025 08:54:32 -0800 (PST)
Received: from [10.10.13.81] ([45.156.240.116])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221c30sm2993875f8f.32.2025.01.17.08.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 08:54:30 -0800 (PST)
Message-ID: <6bdab899-3307-4a78-9352-b565ffae5ba8@redhat.com>
Date: Fri, 17 Jan 2025 17:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
 <20250114080927.2616684-2-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250114080927.2616684-2-vivek.kasireddy@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yqB4jgsM6C6CSQhlseiXffYlI09cRphJ30-DJhGiZjw_1737132872
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 14.01.25 09:08, Vivek Kasireddy wrote:
> There are cases when we try to pin a folio but discover that it has
> not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> but there is a chance that we might encounter a crash/failure
> (VM_BUG_ON(!h->resv_huge_pages)) if there are no active reservations
> at that instant. This issue was reported by syzbot:
> 
> kernel BUG at mm/hugetlb.c:2403!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted
> 6.13.0-rc5-syzkaller-00161-g63676eefb7a0 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2403
> Code: 1f eb 05 e8 56 18 a0 ff 48 c7 c7 40 56 61 8e e8 ba 21 cc 09 4c 89
> f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 35 18 a0 ff 90 <0f> 0b 66
> 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
> RSP: 0018:ffffc9000d3d77f8 EFLAGS: 00010087
> RAX: ffffffff81ff6beb RBX: 0000000000000000 RCX: 0000000000100000
> RDX: ffffc9000e51a000 RSI: 00000000000003ec RDI: 00000000000003ed
> RBP: 1ffffffff34810d9 R08: ffffffff81ff6ba3 R09: 1ffffd4000093005
> R10: dffffc0000000000 R11: fffff94000093006 R12: dffffc0000000000
> R13: dffffc0000000000 R14: ffffea0000498000 R15: ffffffff9a4086c8
> FS:  00007f77ac12e6c0(0000) GS:ffff88801fc00000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f77ab54b170 CR3: 0000000040b70000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   memfd_alloc_folio+0x1bd/0x370 mm/memfd.c:88
>   memfd_pin_folios+0xf10/0x1570 mm/gup.c:3750
>   udmabuf_pin_folios drivers/dma-buf/udmabuf.c:346 [inline]
>   udmabuf_create+0x70e/0x10c0 drivers/dma-buf/udmabuf.c:443
>   udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:495 [inline]
>   udmabuf_ioctl+0x301/0x4e0 drivers/dma-buf/udmabuf.c:526
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:906 [inline]
>   __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Therefore, to avoid this situation and fix this issue, we just need
> to make a reservation (by calling hugetlb_reserve_pages()) before
> we try to allocate the folio. This will ensure that we are properly
> doing region/subpool accounting associated with our allocation.
> 
> While at it, move subpool_inode() into hugetlb header and also
> replace the VM_BUG_ON() with WARN_ON_ONCE() as there is no need to
> crash the system in this scenario and instead we could just warn
> and fail the allocation.
> 
> Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")
> Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>   include/linux/hugetlb.h |  5 +++++
>   mm/hugetlb.c            | 14 ++++++--------
>   mm/memfd.c              | 14 +++++++++++---
>   3 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index ae4fe8615bb6..38c580548564 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -712,6 +712,11 @@ extern unsigned int default_hstate_idx;
>   
>   #define default_hstate (hstates[default_hstate_idx])
>   
> +static inline struct hugepage_subpool *subpool_inode(struct inode *inode)
> +{
> +	return HUGETLBFS_SB(inode->i_sb)->spool;
> +}
> +
>   static inline struct hugepage_subpool *hugetlb_folio_subpool(struct folio *folio)
>   {
>   	return folio->_hugetlb_subpool;
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index c498874a7170..ef948f56b864 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -251,11 +251,6 @@ static long hugepage_subpool_put_pages(struct hugepage_subpool *spool,
>   	return ret;
>   }
>   
> -static inline struct hugepage_subpool *subpool_inode(struct inode *inode)
> -{
> -	return HUGETLBFS_SB(inode->i_sb)->spool;
> -}
> -
>   static inline struct hugepage_subpool *subpool_vma(struct vm_area_struct *vma)
>   {
>   	return subpool_inode(file_inode(vma->vm_file));
> @@ -2397,12 +2392,15 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>   	struct folio *folio;
>   
>   	spin_lock_irq(&hugetlb_lock);
> +	if (WARN_ON_ONCE(!h->resv_huge_pages)) {
> +		spin_unlock_irq(&hugetlb_lock);
> +		return NULL;
> +	}
> +
>   	folio = dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
>   					       nmask);
> -	if (folio) {
> -		VM_BUG_ON(!h->resv_huge_pages);
> +	if (folio)
>   		h->resv_huge_pages--;
> -	}
>   
>   	spin_unlock_irq(&hugetlb_lock);
>   	return folio;
> diff --git a/mm/memfd.c b/mm/memfd.c
> index 35a370d75c9a..0d128c44fb78 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -70,7 +70,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>   #ifdef CONFIG_HUGETLB_PAGE
>   	struct folio *folio;
>   	gfp_t gfp_mask;
> -	int err;
> +	int err = -ENOMEM;
>   
>   	if (is_file_hugepages(memfd)) {
>   		/*
> @@ -79,12 +79,16 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>   		 * alloc from. Also, the folio will be pinned for an indefinite
>   		 * amount of time, so it is not expected to be migrated away.
>   		 */
> +		struct inode *inode = file_inode(memfd);
>   		struct hstate *h = hstate_file(memfd);
>   
>   		gfp_mask = htlb_alloc_mask(h);
>   		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
>   		idx >>= huge_page_order(h);
>   
> +		if (!hugetlb_reserve_pages(inode, idx, idx + 1, NULL, 0))
> +			return ERR_PTR(err);
> +
>   		folio = alloc_hugetlb_folio_reserve(h,
>   						    numa_node_id(),
>   						    NULL,
> @@ -95,12 +99,16 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>   							idx);
>   			if (err) {
>   				folio_put(folio);
> -				return ERR_PTR(err);
> +				goto err;
>   			}
> +
> +			hugetlb_set_folio_subpool(folio, subpool_inode(inode));
>   			folio_unlock(folio);
>   			return folio;
>   		}
> -		return ERR_PTR(-ENOMEM);
> +err:
> +		hugetlb_unreserve_pages(inode, idx, idx + 1, 0);

Hmmm, shouldn't we maybe only un-reserve if we were responsible for the 
reservation above?

If it's already reserved before this call, we should probably leave it 
as is?

Or maybe we never want to un-reserve at all here?

-- 
Cheers,

David / dhildenb

