Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0ECAF40A
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DBB10E4A6;
	Tue,  9 Dec 2025 08:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WMwvbrPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AC10E04F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:02:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5957db5bdedso5721087e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765209770; x=1765814570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Im/UU88NzMzAmZTVyjewlopeNrCHZj8w4QA0s6ZSqCQ=;
 b=WMwvbrPrEGFYoSNxRa7e/SUYaUj2mJx9k27FRWm4KSLLuhhR891j/Ckww2Cp/GAVCJ
 QwG6FI5kOKwOQzEjP167fTAJ5TaiPnaVfEubMtvXxiNaWPoftwil+J4wvJO9CBRL61Fk
 WEG5s8tjz8etEGMAin0cHEOlWgZgXGz3w63aJAOx3w/xtACUH//k+ow0PXrpN4CrNrRp
 XCZDPQvgWFXSnn8U9BeoY3e8hTMg8VKiztixktNmlTRpOHAVywWyjY2gfKwNA9w/xPgH
 yi/sfW6/8k8Vbest4tpyfZoZb0fSqWX3a59tci+62Kp2JVB1Liv+6Yx9gG6uHyu3atZE
 zcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765209770; x=1765814570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Im/UU88NzMzAmZTVyjewlopeNrCHZj8w4QA0s6ZSqCQ=;
 b=O8I9oc/9nOHSv+Xw/zKDwduzVV6IS1z2/ztd7v8kRruxqryo7px1o4riHYdobWyLnQ
 XDR6kCB/VbQQ0etes3dmJ0U3xNQBtOt26urbh+qV/1jHgxU/eslNkVdg6oPg+srTiN3a
 9U0D3MRS3r2HrbR4ugZfs5XQdbz2/HaeAUv3CriAayAN2Alp4R2mm9xz1Qof89iH0OP5
 pNAb0fa29FejsXH7HcIVSGEHrCSY7Djvwc8nCoQ5pXc5vp3HSx/Ocu/KohUIrfyBGNxx
 r1c01a999nN9fbECL6zRedRDANqcn8ugody2uG+fGUcIlHgf0hyP3huN/supHV/VtFW+
 DIXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV72zRydHaS/bj58eSH0E77ap94RY1IrWXLMg/3++0tWA2x27LjsjixyEC/1KuZD0aadWGuYFb5JoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykKovSRwbf1fxKTsSYT6NI45bJS7t+TniUkVkPGlnO3QBr9pgp
 OnWnK4LdiFCW/VMP71xJGhuT8TjoGiZ7xzzGshHFdj3TaucgRImmSbMn
X-Gm-Gg: ASbGnctjCPRaBiPgPCpYRyzqRH+DkwXL6c8lSMKN9tkTHCFLdF618qFGqC1hWPLV8bu
 QOxiKxp0sIbCDuWWSFqUtuAr0I7aJqoYgF/f0PL9Mti0ct9YN5txVlUagQyIof1nCFq1FZT/G2i
 mamS7Q5hf0jb8RglDKqSx9T1hg6HAQ1tbRXWyKVxsifUGOhaDt2e15iqiMqpJKmOzBnlQkNzYRV
 WWEbMeuwbS68zr0asxcgbh1/tJT73WqdS0Ne1BBEuSYfGsfljpjFVF1jEiy2Rbg8H0ViZfbvapo
 tqd0GFVcjT5iJc188JH/NTjmXtvA8rN6q1G26TiWIoKE9fgd20Q0P2UzG2iC8P5b1tmP5l0baDZ
 Fm2jOLCSa1sQS7bcQkjowm7IVF5/FeCxAaurbIZzeX8fs5D+xHvKZJu4lblkSAFNSD5b4CMFPRB
 L8o9WVr9a/a/d5j/FZPTMUA1d+exJYf6scafAyoU5zqYAXu6+1
X-Google-Smtp-Source: AGHT+IGl+2gac5WBQa4JRm/ES2jta48b8h2trd4DFOGKpZqgj+BulMqtAB1nSDlk9h7vcIXyCWxuow==
X-Received: by 2002:a05:6512:e88:b0:595:81e5:7574 with SMTP id
 2adb3069b0e04-5987e8c36c5mr2692786e87.20.1765209770098; 
 Mon, 08 Dec 2025 08:02:50 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru.
 [89.109.48.215]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597df2f7400sm2890827e87.35.2025.12.08.08.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:02:49 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: David Airlie <airlied@redhat.com>
Cc: Alexey Simakov <bigalex934@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Lingfeng Yang <lfy@google.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] drm/virtio: fix undefined behavior in capset shift calculation
Date: Mon,  8 Dec 2025 19:02:29 +0300
Message-Id: <20251208160228.13145-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

According to MAX_CAPSET_ID, possible values of vgdev->capsets[i].id
range from 0 to 63. Since the intermediate calculation uses type int,
shifting by values larger than the bit width of int is undefined
behavior as per the C language standard.

Explicitly cast the left-shift operand to ULL to prevent undefined
behavior during the calculation.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 1925d6a7e0f4 ("drm/virtio: implement context init: track valid capabilities in a mask")
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 1c15cbf326b7..2e0ec7590ac2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -104,7 +104,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 			return;
 		}
 
-		vgdev->capset_id_mask |= 1 << vgdev->capsets[i].id;
+		vgdev->capset_id_mask |= 1ULL << vgdev->capsets[i].id;
 		DRM_INFO("cap set %d: id %d, max-version %d, max-size %d\n",
 			 i, vgdev->capsets[i].id,
 			 vgdev->capsets[i].max_version,
-- 
2.34.1

