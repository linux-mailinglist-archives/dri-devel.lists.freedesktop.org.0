Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B027F4F8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 00:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D956E831;
	Wed, 30 Sep 2020 22:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21256E830;
 Wed, 30 Sep 2020 22:18:35 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7503d50000>; Wed, 30 Sep 2020 15:16:53 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 22:18:31 +0000
Received: from agoins-ThinkPad-P50.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Sep 2020 22:18:30 +0000
From: Alex Goins <agoins@nvidia.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH RFC 0/1] drm/ttm: Allocate transparent huge pages without
 clearing __GFP_COMP
Date: Wed, 30 Sep 2020 17:18:20 -0500
Message-ID: <20200930221821.13719-1-agoins@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601504213; bh=tMz3LKthgMWnzr+Vh8IQBgPkRR2AQ1/d22RThpXsnoY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
 b=mwGFiDJ29YNCR0H+y/SRd0On62HFQ+reIG+9/N/VhoHqenLu8TGk9HKHlC56iB4cs
 MVOm9C3Pq4p1ai3t7MZGhJrMmvA2It9getxhN8IAOJ8K9LVt92G3euxwFv75pi9bh+
 v0tuhThKhhNBASSNhAdh7DD3I6a4Bzr+/9xYRHZDyhWHAQ2zGdkoxcgoy2FdBSyDDv
 /c7TOZeoGy8pEhjXDcHYa3aRz+rLgRhp4ksb/LUSIGLGcII9gb6baAXhikiHpbv/oR
 Vl6V8QQzU/HyIDwCjKUO1nS7CdRh5zTR2qMlG2xdJcHpsCeRna2p09i4yUD7mmuV5u
 BR9dG8ExpM9BQ==
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
Cc: John Hubbard <jhubbard@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I've been looking into the DMA-BUFs exported from AMDGPU / TTM. Would
you mind giving some input on this?

I noticed that your changes implementing transparent huge page support
in TTM are allocating them as non-compound. I understand that using
multiorder non-compound pages is common in device drivers, but I think
this can cause a problem when these pages are exported to other drivers.

It's possible for other drivers to access the DMA-BUF's pages via
gem_prime_import_sg_table(), but without context from TTM, it's
impossible for the importing driver to make sense of them; they simply
appear as individual pages, with only the first page having a non-zero
refcount. Making TTM's THP allocations compound puts them more in line
with the standard definition of a THP, and allows DMA-BUF-importing
drivers to make sense of the pages within.

I would like to propose making these allocations compound, but based on
patch history, it looks like the decision to make them non-compound was
intentional, as there were difficulties figuring out how to map them
into CPU page tables. I did some cursory testing with compound THPs, and
nothing seems obviously broken. I was also able to map compound THP
DMA-BUFs into userspace without issue, and access their contents. Are
you aware of any other potential consequences?

Commit 5c42c64f7d54 ("drm/ttm: fix the fix for huge compound pages") should
probably also be reverted if this is applied.

Thanks,
Alex

Alex Goins (1):
  drm-ttm: Allocate compound transparent huge pages

 drivers/gpu/drm/ttm/ttm_page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
