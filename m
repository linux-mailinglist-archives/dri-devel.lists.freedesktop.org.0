Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D04042C7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF616E41B;
	Thu,  9 Sep 2021 01:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099966E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:30 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso255657pjh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkqkSdeF3cEobbaFIVvs0LNSYEtx1f97FWjC3f7bUbU=;
 b=aCFVeXR4pRgiyA7nAwfsi9WiIHF0hJcTEnzzG8oN7wplUTKY5EsEan6ykebEVVRk06
 nbdmxOGRD/Fj0VnQScipGyatpJcLR97EnwvvO4Iw2r95E77gIuXDz5Ps6oC5aZF7ABMa
 xh7JGBr6YAlvZArgEn2EaLpU5vb2NHLXG0L2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CkqkSdeF3cEobbaFIVvs0LNSYEtx1f97FWjC3f7bUbU=;
 b=D5V8/S7z8Sg7A1WErA04WT0SOAOXRIX0JH1TXW8V+j1iACo3Pq90qC4DOZtDtuiqsj
 3vvuePwO19+gzg7tZTev+QwCT0eKTRv+s8tipi7HEAXdrqGCAqUEwDFjmYI7H8KaTwan
 y+f7OaXJJ9HPRxEjREbUHF759AR9NitprPmHeQNCVUHk/lwwi0ANA99WbFYcttBwlRzc
 IQYRO+dMTt803Bh+ao6kEtqBHHNEU5AHcgLi2sIjGAW/XrtqmS8tv0lIK/LTiV5DJOuF
 uvrxEVaSqNrd5LoGjPkfwTDzD5/DtSuURdLkJ4E/RRBqMyYbo2R9irttmGkSm5v4u/oI
 7YPA==
X-Gm-Message-State: AOAM5324TCEfBLf/elP3O9sgn8mGQbjq6q50iZUm55VhuszpDYs5HpCg
 6Rx2v3c9iWDCObCVA/BnR2b56r9u8L2E8cDB
X-Google-Smtp-Source: ABdhPJwZnbKylI7bXX1p+2WzUeN4xXSUno1LiCYOW4g8+bUT2QRC4pVx1Uq1H0d8qBBcAv4HH9yhkA==
X-Received: by 2002:a17:902:c40e:b0:138:a4d4:cf46 with SMTP id
 k14-20020a170902c40e00b00138a4d4cf46mr367991plk.48.1631151449361; 
 Wed, 08 Sep 2021 18:37:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 10/12] drm/virtio: implement context init: handle
 VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
Date: Wed,  8 Sep 2021 18:37:15 -0700
Message-Id: <20210909013717.861-11-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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

For the Sommelier guest Wayland proxy, it's desirable for the
DRM fd to be pollable in response to an host compositor event.
This can also be used by the 3D driver to poll events on a CPU
timeline.

This enables the DRM fd associated with a particular 3D context
to be polled independent of KMS events.  The parameter
VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK specifies the pollable
rings.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Nicholas Verne <nverne@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 22 +++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index cca9ab505deb..cb60d52c2bd1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -266,6 +266,7 @@ struct virtio_gpu_fpriv {
 	bool context_created;
 	uint32_t num_rings;
 	uint64_t base_fence_ctx;
+	uint64_t ring_idx_mask;
 	struct mutex context_lock;
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 262f79210283..be7b22a03884 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -694,6 +694,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 {
 	int ret = 0;
 	uint32_t num_params, i, param, value;
+	uint64_t valid_ring_mask;
 	size_t len;
 	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
@@ -707,7 +708,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 2)
+	if (num_params > 3)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -761,12 +762,31 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 			vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
 			vfpriv->num_rings = value;
 			break;
+		case VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK:
+			if (vfpriv->ring_idx_mask) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			vfpriv->ring_idx_mask = value;
+			break;
 		default:
 			ret = -EINVAL;
 			goto out_unlock;
 		}
 	}
 
+	if (vfpriv->ring_idx_mask) {
+		valid_ring_mask = 0;
+		for (i = 0; i < vfpriv->num_rings; i++)
+			valid_ring_mask |= 1 << i;
+
+		if (~valid_ring_mask & vfpriv->ring_idx_mask) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+	}
+
 	virtio_gpu_create_context_locked(vgdev, vfpriv);
 	virtio_gpu_notify(vgdev);
 
-- 
2.33.0.153.gba50c8fa24-goog

