Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670D75A330
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8205310E540;
	Thu, 20 Jul 2023 00:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70410E53D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
 b=Sq00I/zeQIxjeiJUqbl930nw5JOmGVS7sDC0+Yypj1pLI5h8LYHI1T11iQUCh1/g+BNWb+
 MVWEEX8M2fxiYIamAeFjhi0rtvF8QIk+4a3fZ27YlpClPCOfiAtOF3QS2xj2qMMcUPMHe3
 iFi3aomrZYEBxJ3igo8FajdZV0hHxao=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-dntmzH1mOQe6ZryqPiATOw-1; Wed, 19 Jul 2023 20:15:23 -0400
X-MC-Unique: dntmzH1mOQe6ZryqPiATOw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993d41cbc31so17265666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812122; x=1692404122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
 b=CDQNr5k6FPhgnGLMrm7Ih1rRo4sTGVCZWJncO3zxXGkebIxqbTvZ1u+QYj/+IPMv74
 LUtQ9v2PRd6WlWRCyUtDlE+pmic1g5TK2s3eInD4r9lCPtGnTkKLmr3C4/Uo6U9xviyW
 LEFZoozvSR4cHDj6YgCVJ2Eg7f4Yi2Cn08Sw3qsRE2XBFIPEYST+8qU6aazQzOsaFVtW
 aI//c63ic9UrtO6p9eNf7rbEa1vvNQn3+EX4B/zqJyDL7D9IPB0QOKvTmzZuSQJMyQ8w
 1rO0V8N6eOjPfJr2msnuQZ+IeH1Cnav87IubATxbg+EisI+mP2vpn/DUMiDGKPiTcSrS
 spOg==
X-Gm-Message-State: ABy/qLbHW0rVYdQIcFhYEYcuaKaNiMVfYR3qmDW6Ji9y33DWXC5/d5se
 fvriKdi7P90+UANEJmDjFfPEopB2EHr9tGF1Bu+HOpCcTAI1jfpbdhDraxIjyIKC8Eeh2zONE4w
 Lp0NV7MXCLhrJFn+mTJB97GMdd5sk2C+n9xhz
X-Received: by 2002:a17:906:5352:b0:98e:3b89:5dc6 with SMTP id
 j18-20020a170906535200b0098e3b895dc6mr3910229ejo.48.1689812122313; 
 Wed, 19 Jul 2023 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHxaasfKFWWON1nzNJ4kzWElBpJTi1OMBEArQvRE1Im2F4zN50mka71pGSvPS5ohPVp2XGgNA==
X-Received: by 2002:a17:906:5352:b0:98e:3b89:5dc6 with SMTP id
 j18-20020a170906535200b0098e3b895dc6mr3910200ejo.48.1689812122115; 
 Wed, 19 Jul 2023 17:15:22 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a170906694800b0098d2261d189sm3028814ejs.19.2023.07.19.17.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:21 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v8 06/12] drm/nouveau: move usercopy helpers to
 nouveau_drv.h
Date: Thu, 20 Jul 2023 02:14:27 +0200
Message-ID: <20230720001443.2380-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

