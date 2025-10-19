Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E0BEE098
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 10:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086410E033;
	Sun, 19 Oct 2025 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mQc8zkOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F0A10E033
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 08:19:57 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo726167966b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760861996; x=1761466796; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzAnCEb80QifK9acVK1YEWu5S4rWy7O2ChI/IhFvLrQ=;
 b=mQc8zkOGvQyZLlw/P5yoJ0qYSCHNZbRx+pBqR7o7YTQEWXVWd/SkMhSVAkym09vCZA
 Nx+Wc69EjBiG4GKgXXodSI7gHrfvJpsFWjr90ufhaTTP5NjB5IvG12NOcUqRBHqHhEvs
 wGJWhh7r+zjHlTCGHFoYzmSWINUlU1ZH3pMTOqCvlbxXrl+m2fNvYF/7BQv7XcC0jqlm
 2pzDIPuqu/MR97o082JCZyKc5wfgrZiNsSXzlg/uFS+p7pDu9ZWiTUPckcc6tynD2ZAO
 1Csd7aE2bep5S8q8nk46kHpraf8urjOt8dD8wGKctopIaiecL/s8uWVoZQ+/YUtIQHCf
 wllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760861996; x=1761466796;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hzAnCEb80QifK9acVK1YEWu5S4rWy7O2ChI/IhFvLrQ=;
 b=gb52AlzUkKRB7MaUQBZSg5myMnYL5F4CH3JTD3sSBx54JHxJxWLOY/pmQTTRdqPZ7P
 XFhkEDh0vVuizEIFDordlD9CcTQSmTRWJj9A8NtQdiquK8Ec47pgXpH9FNycpC+tQrud
 L4Zoqr/wGLHDYtjS2secFagZUCU8gTgDDnJKqujquzDTDnZyjqCzAz851yLWaVr/WxFs
 jiGSFh4ulweApWn6TIp2hnAzm5KkQ+r3hgYp2ufY4ZhSjAK9cg42bp0HOIzpI3GYQven
 aSsOF0yDmZ2hJXH5FFTENuN+kFA7zt2ew3gO93fNiHL5BmRCJQIYAgLcBIIz35fTaGsN
 4v5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd+uPnw7ZEfJx0bP6Opuorv+68lb+7dME8V3Z3Zu3JxLXTWuVqjlYKa1Er5sGi2tfk7DMyvQOSo6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqRT3n9IOEHfibJ2wCwee1hrsGtlxUZoQLpDN8yGlzGnv3RkFb
 E7S49NcbaH00Ysgt7j7U4hUlQqerIgtr+ZHmD3jp3csAM1BvpSlhc3c6
X-Gm-Gg: ASbGnctE7R+TsTlPFEQ2Iz717sM/Q2RdY9b86Ni8RmxXMu6R7QJNYJNpj4AJkgJ+Hn3
 O49cQj6G9f4Pu4zuc7VQuSKM4b7jjkw00vkkrBetw088lolLX9OYN3QsONMeBwgh/CILduxaAO0
 XR/t67SjmrYb5TFcd7nFS3xs817oMwd+3conOj7713zk1rsojDZJ+v/t8xxTNvdIAN9gDHiqEgt
 YIgSWT2Drm3xgcBYaWjKEqihNkiyr0N1/TxR73CW3JQYqyLhhY2Tv8KPs9y6i37FXPsJZJynTya
 n4mxJh0XTA5ACw72/M7TVCKDYJKp4VwnpXQ3tt59UR04mwa88kHVGeao3VpMnIwQg42MnvFzbp4
 wsfCuOKFBwcIzIT4omLV9mFrBMOS4MygGlDapO59Q4HlZxfQPLNmq23sw23RJY3ZtuoI3GFVwE9
 y5xv8=
X-Google-Smtp-Source: AGHT+IGe2bSS2UoD1lk0Xxfgzd8YXhfUNUOT8b22z2p6gAASSaXv1SkNEJLCq1pmMcg1S7iCxcQ1kQ==
X-Received: by 2002:a17:906:c145:b0:b57:78fa:db48 with SMTP id
 a640c23a62f3a-b6474f185a3mr1028142366b.51.1760861995556; 
 Sun, 19 Oct 2025 01:19:55 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb499dasm457209766b.73.2025.10.19.01.19.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 Oct 2025 01:19:55 -0700 (PDT)
Date: Sun, 19 Oct 2025 08:19:54 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
Message-ID: <20251019081954.luz3mp5ghdhii3vr@master>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001065707.920170-12-balbirs@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
[...]
> static int __folio_split(struct folio *folio, unsigned int new_order,
> 		struct page *split_at, struct page *lock_at,
>-		struct list_head *list, bool uniform_split)
>+		struct list_head *list, bool uniform_split, bool unmapped)
> {
> 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>@@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 		 * is taken to serialise against parallel split or collapse
> 		 * operations.
> 		 */
>-		anon_vma = folio_get_anon_vma(folio);
>-		if (!anon_vma) {
>-			ret = -EBUSY;
>-			goto out;
>+		if (!unmapped) {
>+			anon_vma = folio_get_anon_vma(folio);
>+			if (!anon_vma) {
>+				ret = -EBUSY;
>+				goto out;
>+			}
>+			anon_vma_lock_write(anon_vma);
> 		}
> 		mapping = NULL;
>-		anon_vma_lock_write(anon_vma);
> 	} else {
> 		unsigned int min_order;
> 		gfp_t gfp;
>@@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 		goto out_unlock;
> 	}
> 
>-	unmap_folio(folio);
>+	if (!unmapped)
>+		unmap_folio(folio);
> 
> 	/* block interrupt reentry in xa_lock and spinlock */
> 	local_irq_disable();
>@@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 
> 			next = folio_next(new_folio);
> 
>+			zone_device_private_split_cb(folio, new_folio);
>+
> 			expected_refs = folio_expected_ref_count(new_folio) + 1;
> 			folio_ref_unfreeze(new_folio, expected_refs);
> 
>-			lru_add_split_folio(folio, new_folio, lruvec, list);
>+			if (!unmapped)
>+				lru_add_split_folio(folio, new_folio, lruvec, list);
> 
> 			/*
> 			 * Anonymous folio with swap cache.
>@@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 			__filemap_remove_folio(new_folio, NULL);
> 			folio_put_refs(new_folio, nr_pages);
> 		}
>+
>+		zone_device_private_split_cb(folio, NULL);
> 		/*
> 		 * Unfreeze @folio only after all page cache entries, which
> 		 * used to point to it, have been updated with new folios.
>@@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 
> 	local_irq_enable();
> 
>+	if (unmapped)
>+		return ret;

As the comment of __folio_split() and __split_huge_page_to_list_to_order()
mentioned:

  * The large folio must be locked
  * After splitting, the after-split folio containing @lock_at remains locked

But here we seems to change the prerequisites.

Hmm.. I am not sure this is correct.

>+
> 	if (nr_shmem_dropped)
> 		shmem_uncharge(mapping->host, nr_shmem_dropped);
> 

-- 
Wei Yang
Help you, Help me
