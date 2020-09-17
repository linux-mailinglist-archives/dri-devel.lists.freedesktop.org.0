Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6226CFCB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B7C6EB59;
	Thu, 17 Sep 2020 00:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729D56EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:58 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id v14so291714pjd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=inq5VPAbGj55lVsEfqOots0UsyGc9IzMu7tBnt2vhjs=;
 b=CSnV/8iMtkPO1DPjgYgFR7v8z3fS+wwbgcDNmhI1ukT2vPjKZiI/YIQwKlAe/35j92
 9JiV5ExzMD66KtXIMprFR2FhAPuIJa2I5MGyNMjtcvPz2+rRXK5AvxbonJ2DDwzYgmNZ
 k6ky6JAClA4hxd3tI9cz8nP1VTdtpKiGdn6Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inq5VPAbGj55lVsEfqOots0UsyGc9IzMu7tBnt2vhjs=;
 b=HIDf03I3H60PnDfKGP9bVb51riKV25KA74Z1ijkm7BKncKdCiOLMdvsxKPEezyQQWy
 P9k5ytvazUWG6U/MSvYvcd0CF3Mv3FyYkI19LLfjW8hiURmjk95wffIJ6ntP0UekS3E2
 Epu6KxpHLvDOFiafgbzlJD+VNmEqz3wAAhLO4BX7A0Dsu6R+WEO3O3Lot9WHNLvYMQ1I
 O22bQXqyT0Zh0u5KFOIog/KVLqIbaw6XKfAheMOcEOGxFEasowMlHlsrLtpqQqQ+jSdX
 WmOvOFtS5Ysj+hqI55bOF3MTrkarXe4Q7nl2ngQFFZCkFC4RkdIbYqIueORemlpbevq1
 KtVA==
X-Gm-Message-State: AOAM533OLsQk/Ws/LVa9nXOa4mktr7MIZMUqtbhBkzRT/bUVhp/am3xF
 NqJggUAEcQTf4Zx5fkUqJ0QzMNDRva5Aqw==
X-Google-Smtp-Source: ABdhPJysuEuJWScIyZP8Z0VdoHIatOogntIJAk/jaSuHQiSQtVsny512pN+G3kpa6EwqEuOGB4MTgA==
X-Received: by 2002:a17:90a:528a:: with SMTP id
 w10mr5968995pjh.107.1600301337822; 
 Wed, 16 Sep 2020 17:08:57 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:57 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 17/19] drm/virtio: implement blob resources: report blob
 mem to userspace
Date: Wed, 16 Sep 2020 17:08:36 -0700
Message-Id: <20200917000838.735-17-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917000838.735-1-gurchetansingh@chromium.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
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

The stride field has never been used, so repurpose it to be
"blob_mem". This way, userspace can know the memory properties
of the blob if it's passed between userspace processes and
no suitable userspace API exists to transmit that knowledge.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0bf789f2bfdec..b0c9dd171ad8a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -301,6 +301,9 @@ static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
 
 	ri->size = qobj->base.base.size;
 	ri->res_handle = qobj->hw_res_handle;
+	if (qobj->host3d_blob || qobj->guest_blob)
+		ri->blob_mem = qobj->blob_mem;
+
 	drm_gem_object_put(gobj);
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
