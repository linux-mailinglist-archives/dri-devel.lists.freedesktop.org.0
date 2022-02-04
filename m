Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1AC4A9770
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DD910F191;
	Fri,  4 Feb 2022 10:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDC110F181;
 Fri,  4 Feb 2022 10:04:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s13so17837787ejy.3;
 Fri, 04 Feb 2022 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
 b=kEdyeBND1+sjQQEgBxCKwTD2jfD5hj01xe2rH5ufH1ohwmTGz9JuokXVS2loUz67cR
 Sgt0CJ88ZsTTlD499CNTbHz7n2mfp45kjtGliVjkRHcf4JFIPh0flrY1XW+1hCSLTGyN
 a3gssbVWS6MDk7MCK8sC++Gx8N2juQJuJe+RGaYof7Viu0fN41zThohPFYML9aQhT86/
 i6BoDpIpea36irSI9yRq+kekYL+auv2MI+iBlqBxZM5KtTDZM+6y6UoNjvORoLTMuurL
 0McJxS0QOz8cB/lUJdxfkHcsSzp3z8l6D4iOQI8cJVoHqamzqszYvBCOu6CGzatfOQ4O
 uShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
 b=ruhhu4MixAwpabi1EgwBhLDQZ9KHY7w39grW9MPQapluV+al2u9KVu7IZz1T1xogfw
 ym77FFfRDdH8lHoCflOOPNGTvxwxzSkb8zpBEbjlGTHFYWvHPsdz6IeRqifIVnL/9gW4
 m2RqgianFKd23iQdV2bW2HWXrK6JT/1PmCyz5Ba3qy3tvWCP3jcXEqAdcQmGqSNNe0B3
 7GK1QmiCgd/crxzc51UthOMhlznhpJWxJJUihGxVekNL45rFi6/+/D/ogVRZB/a3QgVg
 ZA9ggbo1jqkzeVb/FxAsR8k+h4ubYRMme+ZqqzKN/THNXGayf3O8JxwFbxVBtvQtyoNg
 8jpQ==
X-Gm-Message-State: AOAM533KZxa1aVdZpD3aexNRAvNFQm0+GzSOB7wiqopL+tdkQ2y8X4uC
 AAaZSDbaUbu0p3TFp0KuOFk=
X-Google-Smtp-Source: ABdhPJy/MXdEppNWsn3y2eTv52qm/Awi+bfFn7NIw30r0IajdZozc69ofz3XjihpMxxDUZtMTpsxLA==
X-Received: by 2002:a17:907:d20:: with SMTP id
 gn32mr1914593ejc.55.1643969079533; 
 Fri, 04 Feb 2022 02:04:39 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 02:04:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] dma-buf: Warn about dma_fence_chain container rules v2
Date: Fri,  4 Feb 2022 11:04:26 +0100
Message-Id: <20220204100429.2049-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
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

