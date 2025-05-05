Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF9AA8EB5
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41BE10E39E;
	Mon,  5 May 2025 09:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N1kZ2NmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C2E10E317
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:00:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso35207585e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746435601; x=1747040401; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S92e1vh4VqkP6Isn8EhCS9MZeN0/LLF2cWcJYmEVWj4=;
 b=N1kZ2NmWjS/DVQhoG2DMDBybSPkRAvZH8yv+LWY84dMA9KSvhyXEWMGzaEQwg7buns
 18Am+qh7PJKFZAfCTd5do9YtMs+oQqfMSuu1R5pn/f6A1qLI7A19gg3YI5HtsKNuYZ/q
 A4v2gDMKCvI0ztxOITk4OQzO+gLrQvON42ku3WErgmJuF++CCDYjM0VGE2/jLKU6rtw+
 kjHkEyYedxNXGz63XzZITOBCFLnmC6Fxm0UVZcMMu0pVyYQi7IIDUNguiAqzLzdm+4OG
 ryIGxuewzk5sKqfqkjlhiz+8D00IS2LJ8ufy3AH9vh/h2sK5xOIOASFK9YOtDudjSlEf
 Q3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435601; x=1747040401;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S92e1vh4VqkP6Isn8EhCS9MZeN0/LLF2cWcJYmEVWj4=;
 b=Tov6KqsQXggnXQPXojQKEvNyMJJvDft3i+Vp1l7w1zB6W6QYisaaVRVNnD5GpO532E
 IWAB/PDKb66Bz9DJjH7qoicV7VnKUKsZx0FamazSEQXGlIcaqnenx+nozf+SxVMqDbP0
 zEkg7YmLf6R/GEYHHOg6s67oLVjJ8J1DlltVZ11Bu3aJbEeWdCixmrHZDO5lMylFawJ9
 U3TM9+fU90UmabLDKZjBjJPTec94vFjaLcUOqQJBoeE6e0iI9TQvbZ4h02Y4frLoCEnx
 QEDJILaqmCxdfc77lsaNOzgp6wwHL03c4PIeco+hfP5wH4MZOkY4G4rUwg0MODz0cuI1
 edCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtvgGX/0M4qV3U/xf7IwSIKI6ss6ccx3cann4OjM2XIlbpR7VDTJQr2Takky41jzuE/4nwf9sp3RA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjw3k/v9g73nuRrkis67860IUQUzo0MQud330j9Y1s94tj5ZIZ
 rXqGLmWw7tCauplVtR3ZqiFmPwqldXUVe7FdMKzbJx4G07A8416jfeZR6xqvovY=
X-Gm-Gg: ASbGncu2e3NoqY9JOly1txV/TuucdW8q1tmmj70+X/mIGZNNBv7m8MGe7Pt/NUsy06B
 sLroWJ7/m8fHbSH1QWXNQJw96SzlkZvKe3lqlOL5qEMtHVI2Bh9fld8wCP/3H1YLPnlWPlnjjOH
 xYderH0uTJ1D4aefuV02DHydQsL+FqlYA5j3kEql+KKxRRBl3J5GOI7w3hQR2IjzJ1dEatDISZP
 gAXrF4eLc97i8ppY0HzsSNpdmvN0lSIXvc5q2yNmGnw5ahrMJvylmmCl5HrBt7cUE6HseluHkkN
 apAT2gV1eRUesRYEANC7jAU0OT95N5FHH8otIUPMzvkHtSkmjHO2DBc4XHsGodeBrIbglSzgoVv
 /cNDMMrK9QQisL+o=
X-Google-Smtp-Source: AGHT+IHjn0WyAvaUOF4DlLpk6vtF8Nr+Hc5ikZjH0bnD+F7TX2WdfOdAMYnVE4VqixoQkEYwPJFamw==
X-Received: by 2002:a05:600c:37ce:b0:43c:f629:66f3 with SMTP id
 5b1f17b1804b1-441c48d16ddmr50750345e9.18.1746435600672; 
 Mon, 05 May 2025 02:00:00 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.01.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:00:00 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 05 May 2025 11:59:15 +0300
