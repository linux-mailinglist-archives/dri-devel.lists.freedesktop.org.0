Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73537B6323
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 10:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2E710E259;
	Tue,  3 Oct 2023 08:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313D710E23C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696320326; x=1727856326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OmFHTqOSa59ciYTjUMSks5D1AhH7iwG4dRqZ8ggdYrc=;
 b=MCgrVpOgWM8TcPhled8HsLOq8mhf2GmVDkER/z1D5BugIQsdX3Nw11AA
 8wC01HsDy5L36se8klKlemlMd5ald9gH3R2fC7OJP044lJXY0t7OHOpPD
 I1guX9Lr4vn0pFFHEMcHUtwqXQOSPvPK8d8Y7F+SCfBH8rPV386bxuKCZ
 MyoMDc+9N5WktZUQzpaVmfjJ0XjndAdDGBnBg4kt/6dmKJhDU4LZ7N/9m
 fHh6F7xI8rc/njK4jdmgrr4fBY9hBjuEEa6io0XHRlgkh8vMJZzFQ8XlI
 Emk3J2EdxMMyj+NLrFws/kpRUWhkW03VzyeUFbl4D5L4qX9JIxefQWKXi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="449306978"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="449306978"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700615282"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="700615282"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:05:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 0/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
Date: Tue,  3 Oct 2023 00:44:44 -0700
Message-Id: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch introduces pin_user_pages_fd() API and the second
patch shows how the udmabuf driver can use it to longterm-pin the
the pages. The last patch adds two new udmabuf selftests to verify
data coherency after page migration.

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (3):
  mm/gup: Introduce pin_user_pages_fd() for pinning shmem/hugetlbfs file
    pages
  udmabuf: Pin the pages using pin_user_pages_fd() API
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     |  82 +++++++---
 include/linux/mm.h                            |   2 +
 mm/gup.c                                      |  87 ++++++++++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
 4 files changed, 297 insertions(+), 25 deletions(-)

-- 
2.39.2

