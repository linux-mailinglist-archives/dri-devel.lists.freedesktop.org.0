Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3674F805A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4715C10EA4A;
	Thu,  7 Apr 2022 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5FF10EA4A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649337607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qwnyzBHU2ps0lg/u42dFlsQayDte7IETW+1w7Wx0wc0=;
 b=T45evgTkbJh4KqKuHEUTVjVD1QQtL8X9lZlcXMPhkUxOI9ueih9WAyHEP1zHaoLn6hnoZr
 YQUEJDsPD49FVL/iv9mw1sZn8u9KvwNRiv85PoIAtHjTrqj2/djD6dRiZmL8JO0Gbsf9m8
 5XWonHfEnqbXWjZ00StBEvy1GaJAJIg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-rNILlvZNOMuYrrpCCtEcJw-1; Thu, 07 Apr 2022 09:20:06 -0400
X-MC-Unique: rNILlvZNOMuYrrpCCtEcJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d29-20020adfa35d000000b002060fd92b14so1258812wrb.23
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwnyzBHU2ps0lg/u42dFlsQayDte7IETW+1w7Wx0wc0=;
 b=3Tbg8/PHWhowTZBk4hqB8gepCrB6ZsMhz+BBJ7ewV5PCf4/dCRWRFETAfbapGMdN99
 OdTJk4yWPcZ7X4x/eAnZbSs29GdiE5Gg+icYVRGEQJUjwMQpfXLyuiNcwPEHMQ46l2rJ
 kC4gYwcWI7DNhsAANZ/AQksmjXXYtTQZiLz69w+IVm7Il8AXQOwf/xuR0X5L5kaYp33B
 HN7znrNGplLbfzbGUai3B9PXVOs31BVfU7iSz4ZWODmoT8rh/gz7sgxIxDme4ZcRsiYl
 zMsWWzIdNudXd4LIBVsIl8UVp0PQ6me5MHereZD0vxlYdg8tedz5oxM8MWgJpHFPRIBS
 duHg==
X-Gm-Message-State: AOAM533XMKNI1qk3iQPMK4LKV/CGg+YJsjzkW6Wv9xETdvHNT9ICvJqJ
 VZT/MKDz8y2WBB2wvYCu/8mX1ib3RcOvyp6+k6zCbUpL+YJFvE/bD0THSBUKmqBWJ4oL97oCq7t
 lPXBgWH6VwN9SCGX9HDIdbj/BeOu/
X-Received: by 2002:a05:600c:3c9b:b0:38e:4c59:68b9 with SMTP id
 bg27-20020a05600c3c9b00b0038e4c5968b9mr12255514wmb.105.1649337605347; 
 Thu, 07 Apr 2022 06:20:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQBSQ6JsGQGmUQrZuo6fJZqwQPCpOMvTNMJmEk0YVL6Z/cfLYxjjpt866oxCfauhP9AWslsA==
X-Received: by 2002:a05:600c:3c9b:b0:38e:4c59:68b9 with SMTP id
 bg27-20020a05600c3c9b00b0038e4c5968b9mr12255486wmb.105.1649337605105; 
 Thu, 07 Apr 2022 06:20:05 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f184-20020a1c38c1000000b0038e7d6825f4sm7678670wma.43.2022.04.07.06.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:20:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: Use newer fence API properly to fix build errors
Date: Thu,  7 Apr 2022 15:19:50 +0200
Message-Id: <20220407131950.915091-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 73511edf8b19 ("dma-buf: specify usage while adding fences to
dma_resv obj v7") ported all the DRM drivers to use the newer fence API
that specifies the usage with the enum dma_resv_usage rather than doing
an explicit shared / exclusive distinction.

But the commit didn't do it properly in two callers of the vc4 driver,
leading to build errors.

Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---

 drivers/gpu/drm/vc4/vc4_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 38550317e025..9eaf304fc20d 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -546,7 +546,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->bo[i]->base);
 		bo->seqno = seqno;
 
-		dma_resv_add_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence,
+				   DMA_RESV_USAGE_READ);
 	}
 
 	list_for_each_entry(bo, &exec->unref_list, unref_head) {
@@ -557,7 +558,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
 		bo->write_seqno = seqno;
 
-		dma_resv_add_excl_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence,
+				   DMA_RESV_USAGE_WRITE);
 	}
 }
 
-- 
2.35.1

