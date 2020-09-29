Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9553F27DB24
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 23:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929B6E02C;
	Tue, 29 Sep 2020 21:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5DD6E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 21:53:37 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id v14so3482089pjd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHD+j0Y0rt0NDZv/oo+Hw1Lw3QhA5q1ZuMXf1xNG2m4=;
 b=AzCD8a2LMXLt44NFy8IvG35bzW4N+fZxm1b+zbq+Opzl2IHNqCO8fonKdudH/4RPUN
 y+XvOj3mMxNlk0L0mPLBAiT8tZttiqfNwQpageqNUKZug7glXXIWM4/YEYo5QRqD5oQK
 3OjUV0HUgqmUUcCVgml1bwwjkS/aDLFHYtXk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHD+j0Y0rt0NDZv/oo+Hw1Lw3QhA5q1ZuMXf1xNG2m4=;
 b=Qy+d+zKZhlhlC2hTOp/p1wgly2TFV+3LEMgP8tUhccTXgPRZGlNAfa1Q5LvX5r3XOF
 j/XQu2dlx8e0C9bsziG5MNuEAPpWgjVDbVq6ZQa05yM/2Hzd06ZVj01Ld1GzxHNfceaQ
 iMLLIhn/1sl0IqGf0ghaPDQdoAvqED22YJG8Yrm8noLJMiSkrv7mZisk0u6FSdwfpAwY
 eagEmWGxZmhEhmZpXOkekaWkJrcmw3J1pui3ISw6TI2XttPxA1BgH5J6OGZA6Pg7Q5Pw
 WkGLvlfJ65VUOjkj0aY38s8NruHsOBh//YdRJf9d4XNjppggwpmXa8LIt0SRUjxS/Lh/
 dOlg==
X-Gm-Message-State: AOAM532FGrZsuawU8IZZRuuRgklQ2YJcqG6JfNwzZGoJ9F63nVLCiyWP
 17V3CocjmgVt2NaBjpwK9wF8p8uTDppuiA==
X-Google-Smtp-Source: ABdhPJyDz2qVZbaO/OHjKyaOIWjFxDBsmW/WfBRaKFAlSOKxUzMpAa+w3Krgcy+Bu80L+9czo3hG5A==
X-Received: by 2002:a17:90b:3241:: with SMTP id
 jy1mr5748441pjb.10.1601416417215; 
 Tue, 29 Sep 2020 14:53:37 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id f18sm7008039pfe.153.2020.09.29.14.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 14:53:36 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] virtio-gpu api: fix 64/32 compat issue with blob
 implementation
Date: Tue, 29 Sep 2020 14:53:33 -0700
Message-Id: <20200929215333.1241-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Alistair Delva <adelva@google.com>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alistair Delva <adelva@google.com>

We encountered this issue when booting blob with a 32-bit kernel.
The implementation doesn't match v6 of the virtio-spec change, so fix
this.

Fixes: ff886cbdcc44 ("virtio-gpu api: blob resources")
Signed-off-by: Alistair Delva <adelva@google.com>
---
 include/uapi/linux/virtio_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index fa2ae4a1da5f9..0ec6b610402cb 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -388,9 +388,9 @@ struct virtio_gpu_resource_create_blob {
 	/* zero is invalid blob mem */
 	__le32 blob_mem;
 	__le32 blob_flags;
+	__le32 nr_entries;
 	__le64 blob_id;
 	__le64 size;
-	__le32 nr_entries;
 	/*
 	 * sizeof(nr_entries * virtio_gpu_mem_entry) bytes follow
 	 */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
