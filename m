Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92241276515
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC516EA1E;
	Thu, 24 Sep 2020 00:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2C6EA1D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:23 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id s14so3438713pju.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtt8qhOX791+4VTJl4etyAvZU3rZa3LH1wjsXrfykoE=;
 b=SYHDdtwU3xqvhx/Zv9jilr/X9MMBDfpX/SRV34UDQmDAjLCYhCjX6j3MvfbatmqaIR
 wOs+rtP4WZpjjU2z0Spu/rs99RPAWRr1vMz4zTmPHmzsxdj4ZHJliDUvcHEahymfPGWT
 oGjsUTkNEStKBh54YEZfcVEyWjHq8Bpx344Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtt8qhOX791+4VTJl4etyAvZU3rZa3LH1wjsXrfykoE=;
 b=MzE/c2Bw8+pu7RlvhD3DWM2VmUdjMRxyDqqWr0M7bwajtgS2iHLIWShWmNWMDOXVZb
 cPQG9rLzlNGLKHxScE6gpdDk8ySKA2+KQq8eBHo2InvELVsKf1WDY81PoaRYYPLcUMKT
 GodLL+7fzWCbyPGO+aIVgQNB+IoIFZY9JrQ08knMe9rb1x80zyDQtgKZ9sUzZNxxGmMX
 AduRrRh9BtBrddMhishSgV+Jofnf60rFsr4H2LAw5lJ7z00+LIj5Vqzo8B8QicgP/IcM
 zWJOtEA5CCL3vTRccEQo8zT88FffB8JXC1CApZdsPlVnYuCKuxSJzSddxnNydcliZUS6
 /auQ==
X-Gm-Message-State: AOAM530FBaSZTFIt7Bj4gIWXzOtSfMeLu0vUDRbZDbBISIIvB9UnSOSI
 ZcGGPTlb+8vqifx8BP9qcODCMYPOSaK5iA==
X-Google-Smtp-Source: ABdhPJzVPdAXkzlxsTCg1Sb0AsO+I5MnDE7aQn9sXGx3jSf4jIM4abkVk8m/TO9kz5+fKC8j5SHNGQ==
X-Received: by 2002:a17:902:8493:b029:d2:42a6:238 with SMTP id
 c19-20020a1709028493b02900d242a60238mr2124906plo.4.1600907542538; 
 Wed, 23 Sep 2020 17:32:22 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:21 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/19] drm/virtgpu api: host visible feature
Date: Wed, 23 Sep 2020 17:32:01 -0700
Message-Id: <20200924003214.662-6-gurchetansingh@chromium.org>
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

This exposes the host visible feature to userspace.  Without it,
it is an error to specify BLOB_MEM_HOST3D with
BLOG_FLAG_USE_MAPPABLE.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 include/uapi/drm/virtgpu_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index bb224f604c9e3..e1b1518f9acc5 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -73,6 +73,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
+#define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
