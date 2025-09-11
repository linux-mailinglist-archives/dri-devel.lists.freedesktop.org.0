Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A237BB53E20
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 23:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCB410EB97;
	Thu, 11 Sep 2025 21:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vn0rGp6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D2410EA49
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:04:07 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so80133166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757577846; x=1758182646; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCXGwUwpyKq6QC0HqHvB+PlNFDZF/zHlcXjRKnHG9yI=;
 b=Vn0rGp6MkERqPQKGPUpQ3VD0DPm/+Km9mUewiLcizurThMJ4XIqsnk9YI1h+MvbEsf
 b6By+wiiUesT7mg8As8jRcGXMMfcY2dKoL2yIJsvUnXQ+DUtHjUQlSDc6mK6Wy6txxQc
 XAXvmZ0jFJVsr//mXVdPJ5dC/gBIdEQg/epwzZRcF9aPp3XpCy/82Em7AzlDc/T78r6v
 zSuak8yM701jvRYdfOnSuzgwl3HljibxHlbXrUQjJcGxOG310OgM/1G2KpdAEva0fUMK
 DD8EC2i/7O8GGgLc/tgg5qRB591/iYzqnzMyeoPxYy/A5fvRydo67F66tT878mcHN8yC
 F1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757577846; x=1758182646;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UCXGwUwpyKq6QC0HqHvB+PlNFDZF/zHlcXjRKnHG9yI=;
 b=KV0hEicxRpB/83zB3Q93v7oUV0Kcicqcn3M8pq4uVE+3KnUL16nhjf6MnARzxxzIN5
 R63nHDInbt1V4ycaLlD28CKtb6pKw/nL2ljleTNDhFXpOPNyXaIm+SKbpcTg4mCHz63q
 YM0D9gbS65k3DKTTJNEaGF+fD0rMwvN7lA6/z0WQSZjBf7XfwAIzdEkD9NOnUSbJc2G9
 +2595ZJsz2FT/tbwS8YXyHWOhBr0/uZsAMxrI6YVH4qqfiilYGA0CqurXAJdbOzT+E3s
 GsbeR1nNVOWk9sBIHxifQ9DtRD1g+MdAgptaAgL/u8r2tiecjDtCPNL6ILHuJA5nekWt
 v5cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8yH/gMhiEi2OPwNHN3n8LVbaRcaSHai5A+1KQ5m7oVtwbOtyfSE/byhV3DmcljSRvR4CxAVfxrRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoMVaK/upGd+fp/h1dAO3xapgxkcgegUYrc5sGGZfC93fV8X7b
 yLPfP4v13M89pXGXTGI4iPB7MTiYZ+w/LV/P7i78wZTHA27+uquNcCaS
X-Gm-Gg: ASbGncvaellX3J79VBs8S+EOVO1Npt6VGwFvb8uatZV2KtFOjoALR2DaKG1K/LXw/hn
 8aq8zitm5NdnKRLkX2a5n0aj4sqhIDA3dCrSu+lYmL7SBSYeMpEK1cCv2y7iHBDhEru4bg1OFp/
 EFI97NSWvDGgjMIoYneBp9CuRwK6/C9kx/1zH6z9Ch6rhLgalwVnIzplChi6Fi0qhe0khqHNz8Z
 d1EL+wDVgyF3bFuNma6+7TGMxgxK9rs7NePgrr+4EzJO5cHOWwQ4DSei1ZZK1WVMtCxD8NRB4hN
 5d6MYlJVMSv73cnkkhSPLCJsW0d17ibgZ1wI9UCOt59b5O9Vw4j8Gx9tu5uB1P6+Vvq5Td46LSA
 AME4gNfbxIYCA4Z6ngxG5dvzfYQ==
X-Google-Smtp-Source: AGHT+IEcMSgKo4+sU99486bq3+Fvkta2bK3Nuc0JJPNS1zet5974H/X47nBk+8+kC1RGRur6L5MELw==
X-Received: by 2002:a17:907:8691:b0:afd:eb4f:d5d2 with SMTP id
 a640c23a62f3a-b07a640873dmr285777066b.31.1757577845911; 
 Thu, 11 Sep 2025 01:04:05 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2122sm75915966b.85.2025.09.11.01.04.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Sep 2025 01:04:05 -0700 (PDT)
Date: Thu, 11 Sep 2025 08:04:04 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
Subject: Re: [v4 06/15] mm/migrate_device: implement THP migration of zone
 device pages
Message-ID: <20250911080404.r6vqlhyi7qyjutij@master>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
 <20250903011900.3657435-7-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903011900.3657435-7-balbirs@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 11 Sep 2025 21:52:23 +0000
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

On Wed, Sep 03, 2025 at 11:18:51AM +1000, Balbir Singh wrote:
[...]
>@@ -836,15 +1107,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
> 					migrate->pgmap_owner);
> 				mmu_notifier_invalidate_range_start(&range);
> 			}
>-			migrate_vma_insert_page(migrate, addr, newpage,
>+
>+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
>+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
>+				nr = HPAGE_PMD_NR;

This one trigger BUILD_BUG() if !PGTABLE_HAS_HUGE_LEAVES.

>+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
>+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
>+				goto next;
>+			}
>+
>+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
> 						&src_pfns[i]);
>-			continue;
>+			goto next;

-- 
Wei Yang
Help you, Help me
