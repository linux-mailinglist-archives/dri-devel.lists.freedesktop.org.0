Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39D4358DD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66766EA73;
	Thu, 21 Oct 2021 03:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72946E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:37 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so4928318pjq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1CzWrWFVukEInFcsIV8dpfWP+HgwJWws9TvsQtzZYQ=;
 b=LmiFPrPu2utQ93qeT47eDCtd/GvNiHZTSnwEo8dBBX1ckGPSWuHiq9Km+I5+pbayf4
 TjReip323K18tz/JXLDBd78kETg6wDoMS/u2wZaNx6Nlfpnz8nnhrzvTB8RZgRBUtcSs
 X8ghCRGe25WuxXlFwFoiM+IHGD4ne0lrYTR88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1CzWrWFVukEInFcsIV8dpfWP+HgwJWws9TvsQtzZYQ=;
 b=IvBG6w+D7cRqNbdV2qibL9tSEE79eDrs1qMrreT09A5QKtbkcy3GR7kUMf30ERuMZ0
 xI1V947VgY7/SHNqpgeaVLGUUsQFOIX4GKptptESQ6ei4SvT50xQ8py/YXJtCDiaoqKC
 c2/Yv7O94O0ZJhWGyVDH5APoigQ09crE40wLgpQxWjZKgS2p23R2eR33TXZSQWKI2AsA
 7T0qpiVQ2oH3Tz2X2Ync9+Ggm/Jn9Y2K9KzPuUn+f+F4TZR9R4qN+1SZdZPLQ/xZHsxv
 90E13EPSEDMycd1Gjausu67yRLyPVxpWOySOq0LYKluEs4ey4jcfwd0udDcMlFomGGA8
 tEzw==
X-Gm-Message-State: AOAM533gJz5tvmhdbEusWCGc+Z1iR9smtLig3Uy/M8jraTXYUF/Qg997
 bo4PAbK7KNyfLMrxhAmCRvTyYZWyRQLT0w==
X-Google-Smtp-Source: ABdhPJxaeaICwlCneJFeg6r6/K+h2EZ/TerlwQu0koHctvBU2AlY2jqRNqefxcCSedeT59Do3wvWgw==
X-Received: by 2002:a17:902:900c:b0:13f:974c:19b0 with SMTP id
 a12-20020a170902900c00b0013f974c19b0mr2885138plp.12.1634785837133; 
 Wed, 20 Oct 2021 20:10:37 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:36 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 8/8] drm: trace memory import per DRM device
Date: Wed, 20 Oct 2021 20:10:27 -0700
Message-Id: <20211021031027.537-9-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- drm_gem_prime_import_dev increases the per-device import memory
  counter

  * Most drivers use it.

  * drivers that have a (*gem_prime_import) callback will need
    additional changes, which can be done if everyone likes the
    overall RFC.

- drm_prime_gem_destroy decreases the per-device import memory
  counter.

  * All drivers seem to use it?

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1afcae0c4038..c2057b7a63b4 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -955,6 +955,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 
 	obj->import_attach = attach;
 	obj->resv = dma_buf->resv;
+	drm_gem_trace_gpu_mem_total(dev, obj->size, true);
 
 	return obj;
 
@@ -1055,6 +1056,7 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
 	struct dma_buf_attachment *attach;
 	struct dma_buf *dma_buf;
 
+	drm_gem_trace_gpu_mem_total(obj->dev, -obj->size, true);
 	attach = obj->import_attach;
 	if (sg)
 		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
-- 
2.25.1

