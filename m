Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F5D3FB2C3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5389389CF7;
	Mon, 30 Aug 2021 08:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32FD89CE1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g18so13814185wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kwU9EyBPJZul+EbLL1ALPAdvKVqOFgLsvNBQ9S5l7Ps=;
 b=P9ximS+IpiXBe+zwQrs/JtHRWcOrccaBI8ziTS6F5DGTkiJuFOdcCRtK1t+9iSMcZc
 eBBqKkD/yo2/l93GCmLRCpgK8Vzm2nF8qzbhohCO8dWx1yV93v44m/VxTvgYB7TRyhT0
 M6PgKSU7rHN7EXUk7Nzb55dHjoUOMUftinsmSZ8niq1P2kX8wTHGypjixogO2vM1zFIL
 /n/9R8ejEbeTrLIfS63T3YKfS+KLj1O1ydXTZ64u/Fx2YWj2JA1GJsAox05tkoUsUTeq
 yFnzMaPWbFjfQMfhpotmY4kPWGRJdcwTpEeCjpAmwpf/xpNsTdYOp7QdmaVMY5gGyooZ
 tpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwU9EyBPJZul+EbLL1ALPAdvKVqOFgLsvNBQ9S5l7Ps=;
 b=CT0Lwzxr//iAglBpvQttcDJV8DTk5Gv9F6v0UHWgUQbgid3J8DmXhIRwKVbJl1XSop
 grw3ESL9HYlgz9wrIgDC/9ilbqW8Hnxf/MhtocYBObt+GNSYlC1SS0Rhi6KGOdPNBoIq
 KAp+hJJhvhgHoCOkvHEHl4PSts/GMUqTEXty5efeeVCrIZVA/uSh7AIxJl9IqW2M4ie2
 WLtIWf76E/tcl2wf0MHpWSjUCdCaQdDuui2Uv6CyPZpBX2nOivMYIYI/fNFyBPTg9Ub1
 0h57hKjeYme17MrkzfNYyw99+gft6piY5cxz/PYu/fHclvBHCPjnNOFSOYb5tNDSKRJc
 6vxA==
X-Gm-Message-State: AOAM532qYLnt5IzD/GsUTUWLOZFczjQeYk8lkXcUrOlu6QPQ5fWakmF8
 Z6rQCHR96Cjm4DH9xtWo7vM=
X-Google-Smtp-Source: ABdhPJx4J3vD8gDWSYEAWVbSBXLwgT9pQxpllaUuroU3Bfid+K31f6aSV9kfTX0EjjZt2dS6upmvjQ==
X-Received: by 2002:adf:9021:: with SMTP id h30mr23712612wrh.327.1630313834211; 
 Mon, 30 Aug 2021 01:57:14 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 07/12] drm/radeon: use ttm_resource_manager_debug
Date: Mon, 30 Aug 2021 10:57:02 +0200
Message-Id: <20210830085707.209508-7-christian.koenig@amd.com>
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
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 7793249bc549..9c45d8eb8680 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

