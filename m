Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B664B61112C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152810E19D;
	Fri, 28 Oct 2022 12:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2364910E19D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:22:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0E3E21AA8;
 Fri, 28 Oct 2022 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666959751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTgsPDMx3fc9AF6MHbEmWKeY/NxZ59Wx+FlRxEiaeVE=;
 b=zGwd5+DqEui3vjHg4gwvdEXh3AmYt7yyGf5zp+/y5bq/E8EsApkMmAoEekRUHZ7WpM32w5
 32+5I1Kvz11EOFPSFE+uPSHL0I1F90SZSvGZ9AxWjxK0OeRipRk62LSeY9OOAHAZ/prNP8
 VZgUVzJncuFZy4IQa5H2kGTJyWIs+FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666959751;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTgsPDMx3fc9AF6MHbEmWKeY/NxZ59Wx+FlRxEiaeVE=;
 b=UahRmBZB+yrWlzpMrefoXqcS3otDjXqTKnOjKvcq3xT1u3SedrRWlH1Ai6hbeqXbxEj7Dl
 jdbUvBn9F/wXdZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C47513AB6;
 Fri, 28 Oct 2022 12:22:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8HyEHYfJW2MScwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Oct 2022 12:22:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.stein@ew.tq-group.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 2/2] drm/ofdrm: Cast error pointers to void __iomem *
Date: Fri, 28 Oct 2022 14:22:29 +0200
Message-Id: <20221028122229.21780-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221028122229.21780-1-tzimmermann@suse.de>
References: <20221028122229.21780-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cast error pointers when returning them as void __iomem *. Fixes
a number of Sparse warnings, such as the ones shown below.

../drivers/gpu/drm/tiny/ofdrm.c:439:31: warning: incorrect type in return expression (different address spaces)
../drivers/gpu/drm/tiny/ofdrm.c:439:31:    expected void [noderef] __iomem *
../drivers/gpu/drm/tiny/ofdrm.c:439:31:    got void *
../drivers/gpu/drm/tiny/ofdrm.c:442:31: warning: incorrect type in return expression (different address spaces)
../drivers/gpu/drm/tiny/ofdrm.c:442:31:    expected void [noderef] __iomem *
../drivers/gpu/drm/tiny/ofdrm.c:442:31:    got void *

See [1] for the bug report.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/202210200016.yiQzPIy0-lkp@intel.com/ # [1]
---
 drivers/gpu/drm/tiny/ofdrm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 44f13a2b372be..f1c301820d54b 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -438,21 +438,21 @@ static void __iomem *get_cmap_address_of(struct ofdrm_device *odev, struct devic
 	if (!addr_p)
 		addr_p = of_get_address(of_node, bar_no, &max_size, &flags);
 	if (!addr_p)
-		return ERR_PTR(-ENODEV);
+		return (void __iomem *)ERR_PTR(-ENODEV);
 
 	if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) == 0)
-		return ERR_PTR(-ENODEV);
+		return (void __iomem *)ERR_PTR(-ENODEV);
 
 	if ((offset + size) >= max_size)
-		return ERR_PTR(-ENODEV);
+		return (void __iomem *)ERR_PTR(-ENODEV);
 
 	address = of_translate_address(of_node, addr_p);
 	if (address == OF_BAD_ADDR)
-		return ERR_PTR(-ENODEV);
+		return (void __iomem *)ERR_PTR(-ENODEV);
 
 	mem = devm_ioremap(dev->dev, address + offset, size);
 	if (!mem)
-		return ERR_PTR(-ENOMEM);
+		return (void __iomem *)ERR_PTR(-ENOMEM);
 
 	return mem;
 }
@@ -470,7 +470,7 @@ static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
 
 	cmap_base = devm_ioremap(dev->dev, address, 0x1000);
 	if (!cmap_base)
-		return ERR_PTR(-ENOMEM);
+		return (void __iomem *)ERR_PTR(-ENOMEM);
 
 	return cmap_base;
 }
@@ -629,11 +629,11 @@ static void __iomem *ofdrm_qemu_cmap_ioremap(struct ofdrm_device *odev,
 
 	address = of_translate_address(of_node, io_of_addr);
 	if (address == OF_BAD_ADDR)
-		return ERR_PTR(-ENODEV);
+		return (void __iomem *)ERR_PTR(-ENODEV);
 
 	cmap_base = devm_ioremap(dev->dev, address + 0x3c8, 2);
 	if (!cmap_base)
-		return ERR_PTR(-ENOMEM);
+		return (void __iomem *)ERR_PTR(-ENOMEM);
 
 	return cmap_base;
 }
-- 
2.38.0

