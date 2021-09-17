Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82A40EE9F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EDF6EABB;
	Fri, 17 Sep 2021 01:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912E36EAAD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:58 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id q23so5489021pfs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KaOr+iVjfvuShj9ZpGnmwIF4s/YFeuhDRlcjYuMJV70=;
 b=Y6xtPr0agrokN6HTFwit7/B8+jnIftK90cas3MrY4ENPle9ZwzH9Sp+TDS9Y4DjoJK
 OXzK9+VMef4bzVWzCtsH8R+vGSH4kL0pDJIDt9hEu/JMZQ7//MKaSNTFVLpP5r84wYv8
 KNmr2qmH2EB0kerzqqv+U+Jjl18v4/Y2wyRyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KaOr+iVjfvuShj9ZpGnmwIF4s/YFeuhDRlcjYuMJV70=;
 b=UKgxGCgicVhGNG61hkHCVvI3Fm//ckU+Z/j9T8/hGqTUMSorPQ382smcgceQAr7AWg
 kx7QJ4F7S8ViUIL0/J11jV9bL1dVSrXqCqfflEWeIezKtwhfkzen3QvyksPH5sYv6Wq1
 5rH3C4BHSzhlDEEUUgozN1xvxqRm0aiLLwXb9TDJTBrQy/kNbFQVrNM3Go6Q2lj3UUet
 HTxzv12Ms6k22+M3EzbJXcp6szIodtgELFnD6db7NcIhLTEenkEW4kTABi4+DwcSVsTX
 1kYB18LqbRmX/oAEeXTEV2OS7wyCSqdjN5FXN6ocH+XJykDDWMO7ieQEmHfZ/RKVxz56
 Npjg==
X-Gm-Message-State: AOAM532Vx6TmY7SYM7y01z9RO3qLELXHgXlBIa7rK/ZAb3UMaFNE/cjI
 Vhfo33HY0KHf+/8AhABRlKU26Ve9osSD8JCT
X-Google-Smtp-Source: ABdhPJxKxMyoFXwU6sviyoWGi+RReh1dN4kQUom0FvgGQnuMusRnYi3MOuUPlmpoMxBWwzz2e4E15w==
X-Received: by 2002:a63:2d07:: with SMTP id t7mr7627442pgt.101.1631840936942; 
 Thu, 16 Sep 2021 18:08:56 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:56 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 12/12] drm/virtio: implement context init: advertise
 feature to userspace
Date: Thu, 16 Sep 2021 18:08:42 -0700
Message-Id: <20210917010842.503-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210917010842.503-1-gurchetansingh@chromium.org>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
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

This advertises the context init feature to userspace, along with
a mask of supported capabilities.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index fdaa7f3d9eeb..5618a1d5879c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -286,6 +286,12 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_CROSS_DEVICE:
 		value = vgdev->has_resource_assign_uuid ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_CONTEXT_INIT:
+		value = vgdev->has_context_init ? 1 : 0;
+		break;
+	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
+		value = vgdev->capset_id_mask;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.33.0.464.g1972c5931b-goog

