Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B017707D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0E10E753;
	Fri,  4 Aug 2023 18:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C30310E74F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sILSYR0gnJ8A9dpqcei0GUdx0191p3j7ECPYiYKPGLY=;
 b=KEKAvbUVrl76RcZZDHknn/C1d3VgIEnPRAmSxXNE8Qj93creemnql22gSXkewfQmTxhAwi
 x78l9g/AsEcExFforuGkOBzHO86WYYxnaJm89VYY+YACF77ejjLPZyH2EEUkVMZAOW8rtD
 TKpLUMe5XRjkoO6mL3KniGF+otLAZwE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-E2OLMUJaPxiBEXGPZ5SeSQ-1; Fri, 04 Aug 2023 14:24:39 -0400
X-MC-Unique: E2OLMUJaPxiBEXGPZ5SeSQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-521a38098faso1574948a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173478; x=1691778278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sILSYR0gnJ8A9dpqcei0GUdx0191p3j7ECPYiYKPGLY=;
 b=KZzRTOe1As8+Z/pU2k3JJ6IS6iToAfo/b2ePGPomvwiTVH+FJFZGS4VMdJG8yvzJgy
 d7QmhdMx47EAPywywjtIBn1KhhqwjIQVuhspDSnK2LzR7r7C5kcTP1W4m4/fevv0BbUh
 /PK6keDZr8ptvfz+GCDyvX+CQK5yPCpXFTeZlesibcug5aH5ukGZGmMwMzETLgbxT4hB
 uaAvoywuzRfyQXanzdUh/MiqRRCXet+kPkWqmHtw44Jp2pP/M7VwdnugM8lDNI4lYzLW
 XGBaRcdnMLR8hYB1VJjyBXi3c2usglCjeaVznKxBgsPBAnrSvFz8/DRlEeC4uMMjPMfQ
 LWKw==
X-Gm-Message-State: AOJu0YxOivGpfbn175dLIzulsQo18664cavcWz9lm3f5IbgrWW1e0fc3
 r+JJAfinBjNpqmyUh9RhpuKF2crS2ZkzSaowrsmWcE33UgAQf0gZAKfv4SBVPc7p0sGvHve5ub+
 3zWx1bakSp1WVHtz07E3smN7AZ3uu
X-Received: by 2002:a05:6402:448:b0:51d:d390:143f with SMTP id
 p8-20020a056402044800b0051dd390143fmr2168715edw.5.1691173478710; 
 Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAdtc3GjLhkVTBVp4UpZhrnZWEfIc0NqlSy8j8ZyVB3ZFGvxmr6W4of3EQqVmArV7n8nDbEA==
X-Received: by 2002:a05:6402:448:b0:51d:d390:143f with SMTP id
 p8-20020a056402044800b0051dd390143fmr2168702edw.5.1691173478516; 
 Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r6-20020aa7c146000000b0051e2670d599sm1570383edp.4.2023.08.04.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v10 06/12] drm/nouveau: move usercopy helpers to
 nouveau_drv.h
Date: Fri,  4 Aug 2023 20:23:46 +0200
Message-ID: <20230804182406.5222-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
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
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the usercopy helpers to a common driver header file to make it
usable for the new API added in subsequent commits.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 81350e685b50..d28236021971 100644
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
+u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
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

