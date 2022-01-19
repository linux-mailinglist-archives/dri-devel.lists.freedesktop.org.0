Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B3493B4F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 14:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E24110E29A;
	Wed, 19 Jan 2022 13:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47FC10E2D0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 13:43:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id j2so11739842edj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/sKthdsDAA9J7PKlzAOm6qYQuF+X5868CR5aPtjU9kw=;
 b=XtIEVlQhs8lCmBJhE0TkSAEKWXXHiFKAemZcdZlrk99rAYDkimPaqJUEpH/2Bk9MXb
 oQEDnlNveR24SS7bogutR+ZOlMG+a0rg0FDPw1AcBPWDuBDsl5ssKfnPMlolawXpaoZW
 nhLUSPy1lFNN7XQjXGmbTBTiwm+qMvVP0k9QWXqNIMo567U6nlnmZCcuHgDHdLBfOxpA
 hud/t/u2syPq9nl00mw/J7+KBayrcL2WN2upWms1cdrnu2LJNofFPSec7mgVLhHConb/
 GKpTfXfKCWUQu4mQWrEsRvfd6cgEpPhHJ4IopWZP556QMVm/inGedLKBlFEWk2DNPtEg
 AGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/sKthdsDAA9J7PKlzAOm6qYQuF+X5868CR5aPtjU9kw=;
 b=D5gpxaS6KQ5DGAcDJytRjMBjbZpJsmLzm6p1XdoPJ5BQf638pp40HIU0196bcV7DZl
 Hv3Ue9Of/nohA/K/uiEm66SPGm6eTxgjZO8K/49gpZoKzUxDZSTxlC79A4fRKYh99ZXp
 WxmzpEzkFuK3o+jp19STHdEm4A23NU8nADOb1BLa008uUgnGY9NQsF+KNk8h2Smu7TEN
 lNQSGncn543lFbk1T2QUkVo9Sv0a7PgFItRIfXsLYHxnWlFS/zjIaa+VGQDOWw/G5LRx
 YazBLfQe50j6aL4CSwxrdiO7271ONvdFXc3kLo4x+lch1uezmbCEuvoHH+OOuxKxEp7N
 eSTg==
X-Gm-Message-State: AOAM531fNq8NO1s7pEg8TNo9AwbuD5gSOK6qkhwIJapMiEvaHhYVGsTl
 9Y8Pk2duHg/87tCRViAIEUA=
X-Google-Smtp-Source: ABdhPJxLWMBIZT9uDp2E3FK1c4oEa/VtCv9jlY4Il0pA960zoj9MMVqts0dH61KGyu5t40ib1yO/Ew==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr3040459wrm.417.1642599823344; 
 Wed, 19 Jan 2022 05:43:43 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g15sm19733583wrm.2.2022.01.19.05.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 05:43:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 3/4] dma-buf: Warn about dma_fence_chain container rules
Date: Wed, 19 Jan 2022 14:43:38 +0100
Message-Id: <20220119134339.3102-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119134339.3102-1-christian.koenig@amd.com>
References: <20220119134339.3102-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chaining of dma_fence_chain objects is only allowed through the prev
fence and not through the contained fence.

Warn about that when we create a dma_fence_chain.

Signed-off-by: Christian König <christian.koenig@amd.com>
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

