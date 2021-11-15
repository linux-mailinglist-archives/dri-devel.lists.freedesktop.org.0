Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7D450DA2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 18:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870D66E14D;
	Mon, 15 Nov 2021 17:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461356E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 17:58:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso520050pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4DA5VQoxJZ9wQEduEEWsw5YptVeKFUc27448N5HOOd8=;
 b=OIkRDX9Uzd3iAAItrrOU9bgPfoajGZxbdu8XlVtFDdph3rSv9Vp8wQMaTBRTQ+yw3e
 shEkK9A0GeuA8k2IvrG4ftiqirTTJkJl6daXcSxv3XYz0bPNxCWol83IocIwGDsb432E
 058kQP52rI01nQHNyWzcYzlGP+x2PAW2cY5ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4DA5VQoxJZ9wQEduEEWsw5YptVeKFUc27448N5HOOd8=;
 b=hDWWXc8iv/KCe/yVAguECvNOIhGFLPtDDtb2z0U5iAf2bZG/R99u7lmcJXjGD3bvnp
 IeCcCRCRCQ7maBQMiRmRFDp1wYB9S6+YX7UkLjpyCm7Ee+ZHIscSMgHd0HQxLrOmaP+a
 MDmFtlZajZgLQbQb/9sFwtIPLjnUmWraCH+TIterSXq69JJHPy3ogR6fJg8Hi/RA7iS4
 xx9id/Q7pWqq7Oi3SaExeI7IsZrW7Sp+xeYR5PTGZW6S4YJm1aHp+N/gQiIRgsTB7rsg
 umRoDpUmfXK3UwuPQPAs6bT+Nspez6jJg+Sc34wA5MdSYIyAhkrS6jQGzy/AwogtHwn1
 Tcrg==
X-Gm-Message-State: AOAM530sb0tVJwUThVn75L0eES+Il2YXOXJ74KLungFculsm31ICTOxZ
 dHLewxXq14KRqf/v6REIy6GKwvUoErw7/w==
X-Google-Smtp-Source: ABdhPJxagQfhG9RyWSvQ50gmWf/Fbn3rUnHQV2CaY/ecQOeaLNzOw6SdTVFsdGQN73qfAC8GymSDiQ==
X-Received: by 2002:a17:90b:3849:: with SMTP id
 nl9mr67810587pjb.145.1636999082451; 
 Mon, 15 Nov 2021 09:58:02 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a1ec:50ee:e1ee:6f63])
 by smtp.gmail.com with ESMTPSA id nn4sm13611pjb.38.2021.11.15.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 09:58:02 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: add null check in virtio_gpu_poll
Date: Mon, 15 Nov 2021 09:58:00 -0800
Message-Id: <20211115175800.773-1-gurchetansingh@google.com>
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
Cc: kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gurchetan Singh <gurchetansingh@chromium.org>

If vfpriv is null, we shouldn't check vfpriv->ring_idx_mask.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 749db18dcfa2..7975ea06b316 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -166,7 +166,7 @@ static __poll_t virtio_gpu_poll(struct file *filp,
 	struct drm_pending_event *e = NULL;
 	__poll_t mask = 0;
 
-	if (!vfpriv->ring_idx_mask)
+	if (!vfpriv || !vfpriv->ring_idx_mask)
 		return drm_poll(filp, wait);
 
 	poll_wait(filp, &drm_file->event_wait, wait);
-- 
2.34.0.rc1.387.gb447b232ab-goog

