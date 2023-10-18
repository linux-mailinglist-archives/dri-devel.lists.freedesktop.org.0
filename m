Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E407CE34D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5902610E1A3;
	Wed, 18 Oct 2023 17:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374CB10E199
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 17:04:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so47969875ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697648668; x=1698253468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8D3OOIrCOIDtlEK9pF0rvrHP6eIarWu+uB2ztLd7Yh0=;
 b=fH57k7yNA9aMzU2xpH5/juwz4zQEkj9YFFNkAoKw+nDx9JX79NPIJbw6BCLQSyx2C0
 hzx0qeOQfPjKvCC0llZI0sm2W2XP4XdVfDEM9lcPU8F4nNdHQAxXa/GfWPkLxQ9Cr0tS
 6ARJAApMsrzCmucdlU+NdUNdFTuSRHZ8VycWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648668; x=1698253468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8D3OOIrCOIDtlEK9pF0rvrHP6eIarWu+uB2ztLd7Yh0=;
 b=ahXStU6RggdNR4m/zWAOwVWS1s3EhtWUiD38KGVpBVZLccLWWy9yimR9VW9XnLnld0
 +uXO3ck4hoHdEZPuoNwlH0u6ojsBQv9w5DRpVgp07n55Vz63R08gXsrM99to72waV+mC
 00Z0ql5O4cxuhYe9a+LU4jdTI066zpKIMgpoqxXmkdkx58fmfURR3iN76OGdM9yDbuuy
 ZU+8nYfY9KJz+ACJ7lgGKTllJv0+wkir0SERT+dTHEEi6yOcYJd8PdOKaVaqyIS2e0nx
 7O4au0sqIAzzqTMulxgTyPhURwW1AK6o+yY97WcPomv9ujKcvV+J6JYlyZ2lNrWAH0kx
 yrOA==
X-Gm-Message-State: AOJu0YyXj1AwcI8VabVkzanteBkOR5PeMDZc//X9gb5e8NFvRZfuEb9B
 lF9OFO7yKlYHR669JyESFTgDd/hQrnhALp1arrMMng==
X-Google-Smtp-Source: AGHT+IGZBI04s4uw+PpWJ5IeoDXVkjV1GPb6ernE6mAcskXlYOHAFqdT9b1HhVDjBkHS9G5PPSd/Qg==
X-Received: by 2002:a17:90b:2ecd:b0:27d:a015:a783 with SMTP id
 ss13-20020a17090b2ecd00b0027da015a783mr4923309pjb.35.1697648668181; 
 Wed, 18 Oct 2023 10:04:28 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:26d5:64a4:ffed:7704])
 by smtp.gmail.com with ESMTPSA id
 fu15-20020a17090ad18f00b002749fee7984sm166312pjb.22.2023.10.18.10.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:04:27 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/virtio: use uint64_t more in
 virtio_gpu_context_init_ioctl
Date: Wed, 18 Oct 2023 10:04:24 -0700
Message-Id: <20231018170425.564-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com, dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_virtgpu_context_set_param defines both param and
value to be u64s.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Josh Simonot <josh.simonot@gmail.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b24b11f25197..8d13b17c215b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -565,8 +565,8 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 					 void *data, struct drm_file *file)
 {
 	int ret = 0;
-	uint32_t num_params, i, param, value;
-	uint64_t valid_ring_mask;
+	uint32_t num_params, i;
+	uint64_t valid_ring_mask, param, value;
 	size_t len;
 	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-- 
2.42.0.655.g421f12c284-goog

