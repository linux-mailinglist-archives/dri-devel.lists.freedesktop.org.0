Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD156B70F6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4B10E4A0;
	Mon, 13 Mar 2023 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDDA10E158
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 23:42:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso6744023wms.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678664550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L6L1zRMn7RXTj0YSorRi36CoIbvbTpqPl5G6frS5ebk=;
 b=qQg5I0l+XsWhkDyOnPm9+bat+WJLhznZxrD+/AauSstkSUaUO+3O5SNlzswUyoV3iS
 frZg8lBxQJys363RY7R2XM23j56Q+9K9YCBPNCObWsd3Kx1idDKRRx1+zyt71g+YeCza
 yvRi0TGXqt6cxRMKeBwLqSKAx1zU4aaJ5Z1RnWBWJyqwrVrKdN91fbYHn9KijJvfxySF
 2g1EUb2P80R1Oi1wS2lJaZ9VRmlfSZfDmqMok5JOasDjScVWK+Quy2ThrF3wdvZ7PlGd
 gj1yoSVo1WbbUWQj30k899w0uM9Glb4b9h82LyrHbWv1UavkbsZqU5C5vS9+o/cGSchT
 gcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678664550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L6L1zRMn7RXTj0YSorRi36CoIbvbTpqPl5G6frS5ebk=;
 b=Iuomg25+wjR7ILN1PTOyLyI5xfqb5CmBUmXjBFsKGHB/cX9eXiQfUSZY9eHywQpeRK
 WWCSQM1dCBQR6OB/bupqTVHYBrjO2qlUG4EC+pbEjYz7dqmKUDzFkLDaV8LdxWI9efqM
 RrD9Js/Yp5Czhxa8E1mPr+afhTpETsZY3euEZmBlQUT9vTx46M7DJRsYwo+VhhetbxdF
 G5xh7gDS8dFd1n0Bsp0Mzb7JgdhQeokpArEVhoYGY9Vl7m5NszXrPCoL6B5X70L+In4i
 ciE60XtcTm/R3JX4NhkZ9NOSlexxEV51TL64ZPRO7cEchZzyRL3csOt04hreR1yhnRBY
 rzpA==
X-Gm-Message-State: AO0yUKWXppMxhLA7nagcsGV0MkEmEnrvVWVUi4WKfcjmDpwXHanfpDd7
 Yfgx98Se+4HynHCbZ2/sRzs=
X-Google-Smtp-Source: AK7set9huZg1uC2jiFvA8tejOk5vnpUPfNGhGVQes4FSQiIZC2Akfq9gFzeIDZNfFBKRRWYv67YeUQ==
X-Received: by 2002:a05:600c:4fcf:b0:3eb:29fe:f911 with SMTP id
 o15-20020a05600c4fcf00b003eb29fef911mr8980719wmq.13.1678664549671; 
 Sun, 12 Mar 2023 16:42:29 -0700 (PDT)
Received: from lucifer.home (host86-146-209-214.range86-146.btcentralplus.com.
 [86.146.209.214]) by smtp.googlemail.com with ESMTPSA id
 iz20-20020a05600c555400b003ed201ddef2sm3698376wmb.2.2023.03.12.16.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:42:28 -0700 (PDT)
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/3] Remove drm/ttm-specific mm changes
Date: Sun, 12 Mar 2023 23:40:12 +0000
Message-Id: <cover.1678661628.git.lstoakes@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 08:17:55 +0000
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Konig <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Functionality was added specifically for the DRM TTM driver to support
mapping memory for VM_MIXEDMAP VMAs with customised protection flags,
however this has now been rolled back as issues were found with this
approach.

This series removes the mm changes too, retaining some of the useful
comments.

Lorenzo Stoakes (3):
  mm: remove unused vmf_insert_mixed_prot()
  mm: Remove vmf_insert_pfn_xxx_prot() for huge page-table entries
  drm/ttm: Remove comment referencing now-removed
    vmf_insert_mixed_prot()

 drivers/gpu/drm/ttm/ttm_bo_vm.c |  2 +-
 include/linux/huge_mm.h         | 39 ++--------------------
 include/linux/mm.h              |  2 --
 include/linux/mm_types.h        |  7 +---
 mm/huge_memory.c                | 31 ++++++++----------
 mm/memory.c                     | 57 +++++++++++----------------------
 6 files changed, 35 insertions(+), 103 deletions(-)

--
2.39.2
