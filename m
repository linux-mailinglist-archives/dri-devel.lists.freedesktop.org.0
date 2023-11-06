Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919727E1A23
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 07:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4510E26A;
	Mon,  6 Nov 2023 06:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214A10E107
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699251456; x=1730787456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CQNkmJJjkw/nbxkIqmxjq5ajXGh14LTXmVuOwmXIlwU=;
 b=IdfKOCsPT7UmQaU+zLKB5Y1vCzQuWET2TJ1HJFRuYqc+OXxvzGabuX/v
 8Wj3ugcxGj8sg73H+Pu3rCwSkjbotQ0MZq2OPCYlIiPq4HgwncLGbObjx
 wpiYUhkg6ThBSEfyFFywJnLGmC2z3L4DFd3H/98/Q2VuFR7g0ACFuK3Ys
 +oFbIqYiOYzeHpFdV9rVg6H/LBqpHW/Pazu9/eyRkxnj5z+hBnLskQQbY
 nDFij6uGD+06X8zobo11VrJZsS1Nzt/eLy20iSM/YzBpxgO2AZuVxzLUw
 97sAUrHbVEx82Bh+ZDwbGKL5FABkCPxnkv1uR/0HXL7xizU+fM37vswhE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393113909"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="393113909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:17:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797213043"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="797213043"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.7])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:17:34 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v2)
Date: Sun,  5 Nov 2023 22:15:38 -0800
Message-Id: <20231106061541.507116-1-vivek.kasireddy@intel.com>
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

v2:
- Updated the first patch to include review feedback from David and
  Jason. The main change in this series is the allocation of page
  in the case of hugetlbfs if it is not found in the page cache.

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
    pages (v2)
  udmabuf: Pin the pages using pin_user_pages_fd() API (v2)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     |  81 +++++++---
 include/linux/mm.h                            |   2 +
 mm/gup.c                                      |  99 ++++++++++++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
 4 files changed, 308 insertions(+), 25 deletions(-)

-- 
2.39.2

