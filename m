Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52760F699
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 13:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246DD10E5D0;
	Thu, 27 Oct 2022 11:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01710E5D0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 11:57:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 521051F8BD;
 Thu, 27 Oct 2022 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666871832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPQW7bOK3AoyGLN4jTsxP424r75qypHSRDEd/Bl3Su8=;
 b=SvmgZm4UUGrHKhrHfM2lJdGsQ7swBVmbdaslVM1+MpABMaALPBZBfvCfRLvnJrdpj0YQTx
 qNDdXog9gv4pm40hT9mfoOW85RvbLdVyCLx9oBsmV8xfDIYZBvZEu8tdmsch6oiTUz9j+y
 lCD4+CQAXkma+3XLS9/bGt0ZhpybCgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666871832;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPQW7bOK3AoyGLN4jTsxP424r75qypHSRDEd/Bl3Su8=;
 b=ypjnXH47gVyjEWsGKptf0KLy0jpL91awuhcRuUjLl2INWC6XC89t/t4/fjz2COR/ilzyHI
 wgqJyXijhM5NtuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D52D13A5C;
 Thu, 27 Oct 2022 11:57:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +NIlChhyWmOFNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Oct 2022 11:57:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 2/2] drm/ofdrm: Cast error pointers to void __iomem *
Date: Thu, 27 Oct 2022 13:57:07 +0200
Message-Id: <20221027115707.17980-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221027115707.17980-1-tzimmermann@suse.de>
References: <20221027115707.17980-1-tzimmermann@suse.de>
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
index 0da8b248ccc6e..b358da3840ad0 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -436,21 +436,21 @@ static void __iomem *get_cmap_address_of(struct ofdrm_device *odev, struct devic
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
@@ -468,7 +468,7 @@ static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
 
 	cmap_base = devm_ioremap(dev->dev, address, 0x1000);
 	if (!cmap_base)
-		return ERR_PTR(-ENOMEM);
+		return (void __iomem *)ERR_PTR(-ENOMEM);
 
 	return cmap_base;
 }
@@ -627,11 +627,11 @@ static void __iomem *ofdrm_qemu_cmap_ioremap(struct ofdrm_device *odev,
 
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

