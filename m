Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CF6A50D40
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37A10E7FE;
	Wed,  5 Mar 2025 21:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kn8DGA2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978C310E7FE;
 Wed,  5 Mar 2025 21:23:54 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso1064307566b.1; 
 Wed, 05 Mar 2025 13:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741209833; x=1741814633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k8Dkf2Am7BkCc6xwiEJIkFESnAy6N6xXMin3A5PDXG4=;
 b=Kn8DGA2HOLiWU9iPAK28yIdt61LeFoh54Fqq/+/uAAJPFY2aJc4+XxZPr548++QeJW
 yL70cK2bVsuQ3nS8EjydiZ4hpS5zhIk9x35zpZ4iNrHriujyECG3i1Uv7/fpfltkMp3x
 JuWeR8ZQHXsBFfX6JZv9xThdlc1rQX+e1XGPtinZJAj4KsCXtK8jFXog2Tzq0szDRJN2
 tsZkAF23CXkzX2fD2afMXZ+UQTaIgFRKnzDGs7Z0DY+Re5n1LY9lDsGgncOooZa4ozpY
 8efR3yoOpSQ5wCkssFKm1/qFMroqWl+xo1YzWQFFm2W0/OPT2WFr+8hiqdVaGNUT56C3
 YHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741209833; x=1741814633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8Dkf2Am7BkCc6xwiEJIkFESnAy6N6xXMin3A5PDXG4=;
 b=u8vcBBQSSyli0/h3VhrQnqkUJ7iYptgfBwiDYSnoacMGDz8PlcbTJfq251yH2akdQo
 SyVPdgMOhcnesp7FW2XL8hdOp79LjF51VxzceMb/tmASKLAbkuvEQmQ4TR3FIzzibCmu
 7jSuY4ycTejJ/dlVqf08Qolc4+hR4GPqGMMysNNrfo0xydZWwtBUk7MhKaKJSdjjgor0
 XItt3aZqHIYO4Ovy2cH8imtQVIO+XkRFY+nc2CbfvkD4Ui9ykrKRwkRyCtFxjtK0a+sv
 UHRF0lSpA5Lp07sqsX8ukScLtIJ0yEs4zHcMsJtb3ptvPPJ2UMj8WYkYEPuGQRGGD9kF
 lr/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYnRvgE9TD98lJmcFMXptZhd9alr+jIW7hW6TNNVPH9KTN53vzpdV7Mwmh2NbkTDU+bsxsY2PX@lists.freedesktop.org,
 AJvYcCXJEWUhH8ry7WPt3cYMQgg95DRS431RbeaRTgYqKABN2u1yj2TqqjXnQd4jUIdcgm+9+DMFwNFaMQPk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+vsI11dw8gAvefNuJ1ATjAYnVHXBldzrKFMVaDXSDvhJFC1fK
 ADgLlEpa4XOUie8wVgEno23Ke+7eLWie5NPdXDUCdJvhByJHcaRn
X-Gm-Gg: ASbGncvvVLPPwgRdX8lbPMrn0cRXGxCU6yfMFYzn8IoEo8A4g2Z0tHaXuqa5aJw9SNE
 oKnkTzYL2MJ224Gqaco8PX2QpcGQNDEgWUbNmu36K9/26kvY/BIKTVsk11oQhXq8zf6opR4tPpD
 zdsKv6XrPw3LX83SMZ3qdIc4ygAkXxExyEtpL+nCjOgIFQu7dOaCBrPFXxXAqlEL989aIoOao9v
 0f27T0rbcpd+uX9ttHyv01GLCCf/174qxK7Q0zUl1v9c3QjUO713vayX6YdHT1/qdwwudZ1mU/m
 1+zcayq8WQnBOKZJC/HuNErEsYB5bCrkK9csPateDtrtnPNg58LqxLMi5bNA
X-Google-Smtp-Source: AGHT+IHCUgJSczMALJRUQsNQJij5yTp/ZhVwBJWdsbeRmE1+G/jwWDZcuvPQrej8azlFaVtQAjkeOQ==
X-Received: by 2002:a17:907:c018:b0:abf:7964:f9e5 with SMTP id
 a640c23a62f3a-ac20e03b1d0mr507213766b.56.1741209832560; 
 Wed, 05 Mar 2025 13:23:52 -0800 (PST)
