Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D43A4AB0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 23:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54826E047;
	Fri, 11 Jun 2021 21:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46256E047
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:39:53 +0000 (UTC)
IronPort-SDR: BQUU/axrJVauiB7NNIrpcTqqG8wUDs/EyzccXmaog49f+EaRv3I6pqRxqSOJgLfgWxWlC5WYUg
 ezpUlG2JCkYw==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="291248201"
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="291248201"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 14:39:52 -0700
IronPort-SDR: XE9YScuftSYanMQs/pTI7A8UFoqTFKE9cfhy9BrvUPkifzdsdz98WfyMCOYaRdHygNTQAZ0Ndd
 z0iBeGhcm2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="483406620"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga001.jf.intel.com with ESMTP; 11 Jun 2021 14:39:51 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: configurable list_limit and size_limit_mb
Date: Fri, 11 Jun 2021 14:21:07 -0700
Message-Id: <20210611212107.9876-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Default list_limit and size_limit_mb are not big enough to cover all
possible use cases. For example, list_limit could be well over its default,
1024 if only one or several pages are chained in all individual list entries
when creating dmabuf backed by >4MB buffer. list_limit and size_limit_mb are
now defined as module parameters so that those can be optionally configured
by root with proper values to remove these constraints.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/dma-buf/udmabuf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 1a79ce899b0f..8df761a10251 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -13,8 +13,13 @@
 #include <linux/udmabuf.h>
 #include <linux/hugetlb.h>
 
-static const u32    list_limit = 1024;  /* udmabuf_create_list->count limit */
-static const size_t size_limit_mb = 64; /* total dmabuf size, in megabytes  */
+static int list_limit = 1024;
+module_param(list_limit, int, 0644);
+MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
+
+static int size_limit_mb = 64;
+module_param(size_limit_mb, int, 0644);
+MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
 
 struct udmabuf {
 	pgoff_t pagecount;
-- 
2.20.1

