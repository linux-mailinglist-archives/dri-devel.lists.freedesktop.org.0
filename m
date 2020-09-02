Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0B625B5A5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9E6E5D5;
	Wed,  2 Sep 2020 21:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7416E5D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:05 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 5so336098pgl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lv6gxPcx1wFSHkodWA6KYTNzRA1ofPN8nvUzqVUmL3c=;
 b=K95H+YLzK9bsANQasI72HMTFmVcZYeJ+j8RRDlg/lE6A28qEmum8F5vJQjj831/glc
 ZcRKntaBmhxIN+qADk0FdYu/a6njfIcMFcBeFd1ce7AoIteFrpV/lfMj1J1qpC3WOxXR
 6VwkOCn6gKLpM4voM0tJBcVzLGDmu+ogsbppg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lv6gxPcx1wFSHkodWA6KYTNzRA1ofPN8nvUzqVUmL3c=;
 b=o8xrfQ8SBovwTQo+Q0XyJq5iD1bRFEts6D6WugB76Mah+EfjBFSImGu+iZdlPhGZ7m
 jVIsX/QDtoqO3z2L3OhcT9I5+9x3E4EWtR5QlObpfU581OsUUFTV5VbSQU4cB/RTRd3+
 rsTjVSwwLNplEWdB3e7CrUKxfQVF3r55Co0cOc4uG2y+GvxF3KePHdYR2Nm9ipzbwPp1
 5JycqIi2nQB1VBDCv47b+0a44sbMu27mqifuFslUDQVNZTQvt9GzKZvTLlLoyPkK7rK6
 1rnikIvY1/awLOdnkkzZdc45rEm5p7FnHlP/3acPYj/E/cQC2EwZZ3HELUHpG5tYX+9P
 y9SQ==
X-Gm-Message-State: AOAM533icGnFuM90VlJdmo3GI0l0wGSIhsT4bd+biyZEWNbBaYkqIJlg
 s0IPAtSxXs3lZoLYIfD3/21g9x/wqyOdsw==
X-Google-Smtp-Source: ABdhPJxqrzwnKd57/AChOGDNNgv/QZwnqotZhyV+E5BogNrnnGBwnHUqpY91ylzbRoove4ZXxZkxvw==
X-Received: by 2002:a63:4443:: with SMTP id t3mr3474512pgk.9.1599080944872;
 Wed, 02 Sep 2020 14:09:04 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:04 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 11/23] virtio-gpu api: cross-device feature
Date: Wed,  2 Sep 2020 14:08:35 -0700
Message-Id: <20200902210847.2689-12-gurchetansingh@chromium.org>
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

This feature was recently added to virtio-gpu, lets make
it userspace queryable.

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
