Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49371B303C5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3529210EA13;
	Thu, 21 Aug 2025 20:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UN7xm4aT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2F610EA12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
 b=UN7xm4aTKqMRPM/n21W2Oz+Den0Esmo3lXOSqbTRYLPyezEYyTVGyu1djfaJrFjsRPrWoL
 KOxO+OI43swZIFF/8cSxQ0ppUmRLSoZRfsNpmYnS/vAaV2rESmnnaHPuRvnFHWWUbGAatD
 tmokRJr+iw9DIm62cxsGEA3L3R5nOU8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-FvXivRXMNPSOfqdZ0FXurw-1; Thu, 21 Aug 2025 16:08:30 -0400
X-MC-Unique: FvXivRXMNPSOfqdZ0FXurw-1
X-Mimecast-MFC-AGG-ID: FvXivRXMNPSOfqdZ0FXurw_1755806910
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b9edf34ad0so613408f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806909; x=1756411709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
 b=Fuxr38KjlB/Tc8qAm4qvMeb7dO5u96+m98vDB73uTVoFwfXmqDzXeG5HIcBuiJRaWA
 iqSfER9+8V1Z3FNf001M1VEHHqZltE2UnhAPm4jAFDANx8Zb5Go2YkW6golX8CxXhJBJ
 etVApTiUQMqv4a1Q55Yg7tgJOgTqjkaXuz5x8WG3foi7MFF2nI3Oj9pq8V6qJp5bCgsT
 b47uF4VcVITo/tJ4d7DO8mIIttiTMcacmsqlXMVdYGj0QlgtOpuaHLGyHMbscZrUyuuy
 eDo45XarYA6EDOovReDvU2R0HYuUmNFdZwkZMjXkQb7hGLZxh+HzT0/vW8gkNL5N46We
 DXpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqI+7yTP3eFXUo5F+0rfXgE3mwL2GW+Onqpn9Gnz92ww6Ixc2iyUXA2o27LLvUVUACE7pHFtkGi3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWeFoUu6aXLRZ1YnkPEaZvwAcwWfGaIzLwWLfXfl/FUBL1xikX
 DMVpSamsna0tpEWm/3ejcVMYgxTHTFAQrazs7P1C//vCigoud24ze2tOULRm3hr3LaQy5sey0S4
 w/xNUu+oZY03RJjbtw5ddr3W683FVdzbznZjxJVYv3g+hKDx/SfuYZSl22sm1sZf0ksTHCQ==
X-Gm-Gg: ASbGncviY8iA4xEuPnbisvnLyvK5KcDKYb0X87Fc2D3AcIHzTdLuOZGRMTXmR++RC8/
 ypBI+dJj4aNwFjbNuGD3Dwla1KdzHMYtYfZq5r+2gmbySs5h2lamr+2fh/O6tw30PJ1COzAMC4s
 jM8ElnATzTuMWWun6SdgcHThG972RdCICvksoNeBHgyCTLzrQYb14+6f2oYCB9AQQTFagnm8adt
 XIyYdEfrYpCWmB8/VVn8RwGL3+lfvwrT1X0DWdaL0wIGErQOVKvz8v25slh4KQcgAtRINl5lmfk
 JO0GBdwWhEamRdw84vQHLj78ResCyBrQEC86J02pZHxCaBCM/ucbrE2d6U+3rprKWZXL9PP9Mpo
 uxjFHI0MeszwOZD5QDqUkSA==
X-Received: by 2002:a05:6000:18a6:b0:3b9:48f:4967 with SMTP id
 ffacd0b85a97d-3c5dd6bbb33mr155513f8f.56.1755806909408; 
 Thu, 21 Aug 2025 13:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRykwWh31JVJGBkobbD9YNZEskJV981iF0h0FASAg1XfgxaqZA4MQnDyPntA4/emfIOpWurA==
X-Received: by 2002:a05:6000:18a6:b0:3b9:48f:4967 with SMTP id
 ffacd0b85a97d-3c5dd6bbb33mr155476f8f.56.1755806908930; 
 Thu, 21 Aug 2025 13:08:28 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c5317abe83sm2432791f8f.40.2025.08.21.13.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:28 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Doug Gilbert <dgilbert@interlog.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 29/35] scsi: core: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:55 +0200
Message-ID: <20250821200701.1329277-30-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TGwTqHzc5FqW_zSNldzFnFDheEhTFycSPTzjkYF3Feo_1755806910
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Doug Gilbert <dgilbert@interlog.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/scsi/scsi_lib.c | 3 +--
 drivers/scsi/sg.c       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 0c65ecfedfbd6..f523f85828b89 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -3148,8 +3148,7 @@ void *scsi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
 	/* Offset starting from the beginning of first page in this sg-entry */
 	*offset = *offset - len_complete + sg->offset;
 
-	/* Assumption: contiguous pages can be accessed as "page + i" */
-	page = nth_page(sg_page(sg), (*offset >> PAGE_SHIFT));
+	page = sg_page(sg) + *offset / PAGE_SIZE;
 	*offset &= ~PAGE_MASK;
 
 	/* Bytes in this sg-entry from *offset to the end of the page */
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 3c02a5f7b5f39..2c653f2b21133 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1235,8 +1235,7 @@ sg_vma_fault(struct vm_fault *vmf)
 		len = vma->vm_end - sa;
 		len = (len < length) ? len : length;
 		if (offset < len) {
-			struct page *page = nth_page(rsv_schp->pages[k],
-						     offset >> PAGE_SHIFT);
+			struct page *page = rsv_schp->pages[k] + offset / PAGE_SIZE;
 			get_page(page);	/* increment page count */
 			vmf->page = page;
 			return 0; /* success */
-- 
2.50.1

