Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F0739880
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10CB10E4EC;
	Thu, 22 Jun 2023 07:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D874410E4E8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687420381; x=1718956381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0IFy6Fk+6UocIWE8PLGV+49X8dkho9acYdLheOCDoH8=;
 b=UX8GVc7pRoMXWalcakyBEn+E7eo8XbMSJnnEle3E/2uRPLdsVbM1pSyi
 B00KTd/9/fmmK+zyYZEyXr3cJx2jL9BKSHwSmeLbDquSvZimtI3ANHWBv
 Fh3UYASKqiiAyyapffnZNv7wsfcJ4B34xp6DQkc4nftpJzSgd0IGNCx3A
 FKvuVX2ykF3XG/g4QBczeeNBIEdnC5Oqeuq38QTvZnaFwRsOjHPdyR0kR
 ykMuMBO6Hfvv8DpCbl7Rm7ZsaoNzvXU6kIkl6YItglEyxClVc1WEjhUUk
 dHfRVwFMpDd+ZHSUxUu1ZsvuD0+zS6k02TAVYZucdoTdnV1ly8uZGqyEW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357910348"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="357910348"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784801069"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="784801069"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:52:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Date: Thu, 22 Jun 2023 00:27:08 -0700
Message-Id: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Michal Hocko <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch ensures that the mappings needed for handling mmap
operation would be managed by using the pfn instead of struct page.
The second patch restores support for mapping hugetlb pages where
subpages of a hugepage are not directly used anymore (main reason
for revert) and instead the hugetlb pages and the relevant offsets
are used to populate the scatterlist for dma-buf export and for
mmap operation.

Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500 options
were passed to the Host kernel and Qemu was launched with these
relevant options: qemu-system-x86_64 -m 4096m....
-device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
-display gtk,gl=on
-object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
-machine memory-backend=mem1

Replacing -display gtk,gl=on with -display gtk,gl=off above would
exercise the mmap handler.

Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: James Houghton <jthoughton@google.com>
Cc: Jerome Marchand <jmarchan@redhat.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>

Vivek Kasireddy (2):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages

 drivers/dma-buf/udmabuf.c | 105 ++++++++++++++++++++++++++++++++------
 1 file changed, 88 insertions(+), 17 deletions(-)

-- 
2.39.2

