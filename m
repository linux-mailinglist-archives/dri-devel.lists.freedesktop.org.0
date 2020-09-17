Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20A26CFD1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153EA6EB5B;
	Thu, 17 Sep 2020 00:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644B26EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:47 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id m15so135739pls.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtt8qhOX791+4VTJl4etyAvZU3rZa3LH1wjsXrfykoE=;
 b=K5ah0bQ+Qeu4ciiOBXrcx4s9/OpdBZLbGabXIXQ/Wo/0gSMWS/M9faYSev1GaxJrlc
 0MGt4iD2KVHcULSiHFHrREIU2yif8Ktq6QdrcWUqhqHp+JZatL1r0QW1V2xMTHT7qqIk
 r5g1t5m2vvsDDTbmP4NyJJGxdOKF7ZDIpZeuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtt8qhOX791+4VTJl4etyAvZU3rZa3LH1wjsXrfykoE=;
 b=tNQZCmpcOPyzIhbpDnpPeSg+GFlYURHRdFvfPktdE3ZwdXDY8j9mSILTimQQkEb/0a
 DFTmDc+EYapH/9q1EQ4riJsxRegkuXOYjNOiw/2zy/DCrQLrS8RDO166px7sJtylNQe9
 AfGKel8r5yv2qa3vr51TOv6X2S4ZNVIHCu8zg1nLFLa/HLdMSB1MHL0FtPUT6iECSs/g
 R/PjAkQVW1oii2xMSNIiskzenzWY4h145D9/fDz6yq7HpJqSk4MRTcipfXfHJ4JaX7uy
 O24XalHGkyzrYpSmKpGXuusqtUhIs61DJ4KZFVyQIHzTZ6PilCxlJIkxWbzWnxhHmR36
 dIhA==
X-Gm-Message-State: AOAM530D2DcjfN8VRUFQ9wHqxqyi5hxzWEqKhzwZdDaKlcmA6FTUZuC7
 xQwOOX5pxx6TOMjOloeQxYit3ypMJGJNgA==
X-Google-Smtp-Source: ABdhPJz+humuPEYbiie+uFcpk9S1dY3cyvFRz2NAXv24sPXWOuC6arXKolzDYwJZbSeINsRQeXWsZQ==
X-Received: by 2002:a17:90a:9403:: with SMTP id
 r3mr6265089pjo.52.1600301326737; 
 Wed, 16 Sep 2020 17:08:46 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:46 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/19] drm/virtgpu api: host visible feature
Date: Wed, 16 Sep 2020 17:08:25 -0700
Message-Id: <20200917000838.735-6-gurchetansingh@chromium.org>
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
