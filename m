Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB39C8E14
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168DE10E817;
	Thu, 14 Nov 2024 15:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UOee51/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3765210E813;
 Thu, 14 Nov 2024 15:30:31 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso143963866b.1; 
 Thu, 14 Nov 2024 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731598229; x=1732203029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=es+F3M5SSYwvI4y5uEWYNZ4MyERHw7dt72hObBxhhQo=;
 b=UOee51/RZeBR+bnMpBWI3rT73wo5ciTCY4djpkd57ZZ49LvjHRZXMO94e10Dy7csw3
 Uyl2uGEpVHah3Bjun08lnpCOK/Xq+GHCdGmcPjPwRzjWeoUwTre5qrm/MN2YCuhDWWUJ
 h1DNSJPEPGeKe7E4qsoGhV7uYd4bAk7y9hQbHMXI4hUT42JIwpax9Xt+D0fKReIPqkg2
 JYJtcnJpzYORaDutzXsp7p62thsvf2P/7rVJvbKQL1BHcegfoo2gb3EOlOXaow0WBAH6
 zsXZaG/zGv/5Np19KCRr+h26bcUTcStys2vXprHOIZL5uk+/kmHKxDVyr4Ab1YDEgrG/
 AGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598229; x=1732203029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=es+F3M5SSYwvI4y5uEWYNZ4MyERHw7dt72hObBxhhQo=;
 b=a3gWuh5Vv3ykVozFFRGzonBz/t+JDZm0ztHYPzm++JrXQd8IWABrxrFKQdwU7AmKCc
 8vb7wZCgUNTC8/Q+rCWqqivxSfxAwgtpoC4BVC0UzHE/xyMmkYg8cMe5IjZqVt0a29WL
 adka2JOmYRTBCE7aCVq4D6Q0/UlMXKZe5kbYNEDUe9yRNmgrhuaIde5QMAHvkJPAHGFP
 Q2jK8e9Sci4pnWt402FSM1hq+8QE0cM2Zy2p6tnqeGK535UlX/Rf7HhBObTWTQiGpnzX
 wap3UP+e/JQCfuTtlz1susz/PP/OcoWLNzwhRw3IkbLOGURNntPAFGZD6fVABLapiBz2
 M/aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6xe3wLD3DxLsquZKKrDt1LhnO3OSWiIiNCgOy1EyBaNhMn0KpJka7r/cxEGxWwtf/LnjCCwL20YAY@lists.freedesktop.org,
 AJvYcCVM20OpWQE2g07JWtAd5Mf47vFvfSlMZYy57FR+vhnv/gtRo02lM/XFi0IymF3LcwWbAs5wVmkQ@lists.freedesktop.org,
 AJvYcCWvQot3aF8lQdXQr06kJ9H+x1o4RH+wOAWHLftttP40KOuuXJ7Vwj3bL7oJ61LKScsDsinFItqSwko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwahdZICMbH+zl+vymcIKqXUesdlsd6b+rnJuAFoadD8nLraOHG
 AQqR5f/0oZnJcw0haiH5l98dkByzIlKR9t9X8lguRmpMIW2aq/V878eeDoGLWmQ=
X-Google-Smtp-Source: AGHT+IG10VBr9gvvw5qDFtZWGzbKJcUB7UabePBt7gF7vc2MTqmsgNLE1c1SwGG3/4/IruuC9U/80g==
X-Received: by 2002:a17:906:da85:b0:a99:f56e:ce40 with SMTP id
 a640c23a62f3a-a9ef0021723mr2489316766b.47.1731598229325; 
 Thu, 14 Nov 2024 07:30:29 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c9:2500:bb23:40f5:fe29:201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046919sm74063266b.156.2024.11.14.07.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:30:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/xe: drop unused component dependencies
Date: Thu, 14 Nov 2024 16:30:19 +0100
Message-Id: <20241114153020.6209-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114153020.6209-1-christian.koenig@amd.com>
References: <20241114153020.6209-1-christian.koenig@amd.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

XE switched over to drm_exec quite some time ago.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h     | 1 -
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 1 -
 drivers/gpu/drm/xe/xe_vm.c           | 1 -
 drivers/gpu/drm/xe/xe_vm.h           | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 13c6d8a69e91..99196228dcc8 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
 #include "xe_ggtt_types.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 79c426dc2505..2606cd396df5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -10,7 +10,6 @@
 
 #include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..00ea57c2f4b9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -10,7 +10,6 @@
 
 #include <drm/drm_exec.h>
 #include <drm/drm_print.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 #include <linux/ascii85.h>
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..23adb7442881 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -17,7 +17,6 @@ struct drm_printer;
 struct drm_file;
 
 struct ttm_buffer_object;
-struct ttm_validate_buffer;
 
 struct xe_exec_queue;
 struct xe_file;
-- 
2.34.1

