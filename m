Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223AD25B5B1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FAB6E95C;
	Wed,  2 Sep 2020 21:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9AA6E95C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:26 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id t9so375166pfq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pSYRvBEUpeVWIM5z1fZ1aNrzZ78I+EgwIeC01nGrKmY=;
 b=MKvgy3vUFElQhpIcupIbc2BQaiFMP8c80ktmAVQ9gjE2FMqinagx+qX8GBqDRoA/vz
 RNOigevpxyc9Ahm2pp2JVzUXsMai8IqvvnLxoI+8uv5lntWDbS8565LOameeI4JST2t6
 oMFlHViooAQKS8cX0m+xMXkYP38zcf9RrxI9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSYRvBEUpeVWIM5z1fZ1aNrzZ78I+EgwIeC01nGrKmY=;
 b=YqbjQ0x6tWOyZfx9q7c67p+fkcEbVCgGwQP0IiUcZEdaVUaXcozgtdgyQyDldpzFp/
 x92ylZuTL5+VRsnm0mb7XxHDQZ20xvnGZVXwFZOELmo1O/gbKM8QUvbTDbhi3ujATdDW
 vjK8SCapR5/OlQfs96GeDXkUkiJr0kaVt18NtI5/TKeD+DKvLPJ/Jotmk20547FvdTWb
 ETpkr1+TmEAfE5/Db54jDP/GSKic1QOY/hXGsgRnpiAMrU57Bg+Lnny93NJkuMutq6V8
 ZAaNa6VCNZx8aQF3osgU7RJDMeXl8J9ZcGSV2WFCX8hDW3pT/UAlbH7k42/estBmrQbR
 eV1g==
X-Gm-Message-State: AOAM531QKtVeLg3C1UG2p8BW01QZ3eK8D5lxYj5ahI885+81Nkl3jThb
 u919G3m5aVuWIzymZ3pi+u6tYl0mPNv5Ew==
X-Google-Smtp-Source: ABdhPJwkznx6La0tjkLwbCTOuvUX4iur1rktGeeo3VUWu3P6OFVAFnizGE5aqSRAHSAeVk+iPX8fVQ==
X-Received: by 2002:aa7:990a:: with SMTP id z10mr302006pff.1.1599080965537;
 Wed, 02 Sep 2020 14:09:25 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:24 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 23/23] drm/virtio: advertise features to userspace
Date: Wed,  2 Sep 2020 14:08:47 -0700
Message-Id: <20200902210847.2689-24-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New api changes are now available to userspace. Also, the
comparison to true is redundant, so remove it.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 442cbca59c8a5..e4c0c1f34d5c9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -211,11 +211,20 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 
 	switch (param->param) {
 	case VIRTGPU_PARAM_3D_FEATURES:
-		value = vgdev->has_virgl_3d == true ? 1 : 0;
+		value = vgdev->has_virgl_3d ? 1 : 0;
 		break;
 	case VIRTGPU_PARAM_CAPSET_QUERY_FIX:
 		value = 1;
 		break;
+	case VIRTGPU_PARAM_RESOURCE_BLOB:
+		value = vgdev->has_resource_blob ? 1 : 0;
+		break;
+	case VIRTGPU_PARAM_HOST_VISIBLE:
+		value = vgdev->has_host_visible ? 1 : 0;
+		break;
+	case VIRTGPU_PARAM_CROSS_DEVICE:
+		value = vgdev->has_resource_assign_uuid ? 1 : 0;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
