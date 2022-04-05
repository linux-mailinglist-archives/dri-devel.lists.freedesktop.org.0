Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2484F3CFD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08EA10EDA9;
	Tue,  5 Apr 2022 17:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3C510EDAE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:38:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so3325039pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Io1IzG6hmJITuaZIDTYDYzvTfnNkY/lRuamDnYEiYog=;
 b=iz/lmMITgXQh0MqUOEQiFr6dsc0sTdIPypLCCvAym9JOaLdEYvr9t3x/gutfUpMmCz
 YB+c3zyDyI9Wl9NnnLHeqzzbgLg5x/vuuv3yvbSQZ617dXn+sAi8kVRb4YiSh8/NjB0Q
 cr2BhhDA/xuNawlnZ0rK+d9gHXVD67lZMQ6rlXU456ABQwE/ClXPwbq7/Cxz6bgfuspc
 OTehuW8IHfKzC8rrjyVr91xIYR4urF/R+UNHsxqcwR71gfvero52Uj+Em5/icX/Vza7x
 0sNNcdda6Nt3Wak7MkP7XRlddpBgHPjxen/fJAFVjChFfKpN3jJ4Wj4F5J1N6rdoJS14
 jQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Io1IzG6hmJITuaZIDTYDYzvTfnNkY/lRuamDnYEiYog=;
 b=1NXM6M1Mx6QEUqZuQdsSrz9+Kov4K/svFhnyOOcJ93IRz6DALxqJMLXuw/VQxMuOHS
 k5aeY68s0i35SAfLsoGM/LKNnbPmaKlEUvxJ21hzwnLfW46krwV/uuKXSHmeKzkX6zl8
 JDPCg3CfCyUWlk4N2m4MQ+aI7dmrFD5Q0xwv5QlCif/TqTkkyRgBA8P+SyF/7asvHY4E
 2MW6SOk6XAMcg8leUYyBknrsDMVoBH8HkoFuq/YBVcZ9PT3YVWasbz8UlhJuOpD8grGR
 IUZ7XqdF2NuwUpdzdv7vrN8fwZHaI+f/jdjJKGGREFlrc09eX7FjjbHuzT76firTq+JJ
 GwhA==
X-Gm-Message-State: AOAM532w7QTmwFi/qKBOU6uI2lxtvJsoEUD1f+jQtI018N7MKjZOtPu0
 qKuouvMlDfRhVkIM7m+WsxfQZFGyQoc=
X-Google-Smtp-Source: ABdhPJz8bWFNWl/yMS3gIRE+9LtjVYBYlTCCD9NPyLbTvdXKCpqIJrQ8mAH5ylinjXsk21ZNuzNM7Q==
X-Received: by 2002:a17:902:a9c5:b0:156:32bf:b526 with SMTP id
 b5-20020a170902a9c500b0015632bfb526mr4687173plr.46.1649180298344; 
 Tue, 05 Apr 2022 10:38:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a63b70f000000b00381510608e9sm13966302pgf.14.2022.04.05.10.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 10:38:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Add execbuf flag to request no fence-event
Date: Tue,  5 Apr 2022 10:39:18 -0700
Message-Id: <20220405173918.1000846-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It would have been cleaner to have a flag to *request* the fence event.
But that ship has sailed.  So add a flag so that userspace which doesn't
care about the events can opt-out.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 +++++---
 include/uapi/drm/virtgpu_drm.h         | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 3a8078f2ee27..09f1aa263f91 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -225,9 +225,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		goto out_unresv;
 	}
 
-	ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
-	if (ret)
-		goto out_unresv;
+	if (!(exbuf->flags & VIRTGPU_EXECBUF_NO_EVENT)) {
+		ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
+		if (ret)
+			goto out_unresv;
+	}
 
 	if (out_fence_fd >= 0) {
 		sync_file = sync_file_create(&out_fence->f);
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 0512fde5e697..d06cac3407cc 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -52,10 +52,12 @@ extern "C" {
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
 #define VIRTGPU_EXECBUF_RING_IDX	0x04
+#define VIRTGPU_EXECBUF_NO_EVENT	0x08
 #define VIRTGPU_EXECBUF_FLAGS  (\
 		VIRTGPU_EXECBUF_FENCE_FD_IN |\
 		VIRTGPU_EXECBUF_FENCE_FD_OUT |\
 		VIRTGPU_EXECBUF_RING_IDX |\
+		VIRTGPU_EXECBUF_NO_EVENT |\
 		0)
 
 struct drm_virtgpu_map {
-- 
2.35.1

