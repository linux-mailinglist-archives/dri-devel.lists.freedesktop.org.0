Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD322EE768
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA226E402;
	Thu,  7 Jan 2021 21:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82826E402
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 21:07:49 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 30so5964519pgr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhYDnf4cNIBbGw1l9iLJstghP2/JTzbOropHNx+3T9Q=;
 b=SBf4SJouOQQSWWCXCXpiPO0RirKgOsJ2cse+TTdpPblypKxPzFaHg08EPhBPUWRZUZ
 R7l9h2OQWs8jgRO3ORskK0tHjP7U19cVFfBmmSID0DsXCcbnOtiPIOmqY2praxFCqf36
 FCKvdjk3frJErnljXa2UQqKxEI5fKHwbuw91cyC2YrTewIFn1gfCgrTQU9w7MgYDB2Se
 4lA4iOaXK/XQTmyBqBIaEjmrlG1pF8Qm+w2LWzkkRJIwhYELGx4SsAnwpAofZmC4VTbp
 VSqIJcPr676xddTRRqbLfXY/4rn+VCNsx7c2d2lNTYFp5OhD5luuiMSx0U9Fdb6kxO2n
 2PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhYDnf4cNIBbGw1l9iLJstghP2/JTzbOropHNx+3T9Q=;
 b=c06MxcZygBJVeGC7dGpfDXFfxui/XuJM75MNRbrdmr7K0yPLy9tRIcvXvaCtD1FIYn
 zjySO09ZH69Rm+RrziydiyWDW3HsZsG79sNjPO8vJHvEoJLuRDmH6zfkFH46k9DdiQJk
 3leLD/BZItcnTfiCkX/O2PqyfOM8lKQyOimUXGAITPCRpLyH62tPTm5e8RoadudplEbS
 6rCj78CtAoTvuiJCrC/qcAjDtykyA0vpMfEB+AePA7Pt+rll/gqGhwIBONcY23M+y2bP
 GI4C+5O2EZNUkkPyZCotY6KViJW+tg6ZdqCe+TmrVvN8aOwLM6P2b12a/pftKIxQljCw
 lgmw==
X-Gm-Message-State: AOAM532KZP5n1k8KHlnVpBURvw9creI6gRS2u1RmY5vZpc2cX2QOTCk7
 XR3mU2GT0En1mIMzzlYKY035eh4Pe1lQig==
X-Google-Smtp-Source: ABdhPJycq4uJrpFozZEKGOpbVfXdyUWZw1qrPIazgAcF9IQI2iLnsi6OGewiBT4Fx+cBeSIWQVUKAA==
X-Received: by 2002:a63:3111:: with SMTP id x17mr3627027pgx.329.1610053669049; 
 Thu, 07 Jan 2021 13:07:49 -0800 (PST)
Received: from olv-glaptop3.lan (c-76-103-101-107.hsd1.ca.comcast.net.
 [76.103.101.107])
 by smtp.gmail.com with ESMTPSA id l2sm6348674pjz.27.2021.01.07.13.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:07:48 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix prime export for vram objects
Date: Thu,  7 Jan 2021 13:07:43 -0800
Message-Id: <20210107210743.269885-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 16845c5d5409 ("drm/virtio: implement blob resources: implement
vram object") and commit c6069a02fa55 ("drm/virtgpu: Set PRIME export
function in struct drm_gem_object_funcs") landed from different trees,
resulting in prime export never working for vram objects.

Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index d6f215c4ff8d..5cc34e7330fa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -69,6 +69,7 @@ static const struct drm_gem_object_funcs virtio_gpu_vram_funcs = {
 	.close = virtio_gpu_gem_object_close,
 	.free = virtio_gpu_vram_free,
 	.mmap = virtio_gpu_vram_mmap,
+	.export = virtgpu_gem_prime_export,
 };
 
 bool virtio_gpu_is_vram(struct virtio_gpu_object *bo)
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
