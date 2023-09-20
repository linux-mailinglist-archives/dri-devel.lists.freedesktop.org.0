Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2C7A875E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D2810E502;
	Wed, 20 Sep 2023 14:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA6110E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=teKSA/CYnBKR/nhHsoNvbfNEz6ctyEw/xwjCLcFoikc=;
 b=Lm+bisNvslbCwcn8Graz9dNFoF6Y7TDsiC/1fWZdfU2JwnsPBPKAv2Eav8FC7E+0IBSkor
 BoSovd7kQ8FUS3HadKWf5MeZrJYXFCItI0ihKEFSnezxs8pRRfBNw4Ccr43FzkxD4mI8mB
 GHCyutwWYv5rXv+EPjPoux2IIRQKd3k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-wOkJbDVYO-6nfrXQYLLv0A-1; Wed, 20 Sep 2023 10:43:58 -0400
X-MC-Unique: wOkJbDVYO-6nfrXQYLLv0A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ad8ab8bc9fso503109366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221037; x=1695825837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=teKSA/CYnBKR/nhHsoNvbfNEz6ctyEw/xwjCLcFoikc=;
 b=oc+oy6fTb++BX9wEqjZsAFR/922wENZ6MR9+rToG8XNDPoU62Xbs1/XWg6H2yLfosZ
 ar43FLfcNZR9F2gp7Zq6Mo4/UspNs7UfT5gTwAhKO1CmTX/8PhvLMJOzdgDuRAxIScli
 98LdS30dDrB48f+FNEQCjDZu6um3q+t/pA/gpt/lt4UIX+4WTlYknlnglSpJ9yOmNEre
 N8PrVV3pLmOuqUyR5/hGnzgx6+1dBWMflRBgmjU/H+gVZ9Byp9tDMWOcKKqFBYSn9GcQ
 a7PcUfkEImP2pSTd5rkohuLfVF1cWYavu0eGSFYgTtAX9WhcO0Puav68RUXZ9tyQPioM
 xEoA==
X-Gm-Message-State: AOJu0YwNARewlJIC5sPB2xSyIIyQtYfxne3I96Znkc4lkVh8cMOTdq0q
 nYkFt6Tt8pVoxe+8wZW2bk8NBrTqbYWyAeJJDYCFly1HrIShK02rghrCKcs5gOfsL00x0aoPO6n
 BWj8w/trvzy1czcVE4zj5a1Cu2Jf9FzH3OLyv
X-Received: by 2002:a17:907:75f8:b0:9ae:381a:6c55 with SMTP id
 jz24-20020a17090775f800b009ae381a6c55mr2155912ejc.15.1695221036915; 
 Wed, 20 Sep 2023 07:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnaHW60Dc5balSdXu08W+wuqyr34BCUy5AOQEdXimdxPZX7mS86BNMJpr+l5YTNyRpQOSFCw==
X-Received: by 2002:a17:907:75f8:b0:9ae:381a:6c55 with SMTP id
 jz24-20020a17090775f800b009ae381a6c55mr2155893ejc.15.1695221036661; 
 Wed, 20 Sep 2023 07:43:56 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906248a00b00993928e4d1bsm9337658ejb.24.2023.09.20.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:43:56 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v4 2/8] drm/gpuvm: allow building as module
Date: Wed, 20 Sep 2023 16:42:35 +0200
Message-ID: <20230920144343.64830-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920144343.64830-1-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the DRM GPUVM does not have any core dependencies preventing
a module build.

Also, new features from subsequent patches require helpers (namely
drm_exec) which can be built as module.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig         | 7 +++++++
 drivers/gpu/drm/Makefile        | 2 +-
 drivers/gpu/drm/drm_gpuvm.c     | 3 +++
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..0f78a03e4e84 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -216,6 +216,13 @@ config DRM_EXEC
 	help
 	  Execution context for command submissions
 
+config DRM_GPUVM
+	tristate
+	depends on DRM && DRM_EXEC
+	help
+	  GPU-VM representation providing helpers to manage a GPUs virtual
+	  address space
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7a84b3cddeab..8e1bde059170 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,7 +45,6 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
-	drm_gpuvm.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
@@ -81,6 +80,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 #
 obj-$(CONFIG_DRM_EXEC) += drm_exec.o
+obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 7074bcad5b28..bfea4a8a19ec 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1723,3 +1723,6 @@ drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 	kfree(ops);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
+
+MODULE_DESCRIPTION("DRM GPUVM");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index c52e8096cca4..1e6aaf95ff7c 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -11,6 +11,7 @@ config DRM_NOUVEAU
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
+	select DRM_GPUVM
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-- 
2.41.0

