Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E17CB2AD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 20:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444510E00B;
	Mon, 16 Oct 2023 18:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC3310E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 18:42:03 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so3827639b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697481723; x=1698086523;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6WZJz45cUsK68zoTOTamsyrEphZOqaei7wiOeu4KLY=;
 b=WBo6etMO5HmQBUZQ6nDcWNHREAmkDaRUWln3UfEhLY2JjLIGEziSsTPaUcsl5KJJRL
 3NbBpx76JRG8rmh+KUjvKiyrag/IZOfG1TXfDFFyf7uhwelBui1Yoouf1VOekRNnjjUJ
 iA0zQOT4ZuMlSEv/lxNi/zDWXqctWdh8hlUWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697481723; x=1698086523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6WZJz45cUsK68zoTOTamsyrEphZOqaei7wiOeu4KLY=;
 b=Rb6wcGEeBoEDbN3dGW4Qq21sWsvImn/SnYZbxnraWWpVzu1bWN2KLfNPwkfdhxHAvF
 FdaAPVMusICJ7P5Ay14sUSLnwfPyfLa3hA4+Vv6I2B1AFmTXZEyed8JaHEtEtbksO5d1
 I7ZkZ9ruBFXFlru83Je2VzhoFdaoE6FsJ2mp3flpV/cl+YGuBFkqpBUQQ+YS/jPcjnns
 b4hGAxOs9YTV4OZIlL694Boqe7TEoBe5gnVJVGzxR9cfIu9ggPoo487FKcfOC0PU8OXV
 gfrCoEe6E1C6aIBF1OmJgD+rP8znjdL9P9TTV8Ek/9cKSrkqe1QUlPuTiuWj7POaU0Yc
 tNRw==
X-Gm-Message-State: AOJu0YwS206WlI42zGclkUSogA7GtoRv3Q9DGjwnhI2h4iOYmbfiPS8H
 IEN21TBitHLDbyY8p07rFsv6TwqtWe6E6dHtAHA=
X-Google-Smtp-Source: AGHT+IGU3WJBZtzKTObRorjELiamT+jizeHAUSBpFphWKT29ZD32dBtgkl7poh8klrVV4uOzUSE1gw==
X-Received: by 2002:a05:6a00:194a:b0:6bd:9281:9453 with SMTP id
 s10-20020a056a00194a00b006bd92819453mr13296pfk.9.1697481722963; 
 Mon, 16 Oct 2023 11:42:02 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9fd0:fd3c:780a:6af7])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a056a00189c00b0068a46cd4120sm218735pfh.199.2023.10.16.11.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 11:42:02 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/virtio: use uint64_t more in
 virtio_gpu_context_init_ioctl
Date: Mon, 16 Oct 2023 11:41:58 -0700
Message-Id: <20231016184200.639-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_virtgpu_context_set_param defines both param and
value to be u64s.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
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

