Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43199C6AB7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 09:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837C410E695;
	Wed, 13 Nov 2024 08:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Bii2dlgW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 973 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2024 15:46:40 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B30C610E090;
 Tue, 12 Nov 2024 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oqXVS
 MKA4Orhx7BCmHgBiLA8Z4Chd8Eu/NrdlWlTDtw=; b=Bii2dlgW5flCWZPzXEEXG
 r+5L7/p9MHORB3ZymOBVZC4Ivq2XhT5EbjQN+UFP1je2noNQH5O5VZ3qIM+B0UVt
 SuPAudRalxtv/k8u8pwLzupizku5X2P8xe90xs1UPOt5BhoyxdG/l6ZIj1WHYo+D
 72eH09/IzfICkUd0gPE/7g=
Received: from localhost.localdomain (unknown [111.0.233.109])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3P6w0dDNnFW2RAw--.8675S2; 
 Tue, 12 Nov 2024 23:28:53 +0800 (CST)
From: wang wei <a929244872@163.com>
To: tabba@google.com
Cc: ackerleytng@google.com, airlied@gmail.com, akpm@linux-foundation.org,
 david@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 jglisse@redhat.com, jhubbard@nvidia.com, keirf@google.com,
 kirill.shutemov@linux.intel.com, linux-mm@kvack.org,
 mail@maciej.szmigiero.name, maz@kernel.org, muchun.song@linux.dev,
 nouveau@lists.freedesktop.org, pbonzini@redhat.com, qperret@google.com,
 quic_eberman@quicinc.com, roypat@amazon.co.uk, rppt@kernel.org,
 seanjc@google.com, simona@ffwll.ch, vannapurve@google.com, will@kernel.org,
 willy@infradead.org, wang wei <a929244872@163.com>
Subject: Re:[RFC PATCH v1 06/10] mm/hugetlb: use separate folio->_hugetlb_list
 for hugetlb-internals
Date: Tue, 12 Nov 2024 23:28:49 +0800
Message-Id: <20241112152849.10369-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108162040.159038-7-tabba@google.com>
References: <20241108162040.159038-7-tabba@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3P6w0dDNnFW2RAw--.8675S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryxGF4xCw1xXrW7Cry8Zrb_yoW8WF43pF
 yqga4DKr48Wr9rWw1xAw45ArWSgFy8Zw4YyryS9343ZFWfKryxCan3CF15GFW8Ars8Cr12
 9w4v9F98J3WUCFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU2_MsUUUUU=
X-Originating-IP: [111.0.233.109]
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/1tbiLgOVpmcza3OdMAABs+
X-Mailman-Approved-At: Wed, 13 Nov 2024 08:40:38 +0000
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

Signed-off-by: wang wei <a929244872@163.com>
---
>diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>index 80fef38d9d64..365c73be0bb4 100644
>--- a/include/linux/mm_types.h
>+++ b/include/linux/mm_types.h
>@@ -310,6 +310,7 @@ typedef struct {
>  * @_hugetlb_cgroup: Do not use directly, use accessor in hugetlb_cgroup.h.
>  * @_hugetlb_cgroup_rsvd: Do not use directly, use accessor in hugetlb_cgroup.h.
>  * @_hugetlb_hwpoison: Do not use directly, call raw_hwp_list_head().
>+ * @_hugetlb_list: To be used in hugetlb core code only.
>  * @_deferred_list: Folios to be split under memory pressure.
>  * @_unused_slab_obj_exts: Placeholder to match obj_exts in struct slab.
>  *
>@@ -397,6 +398,17 @@ struct folio {
> 		};
> 		struct page __page_2;
> 	};
>+	union {
>+		struct {
>+			unsigned long _flags_3;
>+			unsigned long _head_3;
>+	/* public: */
>+			struct list_head _hugetlb_list;
>+	/* private: the union with struct page is transitional */
>+		};
>+		struct page __page_3;
>+	};
>+
> };
> 
As far as I know, increasing the size of folio maybe decrease 
the revenue of HVO, do you measure it?
> #define FOLIO_MATCH(pg, fl)						\
>@@ -433,6 +445,12 @@ FOLIO_MATCH(compound_head, _head_2);
> FOLIO_MATCH(flags, _flags_2a);
> FOLIO_MATCH(compound_head, _head_2a);
> #undef FOLIO_MATCH
>+#define FOLIO_MATCH(pg, fl)						\
>+	static_assert(offsetof(struct folio, fl) ==			\
>+			offsetof(struct page, pg) + 3 * sizeof(struct page))
>+FOLIO_MATCH(flags, _flags_3);
>+FOLIO_MATCH(compound_head, _head_3);
>+#undef FOLIO_MATCH
> 
> /**
>  * struct ptdesc -    Memory descriptor for page tables.
-- 
2.25.1

