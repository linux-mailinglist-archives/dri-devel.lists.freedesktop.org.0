Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C24988721
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA0310EC72;
	Fri, 27 Sep 2024 14:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cGOOuHBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54A10EC67
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 14:28:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so20348195e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727447280; x=1728052080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F67HKGJS01CpRs61gIMCLFbQnFdt6OhKu+DWzbIPnBU=;
 b=cGOOuHBTzFEK7phBOw+REQPoIVgJ/v6g72+ncQA8oN6f+xSYVjMYB8L0l++wUwbMMh
 o1k1KGvuW6sGJViyVMzlwM85nGLrQ3/KyJRNYcKx+jF1Z4i8rhApO4cck25nbL2JxyHj
 MQyuloKwb5DYOzvepfsT+kWqKIom81tX2K1O0ROCw/K1yAZ7ZOC1T/KdGceyTsJqbY9D
 BkTusH4XBQLBYVex0zTQzsQeIze0Aw07l1R3OmDgHFxtIUcBD5WRuM8z/uQvrGAwhJEq
 vP247rO/X5AnvZRvC6jB7SYpb0MqIFDWAwoO1CtFuzByDc/6TQtzWTS4bZhwkBwI5g5w
 Isjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727447280; x=1728052080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F67HKGJS01CpRs61gIMCLFbQnFdt6OhKu+DWzbIPnBU=;
 b=YtFoAO6PfRKeUnBuVJfrFD0FTInvUzgYnzaa5n+xUZuCUjhqCa3fIRJlG2O6Wc51WC
 GjqPivnlalUQNEdOqwBgtD92nC03hXDwMa9jgb1pVximRzjEh1Vt+Ys7fQxGVWicRFK/
 kd/3K/Kt3ODqhpfPZfS5krjEGPDJfakbPQp69MNwBWAduwXUvpHVG94I2wdSOgdCWZ64
 d65CNFZCVtwx6tWSNEqaTRiX3fInRJkSWXfk6fX6010aN7+Zuq2BEfd+cE4xrTWL8EpJ
 Zr9Elnfv7J0ysC3der+6wKG2BL8LbyJ2DSoFMwPyvfCcK0D7XcUVxwR2iNz9nDwBNBOw
 ckZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJpuq48eBaXpxYC0uVkCS+Uxm82Tzs21OO3DueCWyek5g1yDAg/A56LeTxgazk4pQJ/GZSsutKZco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd8LnkJTFtj8dzOX/T5j1+Q6P66XenvIr2MAhcxjBPexo0MYSs
 plsNbnikSr0/Y48++xjbRC6+a16qOGhs/HNqGNNs/rSD2at7EbGK
X-Google-Smtp-Source: AGHT+IGqMUeQTNMvVGjzppJTM4qR8JTQ3Wd7JMpDIOlQgOflfafr+/HEu+rk4iWn6/Tu/i2H7Umxfw==
X-Received: by 2002:a05:600c:3783:b0:42c:b942:1bba with SMTP id
 5b1f17b1804b1-42f58488360mr24405295e9.27.1727447280261; 
 Fri, 27 Sep 2024 07:28:00 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1515:2900:6181:3f3e:a0cc:be1a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a36705sm76944445e9.33.2024.09.27.07.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 07:27:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: pstanner@redhat.com, dakr@kernel.org, ltuikov89@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/sched: clarify the documentation on
 drm_sched_entity_error
Date: Fri, 27 Sep 2024 16:27:55 +0200
Message-Id: <20240927142755.103076-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927142755.103076-1-christian.koenig@amd.com>
References: <20240927142755.103076-1-christian.koenig@amd.com>
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

Sima requested that in a discussion, just copy&paste my explanation from
the mail.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..571e2f2365a1 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -166,8 +166,21 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
  * drm_sched_entity_error - return error of last scheduled job
  * @entity: scheduler entity to check
  *
- * Opportunistically return the error of the last scheduled job. Result can
- * change any time when new jobs are pushed to the hw.
+ * Drivers should use this function in two ways:
+ *
+ * 1. In it's prepare callback so that when one submission fails all following
+ * from the same ctx are marked with an error number as well.
+ *
+ * This is intentionally done in a driver callback so that driver decides if
+ * they want subsequent submissions to fail or not. That can be helpful for
+ * example for in kernel paging queues where submissions don't depend on each
+ * other and a failed submission shouldn't cancel all following.
+ *
+ * 2. In it's submission IOCTL to reject new submissions and inform userspace
+ * that it needs to kick of some error handling.
+ *
+ * Returns the error of the last scheduled job. Result can change any time when
+ * new jobs are pushed to the hw.
  */
 int drm_sched_entity_error(struct drm_sched_entity *entity)
 {
-- 
2.34.1

