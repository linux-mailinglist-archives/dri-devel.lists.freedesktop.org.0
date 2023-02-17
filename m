Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE969ACF9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B18610F002;
	Fri, 17 Feb 2023 13:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F510EFF4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qV+blR6Tkr/sKsOr7dEvAgWdCXkrbGqs9gehh/nqNIE=;
 b=B1Vgb7kgfBTXb+JzODrfpfvV9zwoFZpAzeFJ9h6xfFfwgLZgBQkFf78rcyVQloQsYwotTa
 pT7CrniBUk1uTu3D7LJo0sa4j9UIWAfwTjLWLj3fUGD030lJoLu+twnA0lPS3ldLTuPR19
 W5jCMCnFE+P5bNRcIpuPinM5PCdnTgA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-dVPRMSM8MDiN8lKr0fthUg-1; Fri, 17 Feb 2023 08:48:43 -0500
X-MC-Unique: dVPRMSM8MDiN8lKr0fthUg-1
Received: by mail-ed1-f72.google.com with SMTP id
 ee29-20020a056402291d00b0049ec3a108beso1653277edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV+blR6Tkr/sKsOr7dEvAgWdCXkrbGqs9gehh/nqNIE=;
 b=Rjb6OAUBeU7Xlszgf2zWgAFXmg0OSoMc1xRePAS6o3QFPC6sJfP9WmCmHOsqKkooO+
 +9o4dTHHOhqQSzPi/0nrnRXrgyGmFda6/3L0I7jLpdr1wvass1YH38PGzxJQH9T5IBQn
 cOEL7KnfgcIHef7jihfIXUHJ/oCwp1libItkZcbLKp1M2pnnKX7xmSAUvbffbndvYGoO
 06yLwurJTcZgkSR7WajelazK+tT3tCMgpkGt3c0EjaXok8XoAfqNv/FQq/1EtEw7KHsN
 +MiOxp5hWvYEPLLThzv7pFQ9Bf6AXZtnuybRNqNESN8EpwezYvusPisbL4qBJbM083I1
 jopw==
X-Gm-Message-State: AO0yUKVoj6AfMUu7vm+aEnlWugGlm7B42ZlLR0r8/4dusAu8YOX1/BD6
 z1l702NR/C8ko3Y3MbW7CX8Ez/5/iHWPYkRFDDcjTpvQRfvUHuO0a838Kz5UDqLoGlVXVq4qZ7h
 3+ugYiYvjjKJUzoC5zVsXLlrxbuSl
X-Received: by 2002:a05:6402:457:b0:4ad:7640:ff47 with SMTP id
 p23-20020a056402045700b004ad7640ff47mr3317201edw.13.1676641721927; 
 Fri, 17 Feb 2023 05:48:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8TQtlKkchdYFDpX6esHsmxmbuVnZmBvwTb0vwG2PSeRr7Qepshcx1saI0cWGGhV/p6T+nLUA==
X-Received: by 2002:a05:6402:457:b0:4ad:7640:ff47 with SMTP id
 p23-20020a056402045700b004ad7640ff47mr3317181edw.13.1676641721700; 
 Fri, 17 Feb 2023 05:48:41 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a509556000000b004a23558f01fsm2348675eda.43.2023.02.17.05.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:40 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 10/16] drm/nouveau: move usercopy helpers to
 nouveau_drv.h
Date: Fri, 17 Feb 2023 14:48:14 +0100
Message-Id: <20230217134820.14672-5-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
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
index 08689ced4f6a..4369c8dc8b5b 100644
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
2.39.1

