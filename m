Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514919B86B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 00:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF436E9B1;
	Wed,  1 Apr 2020 22:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C06E998
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 22:30:43 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id z3so682488pjr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvIln4ea2cKUuBRn/jGt0NGfa231I0yrBgDkEYXyLHk=;
 b=Lm+XZ2oKaXCg38hsFMY5vwzyvt2VNSIySpErJWlob/U6vfnS6VurSGvzM+7kBocZI/
 GLdLot/x5aJbjajSMD7Da2hfD3Qth7zTCWouJqve+o1sDzRSvHVoSLmZ20bl2WPuzzAD
 Q9dlf9c+/GhxfXF0zgRuWULmC/+wtdVxGcSf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvIln4ea2cKUuBRn/jGt0NGfa231I0yrBgDkEYXyLHk=;
 b=HFm4EyLSeoJRCt9nmttTz3KOcgY0s+7JKOIjbfzn73dPTUJUS+HL5tbEWhNz5tquO5
 RC1gcW1DRvYL1Dx6Jt+dazfbCbaPbPAI2Uuyp7ZcMAjSLd3KJfUMQiIyrXh/rB/AI7tl
 D8NRm17Z0YIkbE4jHyYPmi1dNIT5y1xei60ppXxsZp+fcNBooMzHPKmm/Vl/GLhlyNK4
 kOijz8/b+II4hLpA60v/Tx7mwgS3othdY+hP3biNNY3da/Rx8mNrK71iy/STiu7JE153
 0gKKW3CDQSi9afeyqg6PJr+pWKHvRQAmCungospmoZLaCu94T21gBsbOclPIBa46y8u5
 j5Mw==
X-Gm-Message-State: AGi0Puar25dLoLRo4zXRyEnX+giE70/lq++oAeY93+cePeuid32NHteM
 /TyKvKMfWzbFC8YWGsTqvDFASsobDi4=
X-Google-Smtp-Source: APiQypKcmm+LndDytd1AuEqylfrSjsG++4e+s/jnD0nUQxGLPKYIkqxZoX8aMJW2V0wnzHgY/K/P7Q==
X-Received: by 2002:a17:902:ba8e:: with SMTP id
 k14mr68814pls.103.1585780242520; 
 Wed, 01 Apr 2020 15:30:42 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w29sm2167311pge.25.2020.04.01.15.30.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 Apr 2020 15:30:42 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/virtio: delete notify after
 virtio_gpu_cmd_context_create
Date: Wed,  1 Apr 2020 15:30:36 -0700
Message-Id: <20200401223039.2860-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200401223039.2860-1-gurchetansingh@chromium.org>
References: <20200401223039.2860-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first 3D ioctl will take care of notification.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 336cc9143205d..867c5e239d553 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -47,7 +47,6 @@ static void virtio_gpu_create_context(struct drm_device *dev,
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
-	virtio_gpu_notify(vgdev);
 	vfpriv->context_created = true;
 
 out_unlock:
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
