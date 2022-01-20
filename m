Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38D494EF9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4067810E805;
	Thu, 20 Jan 2022 13:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5811F10E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 h206-20020a1c21d7000000b0034e043aaac7so20785wmh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iAcYclpd/6FIhZinrEfjwuNasmRfUX8EQW8kMKH7eHI=;
 b=JZCYu9MsvVyyMkLSyd+lJilG330m4+DBrbl/Un7UaoLCZybFsPg8RHuPti4apVUnwh
 /xyufUo1OjFZa9yPHIrIz/XFQuTW1MspVVqfpYeUdI1ueeRG/x3h1NIAb43KxsKTTSwi
 pNyNXbyLzQNeCtMLOcwJIUIp2QpATFlFyrCqh0sjt7NyGoeez0OiwhywbAdHr+TSWrFO
 Pt7pxxgr0DCwY/zHyTF+vKVuxhp/J0KWm3GYtqvelUW2FBxj4hPWck9WvbPooPjHzG8H
 e46Gzn7oFUoxokisfqGo0KtPkG6M1czzHmrtcCYZvQQ7FuCkjQDIq/7i0XYUlrb49VYS
 qu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAcYclpd/6FIhZinrEfjwuNasmRfUX8EQW8kMKH7eHI=;
 b=JE1lZz0+BPTOxW3FDz+HzZerU8guAj3IoIXDsP37+x9H8fgHoYvikWqpfo1UPyVdwK
 a/V59r3Uu110D+TGL/p+1n9iR1ggqz3oFLzvkPJEy1HQZfVcrxiMQAZs4KxNJ1tcEri6
 z9VZIMbI7lH6hTpBNu2XvC/55C6mBVCQwDJWwb4PRgEJEujzDAcONsztvCnr46REhLsK
 9073wtiyU+0v/UBg6hWNLfy9H0xt8EUHtw2N+UQz4UC+1gtIfMoB08Win2CG8E2foMMV
 Y3w/XpwRd88tqAU0ZKfTdgoAyK1yO7ZE53992KpX4meWFvI8l0ZIK53yVf6ulFwFc6/K
 r8tQ==
X-Gm-Message-State: AOAM532HBz2VNkFiwhmCFkSi40j0ff8XBEUTcBb5gnNeS+pF1YALVHMa
 Kq7xzK3ynyU3LdypKiJZquI=
X-Google-Smtp-Source: ABdhPJzNuFHgN0BH3Hh5XR2ychKDo4juRHkyCqcEGSf0zzAoftBbFsYbzE5wAQTbkiN7XxAuvJAGyA==
X-Received: by 2002:a5d:6042:: with SMTP id j2mr1881746wrt.105.1642685271909; 
 Thu, 20 Jan 2022 05:27:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:51 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/9] dma-buf: Warn about dma_fence_chain container rules
Date: Thu, 20 Jan 2022 14:27:41 +0100
Message-Id: <20220120132747.2348-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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

Chaining of dma_fence_chain objects is only allowed through the prev
fence and not through the contained fence.

Warn about that when we create a dma_fence_chain.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-chain.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..fa33f6b7f77b 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -254,5 +254,13 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
+
+	/* Chaining dma_fence_chain container together is only allowed through
+	 * the prev fence and not through the contained fence.
+	 *
+	 * The correct way of handling this is to flatten out the fence
+	 * structure into a dma_fence_array by the caller instead.
+	 */
+	WARN_ON(dma_fence_is_chain(fence));
 }
 EXPORT_SYMBOL(dma_fence_chain_init);
-- 
2.25.1

