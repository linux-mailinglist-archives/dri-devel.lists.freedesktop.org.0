Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4075770C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1E010E2FE;
	Tue, 18 Jul 2023 08:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE5D10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689670225; x=1721206225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ovBwSRmf2YWXsGp+lPSra3pZbPqmwXQQyQ5edRriL5k=;
 b=bAGPulMCAruuLi6rJtskn6Tvx3fr7d212N1U1ku5gVYFPHxNv5yq5o1b
 qmUVVTcd99PNJL3krf3gFhmTB7wYx9whrWxrDFcBVkoOQ4NCm8w3D5ixz
 gOXaRP0R8dm6We9JM9UoTeSlPrTXYiFV+3w1INH183b5JteMLKn5p9voX
 4CAus8Iv6YgVVANiEyQMqxleR9udn6ynhr5gyDHXDeTySDPbvGeHts//c
 gZSoX3LG0PfJrgVwoCCDHLI6yj1EMy02Oe8DCy0TtVlcW+Q2aX4RlfVi7
 CmmzmjOuhPo8oNLGW2eRO1ylT07mZcEAV9jgn0dLqG40pj3POWkEB6a2m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363616475"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="363616475"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837205680"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="837205680"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:50:23 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [RFC v1 0/3] udmabuf: Replace pages when there is
 FALLOC_FL_PUNCH_HOLE in memfd
Date: Tue, 18 Jul 2023 01:28:55 -0700
Message-Id: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
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
 Junxiao Chang <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series attempts to solve the coherency problem seen when
a hole is punched in the region(s) of the mapping (associated with
the memfd) that overlaps with pages registered with a udmabuf fd.

The first patch introduces a new mmu notifier to let drivers know
when a new page is faulted into a mapping (backed by shmem or
hugetlbfs). The second patch updates the udmabuf driver to
register a handler for receiving mapping updates in order to
update its list with new pages. The last patch adds two new tests
to the udmabuf selftest to test the huge page support and also
FALLOC_FL_PUNCH_HOLE.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (3):
  mm/mmu_notifier: Add a new notifier for mapping updates (new pages)
  udmabuf: Replace pages when there is FALLOC_FL_PUNCH_HOLE in memfd
  selftests/dma-buf/udmabuf: Add tests for huge pages and
    FALLOC_FL_PUNCH_HOLE

 drivers/dma-buf/udmabuf.c                     | 172 ++++++++++++++++++
 include/linux/mmu_notifier.h                  |  27 +++
 mm/hugetlb.c                                  |   9 +-
 mm/mmu_notifier.c                             |  17 ++
 mm/shmem.c                                    |   7 +-
 .../selftests/drivers/dma-buf/udmabuf.c       | 165 ++++++++++++++++-
 6 files changed, 391 insertions(+), 6 deletions(-)

-- 
2.39.2

