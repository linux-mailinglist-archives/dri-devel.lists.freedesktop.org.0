Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E953B775
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBB310EFBA;
	Thu,  2 Jun 2022 10:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2010F171
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:42:32 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id n8so4211589plh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKdr7CfYzmgcmFB2loZiYlvbj5N+OaQKo7R5pMIPmm8=;
 b=A3YrpRaKmeYmIAEAeNWVkCe6dy9TDA0evXAfqjTuMB1ooxaYHhauQ/mQCJV9aAnVoW
 kXXODq0Lh2naSGw8EAakYnT2WUdDGUd98IMgUbNNJK6D6ju3AQjc9RXJQxhz/zN+TYlt
 0E33alUQvdrHLQWb3l96cHsGtZPf2qD9GiGE1JoVstN2zAUtsrlMTT1rMlBESwIvLpmc
 IFnj23t6ARNo+AuaYGYOOlckCTJDXBLwyK3ZKODyGg4Y+W5/zSE8lBs5Rq7C3FODhE11
 HoUcTRZPla70SRPatjrJFU6nh7y9yROyY42uNr3X/qtU8eiqdc67shiSX0+pxJS3B2Re
 QP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKdr7CfYzmgcmFB2loZiYlvbj5N+OaQKo7R5pMIPmm8=;
 b=d+mxJ0kZgUX8ebAbna+FHgBYIjenBzH59SH8ZQ8AITihkttRfsCL0ZAQS31kEICQH5
 9osD7AKu1VN0hnswLASiRWiDIExr5p8eql7J4hTfgoE/vTGnvXa2+bzMw9eHzSx81i7T
 CMo9QvWmcqlmAYRzA87leGTi2lV6EcqwBUE7kOXH4BPHw7sxg5/u9smIWcqD9VKYd5xj
 /bAOeXiQwERxYm+UNYNizgBeC5IpjbWhBTFf/pwDnde9EeUOuon/h0PrYM+F4c+n0LfL
 mBQge2uGV+FA4V78R0HPN2M4CHY0cm/iCBKysp7IkYDlNEVPgPucEV9ZbJ+YdL2M+16J
 yGNQ==
X-Gm-Message-State: AOAM531I/sl3WzIBg6OA85H+4WS1reIauhkDxX02RQwLbvFhe3x72UDT
 /mwsmqErTQi5Ct6siFl9rVA=
X-Google-Smtp-Source: ABdhPJx6r6pOwkfRgRVpSvvkjLzbWO/RgAk2huhEyWH9GDgglMzzaIMMngRVdaAYuninQmoDHkvf1A==
X-Received: by 2002:a17:90a:9cf:b0:1e3:1033:f580 with SMTP id
 73-20020a17090a09cf00b001e31033f580mr4573720pjo.57.1654166552198; 
 Thu, 02 Jun 2022 03:42:32 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 ku12-20020a17090b218c00b001e31feb7383sm2988516pjb.49.2022.06.02.03.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 03:42:31 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/virtio: Fix NULL vs IS_ERR checking in
 virtio_gpu_object_shmem_init
Date: Thu,  2 Jun 2022 14:42:22 +0400
Message-Id: <20220602104223.54527-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since drm_prime_pages_to_sg() function return error pointers.
The drm_gem_shmem_get_sg_table() function returns error pointers too.
Using IS_ERR() to check the return value to fix this.

Fixes: 2f2aa13724d5 ("drm/virtio: move virtio_gpu_mem_entry initialization to new function")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- Update Fixes tag.
- rebase the working tree.
v1 Link: https://lore.kernel.org/all/20211222072649.18169-1-linmq006@gmail.com/
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f293e6ad52da..1cc8f3fc8e4b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -168,9 +168,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	 * since virtio_gpu doesn't support dma-buf import from other devices.
 	 */
 	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
-	if (!shmem->pages) {
+	if (IS_ERR(shmem->pages)) {
 		drm_gem_shmem_unpin(&bo->base);
-		return -EINVAL;
+		return PTR_ERR(shmem->pages);
 	}
 
 	if (use_dma_api) {
-- 
2.25.1

