Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C6153768
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975086F919;
	Wed,  5 Feb 2020 18:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E376E6F919
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:10 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t6so1215038plj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESAWQGiTJHtVjz116jPsFkeJFDiAPiDLtVdAr+9t9t0=;
 b=B4urB/rLosYqlKVL9teR0DmGCgbMHzCcyXbYOyHLkgFwoGqgCxLXOPsGc2y2v/Y9Zm
 doWSdA7pmDvzMx+bV30WH9HhKH8v/YhcNsrVx9LOFISUjb1zr4pji4dPln+TejH4oT6L
 3gS/w8/y3pdz3VhKuko/HdhP4Scm0LCh2H+88MX692Xi3eumEGuBTJt05UzNvGjkAlQ7
 um4EcXMVgBtGyGRbhczLmyG21TBbRq0owGgVrTp5FOKR43A/XmXsCTexiIAdxOnEcd2L
 4e9lNKw++bt/NZMzihetJUxam51wqJ1M2mky/B8uTZaswU8/UX2ZN0KSGZV3X9m3qba1
 aGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESAWQGiTJHtVjz116jPsFkeJFDiAPiDLtVdAr+9t9t0=;
 b=P8ZLhK0d+agqrskgryTU+/Kdq3rqR2V4DNL9OF/wXPJFY8+rfElfe4U/ser+7dwUss
 qZWp4qqYdyNiz6JofPDK2ukLE1A4qcpjkryOonLBFZX+yaP9y6R5TrN8XmvXKYC2nFQD
 MF6h0Sg2WfiKol+kGhy2l1khzCdgVy5cL4OgbUGWfBnQcLSOiYqMoNS87VTTN7VMko94
 XyjqINUzEqbaQvrFaYp1g0ocvTOa9stoiP3+nhaMtmoac5v9TZHR1v9Iz7Uh4JWfxGZU
 AegQQRXDb4Ad0sCPsKGIIjyDVYgt+fAJk8XMwtJ/oRkr9d+HEPHWSMYeDldIZNaaiRal
 59xA==
X-Gm-Message-State: APjAAAXkT3Vg7nTVudy3pjWOWPQwH4mz0O+zkNjj+lVOsF8kE6VCH6UW
 33BVzxuBB4rzXcyRs4m/rHqpWWdV
X-Google-Smtp-Source: APXvYqwlfuqoYpfV3dMgCW5yN+OosR8hmjs+KoViZQiSor4fP9CgWVtSAF/qSHVN8/892C4qgsyJ6A==
X-Received: by 2002:a17:902:e789:: with SMTP id
 cp9mr36161399plb.85.1580926810236; 
 Wed, 05 Feb 2020 10:20:10 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:09 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm/virtio: fix a wait_event condition
Date: Wed,  5 Feb 2020 10:19:45 -0800
Message-Id: <20200205181955.202485-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
References: <20200205181955.202485-1-olvaffe@gmail.com>
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

outcnt may be greater than 1 since commit e1218b8c0cc1 (drm/virtio:
Use vmalloc for command buffer allocations.).

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5914e79d3429f..5169e8dd9fd6c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -391,7 +391,8 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	 */
 	if (vq->num_free < 2 + outcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
-		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= 3);
+		wait_event(vgdev->ctrlq.ack_queue,
+			   vq->num_free >= 2 + outcnt);
 		goto again;
 	}
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
