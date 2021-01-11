Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D302F1B2E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458B89AEA;
	Mon, 11 Jan 2021 16:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCB789AEA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610383249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8MLJHq6t8gx0gvzWqP/vbEu7Db0NCGsfRJMnLvQSQpI=;
 b=fYr1rF+yTNQDBRgjBiJbFZrr1LVNpqnRDucKJEPihbrVJgP0kdLJB0wEQJuxiIWij2UO89
 5omdwNe1KfcNL5MIMO2ABh8eB8frH3UspZ68DgA0Qizd2NMM/VdJGtFOCKTn67t+CBeMVe
 xkIyvqUEYKNc8vA8f/VAC+7/2AKDLj4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-euznLgxNO8-qESljmL9bQg-1; Mon, 11 Jan 2021 11:40:47 -0500
X-MC-Unique: euznLgxNO8-qESljmL9bQg-1
Received: by mail-qk1-f198.google.com with SMTP id c83so38494qkg.15
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MLJHq6t8gx0gvzWqP/vbEu7Db0NCGsfRJMnLvQSQpI=;
 b=YeiT+TaSjmyctG+dbzYykh6i8kFWPAHT8gbLe+fP1+lA3LrspjgvlxOkmQ+FrZCjMI
 By+KEmiFSYCHf9g7QwyV0Re51Abe+NXINJPEdBbvHhZCcCq8mqG0hBNMneu6BRICUt2W
 ihaZkYzYiy/Ed3DQr/g0AW38QxhponuN6hGvGurLOCaDs8l0oBJARCjZqqQ0pO7JFkVX
 g1MhtZzpzQgDsCxd2vIGxIjSnLzL8I49SIM9JR1puF5nAjwmo9ooclG5VvkXtDpFPWeC
 0yCwZ9MxIqbP+C6fXTXPUTYJSK2RfiS9TscBkdLyBKMT9obrGpfsQpuCv7ZYRFC4yhvb
 9E1A==
X-Gm-Message-State: AOAM532e45eeVuuCKlFiaChUopPJRxC97Sre6MBcxw0/ghvh+lbQ6Kxp
 ptioMh42Tm7ZdJFL9Y6kBeazVjJ/Asrl+c0jWGHG5tWKx/pZj9xdHQlSCCIndTAzDQ8PUHFMe2Q
 QTqWyGRMYeFJXXoi8lH5kVFLepbf6
X-Received: by 2002:ac8:4e05:: with SMTP id c5mr392178qtw.359.1610383246208;
 Mon, 11 Jan 2021 08:40:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMrrmIVF44OfsAGYG/+RRjsGMToGWbU7pQD4+DB6QzgUWbkiNW0MklrV62BFCwWSB4qILCPQ==
X-Received: by 2002:ac8:4e05:: with SMTP id c5mr392161qtw.359.1610383246025;
 Mon, 11 Jan 2021 08:40:46 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a63a:4d01:c440:5c61:43ba:350c])
 by smtp.gmail.com with ESMTPSA id i4sm42599qtw.35.2021.01.11.08.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:40:45 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH] drm/ttm: Fix address passed to dma_mapping_error() in
 ttm_pool_map()
Date: Mon, 11 Jan 2021 11:40:33 -0500
Message-Id: <20210111164033.695968-1-jcline@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Jeremy Cline <jcline@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

check_unmap() is producing a warning about a missing map error check.
The return value from dma_map_page() should be checked for an error, not
the caller-provided dma_addr.

Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 7b2f60616750..0aa197204b08 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -190,7 +190,7 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
 		size_t size = (1ULL << order) * PAGE_SIZE;
 
 		addr = dma_map_page(pool->dev, p, 0, size, DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(pool->dev, **dma_addr))
+		if (dma_mapping_error(pool->dev, addr))
 			return -EFAULT;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
