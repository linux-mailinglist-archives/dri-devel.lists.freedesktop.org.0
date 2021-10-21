Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4514358D8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89C86E3FE;
	Thu, 21 Oct 2021 03:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001BB6EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:35 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id g5so17533856plg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwgsndVmfHw/6pjlQaZU2erZEw/1WQ3kWFjNXQQ/usw=;
 b=QVYUVNLV8P3IAQqTDiFZYwO/JJzXGzHLG/xlruYZIsaIlBJlkYg33OqiDiXDOEOnsA
 n139ls4Ep3AjqEsuyItWrReMJuqEIgGyUIQRqOxD6KEhlMHJ9bInipFm0kw/c8/+Hn5b
 DPsmpLV+GFeJiQCFA+2VyHMHHxQotgH6/cRHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwgsndVmfHw/6pjlQaZU2erZEw/1WQ3kWFjNXQQ/usw=;
 b=iHTV2Vnl7guspa8JYlJTD3H7PzbfbkukBKEj7o/NQoxbm+gpIMNUsn26vtcnaAkPzD
 jf2XB2t2K5iwMHpt+OThpONgbGho2wbLv1Sd46Xq6kSANxZYLhPJ34hmMMGqMit4xQNZ
 sHqlfkt2TlNwq1dmACPR3W77unhrOi+IFsGoLsPoVPbnhgDyG0IdX0Qrr664TNpnsjgx
 jlD8uFgtPMASlgmw17lCOSo+Zx5IzXbHD9uh6QrQI+PS777DkfRKNnje0InBE25I5Vq2
 vT9/J7w+FR1Jduc8RXi3ffid0pS0x3M5SOjjQ0b5LYqmMJIpZ71Wpi6FejOi/vaL2LMn
 bP1g==
X-Gm-Message-State: AOAM5320t2ZnfAxAZmuEpe308eiULixnAskAgr+1q3lpLQsjAn/ANUWY
 /PqDF72n7Y/GQLQKAMGNHsW3+biVbB9LXw==
X-Google-Smtp-Source: ABdhPJxWw2WGryhCkcjWw7TZ74SSaUzjMVDMrpY7nz3ds0Uh6v2h9e6ucOwbBCeif9LFGnvHQbtCDA==
X-Received: by 2002:a17:902:b40a:b0:13d:cbcd:2e64 with SMTP id
 x10-20020a170902b40a00b0013dcbcd2e64mr2882180plr.18.1634785835304; 
 Wed, 20 Oct 2021 20:10:35 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:34 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 6/8] drm: track real and fake imports in drm_prime_member
Date: Wed, 20 Oct 2021 20:10:25 -0700
Message-Id: <20211021031027.537-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
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

Sometimes, an exported dma-buf is added to the import list.
That messes up with trace point accounting, so track real vs.
fake imports to correct this.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/drm_gem.c      |  5 ++++-
 drivers/gpu/drm/drm_internal.h |  4 ++--
 drivers/gpu/drm/drm_prime.c    | 18 +++++++++++++-----
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6f70419f2c90..7637be0ceb74 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -226,8 +226,11 @@ drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
 	 */
 	mutex_lock(&filp->prime.lock);
 	if (obj->dma_buf) {
+		struct drm_device *dev = filp->minor->dev;
+		bool removed_real_import = false;
 		drm_prime_remove_buf_handle_locked(&filp->prime,
-						   obj->dma_buf);
+						   obj->dma_buf,
+						   &removed_real_import);
 	}
 	mutex_unlock(&filp->prime.lock);
 }
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..40d572e46e2a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -75,8 +75,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf);
-
+					struct dma_buf *dma_buf,
+					bool *removed_real_import);
 /* drm_drv.c */
 struct drm_minor *drm_minor_acquire(unsigned int minor_id);
 void drm_minor_release(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index deb23dbec8b5..31f033ec8549 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -90,13 +90,15 @@
 struct drm_prime_member {
 	struct dma_buf *dma_buf;
 	uint32_t handle;
+	bool fake_import;
 
 	struct rb_node dmabuf_rb;
 	struct rb_node handle_rb;
 };
 
 static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
-				    struct dma_buf *dma_buf, uint32_t handle)
+				    struct dma_buf *dma_buf, uint32_t handle,
+				    bool fake_import)
 {
 	struct drm_prime_member *member;
 	struct rb_node **p, *rb;
@@ -108,6 +110,7 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
 	get_dma_buf(dma_buf);
 	member->dma_buf = dma_buf;
 	member->handle = handle;
+	member->fake_import = fake_import;
 
 	rb = NULL;
 	p = &prime_fpriv->dmabufs.rb_node;
@@ -188,9 +191,11 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
 }
 
 void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf)
+					struct dma_buf *dma_buf,
+					bool *removed_real_import)
 {
 	struct rb_node *rb;
+	*removed_real_import = false;
 
 	rb = prime_fpriv->dmabufs.rb_node;
 	while (rb) {
@@ -201,6 +206,9 @@ void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpr
 			rb_erase(&member->handle_rb, &prime_fpriv->handles);
 			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
+			if (!member->fake_import)
+				*removed_real_import = true;
+
 			dma_buf_put(dma_buf);
 			kfree(member);
 			return;
@@ -303,7 +311,6 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 		return PTR_ERR(dma_buf);
 
 	mutex_lock(&file_priv->prime.lock);
-
 	ret = drm_prime_lookup_buf_handle(&file_priv->prime,
 			dma_buf, handle);
 	if (ret == 0)
@@ -315,6 +322,7 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 		obj = dev->driver->gem_prime_import(dev, dma_buf);
 	else
 		obj = drm_gem_prime_import(dev, dma_buf);
+
 	if (IS_ERR(obj)) {
 		ret = PTR_ERR(obj);
 		goto out_unlock;
@@ -334,7 +342,7 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 		goto out_put;
 
 	ret = drm_prime_add_buf_handle(&file_priv->prime,
-			dma_buf, *handle);
+			dma_buf, *handle, false);
 	mutex_unlock(&file_priv->prime.lock);
 	if (ret)
 		goto fail;
@@ -473,7 +481,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 	 * ioctl doesn't miss to remove this buffer handle from the cache.
 	 */
 	ret = drm_prime_add_buf_handle(&file_priv->prime,
-				       dmabuf, handle);
+				       dmabuf, handle, true);
 	mutex_unlock(&dev->object_name_lock);
 	if (ret)
 		goto fail_put_dmabuf;
-- 
2.25.1

