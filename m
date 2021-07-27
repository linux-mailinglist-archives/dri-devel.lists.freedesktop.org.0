Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50EB3D7BBC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E2F6EC12;
	Tue, 27 Jul 2021 17:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBA46EB6B;
 Tue, 27 Jul 2021 17:08:00 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d1so9233666pll.1;
 Tue, 27 Jul 2021 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=jcAcwqstEOR4qb2BBinVCKD2vK40zabAZDobs9CGw7oA0B5/Uo39Z8U/TunA0JlJn9
 PgtSMUxc3TFLH+bNRf3LoMD/b0Ov9elpRdAEVvE+bo1kIf3MiQmjXoVrgQD3oDYA8snQ
 V9kcUqbchW1v5HSVS3WAzg8gbrak2eH2NjUrA+VThTFFA7VZyixQSKweVYFbWWHw0zmw
 3UcYs687WnarE+QTYAJmLNwe49yEHjKJ0W4VyauHl3XxKYGFyWAK1IHKM5GPo4n04quA
 ey1/UDfC8nxgG4iZpDmuK7iqD5hqwVZhhpvwma6zBE5s3RRRf+45j6bc46JCcxICt+Gd
 r0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=MCWBDaq3RbJAjK2oU4SqXpAUvtBL1gl8RrRFl/sLLCmegs9nbAG+UPJpVIg0wEctRF
 FMg9VK5IdQ6fJNCsniwVnNSsqUJbd1GtKSyFlPynDamZL3J1GcHKPu/ojBallvTsupIn
 o0oI3siwZJM5RruJsXGZJiIafTXrherWf7nIIiat4B1xEV9Im7UFe+EQSqJFVsNJJiQz
 axHYmu3RsoW7gDIhG55zRF1n21to6LVU9ZREim7Zvp6EWoIwMznTjAcHtiED7KzMqtsk
 7/sRJTUXYQ63jWDXxjy8dN9al/4zM8G3xQuCT/Z5+nyg9l7u79MnKx93UkdWY1T1acsA
 D03Q==
X-Gm-Message-State: AOAM533bKmV+Jn3FZLErcz4+Eb9umlHVqL4VlrZC0R7JQaOA/wtCpcOk
 EH16dTI8nOyyJSuY6hpDZEzaoZC16gSLFA==
X-Google-Smtp-Source: ABdhPJxkOfEy8AbqJGKBlgeO6CURUUgvuSIA2rG71cqgzXXY47ElwdZIc4XFSetnPwkigt1ALvNlTA==
X-Received: by 2002:a17:90b:3754:: with SMTP id
 ne20mr5224240pjb.74.1627405679659; 
 Tue, 27 Jul 2021 10:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id 33sm4978462pgs.59.2021.07.27.10.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/13] drm/msm: Return ERR_PTR() from submit_create()
Date: Tue, 27 Jul 2021 10:11:24 -0700
Message-Id: <20210727171143.2549475-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the next patch, we start having more than a single potential failure
reason.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f6f595aae2c5..f570155bc086 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -32,30 +32,27 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
-	uint64_t sz = struct_size(submit, bos, nr_bos) +
-				  ((u64)nr_cmds * sizeof(submit->cmd[0]));
+	uint64_t sz;
+
+	sz = struct_size(submit, bos, nr_bos) +
+			((u64)nr_cmds * sizeof(submit->cmd[0]));
 
 	if (sz > SIZE_MAX)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
-	submit = kmalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
 	if (!submit)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
-	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->ring = gpu->rb[queue->prio];
 	submit->fault_dumped = false;
 
-	/* initially, until copy_from_user() and bo lookup succeeds: */
-	submit->nr_bos = 0;
-	submit->nr_cmds = 0;
-
 	INIT_LIST_HEAD(&submit->node);
 	INIT_LIST_HEAD(&submit->bo_list);
 
@@ -799,8 +796,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit = submit_create(dev, gpu, queue, args->nr_bos,
 		args->nr_cmds);
-	if (!submit) {
-		ret = -ENOMEM;
+	if (IS_ERR(submit)) {
+		ret = PTR_ERR(submit);
 		goto out_unlock;
 	}
 
-- 
2.31.1

