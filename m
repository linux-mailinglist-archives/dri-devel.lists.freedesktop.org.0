Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5B752965
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5F310E73D;
	Thu, 13 Jul 2023 17:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932D710E738
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
 b=HgasC+Vgr/qplUtQdG31EVBl0DAtHT4p8wUuGsJFLAY+00uMd3dvXcUnq6bGPKKI3I+ZPD
 84Vw0DfvFIr5u2OGSkxUJ4e+EWE3v4AzuSa6E4vAa3qpDttWHwSGeetVUTaE/vKoOdCh/C
 e8uutCHEnFoNHSuhhQVBycZcBciAbL8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-2PLE2eXrNWaaA4Ue-2Po_w-1; Thu, 13 Jul 2023 13:05:05 -0400
X-MC-Unique: 2PLE2eXrNWaaA4Ue-2Po_w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3143b277985so663127f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267904; x=1691859904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
 b=CFTq98eS9+iypt4LUNMzvNAEQ4R+1giKmduRLKSisJOLpNWxiij5p8VVRLDzhoXyVp
 KdOiCyT5zbIrSfYNIx1y1P0+iQrdWnw6TF77hDF5Alc8zy+B+YjlElnhWRXF2XR7bYfs
 F+S6kZMQzH5IwWGhCv9IHpMgtO6uP2Vq7MAE5iFUc89m5SbNgnEwSf+N1rFDvaQbbuE4
 pUOsaiVRvC0EyPpYGckH7A9+UZzlmq22aBQleaDXloIvHL5Blfr6P122wwV1KK+WJqZ6
 vD6ZYWsSeQzoo44avlbM9B6FxHKPgXEaAOMv3plc5TXpJ4XhyDqC6V8BIhexV2UywDQn
 /Tgw==
X-Gm-Message-State: ABy/qLY5aPfOiBMYhTAp6QEKTB2Kc4w2Fcuq3FbG9EWFeqY8mZMVzRa8
 zUN+UENN6oECNPJxOPU1EYmyDRVdhSO3aZUJkn6WBPBOXshbivU5yf6+gGYIkVSxXAC6n6BSjfy
 FX1WetlNXCNlsCWjMJ9ogPvXZfSD/
X-Received: by 2002:a5d:500f:0:b0:314:37a:4d2 with SMTP id
 e15-20020a5d500f000000b00314037a04d2mr1881488wrt.60.1689267904087; 
 Thu, 13 Jul 2023 10:05:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF056mkLn94E+lKHndYR5EU4ydy3QCAICJDC86xIw557hHcn4RjCQJ4RaRlRWXwLJY/mxbcrA==
X-Received: by 2002:a5d:500f:0:b0:314:37a:4d2 with SMTP id
 e15-20020a5d500f000000b00314037a04d2mr1881473wrt.60.1689267903898; 
 Thu, 13 Jul 2023 10:05:03 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a1709067fcb00b009929d998abcsm4194749ejs.209.2023.07.13.10.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:05:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-next v7 07/13] drm/nouveau: move usercopy helpers to
 nouveau_drv.h
Date: Thu, 13 Jul 2023 19:04:02 +0200
Message-ID: <20230713170429.2964-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the usercopy helpers to a common driver header file to make it
usable for the new API added in subsequent commits.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 81350e685b50..20a7f31b9082 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -130,6 +130,32 @@ nouveau_cli(struct drm_file *fpriv)
 	return fpriv ? fpriv->driver_priv : NULL;
 }
 
+static inline void
+u_free(void *addr)
+{
+	kvfree(addr);
+}
+
+static inline void *
+u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
+{
+	void *mem;
+	void __user *userptr = (void __force __user *)(uintptr_t)user;
+
+	size *= nmemb;
+
+	mem = kvmalloc(size, GFP_KERNEL);
+	if (!mem)
+		return ERR_PTR(-ENOMEM);
+
+	if (copy_from_user(mem, userptr, size)) {
+		u_free(mem);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return mem;
+}
+
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 45ca4eb98f54..a48f42aaeab9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -613,32 +613,6 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	return 0;
 }
 
-static inline void
-u_free(void *addr)
-{
-	kvfree(addr);
-}
-
-static inline void *
-u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
-{
-	void *mem;
-	void __user *userptr = (void __force __user *)(uintptr_t)user;
-
-	size *= nmemb;
-
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
-	return mem;
-}
-
 static int
 nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf *req,
-- 
2.41.0

