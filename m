Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CAC91431D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7133F10E363;
	Mon, 24 Jun 2024 07:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiK4yG1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B8810E360
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212726; x=1750748726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbc/iEJxK8IpwWAyl9EpiegNS5GsUhXEj2obZVdXGcg=;
 b=XiK4yG1n5MwJa28Gu8GnzV8UixYrU8tzRIJ7GzSwZBYPpPf/xEld5tvc
 oISCzY1dcXmYCxMKeUXbg8AjLrv153kB9Oa5eiWyxfpJEncdKGeS1xucL
 xMDOL2vc7b0x26q08UwjkQlWGdZGfotTnI7qdwoNu+BVtq42XQG0j468p
 xBQGPQT8NBKyxCJSIEhgT+w4qnikO1CE2rYP+YcvGXRyv13wcUfLUNW0Z
 51MbW+36StFSPlsDnzfUPfGyxdy6vjedShlXbPGdNO4sv3thilxnHvqcH
 yQMWboARFYqmpU3nIP0eEs/ZGRH/lFw+gtbyIvBhBsg/dVhFArFqBf5we A==;
X-CSE-ConnectionGUID: aE+ASFUUSBmFJ6rwFxEcFw==
X-CSE-MsgGUID: 7UXXRGWiSIiGCMunPLk4MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16134954"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16134954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:25 -0700
X-CSE-ConnectionGUID: 7ue5ihsjSaKDbMt96FdfEA==
X-CSE-MsgGUID: Blr1So55RVynf3hWmKtChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73955871"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:25 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v16 4/9] udmabuf: add CONFIG_MMU dependency
Date: Sun, 23 Jun 2024 23:36:12 -0700
Message-ID: <20240624063952.1572359-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
References: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There is no !CONFIG_MMU version of vmf_insert_pfn():

arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
udmabuf.c:(.text+0xaa): undefined reference to `vmf_insert_pfn'

Fixes: d1d00dd1fd2f ("udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4dc53a36428..b46eb8a552d7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -35,6 +35,7 @@ config UDMABUF
 	default n
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
+	depends on MMU
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
-- 
2.45.1

