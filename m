Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0EB167BB1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B876F3F3;
	Fri, 21 Feb 2020 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6836EE86
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 22:53:24 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u12so2649570pgb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8y6ifayNVQgnY1tMWDMsipu9ODJDdQDstWHm3fHcGfE=;
 b=gm84h6pKQS5YcoJK1K02t1lcWnOmqtleExEez3+nHq9i2/vFclcKm2uvPhs5T0cUHj
 cXpHlL6CbniFWvdE+UifQ2gSKUfjopys7YEPbCpneUzuuobUpneYDSRJ4EV6tD26oePF
 QPE5wLbRV4bfKDtBOZ5GmgZXoCWADW3ya+3XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8y6ifayNVQgnY1tMWDMsipu9ODJDdQDstWHm3fHcGfE=;
 b=cp/UfTslN/M271CCvgxz18pXgQPeq3CxxIyjq6nBVJjlDx0QEgIcnJ7iRl6OK0K6f8
 3XOcpiiXbNyb9QgJtCTPcHN4RjfP00NMTd2UIF0ZrYePd9W7HP7WIZnZt0eVuuUk7dOc
 T6wJRFyqoXuKfjmNnIIyxYKq9hzwGJOxQjRy79wauGLOxlhDOA/twfkGKFAjmmZaWhA/
 DT3uC92kDMQ2oDocHfyEivPUFXiZLFTB4aPDcY52StCu5/ypf8dVmZxtGXwcdZy0rNQ7
 ZFxRd87KaK2/xdjd2wReK68OgE0ZwxQjuC/ictGVXXzLRnf1MVS3vlggHoNL5sZdnxun
 moYA==
X-Gm-Message-State: APjAAAWPmgKDdAomfyC9l5pRs79KOTxCIA2sCe9kZbA+FnRDK7GYPUMA
 p4sM9htKdziJUm1ox18OHzrt0GLQSdOVNg==
X-Google-Smtp-Source: APXvYqwDPd/m6joXZ6fiCV1otqXEu+uHzw6PhQzfEAO+MWtPxMuJxkjuuAjL2YYJFBlnKOoZE+v3eA==
X-Received: by 2002:a63:504f:: with SMTP id q15mr35267581pgl.8.1582239204098; 
 Thu, 20 Feb 2020 14:53:24 -0800 (PST)
Received: from jbates.mtv.corp.google.com ([2620:15c:f:10:e2ce:42d4:ecca:69c4])
 by smtp.gmail.com with ESMTPSA id 144sm641900pfc.45.2020.02.20.14.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 14:53:23 -0800 (PST)
From: John Bates <jbates@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: fix resource id creation race
Date: Thu, 20 Feb 2020 14:53:19 -0800
Message-Id: <20200220225319.45621-1-jbates@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous code was not thread safe and caused
undefined behavior from spurious duplicate resource IDs.
In this patch, an atomic_t is used instead. We no longer
see any duplicate IDs in tests with this change.

Fixes: 16065fcdd19d ("drm/virtio: do NOT reuse resource ids")
Signed-off-by: John Bates <jbates@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..890121a45625 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 		 * "f91a9dd35715 Fix unlinking resources from hash
 		 * table." (Feb 2019) fixes the bug.
 		 */
-		static int handle;
-		handle++;
+		static atomic_t seqno = ATOMIC_INIT(0);
+		int handle = atomic_inc_return(&seqno);
 		*resid = handle + 1;
 	} else {
 		int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
