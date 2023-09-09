Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79A79994F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68E410E29B;
	Sat,  9 Sep 2023 15:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C85310E1D7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694273499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAExJk9wXPRBLR7Aww0xIvaSzJwaJausSAN7Idxt57s=;
 b=EnlZy0ISr5gltjsi5MmvI200EIparEXvoHTM7oPMhbNcBO3ttLY84gLnqm/QRv2y8G97NT
 F5Y0vwsmDkKDCttb7k+09DqDfAqPfc7BLQ9vGCppro18dPDjvmkhBsMpAkrwl51V8jwqiM
 otJCpM+wEt+jefn9YvU+V9YcdAGfD2Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-y5n7U4S9MPW3V1hf7sGfng-1; Sat, 09 Sep 2023 11:31:38 -0400
X-MC-Unique: y5n7U4S9MPW3V1hf7sGfng-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-52310058f1eso6094897a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 08:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694273497; x=1694878297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAExJk9wXPRBLR7Aww0xIvaSzJwaJausSAN7Idxt57s=;
 b=JmrUeCsPnbjQlgKqRVgAb2mz3/t7z8HHqnQjgh71lw5NKXUvLPQWfd5QftoBF+p25V
 M2ni01r0/uxP2a3JqZ+j52RnrH9f4uo2n4+G1FAKG67wnswwf3h5GuxLrkMEpARV+K8I
 6Hw9OFpc9Uz0jX5CoSgpQWOTJr0wV3h8rtZ3IjcN8kSmsVpJamvOluheD4NAjc4fuo77
 YGS6kH4/Yf4sxbKAkOTi1rwTwGKGznVKiUxprkjp7p6SmsqsW1QXm3l27I1pAvT4eIuK
 etPNFPhYhA5W9RoXZeurAw42AaMcp+r97sCltXZRa7INVxdrEaj+rOnVZKU57wBRDcSI
 6nSg==
X-Gm-Message-State: AOJu0Yw+Lq03/IrpU6A74pFCrpaIKcBfSUlhQ+80fALxei/dY0sF2kHw
 c/kSlM5Mbp/PAIQp9iSJUTEw5e4wWqneiGk2213xUXGVWe2wMi8f2uw4zA99CBLQ1ks7W9ijtuP
 CjpwWPdgnDSs05d83epBGik1bXBgZ5NxHEGzo
X-Received: by 2002:a05:6402:4405:b0:52e:83d0:203e with SMTP id
 y5-20020a056402440500b0052e83d0203emr11091381eda.10.1694273497227; 
 Sat, 09 Sep 2023 08:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwPKi9Ud3OSKETkcxe+CEqSSk4EkOZGAiwxnfz5HH0ThoHyvULsXX5HGNPbCGCDHOpytWyvw==
X-Received: by 2002:a05:6402:4405:b0:52e:83d0:203e with SMTP id
 y5-20020a056402440500b0052e83d0203emr11091364eda.10.1694273497067; 
 Sat, 09 Sep 2023 08:31:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 d32-20020a056402402000b00521d2f7459fsm712898eda.49.2023.09.09.08.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 08:31:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v3 2/7] drm/gpuvm: allow building as module
Date: Sat,  9 Sep 2023 17:31:09 +0200
Message-ID: <20230909153125.30032-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909153125.30032-1-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
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

Currently, the DRM GPUVM does not have any core dependencies preventing
a module build.

Also, new features from subsequent patches require helpers (namely
drm_exec) which can be built as module.

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
index de1a69bc4a44..aae086deaa2b 100644
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

