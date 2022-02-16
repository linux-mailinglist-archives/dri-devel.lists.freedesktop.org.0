Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6444B7C56
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51AC10E5DC;
	Wed, 16 Feb 2022 01:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB8A10E5DC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:15:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so969870pjh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hwZ2F3aREhpJrlJ2d2Ygxmwwu5LB/WMxQx3SAucGcc=;
 b=Kn1kq8Z6LR/PsKUAKmu2TgN0q8KMHpYWQ0TA59BvJ8YXgNv9+VQ6HyX8RCNhpl0HKF
 tzKXer0c/VfAgtIdWOuaqJ9PDLt7uNxv183fEXL7piAF+9HILKHrpQGzcrUpaXnhG/0B
 b9WG14crvUmfqNnOWjcOkmRxjzAo55kSsS9JdXzianc87UOkXPI8gUoLh+11HpAuGrYz
 7IX5mR6/cHus1ppqJYk+nXObKvxE2Q1SAmcsvAcHl8XzTLlOcPAykr0lvclKdumwAFgJ
 leMOJyYUdIRBTySDndNDULI/vhF64kb+pDSvx9NbwomaMxjHu5FmJt3FP2Vg2fbh7XMy
 Jkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hwZ2F3aREhpJrlJ2d2Ygxmwwu5LB/WMxQx3SAucGcc=;
 b=g4tl9nRC+Lxd2uuujjORaeUf8yND+205cNSYV9462q9mhPe7SJPNReDV4VlYicOqQa
 JiIvCp1/BQsOfM91mFDJJncFCVDcYMUoai5LM7gkIyYAFTpvH7kwl3L/NbNMhHOPVOON
 WjiW1M4emIj6oZ+qlZol5mvqpn/4CtZa8Mghn5ZfAnNTY0zCzrpTl8PaaJj+9EwnaeuA
 OkXYZzRP4Av7vSZipAF6iudYDai0bKuI3QFydbQwqLaULQq/kUph5e9vM+qey+OyJi0/
 vO/gx4LF79i2ZGSdwcQ9kwLtXk4FSbg2UMrQPaIxEatArQ/CQRQLmqTP/CFZP78RKuQC
 /jnw==
X-Gm-Message-State: AOAM531hp0sA7TcecuN/8yEByNUIMjuKU9oe4Y1Frn9KFN1yif86g5FS
 ZybCK3RxmQQU2Qdien6rpyR36tLK/s0=
X-Google-Smtp-Source: ABdhPJzObOPULx4E0kcZ0vLa3iyJhoz+Xq3kxebJsb1C6cXwwaNrpNsO/2CfAyEGSfvbGjclvdffIQ==
X-Received: by 2002:a17:90a:734c:b0:1b9:b1fa:db6a with SMTP id
 j12-20020a17090a734c00b001b9b1fadb6amr191487pjs.158.1644974149433; 
 Tue, 15 Feb 2022 17:15:49 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 ls14sm15760824pjb.0.2022.02.15.17.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 17:15:48 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Fix capset-id query size
Date: Tue, 15 Feb 2022 17:16:14 -0800
Message-Id: <20220216011614.360451-1-robdclark@gmail.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Lingfeng Yang <lfy@google.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The UABI was already defined for pointer to 64b value, and all the
userspace users of this ioctl that I could find are already using a
uint64_t (but zeroing it out to work around kernel only copying 32b).
Unfortunately this ioctl doesn't have a length field, so out of paranoia
I restricted the change to copy 64b to the single 64b param that can be
queried.

Fixes: 78aa20fa4381 ("drm/virtio: implement context init: advertise feature to userspace")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0f2f3f54dbf9..0158d27d5645 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -269,7 +269,8 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_getparam *param = data;
-	int value;
+	int value, ret, sz = sizeof(int);
+	uint64_t value64;
 
 	switch (param->param) {
 	case VIRTGPU_PARAM_3D_FEATURES:
@@ -291,13 +292,20 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 		value = vgdev->has_context_init ? 1 : 0;
 		break;
 	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
-		value = vgdev->capset_id_mask;
+		value64 = vgdev->capset_id_mask;
+		sz = sizeof(value64);
 		break;
 	default:
 		return -EINVAL;
 	}
-	if (copy_to_user(u64_to_user_ptr(param->value), &value, sizeof(int)))
-		return -EFAULT;
+
+	if (sz == sizeof(int)) {
+		if (copy_to_user(u64_to_user_ptr(param->value), &value, sz))
+			return -EFAULT;
+	} else {
+		if (copy_to_user(u64_to_user_ptr(param->value), &value64, sz))
+			return -EFAULT;
+	}
 
 	return 0;
 }
-- 
2.34.1

