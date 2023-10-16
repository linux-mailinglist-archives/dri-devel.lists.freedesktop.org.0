Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AD7CB2AF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 20:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158D610E236;
	Mon, 16 Oct 2023 18:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF25B10E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 18:42:04 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6b5cac99cfdso2273530b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697481724; x=1698086524;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jAFFYinHZhCREdHd0fA7hDznAJrXS3vHKq9UJd0JcE=;
 b=HTDg8gSoKsv80nsihZD/eVFiQU71iM+SXN8KXdIm1Xn6CHmU/A85aeU2qIWEbldFkI
 o2iAaXvwjlPqV7BkB5OJLXJEES+7HbCqRDyTyrOyf57V4cPhpYZWXNv/c23W5Tj+3v4n
 IeaE/mZe/x/PsCjVgzGrL7v0Bv/4pxw6TKHTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697481724; x=1698086524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jAFFYinHZhCREdHd0fA7hDznAJrXS3vHKq9UJd0JcE=;
 b=T97WmhNePHAscM+ma+mNUX3Aj/ml1v6paZYqxepKb6UE8XLAvTv/uGa+Vb3jcg9n0E
 M2wRiWisXiqgQB7mZpS/oX29pFnGwjkhp78JOaJYvlVjy9fZVYIa0ldhEenkhbin0Xgk
 GDByG6VeFtazj740bHH60RM/m3vO/6gNLSlGL+s+u36kPkdf1oETpzI8BB+/9hUvebbk
 F0Y+h87YtszO34i+/yf1QrLAH8fNsr2iPq5WT/6eXTCVSuyZTsReZNn7sa9uwpgV8X2Z
 QnLLq2WvZ5jrY20TaSQh1AM7ZF3XgGh379KE6SmNaKXbkUIeNypqwDkQ5Su5K/6EHUXD
 xEzA==
X-Gm-Message-State: AOJu0YyQAMAYg13P6Ux4c0VyOHSXAIBM26tu43BqK9+dYSnZJaL5lIwS
 hbDihThgAl/SzGMhIyAK7/cPNtaOU4pQiPuCRLc=
X-Google-Smtp-Source: AGHT+IE1ud5MMvEQDU/n0J2zets/9+0ryz8YRnLxfxsx5IH7sBKK9ROvhY3CroV3q177i/jJFDvd2g==
X-Received: by 2002:a05:6a00:134a:b0:6be:2dce:cf5a with SMTP id
 k10-20020a056a00134a00b006be2dcecf5amr3103924pfu.26.1697481724013; 
 Mon, 16 Oct 2023 11:42:04 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9fd0:fd3c:780a:6af7])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a056a00189c00b0068a46cd4120sm218735pfh.199.2023.10.16.11.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 11:42:03 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/uapi: add explicit virtgpu context debug name
Date: Mon, 16 Oct 2023 11:41:59 -0700
Message-Id: <20231016184200.639-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20231016184200.639-1-gurchetansingh@chromium.org>
References: <20231016184200.639-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two problems with the current method of determining the
virtio-gpu debug name.

1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a
   Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,
   Android/FreeBSD get around this via setprogname(..)/getprogname(..)
   in libc.

   On Android, names longer than 16 bytes are common.  For example,
   one often encounters a program like "com.android.systemui".

   The virtio-gpu spec allows the debug name to be up to 64 bytes, so
   ideally userspace should be able to set debug names up to 64 bytes.

2) The current implementation determines the debug name using whatever
   task initiated virtgpu.  This is could be a "RenderThread" of a
   larger program, when we actually want to propagate the debug name
   of the program.

To fix these issues, add a new CONTEXT_INIT param that allows userspace
to set the debug name when creating a context.

It takes a null-terminated C-string as the param value.

Link to open-source userspace:
https://android-review.googlesource.com/c/platform/hardware/google/gfxstream/+/2787176

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 include/uapi/drm/virtgpu_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index b1d0e56565bc..c2ce71987e9b 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -97,6 +97,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
+#define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -198,6 +199,7 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
 #define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
 #define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
+#define VIRTGPU_CONTEXT_PARAM_DEBUG_NAME      0x0004
 struct drm_virtgpu_context_set_param {
 	__u64 param;
 	__u64 value;
-- 
2.42.0.655.g421f12c284-goog