Received: from localhost.localdomain ([196.235.231.34])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1ea7dd823sm404025866b.109.2025.03.05.13.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 13:23:52 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] drm: amdkfd: Replace (un)register_chrdev() by
 (unregister/alloc)_chrdev_region()
Date: Wed,  5 Mar 2025 22:08:09 +0100
Message-Id: <20250305210809.218138-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Replace (un)register_chrdev() by (unregister/alloc)_chrdev_region() as
they are deprecated since kernel 2.6. alloc_chrdev_region() generates a
dev_t value, so replace the kfd_char_dev_major int variable by the
kfd_char_dev_id dev_t variable and drop the MKDEV() call. Initialize a
cdev structure and add it to the device driver model as register_chrdev()
used to do and since alloc_chrdev_region() does not do it. Drop the
iminor() call since alloc_chrdev_region() allocates only one minor number.
On error and in the module exit function, remove the cdev structure from
the device driver model as unregister_chrdev() used to do.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 35 ++++++++++++++++--------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 065d87841459..55c74466d2c5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -37,6 +37,8 @@
 #include <linux/ptrace.h>
 #include <linux/dma-buf.h>
 #include <linux/processor.h>
+#include <linux/cdev.h>
+
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
 #include "kfd_svm.h"
@@ -61,12 +63,14 @@ static const struct file_operations kfd_fops = {
 	.mmap = kfd_mmap,
 };
 
-static int kfd_char_dev_major = -1;
+static dev_t kfd_char_dev_id;
 struct device *kfd_device;
 static const struct class kfd_class = {
 	.name = kfd_dev_name,
 };
 
+static struct cdev kfd_cdev;
+
 static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
 {
 	struct kfd_process_device *pdd;
@@ -90,17 +94,24 @@ int kfd_chardev_init(void)
 {
 	int err = 0;
 
-	kfd_char_dev_major = register_chrdev(0, kfd_dev_name, &kfd_fops);
-	err = kfd_char_dev_major;
+	err = alloc_chrdev_region(&kfd_char_dev_id, 0, 1, kfd_dev_name);
+
 	if (err < 0)
-		goto err_register_chrdev;
+		goto err_alloc_chrdev_region;
+
+	cdev_init(&kfd_cdev, &kfd_fops);
+	kfd_cdev.owner = THIS_MODULE;
+
+	err = cdev_add(&kfd_cdev, kfd_char_dev_id, 1);
+	if (err)
+		goto err_cdev_add;
 
 	err = class_register(&kfd_class);
 	if (err)
 		goto err_class_create;
 
 	kfd_device = device_create(&kfd_class, NULL,
-				   MKDEV(kfd_char_dev_major, 0),
+				   kfd_char_dev_id,
 				   NULL, kfd_dev_name);
 	err = PTR_ERR(kfd_device);
 	if (IS_ERR(kfd_device))
@@ -111,16 +122,19 @@ int kfd_chardev_init(void)
 err_device_create:
 	class_unregister(&kfd_class);
 err_class_create:
-	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
-err_register_chrdev:
+	cdev_del(&kfd_cdev);
+err_cdev_add:
+	unregister_chrdev_region(kfd_char_dev_id, 1);
+err_alloc_chrdev_region:
 	return err;
 }
 
 void kfd_chardev_exit(void)
 {
-	device_destroy(&kfd_class, MKDEV(kfd_char_dev_major, 0));
+	device_destroy(&kfd_class, kfd_char_dev_id);
 	class_unregister(&kfd_class);
-	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
+	cdev_del(&kfd_cdev);
+	unregister_chrdev_region(kfd_char_dev_id, 1);
 	kfd_device = NULL;
 }
 
@@ -130,9 +144,6 @@ static int kfd_open(struct inode *inode, struct file *filep)
 	struct kfd_process *process;
 	bool is_32bit_user_mode;
 
-	if (iminor(inode) != 0)
-		return -ENODEV;
-
 	is_32bit_user_mode = in_compat_syscall();
 
 	if (is_32bit_user_mode) {
-- 
2.34.1

