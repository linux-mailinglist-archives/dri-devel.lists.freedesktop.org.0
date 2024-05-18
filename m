Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F808C9172
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 16:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787B110E131;
	Sat, 18 May 2024 14:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L/BSrDZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6414B8933E;
 Sat, 18 May 2024 14:37:47 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1ec486198b6so32984275ad.1; 
 Sat, 18 May 2024 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716043066; x=1716647866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=FKsSBBFxiA0ly77raLTlMP1yScB2JsDo1G9Qw1p73GY=;
 b=L/BSrDZuCzaTgQ/Quh97V30u8OglPp6ZUwKWO/b5GchaeGvQlvmabe63o2VSwxyexb
 QfafyWuA1sQIRojmnNdtoJsRrQWR8cWRlLVHCy96DpW7THm8PZHtTmGAsCqfd9IW4yS9
 txKvOBrSYNI3HH9aDN6m8chLDgc6TfYPyu5uM4buU2pSY3BTXAlOlG06PFfApxI4JtT9
 hcc7/Ikccdc0yp6QSonufbLiUFm3EODKG92cb2oQsfaTppwq0jC94pSswZnFkebSk92w
 GTU9fYVnjOesscmTMpqhPOO5RrSWwTtRsgR/UYIL7SSu/oNPdvX0lxhgB5V/YWnjvXa8
 EElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716043066; x=1716647866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKsSBBFxiA0ly77raLTlMP1yScB2JsDo1G9Qw1p73GY=;
 b=gsMHyiojxtfUZ1F+theFx1UMhFPbe/XtSlpXex2DuDPJNBHjt+82YK/iN7Y+W5UQLZ
 kMXGoqcYCQWNw4DzOqz42Yyj9MtFzZDvLd0Ghx8zt+r+GZZ16cO9BQDWI3sbtyP7BOkq
 GrNaTrSIjAKtpjkCvrTrR+dpioZWBhofm0vW21HF+4zNZQOMOEOO/et0fuzquq/gzKzf
 /vKSx9wO/UAtMvKaN0fnDRa1vYhlbVGIamxqHtclNSlXY0/il7A1dHPoBCMiyriBNCHR
 FkPN16/Lr9+FyVkyJuTuBdya20giGCfPFbBr9E/rBNSSbu96zNnQ0owCoB9Gv62MbsQ4
 IbQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWImGEobSduX+9BPyMLcCj+5GijBUI4DS6W4UmDOoiQ6kW1JqLa/ZBokkbA3IxZrU2itWbTGnR3qN5Lj1U2kiC7fpELmKxYGoe5IGKO7M6gCa3ZMbQVJkiKiuDT8MmCbC19wnLiX48NVmI+A8+WAA==
X-Gm-Message-State: AOJu0Ywu6O87228qGPJ6iOXJt3jM5IGGQpbrVTAH/NoUnGryGAducuDE
 ewd9xQZwwbYP5+9neCp3NkPf+2feLhJUtgCTlnQSCURZWraWbx2f
X-Google-Smtp-Source: AGHT+IEU3d5YrWonxdjaRa3pMlUejZK6T/8P9yb9msWLq7aHGLOolYZGTo5U9Gm+a0ELvmk9ix2KMA==
X-Received: by 2002:a17:902:ecd2:b0:1e3:cf2b:7151 with SMTP id
 d9443c01a7336-1ef441a6e2cmr283064855ad.59.1716043066561; 
 Sat, 18 May 2024 07:37:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bbde9d7sm178417435ad.106.2024.05.18.07.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 07:37:45 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: David Airlie <airlied@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/nouveau/nvif: Avoid build error due to potential integer
 overflows
Date: Sat, 18 May 2024 07:37:43 -0700
Message-Id: <20240518143743.313872-1-linux@roeck-us.net>
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

The problem is not new, only it is now no longer a warning but an error since W=1
has been enabled for the drm subsystem and since Werror is enabled for test builds.

Rearrange arithmetic and add extra size checks to avoid the overflow.

Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
checkpatch complains about the line length in the description and the (pre-existing)
assignlemts in if conditions, but I did not want to split lines in the description
or rearrange the code further.

I don't know why I only see the problem with parisc builds (at least so far).

 drivers/gpu/drm/nouveau/nvif/object.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 4d1aaee8fe15..baf623a48874 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -145,8 +145,9 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 	u8 stack[128];
 	int ret;
 
-	if (sizeof(*args) + size > sizeof(stack)) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
+	if (size > sizeof(stack) - sizeof(*args)) {
+		if (size > INT_MAX ||
+		    !(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
 			return -ENOMEM;
 	} else {
 		args = (void *)stack;
@@ -276,7 +277,8 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
 	object->map.size = 0;
 
 	if (parent) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
+		if (size > INT_MAX ||
+		    !(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
 			nvif_object_dtor(object);
 			return -ENOMEM;
 		}
-- 
2.39.2

