Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C7B0B2DD
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8773410E378;
	Sun, 20 Jul 2025 00:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ss34HM1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8410E43C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:18 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-74b54af901bso2154077b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969738; x=1753574538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f0g8euYzh4PVKXcq3yGRqIgxnHvB130Kw4K5TtkFvGs=;
 b=Ss34HM1IG3ZbVHTPC+/Ryfm6FXSxylEXz/bi4YBx3OrMotDfvDqRkmoA0k+h/LR4D2
 ccMehKXSTtnFcOhyi3qN7SedPooIdKGtwvKA8J9hXF7usCR/DPamSIUcIoGqtwFQtuXX
 K6T8PrNNp6qS2HSAOQQmad1QyPkM+ZjrjdOSUpUUG0ceGfyxLTsm4GipUTqspRaGEJ5d
 kCtDRX6SpwKbOU9M0RnMY3WLoeRHGrxpg65EAQ9Ls7cRKKr+41Jsr59BUd+KFqPJe991
 znSvG8I/MSvX91y5K7oRb1fEf9Q+SIP2mh+qRJuKsZZZ6ZYws+XPCtbTOf9ZY/rL2ZtQ
 Jzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969738; x=1753574538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0g8euYzh4PVKXcq3yGRqIgxnHvB130Kw4K5TtkFvGs=;
 b=AKKdTUSckG126ImGhH20l6Uc/Hf8GCGLMcVl8qhN9NwS6efQp/09rMhjGqJ81TXojg
 NMw673GbLyacnZwWQduVoUpCnqYjNxkx0Fv1FEjOd8XaK/LKkGpvKYKCInzJQeRiOwT1
 FkoRKP2EWB9tZ3tuJIT4PS5tKJ4FgfwhUHgUL/Qdud9/MXd4XvMpF1zUHVQkTKQRBqBq
 VRi6HhUolHS5JG3cNn6KZaxtfAwraLnc7Fl1u/+59sBYuLHKt0AlTxkhd+Q2zyrwCbs/
 R9MJBTUjzHTUOqYS3n3mB8mibn2IdWHcyozlZfvdpUuLQrMqJjwxuptpITD4DpfsC0LI
 h7wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/OLCOnBc/8RiOh+34EVl2N37J9XTr97KAIGNnYy/WVor8m42vG3ZjK8Le6XpP803WZ6PkvNXkSYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMKZFp7CVwN/0ZtIOYn7zhG+QOmkFIDYEJLtVyJ2WzwJbbpCxf
 qb4M9MvuaX8LnmSkRNAYLqOyLW9lYZla6CuONfLpBpA8eoAichuOYYqp
X-Gm-Gg: ASbGncufRMgUSJLe74EqRznvchMa7ji5LZEGDfoeDaOhxh5sVNm863G2QINEzLWH8U8
 F2vyLPzKJu3rzIGxIF94plWTV0AmJuGIuJ1sJ/2F0qcTzGKCINf9tqQP/378NgD23edfXxRxStv
 10S/MFytWg8MlM0+T+ZVyl9ROI5maVeD6P9Kmd6M5nSYaViivjh7MkFxzzPqe2ssgoIvyMCtA5n
 0kfKzSFHZ6tyromZFRjwjkHD6FU+goqL5RRV4WqFpvoOCBa8E2xld6JPkfD+ELtIp4E+muWYJgm
 pF47iKsKYXdOZoTqALlzLiC5ASNdHsSytBgTojOAiIDTfqjF0QI+oy9+yAAVPlGCCPZzBFyseOw
 E1g29beG6/b1wHpcRXfWOseN8A8kVhjAz3cvabCMQvZH4FcOoonbW
X-Google-Smtp-Source: AGHT+IH0XzEBS9bAnV+/bToDYJIzXvhemGCeVDQs7hDsvK1S65xaiAr4na/7QXrJig0yY3pxRhrAMw==
X-Received: by 2002:a05:6a00:9298:b0:73e:2dc5:a93c with SMTP id
 d2e1a72fcca58-756ea1ddca4mr24913433b3a.11.1752969738104; 
 Sat, 19 Jul 2025 17:02:18 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-759cb678d9bsm3377982b3a.109.2025.07.19.17.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:17 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/panthor: check bo offset alignment in vm bind
Date: Sat, 19 Jul 2025 17:01:45 -0700
Message-ID: <20250720000146.1405060-9-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250720000146.1405060-1-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fail early from panthor_vm_bind_prepare_op_ctx instead of late from
ops->map_pages.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a857a0dd1099..7862c99984b6 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1206,7 +1206,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) != DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)
 		return -EINVAL;
 
-	/* Make sure the VA and size are aligned and in-bounds. */
+	/* Make sure the VA and size are in-bounds. */
 	if (size > bo->base.base.size || offset > bo->base.base.size - size)
 		return -EINVAL;
 
@@ -2423,7 +2423,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
 	int ret;
 
 	/* Aligned on page size. */
-	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
+	if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
 		return -EINVAL;
 
 	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
-- 
2.50.0.727.gbf7dc18ff4-goog

