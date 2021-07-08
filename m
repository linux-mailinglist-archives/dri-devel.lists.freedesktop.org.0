Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E03BF8E1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C396E204;
	Thu,  8 Jul 2021 11:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916EB6E204
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:25:23 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id c28so14319930lfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8DBNWswRshfN5Ny23TvA6/jrQn9A7b/fkkYmbm5qgVs=;
 b=YaPePHsAH1A4rk9bMi6Jow3MV8e8FgcAJJV03p2GBnirkjF1LglYdizQpCUPrGadxj
 rkRLgiwMsfPTM6UwHDzHCe2FFkvWDhqAdIEBfwAopnuyT/JdQVCVHesk+Vje+ztqL5Ui
 lYl98ywxG+I8EraIrj0UwhdVzauhQnyQ/xw69vWKar3HfZLcNb+OgIG48Cbukl0JV55r
 RNVUNJ6OA0MjbdXOL0isM3cYbQlRS/eTzHW+P6elj3FkqYx1hY2jVEEnFut5qNLd/Yax
 0F1X3DlXXgo+HEf4/C5inRS5qJP1Z8Y4TfGJXTJf8kNLQ65BWyldELIMqgfwbUByg8Ak
 KpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8DBNWswRshfN5Ny23TvA6/jrQn9A7b/fkkYmbm5qgVs=;
 b=fxIF3VggCUm9+1722eil/GhToopFGpms+bqRXoeGR8RVbhJ2rBXvlwBqg6X6PKJP6N
 /c97jTkg5iTqCtwPVGmsQf0YFtbpghkNCFKpGF70VGd3iIq1GGem8SCYzidivVFuHYd5
 nIsKdfO+rGDWjT+C0xvOTHBvESDDsisNFgUF1448zdja0dH7EHJwxYoF/l+baisHYvoK
 195iwGNVUs0ugB0K/1p5jihiATuqF54YjxXFkkr0X1LFoKuERjACwsKM8fObWM6pJmI7
 6CVjbstZ6ZWEgHuxjS6CzNoZ8bhw19i9FUPgOC/Tbxu9WuGUcHCNuzvES+ZdHQAxlLeY
 39Tg==
X-Gm-Message-State: AOAM533NtOweaT+fwuYyVdT8I6vhTTV7jTOI++8fpbHAreRBLuWgzL77
 p8yo38jsYER4qMsKfZPYVSo=
X-Google-Smtp-Source: ABdhPJxWQm115GX66m8TZnr5hZ6aNXgoRI9xpJBwUvtpEV2EGc0IvaifB2KOP4Ph83DOlhgO8tDYQg==
X-Received: by 2002:a05:6512:400e:: with SMTP id
 br14mr19881396lfb.332.1625743521873; 
 Thu, 08 Jul 2021 04:25:21 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id j17sm213986lja.38.2021.07.08.04.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 04:25:21 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: christian.koenig@amd.com,
	ray.huang@amd.com,
	airlied@linux.ie
Subject: [PATCH v2] gpu: ttm: add missing NULL checks
Date: Thu,  8 Jul 2021 14:25:18 +0300
Message-Id: <20210708112518.17271-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <55aa8ece-1f1d-76d0-4f2f-951d39e79484@amd.com>
References: <55aa8ece-1f1d-76d0-4f2f-951d39e79484@amd.com>
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
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My local syzbot instance hit GPF in ttm_bo_release().
Unfortunately, syzbot didn't produce a reproducer for this, but I
found out possible scenario:

drm_gem_vram_create()            <-- drm_gem_vram_object kzalloced
				     (bo embedded in this object)
  ttm_bo_init()
    ttm_bo_init_reserved()
      ttm_resource_alloc()
        man->func->alloc()       <-- allocation failure
      ttm_bo_put()
	ttm_bo_release()
	  ttm_mem_io_free()      <-- bo->resource == NULL passed
				     as second argument
	     *GPF*

Added NULL check inside ttm_mem_io_free() to prevent reported GPF and
make this function NULL save in future.

Same problem was in ttm_bo_move_to_lru_tail() as Christian reported.
ttm_bo_move_to_lru_tail() is called in ttm_bo_release() and mem pointer
can be NULL as well as in ttm_mem_io_free().

Fail log:

KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
CPU: 1 PID: 10419 Comm: syz-executor.3 Not tainted 5.13.0-rc7-next-20210625 #7
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a-rebuilt.opensuse.org 04/01/2014
RIP: 0010:ttm_mem_io_free+0x28/0x170 drivers/gpu/drm/ttm/ttm_bo_util.c:66
Code: b1 90 41 56 41 55 41 54 55 48 89 fd 53 48 89 f3 e8 cd 19 24 fd 4c 8d 6b 20 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 2a 01 00 00 4c 8b 63 20 31 ff 4c 89 e6 e8 00 1f
RSP: 0018:ffffc900141df968 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc90010da0000
RDX: 0000000000000004 RSI: ffffffff84513ea3 RDI: ffff888041fbc010
RBP: ffff888041fbc010 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000020 R14: ffff88806b258800 R15: ffff88806b258a38
FS:  00007fa6e9845640(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fad61265e18 CR3: 000000005ad79000 CR4: 0000000000350ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 ttm_bo_release+0xd94/0x10a0 drivers/gpu/drm/ttm/ttm_bo.c:422
 kref_put include/linux/kref.h:65 [inline]
 ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:470 [inline]
 ttm_bo_init_reserved+0x7cb/0x960 drivers/gpu/drm/ttm/ttm_bo.c:1050
 ttm_bo_init+0x105/0x270 drivers/gpu/drm/ttm/ttm_bo.c:1074
 drm_gem_vram_create+0x332/0x4c0 drivers/gpu/drm/drm_gem_vram_helper.c:228

Fixes: d3116756a710 ("drm/ttm: rename bo->mem and make it a pointer")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
	1. Added NULL check in ttm_bo_move_to_lru_tail()
	
	2. Changed subject line, since NULL check added in 2 funtions

---
 drivers/gpu/drm/ttm/ttm_bo.c      | 3 +++
 drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1b950b45cf4b..8d7fd65ccced 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -102,6 +102,9 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
 		return;
 	}
 
+	if (!mem)
+		return;
+
 	man = ttm_manager_type(bdev, mem->mem_type);
 	list_move_tail(&bo->lru, &man->lru[bo->priority]);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 2f57f824e6db..763fa6f4e07d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -63,6 +63,9 @@ int ttm_mem_io_reserve(struct ttm_device *bdev,
 void ttm_mem_io_free(struct ttm_device *bdev,
 		     struct ttm_resource *mem)
 {
+	if (!mem)
+		return;
+
 	if (!mem->bus.offset && !mem->bus.addr)
 		return;
 
-- 
2.32.0

