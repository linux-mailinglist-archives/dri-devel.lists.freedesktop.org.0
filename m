Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9F74E79A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48C10E31E;
	Tue, 11 Jul 2023 06:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2610E10E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:59:09 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0Wtx06TZzBJ7cn
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:59:05 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689058744; x=1691650745; bh=BBjOtnxHpYtfKCDDqbXWnN085Od
 kLpLKgYToQFgh/Vo=; b=LjF4tE/ugu45A4gqlYRZ8FW2PVrT0eKQHBSLZSWOVnL
 r6ZH7le8VGBJ0OE6+//8Wt4Q+FDr4YsXBdJWCFdwdHvXIWaFI2GqvDWCvqW8fedx
 vmcZK9MzqePLeh3mfHMbWbMifJHRdY2k/1ISytqlg1TcccFHGKNQWyzXddkuOafc
 uZbVZ9h0kJTEXAfhVQiyltAwY2QfI0lKJeH6Jp9iMhaCyzSecZmEkfQCnFK1hWMs
 3hsFhxSobZbQhy5prTOP+se78wP62XOdxZB8KeqFw+aWdBYj4QY5GM5kSh/nv1tu
 ARhKGucfBW+U9TPgBi0+nHRLegHyRPUHY28q6XAiY/Q==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CoQP2Z_PTgWd for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 14:59:04 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0Wtw5BsQzBHXkY;
 Tue, 11 Jul 2023 14:59:04 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 14:59:04 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: Move assignment outside if condition
In-Reply-To: <20230711065751.80206-1-xujianghui@cdjrlc.com>
References: <20230711065751.80206-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <5e8eabb592aaf355e6a29aea1f71a551@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nouveau_usif.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c 
b/drivers/gpu/drm/nouveau/nouveau_usif.c
index 002d1479ba89..d0b555630a6f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_usif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_usif.c
@@ -57,7 +57,8 @@ usif_object_new(struct drm_file *f, void *data, u32 
size, void *argv, u32 argc,
      struct usif_object *object;
      int ret = -ENOSYS;

-    if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true)))
+    ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true);
+    if (ret)
          return ret;

      switch (args->v0.oclass) {
@@ -70,7 +71,8 @@ usif_object_new(struct drm_file *f, void *data, u32 
size, void *argv, u32 argc,
              struct nv_device_v0 v0;
          } *args = data;

-        if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, 
false)))
+        ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false);
+        if (ret)
              return ret;

          args->v0.priv = false;
@@ -82,7 +84,8 @@ usif_object_new(struct drm_file *f, void *data, u32 
size, void *argv, u32 argc,
          break;
      }

-    if (!(object = kmalloc(sizeof(*object), GFP_KERNEL)))
+    object = kmalloc(sizeof(*object), GFP_KERNEL);
+    if (!object)
          return -ENOMEM;
      list_add(&object->head, &cli->objects);

@@ -121,7 +124,8 @@ usif_ioctl(struct drm_file *filp, void __user *user, 
u32 argc)
      if (ret = -EFAULT, copy_from_user(argv, user, size))
          goto done;

-    if (!(ret = nvif_unpack(-ENOSYS, &data, &size, argv->v0, 0, 0, 
true))) {
+    ret = nvif_unpack(-ENOSYS, &data, &size, argv->v0, 0, 0, true);
+    if (!ret) {
          /* block access to objects not created via this interface */
          owner = argv->v0.owner;
          if (argv->v0.object == 0ULL &&
