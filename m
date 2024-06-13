Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E3907EAA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B110910EBCF;
	Thu, 13 Jun 2024 22:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDsC7/PA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345310EBCB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718316818; x=1749852818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbc/iEJxK8IpwWAyl9EpiegNS5GsUhXEj2obZVdXGcg=;
 b=mDsC7/PAvCuGejXX2oZwpSwWbyp/p340rWunr9PV8Cl00tSAzPCNT0x1
 n0qsk/pZ3f/ld6MTqUaYF7G7Fo3nWwls1qAsaKHuxglRfvifcOvdarXu/
 Z6nfGiOAs+ER+poZn4LZQryXq3olDVPcuUZd4aFW4GwJDIdzEZ0G/EzOr
 H0vURPwoBmbg9M03GEb9EZOBsLIFRTn1Mn5KpdoFjtyUvqSioyRAFuby9
 0nrqIMjgdUaEPS3jjOIfk4qlyqb2V5f3FfhzN8VffREHvDuZoUhjw3nND
 wERShtpbfltL6E1Gccukn+l1LOdNEx2Dm3R/nqiiZ5n5rDu5vVaN/a6QW g==;
X-CSE-ConnectionGUID: kdoOEeviQHShbpVdfuyjKw==
X-CSE-MsgGUID: hDlk+e5VTPGoziMZVnqUQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32720548"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="32720548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:13:36 -0700
X-CSE-ConnectionGUID: v6Wh4F+bQM6nkWcKi1+LVA==
X-CSE-MsgGUID: KZOhFuG5Qj2FkkdO5Mi3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45214100"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:13:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v15 4/9] udmabuf: add CONFIG_MMU dependency
Date: Thu, 13 Jun 2024 14:42:06 -0700
Message-ID: <20240613214741.1029446-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
References: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
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

