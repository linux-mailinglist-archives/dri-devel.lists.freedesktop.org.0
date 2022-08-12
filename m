Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34005591766
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 00:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1245AB8C1;
	Fri, 12 Aug 2022 22:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A72AB80A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 22:39:28 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 130so2075112pfv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=WoqjtI8/PDq4XLeCuA4BUU9vOzNcEPwvP6PaF9+jchw=;
 b=kCH5GDRZUrtkc7wWNsc5nuqbMku7NBjt44npkV7Va47a7utj6FA4TomD1TL+NsJMVK
 iSP2uNzTV+S5agOwMfCzu8BIwfzHY21+IKiEpcfPq3bCaxllz5hpz5y4prNqvAa8Uzk8
 HVihG7IleZ+dcCwz9GI1Pfep9EMwK0bI04WDrv8pz/3TULKedlTuuMzsdyVqhhJr1foG
 254E7QnrI2TAiX+gXbn6O8c51AYcyFN4ubCJ6EQFRt9moTLwQjlhkjWEGOcbf9Bl68fR
 lv0St731bY5X959cZgFEwn0Y9tORv+mtnoIHxaWYOB0mAjVWst+yaVCw5BGZVVZ9W0IL
 PllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=WoqjtI8/PDq4XLeCuA4BUU9vOzNcEPwvP6PaF9+jchw=;
 b=LOFoLmIKbn2ct5PM5U4brrJ2WHdXlB5yIfN7u4levx0xuNl1grNk/msCBp8n1w3CH4
 AYhT4mZtEM5Ql/mi8QCVQb7uRxYzDgUtG59oPvjoZMvD3mrlXh4LDdb6C9qL56m2Apd9
 3h5org7EYkRULKDkygU8DxlAEqM4p4rUNPiLHYhP8wDAYs1zFhOsFpbaPV5JMVXK+qks
 deH8Qcqno8zLAIOitypRUmv6FtVRW1SojIkO/VuWOUo9dEo5zmpNzxcmAJqmNk6hu8jd
 I7TTBFD+NZDV0HMLThYszhmn6fdIGyytrdgDHPrkCi+yZ4AuJMGKS94K3MD3Lc5sqBF4
 0p5g==
X-Gm-Message-State: ACgBeo06L8bRbmzau1nkjxczX9lHOF9Va6tGqzNL5TWNuYyI8rJif/qb
 Rfi2db3zrrl8s9OQc/g3wNP5RWnBD7s=
X-Google-Smtp-Source: AA6agR5c193Q2KiScRnuf+nXAXJspANTuNt8azcyAEmzHXLvouKJGN9t8xNlwdLZp0TstxxFt+2jUQ==
X-Received: by 2002:a63:6b87:0:b0:41c:2fb4:24f1 with SMTP id
 g129-20020a636b87000000b0041c2fb424f1mr4913613pgc.452.1660343967087; 
 Fri, 12 Aug 2022 15:39:27 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b001ef87123615sm315731pjb.37.2022.08.12.15.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 15:39:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Fix same-context optimization
Date: Fri, 12 Aug 2022 15:40:00 -0700
Message-Id: <20220812224001.2806463-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Lingfeng Yang <lfy@google.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When VIRTGPU_EXECBUF_RING_IDX is used, we should be considering the
timeline that the EB if running on rather than the global driver fence
context.

Fixes: 85c83ea915ed ("drm/virtio: implement context init: allocate an array of fence contexts")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index fa2f757583f7..9e6cb3c2666e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -168,7 +168,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		 * array contains any fence from a foreign context.
 		 */
 		ret = 0;
-		if (!dma_fence_match_context(in_fence, vgdev->fence_drv.context))
+		if (!dma_fence_match_context(in_fence, fence_ctx + ring_idx))
 			ret = dma_fence_wait(in_fence, true);
 
 		dma_fence_put(in_fence);
-- 
2.36.1

