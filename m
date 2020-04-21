Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F352A1B281C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6E6E964;
	Tue, 21 Apr 2020 13:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F7F6E964;
 Tue, 21 Apr 2020 13:37:32 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o185so6231955pgo.3;
 Tue, 21 Apr 2020 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lagb1/vO0DxAvOGX+tmWzfaoAW87nlvdTyVuGDvba/c=;
 b=Ugk02ikvltLeimw2cX5ucyurM3+CA3EcwDnP2DaZmfXYE3aswNKCDZXUHbb7m+HmoT
 mGOGv4UizHmyT+c9/KATOAXCOp8ihe/RDd1hZJHC5sGrcm8eQeW4ypfmrFqBHP14LOIu
 1jJ2YAqqaGDzoIPcYS25/j1IddOESd61YefATgfUps6M6xzY1K97D2tdfkiZgnc9Y04p
 afxdsB9WjxqK5VPyjXuHbIfJAGlfkYfOXu83P06zkiA6V9I972S0L34/3LMRMTb6qlYO
 CfijvaXS/XE7zaGGHkjKFcRTv6Yf61sikBcNpklhtLjr4TnOTanE74l156BqDG2sb9+a
 INVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lagb1/vO0DxAvOGX+tmWzfaoAW87nlvdTyVuGDvba/c=;
 b=NwzoYvy49gr5mzHNxERYHmkEwmYZDRMCs9R+/xawXLtd+xhYmv5pSIpEAJmSmN+CZt
 is8f0B+nOck4iL4lvNH9Vp1V88h/4CM5Jn/0nPC9WA4Feu9d3NuUXzlI0VETl64xfElo
 HvSzNhmw55XpkFGnW1iw1gcSqmiDTwIgQiRUCEUXQ/jePEl8wAF4TWU6ea/iHi/p/IT9
 Cl5ylojYQ90QHGWHrYw2EqcI6u5+YTanG4eaFRaF8PylQ4zG/7PmXdUTiVU0WrhOgmQZ
 Ma2nslzbNWIjUIu6ZM/8INFV4vTCd/uF8GQTOZdF5l29eYZj7XkodFOdYhUFsniaB2Jo
 hS/w==
X-Gm-Message-State: AGi0PuZAdvtuBgiM3J/0iMDxdAD0Bi8/2TR/B321W5kOjZ8nyto7TMyI
 xrbywlghoRRojnuKcA6UdncpoP5Nyo9eKg==
X-Google-Smtp-Source: APiQypJZXSgi3BB3lYT8eA+AX8RGBEaM4ZoSnd3qqFndE+ef1Ml+XOIr/R6zAyPTUwziSBIsSBmlng==
X-Received: by 2002:a63:eb15:: with SMTP id t21mr21333086pgh.279.1587476251381; 
 Tue, 21 Apr 2020 06:37:31 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:30 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/10] drm/lima: check vm != NULL in lima_vm_put
Date: Tue, 21 Apr 2020 21:35:44 +0800
Message-Id: <20200421133551.31481-4-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to handle this check before calling lima_vm_put.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 7 ++-----
 drivers/gpu/drm/lima/lima_vm.h    | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 387f9439450a..3ac5797e31fc 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -252,8 +252,7 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 			lima_mmu_switch_vm(pipe->mmu[i], vm);
 	}
 
-	if (last_vm)
-		lima_vm_put(last_vm);
+	lima_vm_put(last_vm);
 
 	trace_lima_task_run(task);
 
@@ -416,9 +415,7 @@ static void lima_sched_timedout_job(struct drm_sched_job *job)
 			lima_mmu_page_fault_resume(pipe->mmu[i]);
 	}
 
-	if (pipe->current_vm)
-		lima_vm_put(pipe->current_vm);
-
+	lima_vm_put(pipe->current_vm);
 	pipe->current_vm = NULL;
 	pipe->current_task = NULL;
 
diff --git a/drivers/gpu/drm/lima/lima_vm.h b/drivers/gpu/drm/lima/lima_vm.h
index 22aeec77d84d..3a7c74822d8b 100644
--- a/drivers/gpu/drm/lima/lima_vm.h
+++ b/drivers/gpu/drm/lima/lima_vm.h
@@ -54,7 +54,8 @@ static inline struct lima_vm *lima_vm_get(struct lima_vm *vm)
 
 static inline void lima_vm_put(struct lima_vm *vm)
 {
-	kref_put(&vm->refcount, lima_vm_release);
+	if (vm)
+		kref_put(&vm->refcount, lima_vm_release);
 }
 
 void lima_vm_print(struct lima_vm *vm);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
