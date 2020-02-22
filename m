Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5470168C12
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 03:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0706F5BE;
	Sat, 22 Feb 2020 02:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699416F5BE;
 Sat, 22 Feb 2020 02:43:22 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y1so1663850plp.7;
 Fri, 21 Feb 2020 18:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2ggSthKmC1MgdMMM1+O34Z6L8ZA/PTSMhU3U2kSKKwY=;
 b=lHn4NegEo2eEgJ6OI436CMlKDD3rBXP0fARZnV9i9joRGZ/1CyLAqS6WBMnGqnY7AJ
 hdtjhUNx4OlV32O0Ctl76p+P1dy7to8tG+3nmfDUzOA4ufAAJ1oYzAaKyDcHgd8HLSTy
 LFWQmDccLxyxIa/6e0jBxPGpR7IxAORdq40llMwf5pCdhkWtro9m+WQtw97OJWh3o/Gg
 GO5y6Z44bkprujrvZW2LRfsmWuwYNj77P3OQPk2IpCLBdfiMkQLodtbKxMj92SzCfYmX
 nQn8X+apQC31T7KKRtvvZfNWXxZKBnM2fi7a3WzMVS061IYrC224we3SExnNf0NQH55q
 yXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2ggSthKmC1MgdMMM1+O34Z6L8ZA/PTSMhU3U2kSKKwY=;
 b=KFI6yvjLvDZ5h+eAd0BArVk9Gjw9kjH7C55twgtdcVrw/VZQd4QIH2wmw+8TPTt3YU
 P0BLlC/uDPPqwzvo0gKFt6AezambbXpV3pktCABa2r0Xq73ZyQGw3Gh2UrOwU8HS6bU6
 eXYVfBwgcYgglbpHjUKDOqTLIRqtscnCimSU+mzBMH3lo8hFjiMLCg291wGUoU7n/jOZ
 mJVN86NLK+ArLsMXiejeL5uq5hIbKcEBxl4OZbMoM4PHZ3TYb4KVazyK95rsBTbkPPEf
 bDX1xxN79Ck+MtOftxLe+1XnbzB/ItXx+Uah6r564RnkgTLPe3Z1PFrb6qlCfVdsVgn8
 8B7g==
X-Gm-Message-State: APjAAAWGwhJTS4dFOvTLVAM3r+JfeQo/tbi5YbLuu6wcbrAlTMQJMbr7
 XB0dOoQwSbke4155ML67u/HC8EDZ7X5I7g==
X-Google-Smtp-Source: APXvYqzgOA7O17pD73bS9Il54ctd3p07KxaEZk6NhUZTpRj21ANJA3/vxmrFlO+2Cb6Er7rc8ObyRQ==
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr37547620plo.203.1582339401786; 
 Fri, 21 Feb 2020 18:43:21 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id u13sm3797317pjn.29.2020.02.21.18.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 18:43:21 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/lima: add max_error_tasks module parameter
Date: Sat, 22 Feb 2020 10:42:07 +0800
Message-Id: <20200222024210.18697-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222024210.18697-1-yuq825@gmail.com>
References: <20200222024210.18697-1-yuq825@gmail.com>
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
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Limit error tasks to save.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c | 4 ++++
 drivers/gpu/drm/lima/lima_drv.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 2daac64d8955..e235d4545b6c 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -16,6 +16,7 @@
 
 int lima_sched_timeout_ms;
 uint lima_heap_init_nr_pages = 8;
+uint lima_max_error_tasks;
 
 MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
 module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
@@ -23,6 +24,9 @@ module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
 MODULE_PARM_DESC(heap_init_nr_pages, "heap buffer init number of pages");
 module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
 
+MODULE_PARM_DESC(max_error_tasks, "max number of error tasks to save");
+module_param_named(max_error_tasks, lima_max_error_tasks, uint, 0644);
+
 static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_lima_get_param *args = data;
diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
index f492ecc6a5d9..fdbd4077c768 100644
--- a/drivers/gpu/drm/lima/lima_drv.h
+++ b/drivers/gpu/drm/lima/lima_drv.h
@@ -10,6 +10,7 @@
 
 extern int lima_sched_timeout_ms;
 extern uint lima_heap_init_nr_pages;
+extern uint lima_max_error_tasks;
 
 struct lima_vm;
 struct lima_bo;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
