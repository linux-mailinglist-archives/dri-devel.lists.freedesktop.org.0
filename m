Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E1559EE9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 18:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090110E11F;
	Fri, 24 Jun 2022 16:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A2F10E11F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:57:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9BCCB82AC4;
 Fri, 24 Jun 2022 16:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FC6C34114;
 Fri, 24 Jun 2022 16:57:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XSh+wrt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656089831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7w4F5vDUanD3cyNwRJTK3WbQC/Ff5DbSn/gTkZD/AQ=;
 b=XSh+wrt2Wy33yrqdt71DjblsNKZBNh2GqO0KR/aWNKpt9hoQma7w72rteUjxL2XsK5tTaA
 MXnKXS1hNTEnn/PmxCBlewQ/CobLshUQtutsesvzTnt4deWSt1D2TzI5JD/2Qq+zMwWD5m
 SB9sI/zLrFniFHvP67qrVeWtmKAQLfg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3165afbf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 24 Jun 2022 16:57:11 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/6] dma-buf: remove useless FMODE_LSEEK flag
Date: Fri, 24 Jun 2022 18:56:30 +0200
Message-Id: <20220624165631.2124632-6-Jason@zx2c4.com>
In-Reply-To: <20220624165631.2124632-1-Jason@zx2c4.com>
References: <20220624165631.2124632-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already on by default.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/dma-buf/dma-buf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 32f55640890c..3f08e0b960ec 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -549,7 +549,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		goto err_dmabuf;
 	}
 
-	file->f_mode |= FMODE_LSEEK;
 	dmabuf->file = file;
 
 	mutex_init(&dmabuf->lock);
-- 
2.35.1

