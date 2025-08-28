Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC35B3B413
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68DC10EB52;
	Fri, 29 Aug 2025 07:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BBQi8/Cm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAB610E6C8;
 Thu, 28 Aug 2025 07:35:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-61caf8fc422so971901a12.2; 
 Thu, 28 Aug 2025 00:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366529; x=1756971329; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=;
 b=BBQi8/CmfbT1P4u+3tiLTvw72EOnX47hcJihIblfv1ZkGtZPDCfk3npSEBiZGVlFkO
 YXo5d5bZZVq/IOzbErkvX1V/Bcvw2sGeKupkO8QvzOEkst13x3PNkMiQ5PewGRy+wYpP
 ApF/Y16PFRgPJD9xmZC1IDT80hVX7kc9Ljodo190j8zFPTeOYvN2Sti0AT3m2wQ9i9SF
 2KkNbrsCDLdbggH9V0kVzj6ZBYMMKIAmQTzXCe3TufIQxMgnRadJ/Ixc4wG3dxhoDHda
 wX3E1kqaMsPSuNhn5P62vilf3WKbJkW+NTt3MMoaDeDF0H2kv1xIuAFR3j3yw8kXimJ/
 dXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366529; x=1756971329;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=;
 b=Tr+v3KGztkDx3oaRQ/Pl2BESWC6DrQ54d3gF6T28CrAZ7AsXakzhlMIXDCyN/AklZT
 pt2G84b83bhlKQzCaF9CeqN3B8qsY1WoQopaW8hBwhQFUIs1FqaPp0VHosjadzxmCcbC
 +MWi0NqqVvEkr2X94odGq5pyHDgA+zMIIwFLYi2/Iy1aFAk55nYDrRUe+lD+EswkQKpH
 CrrYZkwFnxnlBgZUTvid5tXnQEKRa038NDo46qgLvkQMP9TwSbCzrHh1Y+G+qXWot6Cg
 /njLVCcQqVU7OkUakjQRIGaXFhBpsxhkSomEYyKnkbbbE9VMZlS9XqNNPt5zFBisK3dr
 MC0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDai3PMjuoAl4ziNeRvCS+I8Us5dRDwV+/hbAB+ID4fgrfybPJZMuuG/cvm2bftkqtZ8oef8+jcT8=@lists.freedesktop.org,
 AJvYcCVMVXUq1Yn2S8PkLZAScbjfHHoqlrRGIQetKvYZzFzUYd2OPlV7uN1TCLkI2UC861/SP09XVcEXQxPC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzHD1YYI1QU9knqhFHGPK/9o1Cm78G8ltFK7GJftjXdQeskBiR
 4EKBtUqkThj+e1n1jYHCZfa7pCLXbitTjGWeArDg31cVMkH0v7R81T/kgA3M2xTy
X-Gm-Gg: ASbGncudyF1YpVTSyMf2Q9fxPdFgVEnooVcbvRRWzdYdAzOJI4lmj4HeZ0cYf03raBf
 B743prOo8eZ4Dpum6/vL2ULsi5ExrJWC626NIr8lmak47CnnF7OwW1tK5NswyxDEO4XK0pm1Yp6
 SpZzBBFG9FvU9vVREKwiKk5xnYIJqJWdoNAiiFZ/4woYWkmgqr64FfcVUG0dijf46jKQwhs5mrV
 9ek1LKfhTM7tmMKCxZTTxACUzhUmbvfVFebP+iPzCSv4a+pi4UnXCW8TMUrClxtUSaA92oqLZRX
 4vqVbeRIPF2SmzOVFX5xKXOt9Goi8/rDX7f2E63ExHp+ulkZ9UZWsSJYnUhpSChGVSSDAiAAbNQ
 UeJpA6Ua+fax+MmVJiOtwEh5JBQ==
X-Google-Smtp-Source: AGHT+IH+/HdQFSXw/W0bPc1NEIz4PAWk+piUx/7dt/vdSor64JcoeKILsFtoJ4Brv3+pRvjO+XdeaA==
X-Received: by 2002:a17:907:3f0a:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-afed590c109mr310258266b.20.1756366529084; 
 Thu, 28 Aug 2025 00:35:29 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe77c2b758sm886311466b.84.2025.08.28.00.35.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:35:28 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:35:27 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 09/36] mm/mm_init: make memmap_init_compound() look
 more like prep_compound_page()
Message-ID: <20250828073527.u4k47fohaquzf3pg@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-10-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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

On Thu, Aug 28, 2025 at 12:01:13AM +0200, David Hildenbrand wrote:
>Grepping for "prep_compound_page" leaves on clueless how devdax gets its
>compound pages initialized.
>
>Let's add a comment that might help finding this open-coded
>prep_compound_page() initialization more easily.
>
>Further, let's be less smart about the ordering of initialization and just
>perform the prep_compound_head() call after all tail pages were
>initialized: just like prep_compound_page() does.
>
>No need for a comment to describe the initialization order: again,
>just like prep_compound_page().
>
>Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
