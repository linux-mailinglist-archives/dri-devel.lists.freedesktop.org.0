Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038098CE650
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B5C10F2F2;
	Fri, 24 May 2024 13:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZB3v0MlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6A510F2F2;
 Fri, 24 May 2024 13:48:20 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f6a045d476so3169131b3a.1; 
 Fri, 24 May 2024 06:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716558500; x=1717163300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=YIEeY0+RnmZng19NXAwQF+NfGbhg49taanreXH5yL+8=;
 b=ZB3v0MlOKWU8QlocA5yueSUHsWFcCEcnQ2lJi7nE/gey4M+0apjyfQZ4WAScoWtBaN
 Inr+96TzjFaEL4HbBBumQCoN0EwY3fHA4H3MfbqiNnFtIlwf8lpPxr17ZtwyjYCmdtYb
 QNTUimBcB+PMhOGm8kEmc6O4iPu3AfKssc13K5BDn+DqJPr7+nMIi1P7vgOUb1FL36Mj
 KOx90a8a2b7PG5N7XDIT2Y6X5YQtLlxoAoONwru69aNctQuyBAgLcWFxPZ9xE7BUn+Lf
 xVrJA9+swRVtiNTNBcrnjz0SCl/yJU61Z3GZVuDnrD3vG/15Q+bgYHHXFjib6bj1inJ9
 37tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716558500; x=1717163300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIEeY0+RnmZng19NXAwQF+NfGbhg49taanreXH5yL+8=;
 b=dhhuPnDnRxf/RqoWr72Im2J3a015qHbK2e0iPhsta55itYfE3bebm7Fb4ADPqcx2UJ
 rzpK6KDdDphidPHCYllLy1hVcnUZfGSWDrEZQFxs/gYjcadnD2+ssMh97HcEqpLm9QRk
 ge0kY6YvUS1qdzlZIk4GJgS3r60BToxfHB6vCc4mcE8uw5sjnKNVVm5lR/fTny/7vjHK
 rDjvLWRd4dt5gGEqO8I8MK4QGCjZJZ8lfZ+NNw8SS80jECN6xhb37dwsIZYUTeFryXZK
 GrULY8nHsU+ZhH9+C+eSA1wilSAVFM8N/581SpdHT3vmPk2hUg7zx0ZjNN/apNl2zgCv
 HDbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJacM70haIqN1l0FgGByupCFqq947Cb7f8wR82ExzZ2F3GDBlQuFJpBWBTsewKABByz7t4rmIkeifHWrvE82ddlxOi373LopQlV6hM+RWcDzLGQK171KO4oKvc94Yc5HNmh9A2AcXLhDPRMw+VmA==
X-Gm-Message-State: AOJu0Yzf3wRDUpA5UfZ3sF24+JpswOXrkLqn91VKEJ9E4gaJQGJUngir
 k/BYgr3wSR5kB6AWm5IzSLsEihSU3Vii1f1w6/KXbZPz0RK0doBK
X-Google-Smtp-Source: AGHT+IGhbkcGjUJbmZJcY4isvA2oPLb6egvbHqqkkHxWAtES97h4D4AL7LJBpaP2EFezAAdNct+Ivw==
X-Received: by 2002:a05:6a20:9707:b0:1b0:2cae:4622 with SMTP id
 adf61e73a8af0-1b212f0ea28mr2312580637.42.1716558499737; 
 Fri, 24 May 2024 06:48:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbeb14asm1121660b3a.118.2024.05.24.06.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:48:19 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: David Airlie <airlied@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Joe Perches <joe@perches.com>
Subject: [PATCH v3] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
Date: Fri, 24 May 2024 06:48:17 -0700
Message-Id: <20240524134817.1369993-1-linux@roeck-us.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trying to build parisc:allmodconfig with gcc 12.x or later results
in the following build error.

drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
  161 |         memcpy(data, args->mthd.data, size);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
  298 |                 memcpy(data, args->new.data, size);

gcc assumes that 'sizeof(*args) + size' can overflow, which would result
in the problem.

The problem is not new, only it is now no longer a warning but an error
since W=1 has been enabled for the drm subsystem and since Werror is
enabled for test builds.

Rearrange arithmetic and use check_add_overflow() for validating the
allocation size to avoid the overflow. While at it, split assignments
out of if conditions.

Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Joe Perches <joe@perches.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Split assignments from if conditions.
v2: Use check_add_overflow() to calculate the allocation size and to check
    for overflows.

 drivers/gpu/drm/nouveau/nvif/object.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 4d1aaee8fe15..1d19c87eaec1 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -142,11 +142,16 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 		struct nvif_ioctl_v0 ioctl;
 		struct nvif_ioctl_mthd_v0 mthd;
 	} *args;
+	u32 args_size;
 	u8 stack[128];
 	int ret;
 
-	if (sizeof(*args) + size > sizeof(stack)) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
+	if (check_add_overflow(sizeof(*args), size, &args_size))
+		return -ENOMEM;
+
+	if (args_size > sizeof(stack)) {
+		args = kmalloc(args_size, GFP_KERNEL);
+		if (!args)
 			return -ENOMEM;
 	} else {
 		args = (void *)stack;
@@ -157,7 +162,7 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 	args->mthd.method = mthd;
 
 	memcpy(args->mthd.data, data, size);
-	ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
+	ret = nvif_object_ioctl(object, args, args_size, NULL);
 	memcpy(data, args->mthd.data, size);
 	if (args != (void *)stack)
 		kfree(args);
@@ -276,7 +281,15 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
 	object->map.size = 0;
 
 	if (parent) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
+		u32 args_size;
+
+		if (check_add_overflow(sizeof(*args), size, &args_size)) {
+			nvif_object_dtor(object);
+			return -ENOMEM;
+		}
+
+		args = kmalloc(args_size, GFP_KERNEL);
+		if (!args) {
 			nvif_object_dtor(object);
 			return -ENOMEM;
 		}
@@ -293,8 +306,7 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
 		args->new.oclass = oclass;
 
 		memcpy(args->new.data, data, size);
-		ret = nvif_object_ioctl(parent, args, sizeof(*args) + size,
-					&object->priv);
+		ret = nvif_object_ioctl(parent, args, args_size, &object->priv);
 		memcpy(data, args->new.data, size);
 		kfree(args);
 		if (ret == 0)
-- 
2.39.2

