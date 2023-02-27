Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7184C6A3F7C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9892A10E3AD;
	Mon, 27 Feb 2023 10:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0462E10E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:33:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r18so5673264wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K9odxWzvzue9z1NrNjPL2bn7gUkLmctX3VvfrU8oiAk=;
 b=dav+XCq3c710V4HBALG6vLCxdDuPp7pufLGks1XX8cO0PLFYMr1J0HuHDHUsvura72
 oSt6KEUgkKLQ43IqrrrwqoWj8MPOm7E3JkZvYicVha2tqRUDRHyMGo9UQrVp+0kU/uMG
 WOyaK0qXat3vhS4VJZv/BkmQSUn+zqc5sEZn2sPG1dVwbssa4kQlcuFOSlvp6hwOIWPA
 gOcR2Su1+Hvrg2ep4CsA4qUo2gZUa0MTj2kwtx+tQR2i3ZUXQpAH4YAphiOs+57REEs3
 D12dQ5f0cTaLgmWVfCj7EfwbnHGSyQpQv68W0AZe971j0+b7fHK3ft67fuu2+iLn7SLS
 JbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K9odxWzvzue9z1NrNjPL2bn7gUkLmctX3VvfrU8oiAk=;
 b=PSswPdyVlV+4cNSFKQfKZBTWPza+ZGoiU0JNiqXVCsbVMl6kBNBc4HjC86Dwl9xuIA
 ahpv3bxgHo2XwF6yjhK2rATu9K68iE+Imn9iqAsRhbipt+uTTmh9yV9rQV3XW6ElJ053
 GsysUiidCyPP2Cv4sUDL5oHO70qjTcVJjFseWHp0GzVMypanN+blmurhuxyrZvbzrhWe
 cGYE8L1WhIQRJx9b7jtGh15xwPGgFgON4yfj+u5l4g2iCcXALiaQG9xL7ZJWg5KyXz3w
 k3sRDasMsAqgwa6dwfBtfBK36o06ZiBlMFX1zb/uTa84b/eBQh/N0okziIXZWPboDHF2
 HOhQ==
X-Gm-Message-State: AO0yUKW6Vc95ccFIQkWEE2zgBAjHT9csLeXDXtviKHR2E1dsDkfxJonl
 75r1QPdFrWn3ZUkWY5Uk3dk=
X-Google-Smtp-Source: AK7set9+9zFd2aJkifJYbiHWR4I7Zsn9y0bCJ5P9tNnwHzorUqaB02E6KU0aYOs4YojoMt78neFgrA==
X-Received: by 2002:adf:ef0d:0:b0:2c5:587e:75ba with SMTP id
 e13-20020adfef0d000000b002c5587e75bamr19380603wro.55.1677494014479; 
 Mon, 27 Feb 2023 02:33:34 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 r1-20020a1c2b01000000b003e9ae2a8cbfsm8854770wmr.2.2023.02.27.02.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:33:33 -0800 (PST)
Date: Mon, 27 Feb 2023 13:33:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
Message-ID: <Y/yG+sm2mhdJeTZW@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The error codes are not set on these error paths.

Fixes: 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")
Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2: I accidentally returned -EINVAL instead -ENODEV.
    Add Thomas's Reviewed-by tag.

 drivers/video/fbdev/chipsfb.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index cc37ec3f8fc1..7799d52a651f 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -358,16 +358,21 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 	if (rc)
 		return rc;
 
-	if (pci_enable_device(dp) < 0) {
+	rc = pci_enable_device(dp);
+	if (rc < 0) {
 		dev_err(&dp->dev, "Cannot enable PCI device\n");
 		goto err_out;
 	}
 
-	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0)
+	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0) {
+		rc = -ENODEV;
 		goto err_disable;
+	}
 	addr = pci_resource_start(dp, 0);
-	if (addr == 0)
+	if (addr == 0) {
+		rc = -ENODEV;
 		goto err_disable;
+	}
 
 	p = framebuffer_alloc(0, &dp->dev);
 	if (p == NULL) {
@@ -417,7 +422,8 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 
 	init_chips(p, addr);
 
-	if (register_framebuffer(p) < 0) {
+	rc = register_framebuffer(p);
+	if (rc < 0) {
 		dev_err(&dp->dev,"C&T 65550 framebuffer failed to register\n");
 		goto err_unmap;
 	}
-- 
2.39.1

