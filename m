Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67FAA8EB4
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F3510E291;
	Mon,  5 May 2025 09:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XbO/XP0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE1510E39D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:00:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso39362455e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746435602; x=1747040402; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2aENDSHoBUQDncGi75hijmd8KFyNYGfXXoOg+4vaXxg=;
 b=XbO/XP0QpcDLs4hT1je4Rpt7pcvPxq7bxwemQqR1A6Ks5wnp0LWa2tPqgllDqNDkeN
 ngGt9RxQ3n0KCPzoOrH4dtcEAiWAMj7IBa4TKPRKQzWJbYN+ERTkKkNIDwpl3lNvIYxP
 uRKZVJr+/yh19LlLtrGtYmrwOAW/VLfBtlFGTXQs2osZA3fBhC9POmGd+W02MDe6EmIO
 nsBjnKGyBrKWXRZ9i73enkSLzwinxzS5x39wIjs5r9UcDj0i70t3L+oIlQ6Ap1pJ2JZ8
 IWz0PHhwdUVegrdcmlHx14UIcGPaNr9yFWVo32yZaHN2EwOCFcFfhb1+sOHgQ/eWSHg2
 asDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435602; x=1747040402;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2aENDSHoBUQDncGi75hijmd8KFyNYGfXXoOg+4vaXxg=;
 b=kNluZxJooaaqMXMKImSVYzXiwh04CodYtR11UbnZM/akL2YKIkxRBvt9T1ybn3MXen
 F/w4kQ0Yt33U2tF53Qrp6bldlrq59Z6j/pim/kjmhthB4fNB7NL+H+zp+t3X2mzPH+0M
 G2uzJszDBOyAh0OU3ThTSiZ5R/FuQYYRVy8BdXcUfGr9eOmngyYUPHhnLvih+yBqTqmA
 I0DWCIfQI6oxQubPiMhi5hVhWIhH4MS2C9EJ74DmI423J8ZKUe1DxHPS7eabYIHz2Nw/
 zBdCluOoG3zNA9AI399Jse6damgPNjhHkhX7ldShw8svWUUX6o+anIzNIw0rpB7l1xJr
 wwag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe0WD5TFvd/CMIKq6tYMvJLHKUqbS5bNLtGzj9IfceODoTZvp0XAHMkrQZ4J8PNEmnn5wXwneygs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2cCtNBLd+ARGA/G6aIzN5wMSEOZTKjdcXhTP2jkUk0Gb6qxRJ
 7SzRoYOVUgI8AL9Aco5JT7/J4Nou8POiQ3/UmzONSHNnOudILm2MUxXaIVs2O0Y=
X-Gm-Gg: ASbGncslz0Cno2ZGtetorWCm5AZUz5FCF5D6ui/dp2yac3N7NfQ17zwm9tDwsBWtoVF
 D5W0ep7Q9J1JJ5uQXqNgN4FX07TE5/Y1HS8xtRFkhG5emuxB3PSBYwPdAZxmh/ERPHefDPQAcHg
 7jfERFwodo/4zAnlT9DRxM3C7CZvODHNZBQ7QcQRstbRRQUw3Ze2GbpbUtkpo/lpvdeiIREbdXa
 yE00FMSp4F5jf2wD9Y1W/1fsSwFNkawhFIPhRdqrJ1WNEFiEiocH+Q+OH3wUDvLrw3X2/JDnVkp
 4rQQ9dlQlWJvW605mPEdGZZMhPoYJjqAbYffr6UhnZuuoDrXlnA9qhprc8rsj7a2mqnVBa63S94
 P9mcq2QZ7HORDmVM=
X-Google-Smtp-Source: AGHT+IGg0Vn+z3bbOg/uzaXcU9oRZ5gyFrNKK7mD8WX6VvRKSYjefILs7xFlLJvJAY/rZ0IGfGWxiA==
X-Received: by 2002:a05:600c:8283:b0:43c:fe5e:f03b with SMTP id
 5b1f17b1804b1-441c49483f8mr58600635e9.30.1746435602452; 
 Mon, 05 May 2025 02:00:02 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.02.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:00:02 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 05 May 2025 11:59:16 +0300
Subject: [PATCH 3/3] virtgpu: deallocate capsets on device deinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-3-810923da2b1e@linaro.org>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=0gWVNbRB11j6NzQheFtP3AhW2B6FSY8x/IiQjLkDkHA=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMbDdqamlhQ3I0b0s2OVo3LzBzKzdVNWx3CmpudkIydlE2b2hCOEdXWElV
 ZzJKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowTHZSRUFDUkIrdGM4Sk9ENzJTL3lzM2JPWDhFV3RaLzByRWszRm9aSnpWZA
 pTQ0RSem0zL1BKeWZmeWMyYmUzS3o2RDU3SkFjRzV2dERlOFJFbXNxaE5GUmlrdnd6RVZnOGo5N
 2NrNTFsZHR4CnMxdC82TmlXYzFlZmFXMTJNNVprWGFwdVpPSVZ3SVlGUVFwY1N1VDg0REtMV0xQ
 UnBqTG9BcmFSYTE2UndaRk0KWEJWVEl3ZUg4WWI3ekluMzkzMFVKckordDgxaUg4bUFFTlFjVHB
 PVWFxMVFCeWE1U3FHK29aSENWTFV3b21kdwpwS3Z3ajBKMW5MM0VvTVJNOUhLUFZPRTlpVjdzVk
 RvdnlDRHlNM3M3T095OXJ0elk1c0VqYkhxK3ptdWJrU1ZZCmhsRWNKUkRVYk1yVnRBSGI0Zy84d
 GxzMGp0OEluUGhERWg1SmNTeTlJYnpwWjNVQnJxNithNEpxQ2M3bzVzSjYKUUg2YmJJelZYZlkr
 VThvamc3a05VSGd0V0lYc0VNOFozeUhhcG1NWWVzRVhMWDRCTTdjMUxIK2NoT2syRk54UQpjWkx
 HblBlNVl3ZkFQQnYyNkJCUnhMdFhvUGZRNGJqdWd1YnVnTkRsQnNNajFnOHRUQmhBZ3pIMkZ1bX
 VjdDJHCkhBcjVaTVR1N2JUYVlPQ2dHL2ZwNVZzZERWYWd5UTliSGpubjNqS0RlWjR5Z2hFcHlQO
 EtydjdPV0JzVTZpdFEKR1Z5T0RNUi9JeXdycjFuNUVGQUtaOHQrRjk1MmtmWHZlVEFPQkRxZHI1
 WS8ra09OckRpem5iVnptcDZzbmx0OApURFpab1Mxa1d3ZDFEVGR5cm96T3puajRYQ00wdTVRSGZ
 sYWhPQWNhdjJZY0Q0ZVRTcVl4b0hTZFlONkJoZUl5CnluUnNNdz09Cj1MSFJmCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
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

virtio_gpu_device's capsets field is allocated with the DRM memory
allocator but never freed. Add the appropriate freeing call inside
virtio_gpu_deinit.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7b3c4d314f8eee692e2842a7056d6dc64936fc2f..a8b751179332b9ec2fbba1392a6ee0e638a5192e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -286,6 +286,10 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
+	spin_lock(&vgdev->display_info_lock);
+	drmm_kfree(dev, vgdev->capsets);
+	vgdev->capsets = NULL;
+	spin_unlock(&vgdev->display_info_lock);
 	virtio_gpu_fence_cleanup(vgdev);
 	virtio_gpu_queue_cleanup(vgdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);

-- 
2.47.2

