Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C53AEC2C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7621B6E1CE;
	Mon, 21 Jun 2021 15:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB60D6E1CE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:18:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso14154831wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+K7pfn/GwizgnG81bD8iFEUz4FpDS5BGHuYh6ppqGs=;
 b=FlL3v/bFlgCt0P/oIGy8repY7sjZt4myWS31/wrBiXr1N8O3qn57mIpK3dnv40/D6C
 D0gKjBkx2kCYTg/enPbPCdxVE9mqxPpzNptVHakOCYEGXwvpfNj2QlaGol2fLSvK9a+V
 Z3XdihUHddAIKf4j51kVZYz0tBrsGg0VM/YTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+K7pfn/GwizgnG81bD8iFEUz4FpDS5BGHuYh6ppqGs=;
 b=KQkS+2mCNzirArBso8dcWkdYibLq/RS80XE7biz74uF2F8GfQabcwdYuIsGp2Y0rlO
 ShxMVLErrIBq7ka4wJISOVy0I1EDkKCbRhgjBx8j5XHjIOKysBYRPGEN6cM0ifJFDVCH
 oSLFT2ST8XjovSl1bI0Z9Kk4NVqcV5ogaUHcdPdsyISoh7yCSJjQLDRBrSipTYjwxZ28
 smv4WpYgNjTV3xD8fsfkEUWU6q/sdLKKdL2XR20klldE7irgJLrhX/8nhNJqxY2iJch9
 Vl41by/P449UHKAdRgm66Zb1KHJgB81ywYV04T5rW3EoTtLqmnsecJif4rO923DexiTs
 Mx6A==
X-Gm-Message-State: AOAM532NHAfTmLl52fG7Xe7OJSMWsSvVlP3+Jfz3iHA2raacL+MOjFvv
 UFIScSSdwzuUveX3mR6QJQLJMAAeNQlrHA==
X-Google-Smtp-Source: ABdhPJz5vdUuiEHUJTp54WNNpoa4PdEUmEim1wA7kTYxtIMXfdKhj0N4kj3e7oMUHKwBYnmQtXmLew==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr27226445wmc.95.1624288684627; 
 Mon, 21 Jun 2021 08:18:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b9sm1790947wrt.55.2021.06.21.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:18:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Document non-dynamic exporter expectations better
Date: Mon, 21 Jun 2021 17:17:58 +0200
Message-Id: <20210621151758.2347474-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210621150732.2345632-1-daniel.vetter@ffwll.ch>
References: <20210621150732.2345632-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian and me realized we have a pretty massive disconnect about
different interpretations of what dma_resv is used for by different
drivers. The discussion is much, much bigger than this change here,
but this is an important one:

Non-dynamic exporters must guarantee that the memory they return is
ready for use. They cannot expect importers to wait for the exclusive
fence. Only dynamic importers are required to obey the dma_resv fences
strictly (and more patches are needed to define exactly what this
means).

Christian has patches to update nouvea, radeon and amdgpu. The only
other driver using both ttm and supporting dma-buf export is qxl,
which only uses synchronous ttm_bo_move.

v2: To hammer this in document that dynamic importers _must_ wait for
the exclusive fence after having called dma_buf_map_attachment.

Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/dma-buf/dma-buf.c |  3 +++
 include/linux/dma-buf.h   | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e3ba5db5f292..65cbd7f0f16a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -956,6 +956,9 @@ EXPORT_SYMBOL_GPL(dma_buf_unpin);
  * the underlying backing storage is pinned for as long as a mapping exists,
  * therefore users/importers should not hold onto a mapping for undue amounts of
  * time.
+ *
+ * Important: Dynamic importers must wait for the exclusive fence of the struct
+ * dma_resv attached to the DMA-BUF first.
  */
 struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 					enum dma_data_direction direction)
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 342585bd6dff..92eec38a03aa 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -96,6 +96,12 @@ struct dma_buf_ops {
 	 * This is called automatically for non-dynamic importers from
 	 * dma_buf_attach().
 	 *
+	 * Note that similar to non-dynamic exporters in their @map_dma_buf
+	 * callback the driver must guarantee that the memory is available for
+	 * use and cleared of any old data by the time this function returns.
+	 * Drivers which pipeline their buffer moves internally must wait for
+	 * all moves and clears to complete.
+	 *
 	 * Returns:
 	 *
 	 * 0 on success, negative error code on failure.
@@ -144,6 +150,15 @@ struct dma_buf_ops {
 	 * This is always called with the dmabuf->resv object locked when
 	 * the dynamic_mapping flag is true.
 	 *
+	 * Note that for non-dynamic exporters the driver must guarantee that
+	 * that the memory is available for use and cleared of any old data by
+	 * the time this function returns.  Drivers which pipeline their buffer
+	 * moves internally must wait for all moves and clears to complete.
+	 * Dynamic exporters do not need to follow this rule: For non-dynamic
+	 * importers the buffer is already pinned through @pin, which has the
+	 * same requirements. Dynamic importers otoh are required to obey the
+	 * dma_resv fences.
+	 *
 	 * Returns:
 	 *
 	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
-- 
2.32.0.rc2

