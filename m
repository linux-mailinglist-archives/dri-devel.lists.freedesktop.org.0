Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA55229186
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37206E44D;
	Wed, 22 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E736E31C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 05:19:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x9so387379plr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 22:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dmd/Tm2NKIlPmtmf250Rr5po/tBi+tVL5ukErGpu6/M=;
 b=fZW1F7DltafThR0vBDMpn78I1muDP0lGZn3RhT1ELTFKpoeX8LXcT8AlQBpWyexuw0
 SaOCdrpFD6Btz0PYfdejP8xgqBzdxb6cIwiEbUkCsix7k0RPv/Rqxd+khvFbANg8mvEu
 Tf8EX+3Fg/sG2aUMJ23I+Lve68oOIld2MKKXqsC3M3Ou35QKn6jaI/Ml3moPaK6lgPTB
 V8xSL3NXBlulAaqHu/8dvSZlaVfJNh+HyBQSe2ZHB+fL6eMRyMb9UT2Ci4ITKksV1gA4
 k8vTH33euyrNNE+FsnGAByJLOlZfWdtTdfhh/9CAv6S5K3f9M8SIRJeRgu4ux08/UjKn
 3xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dmd/Tm2NKIlPmtmf250Rr5po/tBi+tVL5ukErGpu6/M=;
 b=teyfDFw4PZH6me/wgzAuflJCaTeHj+5+Cnt5sb7kI3qFA6PtA8bLRTEyIARo7iBwva
 lWsdbi2ugbRZePPsqiEb4txjYCSedbjFtaMk2nWsMRwohTjokDOpOQfTZDojVyTx1I/7
 fgSTj+MrcrnJbiqfSPTdddkZYc+oYkaid74h2ruEsftMl96lxcR9tr20gMdtnglcA6WI
 lKicvFm4gU7LWmDkEvjtjzzloVIeSDI5JLl+mgDBSauU2z8TBVTEI6ptobH8X6uh8viy
 v8yW6cbswPH2DL2WWZPw+JV6BJRnsrvbx90ozlNuI9D7vb+f0U3eWENGpan6BDoVWgTD
 qPeA==
X-Gm-Message-State: AOAM531s41lEe7KY7V3ttcAqUPFYODWRBo7yCbVdgMbsvC46Smny7KTd
 Y8DdqosecC0u6bweuhTtS58MAQ==
X-Google-Smtp-Source: ABdhPJyXyJC/r6TNRCFBvIm4BOX5hZWyrt2U6MzGfh0U8fNwL8IQsJTk6C62jeiorB+OWFvXacBrQw==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr26310498pln.16.1595395155749; 
 Tue, 21 Jul 2020 22:19:15 -0700 (PDT)
Received: from C02ZK051LVCK.local.net ([61.120.150.77])
 by smtp.gmail.com with ESMTPSA id h3sm4971462pjz.23.2020.07.21.22.19.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 22:19:12 -0700 (PDT)
From: Xin He <hexin.op@bytedance.com>
To: airlied@linux.ie,
	kraxel@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/virtio: fix memory leak in virtio_gpu_cleanup_object()
Date: Wed, 22 Jul 2020 13:18:51 +0800
Message-Id: <20200722051851.72662-1-hexin.op@bytedance.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: Xin He <hexin.op@bytedance.com>, Qi Liu <liuqi.16@bytedance.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before setting shmem->pages to NULL, kfree() should
be called.

Signed-off-by: Xin He <hexin.op@bytedance.com>
Reviewed-by: Qi Liu <liuqi.16@bytedance.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01cd888..703b5cd51751 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -79,6 +79,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 			}
 
 			sg_free_table(shmem->pages);
+			kfree(shmem->pages);
 			shmem->pages = NULL;
 			drm_gem_shmem_unpin(&bo->base.base);
 		}
-- 
2.21.1 (Apple Git-122.3)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
