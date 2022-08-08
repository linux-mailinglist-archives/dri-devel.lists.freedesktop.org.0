Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355558C8E8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245491281;
	Mon,  8 Aug 2022 12:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AE890AF5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 12:54:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E593A37ACE;
 Mon,  8 Aug 2022 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au1PbrBym0RDvBK59gzpYLmZ5lBCOOF2TJfnVZ03KeI=;
 b=A6IyIml1ehWWPn5/77sPeEDw/XDPl4/2QiX94X+YCc1eMqCNB9IsAnb2eay6OMK2YBYbs4
 ZWr11e40xwZXCDE864iRl/8ZbWuYQdfqq/9xdlp5eOgHmK1BJ47vcaea/JG/CpI4RubcMa
 PJP9w/+8BNuXur2857Y6d5PLTql2jWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au1PbrBym0RDvBK59gzpYLmZ5lBCOOF2TJfnVZ03KeI=;
 b=n16QRsxNOLQ1lSZJxtOxmQYqXgZ8dOOAmjeuemCUbTMQC5fhaAyIQnY9+Z18BcgpBNWtOr
 VUTtPZronTGC+ICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 914C413ADE;
 Mon,  8 Aug 2022 12:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kCdiInAH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 01/14] iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
Date: Mon,  8 Aug 2022 14:53:53 +0200
Message-Id: <20220808125406.20752-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
References: <20220808125406.20752-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add IOSYS_MAP_INIT_VADDR_IOMEM() for static init of variables of type
struct iosys_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/iosys-map.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index a533cae189d7..cb71aa616bd3 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -46,10 +46,13 @@
  *
  *	iosys_map_set_vaddr(&map, 0xdeadbeaf);
  *
- * To set an address in I/O memory, use iosys_map_set_vaddr_iomem().
+ * To set an address in I/O memory, use IOSYS_MAP_INIT_VADDR_IOMEM() or
+ * iosys_map_set_vaddr_iomem().
  *
  * .. code-block:: c
  *
+ *	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(0xdeadbeaf);
+ *
  *	iosys_map_set_vaddr_iomem(&map, 0xdeadbeaf);
  *
  * Instances of struct iosys_map do not have to be cleaned up, but
@@ -121,6 +124,16 @@ struct iosys_map {
 		.is_iomem = false,	\
 	}
 
+/**
+ * IOSYS_MAP_INIT_VADDR_IOMEM - Initializes struct iosys_map to an address in I/O memory
+ * @vaddr_iomem_:	An I/O-memory address
+ */
+#define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
+	{						\
+		.vaddr_iomem = (vaddr_iomem_),		\
+		.is_iomem = true,			\
+	}
+
 /**
  * IOSYS_MAP_INIT_OFFSET - Initializes struct iosys_map from another iosys_map
  * @map_:	The dma-buf mapping structure to copy from
-- 
2.37.1

