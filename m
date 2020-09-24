Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2A276517
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2479E6EA1D;
	Thu, 24 Sep 2020 00:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B28D6EA1D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:24 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id a9so676794pjg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HqROGzlbToaRzBVid4qBojAP/QMcbnLz/KvrDQUDCZk=;
 b=JcqgMiFaX83xTfip9uoF4eYLraEoFRdehlUI23AX09WC1TXwE8e5A+3NxI0MiOD5tt
 ilJJXQDHe0YrLPtb+ja5Tpoy7ZlK87MeYOkFxcKPGfPrZ7UzkM1behYRHDcfN10knmC8
 cGPOjQI+OTNKGZ77HwHgpNNPx8ZUPGoE7f5O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HqROGzlbToaRzBVid4qBojAP/QMcbnLz/KvrDQUDCZk=;
 b=IFHcTSRe30cFbzoQi5cSqmozk92uS6En1jrTxP3y+3Ui4WkBokxGEa54eJSItjdLTn
 ZuJrap+QXYkrdNCP9PRsvM0rP4GLeuBj5LhMg1nlWNhmJhxKG8g6TPuplGpVBgGm5AM3
 J8haIKz1+Stbd0311SZDmL6Z1Bdb6DxroTpkzsXa1BPBAqnly1nVdE7d8dDy/rZywQUL
 Ud7SabT9zO3sFhHyN4/1muM6xHQaS85yWrqwpTm07diRwMSN/Ybql0wCk0P89mgmbtcD
 40ZfaNAKU3jgT0wAm90cPZzbjOMKP3hnlG+vmeiwA0F35avi9EcIWNnba5HKDmh4kftj
 sNJQ==
X-Gm-Message-State: AOAM532ziQwYCAx9rOx4U9b39J3p+Df1ktMXy9sSqN3W0SHruVSf9Rve
 T1shPD4Q1j9dLu6euBGaOFDNF90wMlr08A==
X-Google-Smtp-Source: ABdhPJxqLEXAQRunBfsRTd1UAzff249c8l/kuETQRhhzuqePgFeehL0FMDZKl7osR0i4Piudl6Qymw==
X-Received: by 2002:a17:902:b591:b029:d1:e598:740a with SMTP id
 a17-20020a170902b591b02900d1e598740amr2093912pls.61.1600907543536; 
 Wed, 23 Sep 2020 17:32:23 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:22 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/19] drm/virtgpu api: cross-device feature
Date: Wed, 23 Sep 2020 17:32:02 -0700
Message-Id: <20200924003214.662-7-gurchetansingh@chromium.org>
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

This feature was recently added to virtio-gpu, lets make
it userspace queryable. It's an error to use
BLOB_FLAG_USE_CROSS_DEVICE when this feature is not present.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 include/uapi/drm/virtgpu_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index e1b1518f9acc5..b9ec26e9c6463 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -74,6 +74,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
+#define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
