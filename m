Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B1168C11
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 03:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE136F5BD;
	Sat, 22 Feb 2020 02:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC946F5BC;
 Sat, 22 Feb 2020 02:43:19 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t14so1661426plr.8;
 Fri, 21 Feb 2020 18:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3U1IC2Bl/UEMV+oLQmV3uNw3C939JxbUINaVIeDLDNQ=;
 b=rQhBDedbrOzT0cgipChJyyR/MxNWkwqoJ6gQ7VoSmSWpB7bLpHx/DzcL5dg7d4Pj3E
 i5TfyeY9vXJHPDpe5vghaEMXfbyH+UOr7Yb2ZWKuxbYIxNcu0hdr70XK9wWyGhTQT/+t
 f8Tlp6voxJu0Sxwdou69wd0T2yMJAaqqeyDAEZXHNDOi4C1QZzaxbf54LevuEzeaZJ7f
 jbnL2mc2NScRBF361itdRKi/Sky/+/lVGr9T5KRjFcQY4e7nxRdpP7qeIS+v+mHfTm/h
 LK02EqcAmJypgE2phkAUcuYEZirDXpqzvdL5AU93Uk2gnpPvA7W9BuX/9/uc/JOxkuKs
 REiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3U1IC2Bl/UEMV+oLQmV3uNw3C939JxbUINaVIeDLDNQ=;
 b=QdnrxGgY5yBuO09w5uHdf9wXtxSmli2V7kxiy9hd63yUKQSK/vk1bVIDyzNYHhkZfG
 /vYa12nWh5pLgYw246bFdNUVddsoREi4sdxRJLk6X7bWPbUBxBaiyK5he2DtxJkh7N48
 pdNuDc7COwZzbGpxsSHjtW470gsMq8Ti/ZsVIRM/J5dTx4o9/BLUwMp/wDryhsSD1rqd
 ZoJKlL2JBPHW1osW7SXD6wYKx2UHqCKb8x86/0eLF5NHpH8cLEpHcqNoTSoafflvmQZA
 IWYMkcYUX1+aqQmVBHY6HybqTjKR37f1jUGRhgSf3zO1YY4h6izMDbeXQtNK7BzvZ3nq
 LnSQ==
X-Gm-Message-State: APjAAAVLAaw55tskoV4tMqbob7d63BbCRICAJ1dgUgfH9UR2K8bddNqx
 UN3wiENe9plTLQQhdowyryZRdrQbRrl8YQ==
X-Google-Smtp-Source: APXvYqxNM5qCTESDav5Xk2PWTAnHpQ9gfkwwclrwc9m3JNKxIiyHmW8jd2qRBSF8WVf9E5l0dar5fQ==
X-Received: by 2002:a17:902:6bc3:: with SMTP id
 m3mr40066110plt.27.1582339398714; 
 Fri, 21 Feb 2020 18:43:18 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id u13sm3797317pjn.29.2020.02.21.18.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 18:43:18 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/lima: save process info for debug usage
Date: Sat, 22 Feb 2020 10:42:06 +0800
Message-Id: <20200222024210.18697-2-yuq825@gmail.com>
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

When task fail, we can find its process with this information.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_ctx.c | 3 +++
 drivers/gpu/drm/lima/lima_ctx.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
index 22fff6caa961..891d5cd5019a 100644
--- a/drivers/gpu/drm/lima/lima_ctx.c
+++ b/drivers/gpu/drm/lima/lima_ctx.c
@@ -27,6 +27,9 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
 	if (err < 0)
 		goto err_out0;
 
+	ctx->pid = task_pid_nr(current);
+	get_task_comm(ctx->pname, current);
+
 	return 0;
 
 err_out0:
diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
index 6154e5c9bfe4..74e2be09090f 100644
--- a/drivers/gpu/drm/lima/lima_ctx.h
+++ b/drivers/gpu/drm/lima/lima_ctx.h
@@ -5,6 +5,7 @@
 #define __LIMA_CTX_H__
 
 #include <linux/xarray.h>
+#include <linux/sched.h>
 
 #include "lima_device.h"
 
@@ -13,6 +14,10 @@ struct lima_ctx {
 	struct lima_device *dev;
 	struct lima_sched_context context[lima_pipe_num];
 	atomic_t guilty;
+
+	/* debug info */
+	char pname[TASK_COMM_LEN];
+	pid_t pid;
 };
 
 struct lima_ctx_mgr {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
