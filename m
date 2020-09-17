Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA926CFC8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABB86EB54;
	Thu, 17 Sep 2020 00:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFFD6EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:52 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d19so157663pld.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iGaee43EXlPWhgdf9Gnv3QJC5jb1e3zTIJUwX52KPp4=;
 b=Zm8yQFFwWhdg51g0yju8LOypuA4Ue8mKE0UMAOrJambkQ6P1KVRS1GSk17liBSylgy
 qm3/QEiDw2PXULjPL1OWQ+3n8fyPa1ZfBCkS868QWpypLOXPPyi84KENXgHMyAIzvOv3
 fWzDxx9SB6vjzQAkRlu+ERNA4umgLWp+UUOTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iGaee43EXlPWhgdf9Gnv3QJC5jb1e3zTIJUwX52KPp4=;
 b=Xe1fqbGSyCbP62YJ3h0Gg3gJWHtlAToufdqIUd3tiuLINXyxVfGSP9x3S316Fy+wBd
 PfgWT2A0mFcdSdm/GUUXGGEF7K08FinSj2Lugqn2xDWfP8rjqN3ucn2eiAHFQykqPq4x
 +tLGEqePc7Cs4bjYyLBF1PYh7zoQBf60OTNgSqrOq90h8tyx8aCakJHtCw/4YASSfFBB
 VvObU0GyFVUujKvMA62emPh0bfHyp1Ff4V0OtJ2F9F6jjtxTQ6htlKYV5Ts0Z9drgDgl
 7uC77qY27WssdETmevjJ/CJE1eUvFGvzJQJXa23b3loMdHMJ0uRGYc8SvYaiC38EN9pe
 hC2A==
X-Gm-Message-State: AOAM533kiVsXBLbqmuaXBlPKSJT+zJiGNLyEbhC6ORNGsYLh9qJ2FvSv
 shddjsej0ZQ3Ye+gQLu6/SrFcUpzxqwtDw==
X-Google-Smtp-Source: ABdhPJwOXir4/wu1UMeZ675FkD9cHeGYGnmz372H4r7k06mQeA1bCYJLa9nQtMPWokNAfhXQHVi8BQ==
X-Received: by 2002:a17:902:8d8f:b029:d0:cc02:8527 with SMTP id
 v15-20020a1709028d8fb02900d0cc028527mr25850425plo.33.1600301331894; 
 Wed, 16 Sep 2020 17:08:51 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:51 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/19] drm/virtio: implement blob resources: add new fields
 to internal structs
Date: Wed, 16 Sep 2020 17:08:30 -0700
Message-Id: <20200917000838.735-11-gurchetansingh@chromium.org>
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

Useful for upcoming blob resources.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 674a525df9bcc..bddf06b8fb684 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -54,13 +54,16 @@
 #define STATE_ERR 2
 
 struct virtio_gpu_object_params {
-	uint32_t format;
-	uint32_t width;
-	uint32_t height;
 	unsigned long size;
 	bool dumb;
 	/* 3d */
 	bool virgl;
+	bool blob;
+
+	/* classic resources only */
+	uint32_t format;
+	uint32_t width;
+	uint32_t height;
 	uint32_t target;
 	uint32_t bind;
 	uint32_t depth;
@@ -68,6 +71,12 @@ struct virtio_gpu_object_params {
 	uint32_t last_level;
 	uint32_t nr_samples;
 	uint32_t flags;
+
+	/* blob resources only */
+	uint32_t ctx_id;
+	uint32_t blob_mem;
+	uint32_t blob_flags;
+	uint64_t blob_id;
 };
 
 struct virtio_gpu_object {
@@ -75,6 +84,8 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool host3d_blob, guest_blob;
+	uint32_t blob_mem, blob_flags;
 
 	int uuid_state;
 	uuid_t uuid;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
