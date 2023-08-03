Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755576F000
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 18:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC6210E639;
	Thu,  3 Aug 2023 16:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E538210E639
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLzavWF6HUG+3GGQgH2DTq7sDOog3ykOR8e7MsGbNA4=;
 b=B8FJtjHX0RfjYp+7pfHYx0Y3JFu6vTE7vhR1FYJdDpHYjC/7f01mBjVOCAO+ExEc6G+J/I
 xD7S45n8b7ysWZ+jKpo496sJ+jJ/2be69FH3+YyPy4KCrM0IMmVvuRK2CMljInfMJLy8/W
 wS1l1XdT0a3hagn+KXKws5fXP1T+sWs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-my0IXMUqNYeT3mLhWZnu9Q-1; Thu, 03 Aug 2023 12:53:12 -0400
X-MC-Unique: my0IXMUqNYeT3mLhWZnu9Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bcf56a2e9so77702966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 09:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081591; x=1691686391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLzavWF6HUG+3GGQgH2DTq7sDOog3ykOR8e7MsGbNA4=;
 b=En0VSiXlE/U5rVMsSddoGRCBY0Dgr2jKzVT9XUuDMdwMm6DIwoQ37Rm1TZ0SeUFxhe
 wiElUGY1PUUonACdzeGLdWFn+mtbrouoJBjDg56RWOmdpudqk8/fdbMDkx4gEHnbPdxg
 2m3Hb/s0VBCi5Eld0nklcgjk95PwK6qK4y97fLPn8usgATFl/jdqtu2kUFKbyyvbdnQN
 ky9cekQIAHryH5WjN7dmwZCZB2xfTVzojbhR9MV+MCzhFHdSqf2JAM5U3N995wy8ApI8
 TtjkJsKFIAUVKEQuHNNLRKO4+mSoC3x5yk9gKbR0IehFc+YCmgcW9csTwobLLvBvIFtB
 gulg==
X-Gm-Message-State: ABy/qLZYOGpfmFC2ezaK6+C4tZMoq+ehC9CTApOAG9Nk2K1Q23LqT+v2
 LA1HZBkWYEP/DmLXAJim1pU5UvFZS1rCNDSn/xn4hcAypSr93/akYglrrfliNpKfu/63fOHhtvn
 OfHo/HwYHfQXHYD4jHjah3lEWzK5D
X-Received: by 2002:a17:906:73d8:b0:99b:de2a:d9a6 with SMTP id
 n24-20020a17090673d800b0099bde2ad9a6mr8157544ejl.41.1691081591074; 
 Thu, 03 Aug 2023 09:53:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH88VVUyeljJh/RTuLjx6dMZVKmwPisfXTau5q9VkuIQhzKoeDHKmSMdudiTm0zRh3+A0gk6w==
X-Received: by 2002:a17:906:73d8:b0:99b:de2a:d9a6 with SMTP id
 n24-20020a17090673d800b0099bde2ad9a6mr8157534ejl.41.1691081590887; 
 Thu, 03 Aug 2023 09:53:10 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a17090612c700b009937dbabbdasm61145ejb.217.2023.08.03.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:53:10 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v9 05/11] drm/nouveau: move usercopy helpers to
 nouveau_drv.h
Date: Thu,  3 Aug 2023 18:52:24 +0200
Message-ID: <20230803165238.8798-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
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

