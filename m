Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7726CFCE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7D6EB58;
	Thu, 17 Sep 2020 00:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23DE6EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:09:00 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id v14so291747pjd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6EdaR9KwU+pnvkycYJPPLNu+q7R7PLRGVA6ARzb1Q8=;
 b=ad0L/48WkaNbOn0F+C5TRLP/wcVC9f9p4MGUwWRYSFGsLnGRAfl/TXgRgQf7ZCzuHH
 fkjBYtBkKQDdFezCRpsQj6Ned986bp7cfEUX+opTUM9usJcaa3gfCf1Sri2DSdtncKAH
 8zJnvXS/IMQvhCN9L5wExo1L+7zlGuMOt8QB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6EdaR9KwU+pnvkycYJPPLNu+q7R7PLRGVA6ARzb1Q8=;
 b=uYxZY5P/CCpX+h+cjU3XSuxaxWRR24FVbsNBYP1o340wKFuNozI+8Edr8oYHJTqBDu
 hNJEVQaDUHDYO8J6nNr5/BsVcW20eA3a+wzEFxNeseDhZ2zpu1ff2f9pwMSgR0iuHydU
 HY2v4VtS8Wia2oMYXrpFbDFNur1axLyX2hCk0asAB42QMIhlm2W6xJb0uztW1OrX5lBb
 kTQ9aUVqGu96KdIyywcIt79DPG5nINMwJhSrtucDeSPgnSCPBxNcH3OeAFjhmVOW1vsK
 SAqvo+RQGw43mdXlalCp+9sMshXdTHqiOz37UQvMzy50NUTIk4G4y3tcnQEFUir7gUw3
 z19g==
X-Gm-Message-State: AOAM533ZOBQNy5PxSNfQo1MlvagSAiTLcKJEM0Wj0q1yOKkKScW3/EAs
 PJLXxrcmdxVVyK/CkvrIoyqbgiob6gtVAg==
X-Google-Smtp-Source: ABdhPJyZABlysGcbAiXGH+8bJYzNYODaHwPxcmLVTy/2iY8CZqyqw2bslDNwxzehZt49U4dZIj4xTA==
X-Received: by 2002:a17:90a:fb52:: with SMTP id
 iq18mr6195465pjb.162.1600301340050; 
 Wed, 16 Sep 2020 17:09:00 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:59 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 19/19] drm/virtio: advertise features to userspace
Date: Wed, 16 Sep 2020 17:08:38 -0700
Message-Id: <20200917000838.735-19-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917000838.735-1-gurchetansingh@chromium.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
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
index 3ede098c1d280..5417f365d1a39 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -212,11 +212,20 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 
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
