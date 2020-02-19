Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8116598B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC236ECF9;
	Thu, 20 Feb 2020 08:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3616ECA3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 20:40:11 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i19so663180pfa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 12:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gwGT1WNIBzKVtCka08FuXOrluIa39BPEkwi6FL8QcY=;
 b=IbPGXHiDH3ev5nqRzbcAPF7P+AbPGcpowswLJjb8l8ZWQumB8iRhxftJQ449G73wBu
 LDM9F0mRnGxtlZ/EnpIcXQETbubuLFIcz+5vW+ZsvAypkc/5sXwrUu8C2SG7zQ6s4SnY
 Ep1jzdGe/CztQhKU7TIXisjsumWGLlKtOphLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gwGT1WNIBzKVtCka08FuXOrluIa39BPEkwi6FL8QcY=;
 b=PuWk/byb0/6w29t31inBFr4AQ0wJIj3AeOOnW7x7izaUdHXp8MmnT6dbugwb8dAE5B
 WhmE4Qm60QLwqorwqN+iHgpIZK/+cuvzR9Ptuq0JE8BXzn5vdVUkBFvLFQ4wRJ7Lkr3p
 IsHOjPRLK4w6wasw52CR2zVd5z+7FFF3NJiBZmIwylJED03pUzE6vK6Ngujcbs7Nvcfc
 ZEH4Sb+o7uWieo/cEo925+yLZp4PAndJS5Ria5F0leqlrPvQ7DtaIskXmnc/yi3YMfpp
 r+YiOUoFp7VMYZsoP3zk9GIpwIta3/R5Hxby3iBF++FhMzFxp63/XuLfIyGgIJMRzwdY
 GzbQ==
X-Gm-Message-State: APjAAAXQG6dW1QESUsj7oUVvyfzKonC9KucZAHihRNDFyXelijB9aSbY
 oy+NkIBZHThncPg/Np8azPpyNETwD7nO+g==
X-Google-Smtp-Source: APXvYqydd76zU5MRQe+1mSq61cRIpfGsPiC1TTDlz4itbETb3xQysZO8XrR55Nm/wngYP+0HJVMq3w==
X-Received: by 2002:a62:1402:: with SMTP id 2mr28816369pfu.126.1582144810556; 
 Wed, 19 Feb 2020 12:40:10 -0800 (PST)
Received: from jbates.mtv.corp.google.com ([2620:15c:f:10:e2ce:42d4:ecca:69c4])
 by smtp.gmail.com with ESMTPSA id a10sm574086pgm.81.2020.02.19.12.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 12:40:10 -0800 (PST)
From: John Bates <jbates@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix virtio-gpu resource id creation race
Date: Wed, 19 Feb 2020 12:40:02 -0800
Message-Id: <20200219204002.220744-1-jbates@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, John Bates <jbates@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous code was not thread safe and caused
undefined behavior from spurious duplicate resource IDs.
In this patch, an atomic_t is used instead. We no longer
see any duplicate IDs in tests with this change.

Signed-off-by: John Bates <jbates@chromium.org>
---

 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..b11c1fce1770 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 		 * "f91a9dd35715 Fix unlinking resources from hash
 		 * table." (Feb 2019) fixes the bug.
 		 */
-		static int handle;
-		handle++;
+		static atomic_t seqno;
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
