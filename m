Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CFD15376F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031786F91F;
	Wed,  5 Feb 2020 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EE06F91D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:14 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k29so1605712pfp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XORg0aqJcQWmmTNOH1YEuzSo/o+dN5ZC3N87GWWCK7Y=;
 b=sfG5QWG8ArV4SOkUtwSZYocieXtDjQ1qveE3m5IioB7yj4lvYDzjVpeYPZ/zG2DLo5
 3H9BZOelf9owj05BYQJqhvgjmofpqLsY55DmV/UmsBnoeuQ5DSx8R59dO441M4RZJWJZ
 +kQ4vPvVpSuPyLXLO48Ub87ghpRj8Dr8acmMs6xXWpceFxXpgBZDjHzSCT23V7AZtD35
 nLXknuy1xB6os9zW95XhxMhzBukWuC3LAW3wStoPxqKwr3r280xk9thxOdEeJK/h0MGd
 6Cwp0Z2nqtoxDuCUY4zs95rOQlPam2K0seeiwyivtL73+f8sVxkH4rsQUj9bBg8PIhOY
 0rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XORg0aqJcQWmmTNOH1YEuzSo/o+dN5ZC3N87GWWCK7Y=;
 b=WFAPaXwl1Vz3pqEk973C0X6vcSuuX/x1fEXYCYVeZ/TRNjkhqaQn/C+osTwN489Nbt
 uS1pDroYcBtuZ3+1yxTZ0xb4HDjX6zMcq9rxqsbZVu8ZIn9q4F32Mm/hC/ZGprpwaFuI
 9ZSbLP/G4YbDww/9fCRxoxgEpXP5aKEaa2Ty9Na681WRQ+6nMBp/CFTdKoP2xIEB1won
 vt/XBeKDiH7iHlq/aJCCDBVKxflTURtlUJcDHZ9q0OeoyIot8VX1XvaOzbps6fuxc+64
 ByPzXVLuFgEa0rYXsC/Cq9TcwO5x7iNKld8eDPQk/hppCDPCzZxqMA72gHL61l2f2j0A
 LapQ==
X-Gm-Message-State: APjAAAVjnw2X8sInmLQbDwNSe18VT7zsbDGZS6huo+mop/hqKgz3zHzQ
 eLfVosJQhjtgkfMNqcIXcNtKPCRE
X-Google-Smtp-Source: APXvYqygovB6m8ovjz/cyStDz1EvI0gHaiEVIQjDRY7H1muBWs47RCVr2GKo7zoIBnTk08aEI76DOA==
X-Received: by 2002:a63:3154:: with SMTP id x81mr27413713pgx.32.1580926813282; 
 Wed, 05 Feb 2020 10:20:13 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:12 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] drm/virtio: unlock object array on errors
Date: Wed,  5 Feb 2020 10:19:49 -0800
Message-Id: <20200205181955.202485-6-olvaffe@gmail.com>
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

We don't propagate erros to the callers.  We have to unlock object
arrays on errors.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5815c7d50dc20..1e27f4c09341e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -370,8 +370,11 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		if (is_vmalloc_addr(vbuf->data_buf)) {
 			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
 					     &outcnt);
-			if (!sgt)
+			if (!sgt) {
+				if (fence && vbuf->objs)
+					virtio_gpu_array_unlock_resv(vbuf->objs);
 				return;
+			}
 			vout = sgt->sgl;
 		} else {
 			sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
