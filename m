Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61349805D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA8B10EB58;
	Mon, 24 Jan 2022 13:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CD210E7DE;
 Mon, 24 Jan 2022 13:03:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s18so13466341wrv.7;
 Mon, 24 Jan 2022 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
 b=Za0l1xsonKjouvDIMROzfQL6VhlP8mzkESil1aeWuJGWeszrr05TDVJRnNQPHMjAmL
 ciUKjhRVlVdfIoWOstpjaFKypK3pZm8V3ujTya8XDZfJjQi5YVtpMaPGRFLaPYd6AzFX
 fAtr6XVhop5ak70LhAo3KDlnf7lqgftnijiM4MhYk3o6XKMxyXLbeAIpRygNIyHsfjPC
 ULnsMaFPKcBIJg7wQ05fw7igggYGtQTZS9cUIHtdH9r2hva7pZW+dJpwrEyi/0J0gjlU
 aTxrjnGzBGw8J3B65Hj0RK4nSgn+engUyV+MR5IoBAUUvROjofmJTZzKJ0a3KpOVSV4O
 nwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
 b=NWeETnhQImnHfjWAvsfU/aPfEpS6CotaVpnCadepDsjP+a6pn/DfVPn0RhWa737fa9
 sVpStKp3fac/6VjWooqzd0bsg8at8epSU2aPh+6qc9QQimWAq5kbDlVPVUC+e9t5E9qU
 psFS61sJFks6Zq7AitEav6++vN/AwFbR8WYLcYSahIQzG95xafSrJgP7EF2zEon+d/R8
 HWzdrfEMgUiKt60VIfLcrkwem/SzmPW5Hti1OJ1yQgpiqapdL73aJ3fKlu03EpRX3OS+
 VekXYYPH+3E2bgzIpatnBKF0XvxTgpuowhi/oK7863IUHAwT8Dq3V8N10TysGRQdpZch
 3xPw==
X-Gm-Message-State: AOAM530UQg2OtgJfV1eA7FZsUsVpxk+J+mHxx1GEw5r3xN6arXDOji12
 Tasq6aVBy26kwwux/wA9AJU=
X-Google-Smtp-Source: ABdhPJybmvbb5mAUUvu0Ijhnddxeo7Xw1mcpCy2qmY9reEMoeiW/+OvaQYIKxw/RSfns4ryIV8XoZA==
X-Received: by 2002:adf:f804:: with SMTP id s4mr7647788wrp.425.1643029416642; 
 Mon, 24 Jan 2022 05:03:36 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/11] dma-buf: Warn about dma_fence_chain container rules v2
Date: Mon, 24 Jan 2022 14:03:22 +0100
Message-Id: <20220124130328.2376-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

v2: fix comment style

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..084c6927b735 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -254,5 +254,14 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
+
+	/*
+	 * Chaining dma_fence_chain container together is only allowed through
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

