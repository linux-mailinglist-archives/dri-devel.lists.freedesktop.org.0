Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5C153771
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2A46F923;
	Wed,  5 Feb 2020 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE386F91F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:16 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z7so1353363pgk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O4GxhHLv8gok+Xa5FqUXZgaSThcpfeAonWMQgh5xO1M=;
 b=Xx85uhPvNYHak21e5HVDZC3k7dOtP4flGLc79e1430MdokBrO7i/myUeJ5YhvhtMqm
 mX4gEFix9NuVI98JpcUlV2yJNw4DTJyND0u0VJZ87O9I7PSEbtUXqWXYalVORjlcZsMi
 +Jy4MRgFXc2xrJX0pJpe3L72pTJl9O0vjsmLntKkG4J/BLFriekqSYIzfs7LuScBjWP3
 RxmJrHVJ8BZElU70xQh2V/nqudfd/pxMfgUjhyT+i3l6MvaeC5McWQSpjjbO1/SB40/g
 0SjS2iuuNEhr2A7DLm5Y/WOLsyY9vn/cO6xw0UXo3Efv+J4nOkeXrx6N+J3dOIL9tin/
 htjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O4GxhHLv8gok+Xa5FqUXZgaSThcpfeAonWMQgh5xO1M=;
 b=UThCwMRbZFpnF14fVVQt7V+yUdMpOUBFjEnQ4D0iE9uqyBQkxOIA6p7vCHpcIp946C
 +d+hEicC7EP/FAqJsAHbOGpY4suOYVC5Ml22AHRmOjvzUb8jCt5Y46y1SYrboueOI+4I
 MxLAXvZHCpirMDebUqGjVPahjEgeGBN8JNzz44PFczxctjb0v/eDmIQvsaN3m0Lt4yjj
 9v+1jzBhOn6Ko8Rpvd2MZ4AZ0Jf7HVPPM4U0ncgAYIydK5TEudn/CVnLXA7dro3/NfTV
 +iQyWLxUycGdrxreO55tTQ/iKRUpYC5wYe6slBYQd32WkeUX8HGd7d476c6ndnL4tj3G
 odZw==
X-Gm-Message-State: APjAAAW8cqcKhqLe1ddY/Bc7SULWmhTmY+M7f47e5+YZIJzrmmj3kqNo
 ew+Veekub6FT+ac8g6DxI3SSuucI
X-Google-Smtp-Source: APXvYqyzZekArHsLe91rvf1+69FK4Pz399tjYhqk5bqftTv6CoTAb5p/At9lWtWHx+qIpyiygcUWkQ==
X-Received: by 2002:a62:7b54:: with SMTP id w81mr37981528pfc.127.1580926815515; 
 Wed, 05 Feb 2020 10:20:15 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:15 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/virtio: move the check for vqs_ready earlier
Date: Wed,  5 Feb 2020 10:19:52 -0800
Message-Id: <20200205181955.202485-9-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
References: <20200205181955.202485-1-olvaffe@gmail.com>
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When vqs_ready is false, vq should be considered invalid and we
should not check vq->num_free.  After this change, a fenced command
queued before the vqs are ready will have fence id 0 and will be
considered done.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 299470aac281a..0bf82cff8da37 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -333,6 +333,14 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
 
+	if (!vgdev->vqs_ready) {
+		spin_unlock(&vgdev->ctrlq.qlock);
+
+		if (fence && vbuf->objs)
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		return notify;
+	}
+
 	if (vq->num_free < elemcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
 		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
@@ -351,11 +359,6 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		}
 	}
 
-	if (!vgdev->vqs_ready) {
-		spin_unlock(&vgdev->ctrlq.qlock);
-		return notify;
-	}
-
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
 	WARN_ON(ret);
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
