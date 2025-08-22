Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF39B31B8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D7710EB23;
	Fri, 22 Aug 2025 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="z+bGRzSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D0810EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:14 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b133b24e69so9409681cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873013; x=1756477813;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6OY5evIliuTUSUpI65wJAeLBbEZqsWLdp0NsDRl0Iz8=;
 b=z+bGRzSrxfY8/aOjE+tYi4zmRNNr/iUTCXvKnn8grGIfjbA/isijSqhLC68099NZm4
 GgFGADV4niIQUQks4f5iOelJp0H0HSEcMd87gMSlG7vs/LTdLPsOfStm1bIojpIWk8N6
 TUlS16L4GRbzY9bz0677ZVXGa7KGlLgNV196ygXnY2gqnPF4P6lxwnDllAj53urAZxzo
 L/Llh02ywcVidVh6z0pdQ8DdqUkmK5SSfJqTdKnQMBIcPAhP0q/VfaN0Dd1rQZ8J97Ic
 AqWczf/azjgZqlpZZKyxxyFi9AjRJ5xrIFPDhDKs0zB3yt5fjwZWGxJtbUJbf4p8kKqc
 yg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873013; x=1756477813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6OY5evIliuTUSUpI65wJAeLBbEZqsWLdp0NsDRl0Iz8=;
 b=CZlP1BCF7kabj3YmBeg+7TxsuvJ1AXY1SvbSJAYef/OFfFT3uRAnEHM0d/9oxXkIKq
 341YZNGYcO2wxBJKU+mmDIT7rrfngc75oa1ez8c06XXSy1wqrpdD22Yimh37RQ7ueiwG
 f68urRcmTcG+hNZTW8mGubWTcC/d2cZD8w2gZ0QNxUTEhaNbS/XBYA05mvC66LKYnlJr
 W/aaJp5MmrPazLdfAtuRTYXloiC26fJcorbSd+IxGy3YrPEGo7zHzVnYI1cjSIL4RIAR
 Qi2CdOLmmBZUT993wlTsCw0yk3EDyi3ON2b+zj9F4e221eE5ZNsS1/jplTdWm+pj2qx5
 5Xjw==
X-Gm-Message-State: AOJu0YwP7lFNxuLNav+g05iGlO8Ns3d4QCc5aDAdvppCL1FnjF+Z2s2B
 RSh2ks9ZTtgsxiaGsBH/Xg0aLiVxVu7DZlFFC9/eHFV3ybIGgAORI4SXWvnohCmNyJhGI49+mPZ
 dfgY3XHE=
X-Gm-Gg: ASbGnct5/wAm92GRdhUuvPwsKAoA07q0Zs9I389mT+VuTS9LQOuvgABQGE2C76D17zz
 yNSQMs2dyTSbYkhR2QrqBDASmsjfI9N9GFO37hOu7NGlKzfwK0/uNmeotx4yfyNvuHqBLF/6Qb8
 lV3yyeJ7Ulu5Bum7rRKQJxrwSN2zAZrfgrBZuOamCOBZQgz1KO0YiUIBkaXkDhpHXpgT6CKpNsp
 Ti1Yq2zlED3TZjZzs/RsSuGWP9SgAIjy3SVB1Vu8Q9AnsrvJGTCsIhExi2OL1JEheO9QTjQwln7
 xjKuCkrPLtHNqdGydDYvptlskGR/b4c94nqt2UBm/gHxKR5vlFy9OL3vyisTGwkWZ39KhMPb/z/
 Cx3yCkMeAFLacNvK+kmtDNCSnXWGzjfc=
X-Google-Smtp-Source: AGHT+IEtQXcAFYLUQlb1CyRaM5PwLmG+4vPd1d2iGHa9DJ2s8lPpErc7aad7I2thYiv5cnRxOz6tXA==
X-Received: by 2002:a05:622a:5916:b0:4b0:9dd8:724e with SMTP id
 d75a77b69052e-4b2aaa6d004mr38554611cf.20.1755873012748; 
 Fri, 22 Aug 2025 07:30:12 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:11 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 4/7] drm/panthor: Bump the driver version to 1.6
Date: Fri, 22 Aug 2025 10:29:13 -0400
Message-ID: <20250822142954.902402-5-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1527966604e1..2da06057ce37 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1658,6 +1658,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - adds DRM_PANTHOR_BO_WB_MMAP flag
+ *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1671,7 +1673,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.50.1

