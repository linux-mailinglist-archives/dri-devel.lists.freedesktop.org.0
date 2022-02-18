Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51A4BBCA0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 16:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94F610EE18;
	Fri, 18 Feb 2022 15:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8CE10EE18
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 15:57:05 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so12722732pja.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 07:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=76Ch6++ik3Xa10+F3GaCo4BUItW2eOp7s3nI1jmAaLM=;
 b=A40JfGTULXeEUbGb9OgxcyRI82LxcgRaLTkMait0arWn+xroPYbZgjIcpuB5u2l1L+
 sTwFaGQpf0koggIBdKnYnVx02wX+TVu+8ngmXD4e7mMp6hfp/9APvsdldJHD2S112YZX
 v0zRiA6pIR7tBEyD0HnWuzTAZbL4cUJkdVFUXqZchlUVOW67Um90cP1XMFHJOwBDyZ9f
 /ttNhcRWdNNqaCHpuwvI4UYXlp7znCgoVpx2tUjH2FYfuR5RJd51GVi6XJfzidG6PMUn
 f8Rh0O6P6+uxpaOehdQTpSOIWRP6HJ8ORQ1r5wu6YA15UfW+KBar4KEnTWeMoX67eHY0
 5UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=76Ch6++ik3Xa10+F3GaCo4BUItW2eOp7s3nI1jmAaLM=;
 b=Nf1FvXZycNfHev5NwutxZruKWCOU7au+nkOnOhjBLYKOsyHRHR1t0+Pq3arE9mxF0/
 udEZFW99ysKNCdavcs2lGfyEorSgCaQjJPSHA7taQluUK/pHIQUXZwXvdG6EIY0CDAUd
 +25pgic0PuWm1GDytoe6A8VTzZT6NqP+c7uIx4Ru79YqK2ouiBoRh61Vfmp7FMbTHH8b
 z8upRt33RqlRP2b3IMqazn1qSD7OuoqmXIWpOqWimNl9G57NnsEbmZ3zIwJwLDnr85/o
 Le1MFFjClibYCRGCsTFsuDRrkJ80fT47+H+U5oKeR3Vac7CANk4gUuVN2ADOt5RV2Zhn
 KOpA==
X-Gm-Message-State: AOAM532q9WkAgj3U+4ICxcH6yewG1Ph3Xrel9j+dewdslJl9EQCWLLjF
 aeDWpmX9H1F1iR/1umTdFymmNhJIidk=
X-Google-Smtp-Source: ABdhPJzowmB7x8JMRpgtI/TJsdA2/uiiijdaIc3IM5FfQuUSf/aRW56OUqxSDoCAKPwWMBnLsaESQg==
X-Received: by 2002:a17:902:c10d:b0:14e:d3ca:8a20 with SMTP id
 13-20020a170902c10d00b0014ed3ca8a20mr8021755pli.92.1645199824398; 
 Fri, 18 Feb 2022 07:57:04 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x1sm3485752pfh.54.2022.02.18.07.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 07:57:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Add USE_INTERNAL blob flag
Date: Fri, 18 Feb 2022 07:57:25 -0800
Message-Id: <20220218155725.487785-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
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

With native userspace drivers in guest, a lot of GEM objects need to be
neither shared nor mappable.  And in fact making everything mappable
and/or sharable results in unreasonably high fd usage in host VMM.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
This is for a thing I'm working on, a new virtgpu context type that
allows for running native userspace driver in the guest, with a
thin shim in the host VMM.  In this case, the guest has a lot of
GEM buffer objects which need to be neither shared nor mappable.

Alternative idea is to just drop the restriction that blob_flags
be non-zero.  I'm ok with either approach.

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 7 ++++++-
 include/uapi/drm/virtgpu_drm.h         | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 69f1952f3144..92e1ba6b8078 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -36,7 +36,8 @@
 
 #define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
 				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
-				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
+				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE | \
+				    VIRTGPU_BLOB_FLAG_USE_INTERNAL)
 
 static int virtio_gpu_fence_event_create(struct drm_device *dev,
 					 struct drm_file *file,
@@ -662,6 +663,10 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	params->size = rc_blob->size;
 	params->blob = true;
 	params->blob_flags = rc_blob->blob_flags;
+
+	/* USE_INTERNAL is local to guest kernel, don't past to host: */
+	params->blob_flags &= ~VIRTGPU_BLOB_FLAG_USE_INTERNAL;
+
 	return 0;
 }
 
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 0512fde5e697..62b7483e5c60 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -163,6 +163,7 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTGPU_BLOB_FLAG_USE_INTERNAL     0x0008   /* not-mappable, not-shareable */
 	/* zero is invalid blob_mem */
 	__u32 blob_mem;
 	__u32 blob_flags;
-- 
2.34.1

