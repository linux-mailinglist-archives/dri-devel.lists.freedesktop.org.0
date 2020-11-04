Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6D2A6418
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAAF6ECEE;
	Wed,  4 Nov 2020 12:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87F6ECEF;
 Wed,  4 Nov 2020 12:15:40 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z24so16478014pgk.3;
 Wed, 04 Nov 2020 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=R1J0AH9WgS50lM8FwPFZLpnnKAWRIzjyzvCVb6eH6q8=;
 b=LffQLyBZWSLKygNLU7+9ISrE6hdj+29LZSoL0kyavnd4iP2nJS5rzih3teg/MmzDOI
 etr9Q6zhdypa6G6uLRqZBItq/2pMojDYu/CjACz7rP2vKA08T9L6dplm4GqhxaeoSY+J
 q7A4ff/S0+SJj7ElQ1+sCmHfqiIomlZ7Uh9pFY538e3Gy+H9qrVIaS7Gu+ISrp8Nieuc
 7kK9PMUcSJrQRJga18KcWxpYaSOs4aRxa4vy/N9y+HEsHvbifQuMhP3qoKO2AAYyJqmD
 hVSFOZfs6WeKCLsj9Y4JnYmNy4Sl74UFf/0uRlPfAmStzyzR2/gCTW6FHEYmvU3hJlgJ
 6KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=R1J0AH9WgS50lM8FwPFZLpnnKAWRIzjyzvCVb6eH6q8=;
 b=rdk00KCXR3ZLcK6LghUrFjGXrR/Chr04oBICQGFRZzYcSnTVFOn8L40Ag/c11htKDK
 8QaWm/wc1TLMslwEGMeOFBusiqsNWiqjFBER9IDRc7uIGFnUjj0cZcjeOL6yY2teNkfu
 EX71SUJjYQI8IQgF9n2Te+qT1fGyEaFHjYJKtkrevDRbM9kgCiHnTEMT4XZkRWP0AdzZ
 +kjgOMnibtAdYIJpkyTz2jOSSF+8fJPpuiU9lbWYbXWq9ztgKWy3AShkWwsWxyi/aTyV
 ahgbcWrafoZ+gV2o2ZBiI/MGgATCMp3Ji3yRnHoXh57WDzLU5xmOS3aq8lzx8T0sz9qH
 a+eQ==
X-Gm-Message-State: AOAM532UVmMj/zV0hjXonsPn3eterjgVu8fWMv+8MD3UL8vyGSCpJ5EG
 sMa/2SVZ4uOVqoHtSIemGL4=
X-Google-Smtp-Source: ABdhPJw8errMDs0Q21bOu5QpwF/Z3BYb7nDU4hdkJcP574gWqsGLZYHxZtFlddpR0ij7IWk1qxo48A==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr3973377pji.7.1604492139788; 
 Wed, 04 Nov 2020 04:15:39 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id x4sm2288322pfm.98.2020.11.04.04.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 04:15:39 -0800 (PST)
Date: Wed, 4 Nov 2020 17:45:32 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: replace idr_init() by idr_init_base()
Message-ID: <20201104121532.GA48202@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 04 Nov 2020 12:19:32 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier. The new function
idr_init_base allows IDR to set the ID lookup from base 1. This avoids
all lookups that otherwise starts from 0 since 0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c  | 2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index c7c561237883..45b492edbb19 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -312,7 +312,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 
 	gvt_dbg_core("init gvt device\n");
 
-	idr_init(&gvt->vgpu_idr);
+	idr_init_base(&gvt->vgpu_idr, 1);
 	spin_lock_init(&gvt->scheduler.mmio_context_lock);
 	mutex_init(&gvt->lock);
 	mutex_init(&gvt->sched_lock);
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index f6d7e33c7099..1c8e63f84134 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -393,7 +393,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	mutex_init(&vgpu->dmabuf_lock);
 	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
 	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
-	idr_init(&vgpu->object_idr);
+	idr_init_base(&vgpu->object_idr, 1);
 	intel_vgpu_init_cfg_space(vgpu, param->primary);
 	vgpu->d3_entered = false;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
