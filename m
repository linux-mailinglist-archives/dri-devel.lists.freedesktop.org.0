Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58698AE2690
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 01:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C9510E254;
	Fri, 20 Jun 2025 23:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="en5DIlVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2432A10E252
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 23:51:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b2c2c762a89so1972693a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750463470; x=1751068270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bIspX+R59/KkNw1d2FACMt9ogJpMnxhLRlBebcNNzSk=;
 b=en5DIlVYCFd1YfRN9TdEUvWs9INw/zYAy4rbno0tg8EHV5Cb3dH1rXUOk/mIlfmiEA
 XPOaqRyoJvl1gdXgXFmbS+nLLf1z3uHHsiPHNUcIR4u8ngFoF5bJ/nvtOmpWyXKFr0HT
 UnxqLCUwPCxHIGFvAJ5q4wdASMHNUgkaeggyfs1coFGH5uE7A3KuSLNWvbq9UkxzZmxW
 ot3D4KEPWsOZoWEEdIG3OWxxKG1yrpwD1yuse22qx2Y4KUQ9TlHYWGZ8sodJQRxt8XUs
 J6JfZJvCvstG+Z0HX0yVZE4Kh4c5Szta9TXlMWUhhjFcun4l4aRRuPYGRKCPyiySUmgi
 0zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750463470; x=1751068270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIspX+R59/KkNw1d2FACMt9ogJpMnxhLRlBebcNNzSk=;
 b=bPVBWJA6xFz8NKutnPVbosOR1PvmSlZsPTrlGPFTUfB8bVfbjQEqw9m8dMeerd/8Rf
 ZFgw55jfdr3DVDb7jRNMs0L2mqrmuj5D7vYO8HxnMxF+0n+kO+LuHO2vp6pfiOBrMklJ
 ggsdiY1pWKgYTZjCM2caOTWOzTjumtKCpC6VA2N97Lh0yWAHYs1L28TeEqfsdhZZ0J+/
 PD4R6sizD+pivOAbqYVNtEF/O1ul64u11sn0igtNb6Ea5bxXL9wYB+MTjrQE+jK95F5t
 k+CsFLaOF3SBNGEa6ksQVWdJzpbf3wfWOJ5nkIDDyLq69FQP3mhTHXoJ7YkhgamfuAOo
 l9yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsoGzWcon12W3gTEYw+COVNSZF3lGvXZYG0vthBF1EhimFYykGei5f6bN4Fyu7/ru8btMI0kxktIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvHDkCZUNxLWqjRi5BJ4xqtTIERAGz8XHTnjo2SomXkvyB+PLE
 RGZn0toScY0IhfwlJWFzRlU3LGR3YoyxZQLFj3lVJ9A39cldup26YZuw
X-Gm-Gg: ASbGncsz+YLBm0XMfuAuLsjbSqmOMqbIB9LiGzNE3iAIlfOBfpmXsT+E0w22sJUXp+N
 a8kgayNSNroaSrUxNd1xE2d5csJ1xqCYvT1g0PALIT8KUU0d/1VYsASjDJz6JqBhqkp63seIH7k
 P46gbJzxy/KDawOkzQ6iBjTC08CZgQfRDlUqjN6bOghy3+Pd9xMtJCpPoLY+HNvapd2wL2kzbCQ
 TjZ3QJWH7IZpEwjiP3LlBlM87vC89rh6uMAw40mKB3wErT6JqfrhWeLpOlPg5Ya58URY681cCNV
 a5LDCILHJMJcjJZNgho2m/11sQrpNYj9OHJfaY33sr2JXMgtxikM7gSY44YBKYMw89hP3H7IfTx
 rX+PSRSxdc/IFvO5eVktn
X-Google-Smtp-Source: AGHT+IE976pSbdd7FW0S5BytUdlkttRhJ9v8UMgbKLSGtDpmUrSef8Wbi/Q5nXAJVfP5KA7TureZtQ==
X-Received: by 2002:a17:90b:5625:b0:313:bdbf:36c0 with SMTP id
 98e67ed59e1d1-3159d5779femr8909762a91.0.1750463470490; 
 Fri, 20 Jun 2025 16:51:10 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-237d875a7b5sm26731135ad.256.2025.06.20.16.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 16:51:10 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] panthor: set owner field for driver fops
Date: Fri, 20 Jun 2025 16:50:50 -0700
Message-ID: <20250620235053.164614-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <20250620235053.164614-1-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
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

It allows us to get rid of manual try_module_get / module_put.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826ee..775a66c394544 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1400,14 +1400,9 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	struct panthor_file *pfile;
 	int ret;
 
-	if (!try_module_get(THIS_MODULE))
-		return -EINVAL;
-
 	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
-	if (!pfile) {
-		ret = -ENOMEM;
-		goto err_put_mod;
-	}
+	if (!pfile)
+		return -ENOMEM;
 
 	pfile->ptdev = ptdev;
 	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
@@ -1439,9 +1434,6 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 
 err_free_file:
 	kfree(pfile);
-
-err_put_mod:
-	module_put(THIS_MODULE);
 	return ret;
 }
 
@@ -1454,7 +1446,6 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 	panthor_vm_pool_destroy(pfile);
 
 	kfree(pfile);
-	module_put(THIS_MODULE);
 }
 
 static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
@@ -1555,6 +1546,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 }
 
 static const struct file_operations panthor_drm_driver_fops = {
+	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release,
 	.unlocked_ioctl = drm_ioctl,
-- 
2.50.0.714.g196bf9f422-goog

