Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204077F0EC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302810E1B1;
	Thu, 17 Aug 2023 07:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC1110E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692256220; x=1723792220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+78dlvA/51d4wBsy1EIEYrq6opiEqB7AJeBx2sGkqW8=;
 b=GObZAgsA2qRA4YSd8Xqp1n7L6n2U1TnwBHLSzwBlechBjvgSSdobs+gk
 4i8txq29Va2osVnEc8WotfCgQJD5H3nX8QXxTanoTX5hJEDkkxRxdWxna
 RlLtaY9oc19Z/MJ1v5OtY6h4vgPpn41enAv4JeH4P3J7CG6hqdVUN92w6
 dFshQIUF44WOChBtBhnHMh4uuTtZt3bL7845iuQNkIouHkhn1rGRkZxrP
 ZOkoUoARTB8b02YmQfDOE2Pntkt6+VbRGtvPywgAm6W3dh9QScwmGqGVf
 7M0EpESR3YMEK+64fU5XR20txQlta8+3t476fxcGAtCB/tITtZm1qbRM8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370200878"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="370200878"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065142179"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="1065142179"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:10:18 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 0/3] udmabuf: Add support for page migration out of movable
 zone or CMA
Date: Wed, 16 Aug 2023 23:49:31 -0700
Message-Id: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
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

This patch series adds support for migrating pages associated with
a udmabuf out of the movable zone or CMA to avoid breaking features
such as memory hotunplug.

The first patch exports check_and_migrate_movable_pages() function
out of GUP so that the udmabuf driver can leverage it for page
migration that is done as part of the second patch. The last patch
adds two new udmabuf selftests to verify data coherency after
page migration.

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
  mm/gup: Export check_and_migrate_movable_pages()
  udmabuf: Add support for page migration out of movable zone or CMA
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     | 106 +++++++++++-
 include/linux/mm.h                            |   2 +
 mm/gup.c                                      |   9 +-
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
 4 files changed, 254 insertions(+), 14 deletions(-)

-- 
2.39.2

