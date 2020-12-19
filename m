Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E32DECD5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 04:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAFB8982E;
	Sat, 19 Dec 2020 03:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401FB8982E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 03:20:07 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id y8so2417150plp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 19:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8Y85I/zAbdKBi0JFj+5KIlvSN8l0jOp6aLzZdxZPcM=;
 b=uf0nVN6ZjINbfnBZh7x7lt1Yz/aA7RmSQ5DGOaNwRc9hG2q6XZ8r0lc/65SiP0OkHv
 Gc6Lzn61cJWRAM9o6RzBz+01/iswxPUhvzj0nmcEOB9Xc4Umi40inKj4Sh533fxiZLUP
 uanCAFcFiL1O/Ue60VXroa9GT+em7OvzCIgK2U/VzJtp+VyqI44e8lO3Kwf87G7dydfL
 4G8IZVmAf1ASens8WeVVkQgaCW2t4WzKmruZPLIIN+aDMvcA1ygnDcfYaogFDwphBVUA
 Ps44n0g3Mc2W0aRAA4v/Jv7t1E61V75V99saaNhDZ4gSgw3htbNnr69VAzc1aUxccAXv
 P+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8Y85I/zAbdKBi0JFj+5KIlvSN8l0jOp6aLzZdxZPcM=;
 b=HrMnOwVFBmPQBrajJhqGuqjsutK3NHZboGGIHhcH9seJiAZlwVaFAs/BdlyjT1xHiJ
 T7ESwl6F/K6XKq8pUP5NtfhZyzE3KXEUhKkKiN1pGdahicWyp6Pn/GN7m/NpK/1bJndv
 VYHUYaPSx1oyrqooIK3EPH4/yK5cOPnE8GNwQ5FHb3KmwYVVdKzAi+bCr4aa9okBP48l
 pGnxEaHQ95+G5rqpFwk7/BfCQ5gTD272v9LN9fgqaDOb7Vasbr82j//oFibUc0VdvtZw
 Bf5nfeyrqYWiT52njyfzyZKv6njS0gLq/M9D6Odjvj4X0MfNeaeRlO8WX4igzXFOA6rz
 4QEw==
X-Gm-Message-State: AOAM531AhBYmoaApzH8rWVyNaaOuTOgHvA6bcKegauZ3uxqyv49TzNnb
 KYgqAIGwsGaRcR6T9L5nOJrBHL9o8TkrB7cX
X-Google-Smtp-Source: ABdhPJwW6r3Or+cmlQxGt3AtMgmr/y2kVdpBq9e13ezfD/dc6X3txztwbrgWn9tIO7UK0RUrBNyzFA==
X-Received: by 2002:a17:90a:4083:: with SMTP id
 l3mr7297711pjg.109.1608348006356; 
 Fri, 18 Dec 2020 19:20:06 -0800 (PST)
Received: from olv-glaptop3.lan (c-76-103-101-107.hsd1.ca.comcast.net.
 [76.103.101.107])
 by smtp.gmail.com with ESMTPSA id b13sm10451590pgr.59.2020.12.18.19.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 19:20:05 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: align blob resources to page sizes
Date: Fri, 18 Dec 2020 19:19:59 -0800
Message-Id: <20201219031959.92932-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

They trigger the BUG_ON() in drm_gem_private_object_init otherwise.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 23c21bc4d01e..d6f215c4ff8d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -134,6 +134,8 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 
 	obj = &vram->base.base.base;
 	obj->funcs = &virtio_gpu_vram_funcs;
+
+	params->size = PAGE_ALIGN(params->size);
 	drm_gem_private_object_init(vgdev->ddev, obj, params->size);
 
 	/* Create fake offset */
-- 
2.29.2.684.gfbc64c5ab5-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
