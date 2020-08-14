Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53469244321
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8C26EACC;
	Fri, 14 Aug 2020 02:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2926EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:23 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id ha11so3701567pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKJhk4mqXAU+gX/aLeavRZaKyFmahEWQXVWAdCidGa4=;
 b=dq/Yjc0h8LKnXSqJGRF5kftq/R9kujE6fZ01rScSjM/FdDV3+hbFQrnKmUkqWZ5NN7
 psX+q5i2UT4UJ2ona4/DCwm8b/Q5f/BZ8mzAzT0s6Bc0mJVVGPJTbu//QBzch66i5tvA
 yhWtoyIpfvk5Jm/qbgU2I5Jd/qI39XF6ntfHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKJhk4mqXAU+gX/aLeavRZaKyFmahEWQXVWAdCidGa4=;
 b=pAKGLvUnrwAE+qwNvX7fnmyPui3KtZG0JBiWtT4ofhu9hgv6ISgjAHhXCNdMCHmCAd
 pGtzW6QTJkp6SkcOzQN5OPFEYnD4cPb5P/GDVYjwMpItjDpB8pq0yvr3Xk2A0rYikXoe
 e5ecGRLkk0znbRAqlpu1vdYprP9BD7EGFhdmcXVJ2hSN+U1u8VKFSKBZgjkpChsJv+YQ
 NE66UUvK9WOLSvTEJCp20NWY5udZlIMwmKXcJ6NFFzLLRcq6tb9oe0nknFOoPE/fyrDx
 3nUFhM+Bxz7UxwNsp1cHA3oO4nkDviu/SFr7lOT8tktPGJXYL9FnqOF2hV8CSCObICvF
 Tc6A==
X-Gm-Message-State: AOAM532WAyZm/XNmS31a0Rx72+G9h3gvpKRdagCmVmvbkMAsPRX/owto
 Jvakzj0Go3jExZhpNAlNbDN5SWE5baxWMA==
X-Google-Smtp-Source: ABdhPJxgWJYPQ8ZRdWaEeBRiHgdVx96JXUb861LYyBP4+tuknoPTsxxRLd4yWcAqDI7P4EotKEQ0KQ==
X-Received: by 2002:a17:90a:c693:: with SMTP id
 n19mr525253pjt.53.1597372822377; 
 Thu, 13 Aug 2020 19:40:22 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:21 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 16/24] drm/virtio: implement blob resources: add new fields to
 internal structs
Date: Thu, 13 Aug 2020 19:39:52 -0700
Message-Id: <20200814024000.2485-17-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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

Useful for upcoming blob resources.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 71743916300d..34636cb5a93c 100644
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
