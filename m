Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DD88FA97
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A2F112383;
	Thu, 28 Mar 2024 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fo2gJ5yQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC57D112374
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5vlf6vqKAYhk0ag6OYHcNY4wXaM3qL+5LRzjghAnNm4=;
 b=Fo2gJ5yQPLhGcjIlSIDwp8z/T1j74yUbgKe45CuRuxTCnNtVK09R3Cpa
 DRsicYYFAEB/PGnTixDoSZCkdaw1ZfIfiy16JD66jSvSqzKf/L5kyN52E
 0Zd+y/f7awQHTKHKotsnC5MUXal8DLx8KHhLi41REMdibhGy5h9fAJ5vn
 SG5WS5HEFtvE2s2DzUUnjvDkaOjXtVISyFC58A3G/BV6jfSHLcCW92ssl
 JsRbuQSe++RejDPSi4jDpM/s4Q6dlwop2GIFC9pTion/5cOwwFxogqeMe
 0Mh0mZ8b/iaJUMbtHQj8D803M9kGpUW3Nk66ZPQHPcJo8Kkx1DiVV9XD5 Q==;
X-CSE-ConnectionGUID: 1rgikLtKTcmhBdQDbjto2Q==
X-CSE-MsgGUID: ONRk70acTjiGZgR2R6gsfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355701"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355701"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078240"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 6/7] udmabuf/uapi: Add new ioctl to create a dmabuf from PCI bar
 regions
Date: Thu, 28 Mar 2024 01:32:59 -0700
Message-ID: <20240328083615.2662516-7-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
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

This new ioctl can be used by a VMM such as Qemu or other userspace
applications to create a dmabuf from a PCI device's memory regions.
The PCI device's id that the userspace app is required to provide
needs to be encoded in the format specified by the following macro
(defined in include/linux/pci.h):
define PCI_DEVID(bus, devfn)	((((u16)(bus)) << 8) | (devfn))

where devfn is defined (in include/uapi/linux/pci.h) as
define PCI_DEVFN(slot, func)	((((slot) & 0x1f) << 3) | ((func) & 0x07))

In addition to the devid, the userspace needs to include the
offsets and sizes and also the bar number as part of this request.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/uapi/linux/udmabuf.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/udmabuf.h b/include/uapi/linux/udmabuf.h
index 46b6532ed855..16fe41fdc4b9 100644
--- a/include/uapi/linux/udmabuf.h
+++ b/include/uapi/linux/udmabuf.h
@@ -15,7 +15,15 @@ struct udmabuf_create {
 };
 
 struct udmabuf_create_item {
-	__u32 memfd;
+	union {
+		struct {
+			__u32 memfd;
+		};
+		struct {
+			__u16 devid;
+			__u16 bar;
+		};
+	};
 	__u32 __pad;
 	__u64 offset;
 	__u64 size;
@@ -29,5 +37,6 @@ struct udmabuf_create_list {
 
 #define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
 #define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
+#define UDMABUF_CREATE_LIST_FOR_PCIDEV  _IOW('u', 0x44, struct udmabuf_create_list)
 
 #endif /* _UAPI_LINUX_UDMABUF_H */
-- 
2.43.0

