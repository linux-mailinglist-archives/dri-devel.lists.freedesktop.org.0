Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A44E5BCB69
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 14:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1437610E60E;
	Mon, 19 Sep 2022 12:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF5310E60E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 12:06:22 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id sb3so34275392ejb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RqjIPZcH2Md+douc0/MSQ5MvDH0kopC9S0ibMoplXGI=;
 b=ISxqoms7ihsCPJ0LpQypd2KzfHKSGIE4N+yl9DTm4H0Qqtai8pLMrez20J7gFfyXu0
 6d4e6nTq/NF//EUpB7Xc+GzRGFRjbY1g2lx60Bt1V1lt86sDFgOPqInaooCA2yhJs9aG
 y3e9of5nOthrI5XYQOxBwZ3UWhm4A0IxyMH2fqfTW7pdH1K/BJ73aawhcAke9WKpQ5NW
 02SVORULTCwCkylLxT4HDpWoK38L4+9JgrNI6fOK1PSLDAc+GITaJeFc6YJLcy9C6f5H
 5U4pAteRQvQIHjBcyvclklhqJGDWesIeBWZMcqgwOaKwXoqWE8nb2dd3/ODS7vfEvVs2
 Ihqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RqjIPZcH2Md+douc0/MSQ5MvDH0kopC9S0ibMoplXGI=;
 b=6uwCnbyuw47y7H3A9F/BXsx9sznJjLZtnb/uOIw9qIg9M1LQ7E6okXak2D6L6VnAqy
 +0P6wmWWYBsQ6+rmxKGMAQvnNZkqykvPghGNMRzHJr04bnXbLsY2Gqai/jtmgmmw6RnD
 zkG43vbehkywcHIYW8FqHL6BtB5X2+6QY0GsxLA+9zrqTey9fVw56X97H0kPqQN7EQBG
 5GHRO6FjHkAfZd7MOIosAw8cxVEqgwZicJM2w/WxCjoqaoJtVaqsP2BZ9krTMMyt/fhA
 ERcpoYQkBC1lr4CdDu/9Mkrzced4jQHIHwRv4ABt9Q/SPVw8+BG2fKwTmRP/btgxsElx
 oXdw==
X-Gm-Message-State: ACrzQf2is8GiLawrNNTaTxaCsNXSxx0wCnFY3AQkA0Iqk9He6yxzoFzh
 yrgX5YuPpuzaCftK25Qno1I=
X-Google-Smtp-Source: AMsMyM7Nngoz4SFwpIRbakMLpNRXDyvmbz6KedkmwxGUqiEh5XEN7vU4NK2n/d7kAnZxmBst19AAsQ==
X-Received: by 2002:a17:906:dac9:b0:780:ab6f:591f with SMTP id
 xi9-20020a170906dac900b00780ab6f591fmr10936492ejb.77.1663589180445; 
 Mon, 19 Sep 2022 05:06:20 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170906069000b007414152ec4asm15459435ejb.163.2022.09.19.05.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 05:06:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ville.syrjala@linux.intel.com, Arvind.Yadav@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix dma_fence_default_wait() signaling check
Date: Mon, 19 Sep 2022 14:06:18 +0200
Message-Id: <20220919120618.113332-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That check must now come after grabing the spinlock, not before.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: b96fb1e724ae ("dma-buf: dma_fence_wait must enable signaling")
---
 drivers/dma-buf/dma-fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index a5fbf1c1e0ea..406b4e26f538 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -763,11 +763,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	unsigned long flags;
 	signed long ret = timeout ? timeout : 1;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return ret;
-
 	spin_lock_irqsave(fence->lock, flags);
 
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		goto out;
+
 	if (intr && signal_pending(current)) {
 		ret = -ERESTARTSYS;
 		goto out;
-- 
2.25.1

