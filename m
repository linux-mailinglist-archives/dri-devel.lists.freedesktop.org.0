Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BF794551
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F1C10E20B;
	Wed,  6 Sep 2023 21:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E0B10E1C4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694036855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bmrcb2oq50rZlpGWQfTXaOIClgXSoOriMS7Nyz+ms1c=;
 b=RBT1WdkMA/cZXc4dN+ar6INFxMNjHsGNDkXQJsQ8n4thq9Gzx90pZCeE+QV1D2lgwRS2bG
 Wkq+Y8+GHhVdbftkxhUl3h9zYYYvSYTVUUh07mb4t969yJBeZULg/GIYyqNYvkFdUt4ZGC
 woxbZDPo0cJxkIopMZsEtKDZkeNeDqI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-2cDwMkXWNRO8sddc5QaoxQ-1; Wed, 06 Sep 2023 17:47:32 -0400
X-MC-Unique: 2cDwMkXWNRO8sddc5QaoxQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50098600fd7so234132e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036851; x=1694641651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bmrcb2oq50rZlpGWQfTXaOIClgXSoOriMS7Nyz+ms1c=;
 b=dwFpwM4+HvDHSZE8AeIQ6tZiszCJjSCL61ch0klJ0md3yO3in3HGG0YIw86lJC+RSY
 /RruMdnV0Cp3bZ9LTDgS4lGUiZNV0zmPon5Yhs6Kf/UHzt4H18dh1ETrxZ1gcjfBjVUG
 klFKPlGfoUo+3/NshpGi4GSELmuw3rmC5W4SujNuGM/5wSH7H12gYIsW3KHrEb4dI9lU
 xJy+TwOPjVczSZ2xJczI147Ok+CABqivlam7D3kc0UxRrHI0fONBceV7HUU/d2BeO5WQ
 XUfhiNcvTJYYeOs9PKOXPBr2I6H1OcKisUyQczzGnVjt6UHYS1Y/Jj0ZS4I634VQkUSn
 IyHQ==
X-Gm-Message-State: AOJu0YyIKy2MTbI9h5OcdYnFikLnM9rEeHjZ9stO55HhjxXwY9sIEfxT
 6MlJ1kmHGufNM8Wle1mUbybeUvLNCrPoza5QvTn+tALseAimeSUQhishiE3n3teBx2uCO60Qp+R
 Y/O7uGKdruYeZxzplmjB9/8f/bRnT
X-Received: by 2002:a05:6512:47c:b0:4fd:bdf8:930d with SMTP id
 x28-20020a056512047c00b004fdbdf8930dmr3397722lfd.22.1694036851085; 
 Wed, 06 Sep 2023 14:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZOvUjQotqVmw5dq+H1cGrTwf3v11lzqe++IgrCUjU4OD92LBUiS/v0WDNutLYEF1h43q/IQ==
X-Received: by 2002:a05:6512:47c:b0:4fd:bdf8:930d with SMTP id
 x28-20020a056512047c00b004fdbdf8930dmr3397700lfd.22.1694036850791; 
 Wed, 06 Sep 2023 14:47:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q10-20020aa7cc0a000000b005232c051605sm8829288edt.19.2023.09.06.14.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 14:47:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v2 1/7] drm: gpuva_mgr: allow building as module
Date: Wed,  6 Sep 2023 23:47:09 +0200
Message-ID: <20230906214723.4393-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906214723.4393-1-dakr@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the DRM GPUVA manager does not have any core dependencies
preventing a module build.

Also, new features from subsequent patches require helpers (namely
drm_exec) which can be built as module.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig         | 7 +++++++
 drivers/gpu/drm/Makefile        | 2 +-
 drivers/gpu/drm/drm_gpuva_mgr.c | 3 +++
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..3f2577e10c07 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -216,6 +216,13 @@ config DRM_EXEC
 	help
 	  Execution context for command submissions
 
+config DRM_GPUVA_MGR
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
index 215e78e79125..5c10243d77fe 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,7 +45,6 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
-	drm_gpuva_mgr.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
@@ -81,6 +80,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 #
 obj-$(CONFIG_DRM_EXEC) += drm_exec.o
+obj-$(CONFIG_DRM_GPUVA_MGR) += drm_gpuva_mgr.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index f86bfad74ff8..6b5e12e142df 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -1723,3 +1723,6 @@ drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
 	kfree(ops);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
+
+MODULE_DESCRIPTION("DRM GPUVA Manager");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index c52e8096cca4..bf73f6b1ccad 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -11,6 +11,7 @@ config DRM_NOUVEAU
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
+	select DRM_GPUVA_MGR
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-- 
2.41.0

