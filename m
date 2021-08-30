Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B03FB2C2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7EB89D49;
	Mon, 30 Aug 2021 08:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246D289CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g138so8259428wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sklhFOUIHcyskXL2Sl6Cydy4UB9sY5VBZlHmhCG69qY=;
 b=jnW/uXj+XRqE1hOAYXcrNSfey9asas9PhxZg26M1jawHUH7UnFkG2xZvDVcm7kPcRV
 OZ8T1Zp/wzkYyBFpUbWB/P0bgNSmYhX/2q2/9/x0uoKqT2btQMg/C91hcZsFaLt6AXE+
 IYksbaS/OhZEop0Cs/Ht/r2dzpMcWnuyvqeC0YEFn3QePAIzy69GvcfXPhVWHIbogT++
 +M6L74uwQuJyk+/PpryK5t2sxsnXCItKR1z57fnvQ1wNZITabjT6d+5gPs786WkSRlJ1
 iKx/4EJNdnde02vFrXIyxlZJdIMFOZhdLU6MzcTtzGpN9XPChK2HUljiMv99wqJ1U9au
 JuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sklhFOUIHcyskXL2Sl6Cydy4UB9sY5VBZlHmhCG69qY=;
 b=scv2nEImt49jEb1Ib9pZesVnJBpY2hFVs8O4krHCL5qo+Yw0PdANq94aTnOYU19uzQ
 jhSbQzPk8mcdyUpfNBHeRKfdySfmmKgThPJiJkgobqZE6QmgKfPfpw/t+0Nw2TIFOVkh
 iB9j3cEzMjEXyMKgAfPQsdUQNHNmQh1VWWhMH1oIjnzCorcfgabbkahpv9pK4GVPNrOM
 +h3rAaoKkIRGcqszyP5b7RuMYrY+s/EzBbwkigQQ8trtvK4K6/3FZSCsU1PkG4dT4wdm
 GHKgW5RjyXLuNvhfAkRXqn8flU/TePQMAeMlUpco4/dkx6/KV3Jf3i7cA8EHncW0YQ90
 irzg==
X-Gm-Message-State: AOAM532L/qZi+pjeP5CXN/TBgjbOW+9LpmlIHi5YY0ufbYH1CYgndvJH
 6H0VwifzgrTT31A4hc3pyIY=
X-Google-Smtp-Source: ABdhPJw+urV768jix6IwsnTHFt+26hg4wWl5AWJbrrLL4zoT8EjSDZgcoz8o4Z73XW2V+KjHKX4JCQ==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr20433452wmm.182.1630313835761; 
 Mon, 30 Aug 2021 01:57:15 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 09/12] drm/amdgpu: use ttm_resource_manager_debug
Date: Mon, 30 Aug 2021 10:57:04 +0200
Message-Id: <20210830085707.209508-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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

Instead of calling the debug operation directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 489e22190e29..fdf4c46d2073 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2045,7 +2045,7 @@ static int amdgpu_mm_vram_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2063,7 +2063,7 @@ static int amdgpu_mm_tt_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2074,7 +2074,7 @@ static int amdgpu_mm_gds_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GDS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2085,7 +2085,7 @@ static int amdgpu_mm_gws_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GWS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2096,7 +2096,7 @@ static int amdgpu_mm_oa_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_OA);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

