Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE7276522
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7BE6EA29;
	Thu, 24 Sep 2020 00:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4636EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:36 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id y1so771465pgk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6EdaR9KwU+pnvkycYJPPLNu+q7R7PLRGVA6ARzb1Q8=;
 b=VAEDJWEq0ipDK1qzu7evsiwzHq+7Z3oMnJ3AwGZTYjOWtk1G6hqfTpLvdMlhS18ZcB
 ug5naX1mw5GzwibHMrMDkTVvDT9jMpINw8VGeQKeUzyVWizO83cTZ8mdlGTVJkGGpijA
 2uFb3E1Xl4W1NNsd8xdGdryAs5/ACzXKZ8KDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6EdaR9KwU+pnvkycYJPPLNu+q7R7PLRGVA6ARzb1Q8=;
 b=F8KEZn6/6iZLn/6VLyMgu395zL0SwZBk7+DUX5nRPnJRtr5Y3AV5o8CvkSynci2Ib7
 p3SEkRqYL2FJDGcSVryxyRNbcYH1rC33vvv5l9iCFTJvMEbtHw1oDhbH2DXHMFLCsf46
 UFqzRxpb1X7/M8mulz7GucIGzIAWVbl7rKaenFfJquFduhRkOXxRBaHthUQTu47mM6h8
 kR3wjJhXSYS50zWVcorADiePm3BzU71g7VDQ5pPdUsl1eBzK7DSgjzvWUb8yy0XdiaCn
 OmSjM2f6ECHXlaM5ttQGRP9W0OUUyr7T+KufWw+FAF/GbNrz3aynA0FYoIoeyEdxXMm0
 4Keg==
X-Gm-Message-State: AOAM531QlCava5p/0i6rqKcD2NP911GegCcp8kK8Sx1vwvLMl497wiF6
 0NwqNLmMskNcaVjLwdEFdFrjvxY0TKeI3w==
X-Google-Smtp-Source: ABdhPJzb29Ufrs6bmTmK/NBK0WyydsWT5zfdV5zcILSL4Pg4i0dPPofQDkQ/kSLIOBftJEBg9pp7jg==
X-Received: by 2002:a63:eb4c:: with SMTP id b12mr1836592pgk.266.1600907555769; 
 Wed, 23 Sep 2020 17:32:35 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:35 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 19/19] drm/virtio: advertise features to userspace
Date: Wed, 23 Sep 2020 17:32:14 -0700
Message-Id: <20200924003214.662-19-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