Subject: [PATCH 2/3] virtgpu: add virtio_gpu_fence_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-2-810923da2b1e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2670;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=4ujhfnsD9gR0dVbtPkG6+9ZOl4u1TOz+cGHcmkSuqBg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMSkxTOFIxYU8xdmI3Z2kyZkpSYUYwVWc5CnQzaGcwdkg1WUw0UkJzSXFU
 dnVKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowUGhtRC85S0h6ZFVTRGdlZHdreWhPWHdiNWp5R0ZiY1NSRDNGczMxUHh2SA
 owMzBDK3ptczh3aFpRUWkyWjhIckp1NDZzb1pDcUlSREVkemRkWjBuUzZmbE4wVUlpSE5LTDdSV
 TFZcTBVT1R5CmpTMzdZbkx6NmlWQjlydFQxcUdnd05sOXM4bGZCdWxxNEFNUW5hd3lxRVhyd0ti
 UGw1SjcwbDBRMnVxSHNzcTIKTktjYVRQdThDUncrNkUwS3d4Wlh2Snd5dVBsRmo5YlRvZStJZXh
 BVUFSb0tteWtDNmtMUXpyYkMzVnNUc2pTaApzbUg0V093ZDUrMWkra2dYS0VKc3VvV25LZGFEcX
 FqL2dKSTBSUGtKc3FvazBoclF1S3BRSFFsaTBYWThpUStwCitoaElrQ0dvOERZSjVZR2V3bWxQR
 EMxbGtvR0h1K1ZUY0RSTW9iZk9mSVBrcWt0TjNmOTQyMEFHb0VYV01yYnEKb2JkUzd1VU52WW1B
 YUVnTzJaMVhZOUtZWkkrUW9TTzB5b3NrcWgyUjdOVkhrbG9iZ1FGWFBKYkpDejJ2U3FwaApXZkF
 DVTIvekxmencrdTNzaWNyaEQvc3dYVWErLzIxV2tzMnhWbWU2ZnJEREhXbzdZMXNWNmNFQk5uaz
 ArQXpyCkxkOHp4Nm14cFVaLzk0QlJWeG5waDJGbWhJZTUzVFpoS213bVlrdlJpcFRuUytuQ3R2T
 DkvOXdTZENtcFBIMjIKNy9HMjN4cVRNS0s4a2pwZncvNE13ZGhNSjcwVHl5UVh6UG94VERxQzAv
 ejIxN2lDQW9mZkdYUVh3MlBiWVhQbAorNncvY2MyZTk0RS9VbVlhUnVYUEpEejN4b1lHeUxSMyt
 kNVFjbi84N3d1dXdpVWxTalI4OTQ4TlFJMTNaMHk4CitTVEluQT09Cj1SY1FOCi0tLS0tRU5EIF
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

When virtio_gpu_remove() is called, there might be in-flight command
objects in the virtqueues that the VIRTIO device hasn't processed. These
commands might use fences, which end up being leaked, as reported by
/sys/kernel/debug/kmemleak.

This commit adds a cleanup function that lowers the reference count of
all in-flight fences, resulting in their de-allocation.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b3d367be6f204dbc98bf1c6e5c43a37ac8c0d8b3..c94b5edb2aec42fe5cd6416e243cf40e4e2b060f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -465,6 +465,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_fence *fence);
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 				    u64 fence_id);
+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vdev);
 
 /* virtgpu_object.c */
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 44c1d8ef3c4d07881e2c4c92cc67f6aba7a5df4f..3e536d190c0464f4db8955605bbf0aa4aa3612bd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -157,3 +157,15 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 	}
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 }
+
+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
+	struct virtio_gpu_fence *curr, *tmp;
+
+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
+		dma_fence_signal_locked(&curr->f);
+		list_del(&curr->node);
+		dma_fence_put(&curr->f);
+	}
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index da70d9248072b64786a5d48b71bccaa80b8aae8f..7b3c4d314f8eee692e2842a7056d6dc64936fc2f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -286,6 +286,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
+	virtio_gpu_fence_cleanup(vgdev);
 	virtio_gpu_queue_cleanup(vgdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 }

-- 
2.47.2

