Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E798839FC7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A01010F5D7;
	Wed, 24 Jan 2024 03:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B6610F5D2;
 Wed, 24 Jan 2024 03:01:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40eac352733so31149245e9.0; 
 Tue, 23 Jan 2024 19:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065212; x=1706670012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsH0t0Mo3703I7xwFyS+NhUyDq/CWLVJL75Yu+tXQAA=;
 b=ErnbZcDbC0exoKCupNVo93ZRy8uoqhLjw0vOkbgtwz0AIV6vn+Leni82xAjg1t5eBg
 ut9ka1IsKBLTydxjDNOpIgvkX91O3X53lcIX60nyApMyeu5CJNOS+bK28eM8hq+KNBMk
 85Js/rdWs1EbZtwRY8WWY/xAPJaGubS4sj+0E7J9aEmU9FS4txA/lPMgM4WJIprEXsg8
 pCc/49+xItGrE1Nv5rqbqmGW2pqEy1dcabVaI7Zr9v+TGajFKW8ZWx8CWjA0Qu6XNzBN
 /RHt6e0taD2py0lyT4gKFtOr7e2hcKSMd+9PP6Dyl5pB3aULeQJrjnJIbVK235mlAvk0
 qPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065212; x=1706670012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsH0t0Mo3703I7xwFyS+NhUyDq/CWLVJL75Yu+tXQAA=;
 b=T7Q429PhL+inKy6YI0en3im/DIumMf3WQ0j3OtSQcpoD8dX9/6NPR9B59jaXP5dVQX
 J3RZ/quSMFAU7R2hh8oAjrWDn0AL/0g6paioXIhvCEiVOEVRR7w9P9itWOdMSVAlypZI
 0JffWUH73Ht9+uQKiDeQrSWib3atWBLj6BFdVcvuYOkPE/z5A6OO7dzdEb9zoWu3MnL9
 mSxeDhHfL+gOMPnCf4I+9zDxTzq0ydLZVls9Krb/KuMl/xK1FjTHVVgRvZ/8Y7y+b5fx
 IOmJQC/LpI5dSvJHgAMmRLjoBcLAkIp6vEc18WbUBh2ylZvZyioRqC7ZdluyaUFqCilK
 kSUw==
X-Gm-Message-State: AOJu0YxEUAC0NIMaXW3K4CUEgMNB1izoWpTQwTuVYArbdRRFflhSSPSu
 TPsxNw0gBtZuBD7zLc4PQdSAmFvaZSl8CAKaicotpcSyAyL5bJ6U
X-Google-Smtp-Source: AGHT+IG56fGRQ4TmapP4DZAXI1KdXrMXihzbtQnGB0VIMwwJOsKunjx1HQl/TwRycRUsmO8GmBJLiw==
X-Received: by 2002:a05:600c:4214:b0:40e:afa6:5e00 with SMTP id
 x20-20020a05600c421400b0040eafa65e00mr620087wmh.168.1706065212421; 
 Tue, 23 Jan 2024 19:00:12 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:11 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/lima: set gp bus_stop bit before hard reset
Date: Wed, 24 Jan 2024 03:59:43 +0100
Message-ID: <20240124025947.2110659-5-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required for reliable hard resets. Otherwise, doing a hard reset
while a task is still running (such as a task which is being stopped by
the drm_sched timeout handler) may result in random mmu write timeouts
or lockups which cause the entire gpu to hang.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_gp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index b9a06e701a33..4355fa7b17f4 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -166,6 +166,11 @@ static void lima_gp_task_run(struct lima_sched_pipe *pipe,
 	gp_write(LIMA_GP_CMD, cmd);
 }
 
+static int lima_gp_bus_stop_poll(struct lima_ip *ip)
+{
+	return !!(gp_read(LIMA_GP_STATUS) & LIMA_GP_STATUS_BUS_STOPPED);
+}
+
 static int lima_gp_hard_reset_poll(struct lima_ip *ip)
 {
 	gp_write(LIMA_GP_PERF_CNT_0_LIMIT, 0xC01A0000);
@@ -179,6 +184,13 @@ static int lima_gp_hard_reset(struct lima_ip *ip)
 
 	gp_write(LIMA_GP_PERF_CNT_0_LIMIT, 0xC0FFE000);
 	gp_write(LIMA_GP_INT_MASK, 0);
+
+	gp_write(LIMA_GP_CMD, LIMA_GP_CMD_STOP_BUS);
+	ret = lima_poll_timeout(ip, lima_gp_bus_stop_poll, 10, 100);
+	if (ret) {
+		dev_err(dev->dev, "%s bus stop timeout\n", lima_ip_name(ip));
+		return ret;
+	}
 	gp_write(LIMA_GP_CMD, LIMA_GP_CMD_RESET);
 	ret = lima_poll_timeout(ip, lima_gp_hard_reset_poll, 10, 100);
 	if (ret) {
-- 
2.43.0

