Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3A6713A6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984610E697;
	Wed, 18 Jan 2023 06:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45810E696
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuIA/967bi8fJ2s/oMp21AWFew5v50JdzBzuNFK8Osw=;
 b=eQFONCsQNmIf39t+2fLq5M1nMbNSsgn0zux+egY1kWyRUx49bl/8Sgnu73y1df7OMq9Iqv
 dCWAWfjSLayASoQfMktOrkNFy5fNfymTUDAGQbLeUkGjp4h0duJbrm0gjzWDOLZIy7BH0R
 q6JX8nw/VuWDdKpURNXtdNqQ6FjJAM8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-U5kGMmoqOu2VHr_j5dOJ7A-1; Wed, 18 Jan 2023 01:13:58 -0500
X-MC-Unique: U5kGMmoqOu2VHr_j5dOJ7A-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb18-20020a170907961200b008715e951f02so4748474ejc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuIA/967bi8fJ2s/oMp21AWFew5v50JdzBzuNFK8Osw=;
 b=R19n194chWTyP5P1pwSP4qhzsGjKjq0TM+ZYkijvZsIRjXugsnTq8OHnWXvWk7wsjl
 NaLE1SPXRDfmEFB27TYE6E99nr7DJnJvc9iOeoXMZp6P/VYsvF5V+qJk43acAti2Iq4U
 gaRPkPHvRSGe26S0H4m2mv2c+f8bpgfowqTmWuNJ3sGuOFdoC82aKGBRJJEamt12GYdz
 Hs7BsLTJ5t0gDoEFzJIb438McKwKypH6fjWcT/o1G/JRZQ4bZH2ubvKAwpEwfxkhOxwX
 t+VZDbKyfxBjQgA1Rq+Z4LZ91bghXyiQRd6oIkLhkNjFaDT6I9DLLuDLa5sdOSFwoJGk
 DD0w==
X-Gm-Message-State: AFqh2kp8CnW/T5/QkjmZNrfgFY/wI/o/KR3j6qKI/6Ei8LEjPVmNNBbT
 7yBWsYpkL3dq+dt6uIwG6UMrlGzaEtWvqFgZ0zApLCtAXvcLNWXZV/WMuyEwX6d8FJKtxkqdhwz
 hQJXD9blstbzSyu+XRy/oPa9LA89E
X-Received: by 2002:a17:906:549:b0:84d:3822:a14e with SMTP id
 k9-20020a170906054900b0084d3822a14emr5532746eja.64.1674022437317; 
 Tue, 17 Jan 2023 22:13:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv86GpSfYd+wwTGTqkBFiIhaFIdaUkZl6RvjU2Bnz8b7FM4BmyUqqqu3yOGXwZAwyOl/axmZQ==
X-Received: by 2002:a17:906:549:b0:84d:3822:a14e with SMTP id
 k9-20020a170906054900b0084d3822a14emr5532728eja.64.1674022437107; 
 Tue, 17 Jan 2023 22:13:57 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906300b00b008675df83251sm7184811ejz.34.2023.01.17.22.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:56 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 08/14] drm/nouveau: move usercopy helpers to
 nouveau_drv.h
Date: Wed, 18 Jan 2023 07:12:50 +0100
Message-Id: <20230118061256.2689-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
index 48e6ba00ec27..5dad2d0dd5cb 100644
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
2.39.0

