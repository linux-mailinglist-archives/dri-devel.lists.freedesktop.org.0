Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B34BBE371
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 15:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CB910E375;
	Mon,  6 Oct 2025 13:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SncThMKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CA510E375
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 13:47:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso3146087f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759758435; x=1760363235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JUjSFz6fN2wSOyWGzwAwR2J1COdGWDGN7frdNiRq5kw=;
 b=SncThMKphquRfUwuQvnCV26YtWSpEsI2ImKApG13+nGIAEbR6camwM54480ckdHyiE
 1u3aUvkpINJnE8TZ46W6PCGS+KJAi1ZEIwleaZAIrt+Hk3VsNjcXjhioZYAw5T+SbxX8
 0Nwsm5nvaLMFVrD6iLgY1XYv2/7RolPm+0V9rO32ex3e+0TXS4a61spD33vnJGSh8TZl
 3JR2u3SmVDNX710cRFp7JPOZD0TbXuFHnkd8752Ye+sbkyi86fxNT60sQLicMjgKx/GT
 ivg4zLY4q2exWpegYpp26haBQc+KVJ+AAiLvUAXR+1Knn6+uV+K1rg4fdu7eInAyOjpw
 XVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759758435; x=1760363235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUjSFz6fN2wSOyWGzwAwR2J1COdGWDGN7frdNiRq5kw=;
 b=Ndh5+XSl1skF05taE1wQ3l8owdisuTPUCcz1H8Qd17aARq88QEGE5Sbrond2iCRoPX
 AuGrli9Ivh3/gXCPXIXf9Ioviiq8ea56J8jxr9JOF/sn6169/Aye8ButCmKq06iHKRQK
 24gk07UdnPcOTPErJ/ZhjXzjjjAbHIhXPv50YdvrZLln0uSLJRa9oGhvOCjcu7Q1ePBH
 JN+fIpGOUNibwMGddTIi/vbbOjR5KqWt0qAJ9yhnhgRNxN7U/rHmCElgBbgah+q2B2xL
 DbuNRpQk2wPNOaaqKJBCsDrIft7V30NjJODUvw/MdDrN6pbGLp0ZowqraxfwXptcrtrC
 l+wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9DeqYvPZJNLCHnZBVdZaexiDkFiZER/oGMW0NBh/TP6oJHVuM7tmZv05l+TflSuJhNkR8afvW8Vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQoXSIjM94UE0IJd2OgAzyJ0ookeLEPIY14/AL86j68ksN1iwP
 5lOSuRr+X4nUj8geuddVEABC0H+f9QhOf+QzILfuIMYk421mlxO9SjO/
X-Gm-Gg: ASbGncs8SvuINKt+02w7FilwinGvKuI0AlQF8qC5BudQCZnmcYf/HmAmEDKhyJWHTZF
 UcXk9Qj+MZtYozHtImHXSddrBq0bbcNPaJEwFM9l5drwBpz/GnW/pRpstqoofDcf2Uz2G7itj9D
 a+q4xRbkn44WMoiG3ToVJ8CM2RYBX5XymLheU79Yh6bs6uG0KgGSVgGVROJX2nZ34+oZz9P4hT8
 f7pnm7PGy/PxEbeMA4n/a5TWILv2/PvmPyGzK02JmcpBhChRpXj/hOYI4P2/33vIoP466EOqZjb
 V++LexuQ1T2EWwTWOZX+bd9KSdBkSfuDzoYEvZrgUlDFSkNSrvUfcBnmDhAVcLLPyKQ/fiHpzXg
 EdfxxUkv21KAy58o5lHgibRILnnfsRvZLYtEdtr9BJc6hVnEaqYLVNeYY1fOhHRIn6BV0Sg==
X-Google-Smtp-Source: AGHT+IHghnHYTHQMZ74bXvaml49IhX11dZtX5PjRksFkQP9ERbo3nu+xG5MfUzWuLRJts3bUM0z8Ew==
X-Received: by 2002:a05:6000:610:b0:3fe:d6df:c679 with SMTP id
 ffacd0b85a97d-425671c1c62mr8200162f8f.55.1759758435309; 
 Mon, 06 Oct 2025 06:47:15 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1585:c600:2084:c9fe:598c:ebd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8b0068sm20966125f8f.26.2025.10.06.06.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 06:47:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
Subject: [PATCH 2/2] dma-buf: improve sg_table debugging hack
Date: Mon,  6 Oct 2025 15:47:13 +0200
Message-ID: <20251006134713.1846-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006134713.1846-1-christian.koenig@amd.com>
References: <20251006134713.1846-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of just mangling the page link create a copy of the sg_table
but only copy over the DMA addresses and not the pages.

Still quite a hack but this at least allows the exporter to properly
keeps it's sg_table intact.

This is important for example for the system DMA-heap which needs it's
sg_table to sync CPU writes with device accesses.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 68 +++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2305bb2cc1f1..1fe5781d8862 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -828,21 +828,59 @@ void dma_buf_put(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
-static void mangle_sg_table(struct sg_table *sg_table)
+static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
 {
-#ifdef CONFIG_DMABUF_DEBUG
-	int i;
-	struct scatterlist *sg;
-
-	/* To catch abuse of the underlying struct page by importers mix
-	 * up the bits, but take care to preserve the low SG_ bits to
-	 * not corrupt the sgt. The mixing is undone on unmap
-	 * before passing the sgt back to the exporter.
+	struct sg_table *to, *from = *sg_table;
+	struct scatterlist *to_sg, *from_sg;
+	int i, ret;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return 0;
+
+	/*
+	 * To catch abuse of the underlying struct page by importers copy the
+	 * sg_table without copying the page_link and give only the copy back to
+	 * the importer.
 	 */
-	for_each_sgtable_sg(sg_table, sg, i)
-		sg->page_link ^= ~0xffUL;
-#endif
+	to = kzalloc(sizeof(*to), GFP_KERNEL);
+	if (!to)
+		return -ENOMEM;
 
+	ret = sg_alloc_table(to, from->nents, GFP_KERNEL);
+	if (ret)
+		goto free_to;
+
+	to_sg = to->sgl;
+	for_each_sgtable_dma_sg(from, from_sg, i) {
+		sg_set_page(to_sg, NULL, 0, 0);
+                sg_dma_address(to_sg) = sg_dma_address(from_sg);
+                sg_dma_len(to_sg) = sg_dma_len(from_sg);
+		to_sg = sg_next(to_sg);
+	}
+
+	/*
+	 * Store the original sg_table in the first page_link of the copy so
+	 * that we can revert everything back again on unmap.
+	 */
+	to->sgl[0].page_link = (unsigned long)from;
+	*sg_table = to;
+	return 0;
+
+free_to:
+	kfree(to);
+	return ret;
+}
+
+static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
+{
+	struct sg_table *copy = *sg_table;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return;
+
+	*sg_table = (void *)copy->sgl[0].page_link;
+	sg_free_table(copy);
+	kfree(copy);
 }
 
 static inline bool
@@ -1139,7 +1177,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret < 0)
 			goto error_unmap;
 	}
-	mangle_sg_table(sg_table);
+	ret = dma_buf_mangle_sg_table(&sg_table);
+	if (ret)
+		goto error_unmap;
 
 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
@@ -1220,7 +1260,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	mangle_sg_table(sg_table);
+	dma_buf_demangle_sg_table(&sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
-- 
2.43.0

