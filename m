Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13AF89B83D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC22B10F974;
	Mon,  8 Apr 2024 07:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zsuFkQ8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B093411219F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:20:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56e2b3e114fso3416274a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712560821; x=1713165621;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=McEKzkmjcf11I9OhkP/1LlQGEjlZMSP7VYzBPCvWmZI=;
 b=zsuFkQ8jev9NHlUy6U9o1t8S3f3JYg5k0L82ms6Gj8usO6ZJ96utvBra2LzjUJHhF3
 yjjjw2AVwVK7EljDnOMX9DzlkfU+2ESlI9lpoRDRPTJkEsZ+tL6tndLxwy1HrMvW8DRR
 3bEeWsNyBmKhL1H4q/VyPvC8WwxC1Zlv9ciKzhS/GIIj86zd/AagBbmtWBRyu+Wjmjsn
 xLTrRm0pa04pn4wVFUJcyMplIVk4I40PakZ30ChYUYke+T+4K1TrXuOfRWP5WBeFfipG
 MTanCzKsidNUEVuxqNzclhZTkBFpQO/6+qnMXAxxfG8yWVDpnF3S0WKQHsWgho6H2IKO
 NzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712560821; x=1713165621;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=McEKzkmjcf11I9OhkP/1LlQGEjlZMSP7VYzBPCvWmZI=;
 b=Kha+1i5WKwqHAOX3Lap6F8LZxJHUBjtyB/mE5s6WsqGDge9BZ/SH6pnmP6yceH4TRP
 ntV+DiTvrciOaXPSEu3wqLmueNM+ldWZnIdsJoM5GE2sYXZf48DAuTq6C7SnzUldMOYQ
 SA9rUIhA2PsgPfALlM58FHP4PKtlglnjkPZnJ9itSNbp8EVd27KzvwVGw/+szLWeMOAY
 Wl67qVxclwyrLuS0JvgzlSdxahF98NoMSVttmpQhEG15uflWS0LSUkJDUOmcI/MJLOX0
 T0jBV2y5uWsqg3AUpbwe2QT9kW8HQMlgO+BukIotE279cKvWFFwhwDja7J37Buy748m+
 1KJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt+9sXuOJ3CBQedWpz1CJ1snAzsCewKcCGxto6HVXPz/UJyHd+qSuj2V+NhFXopAOi/xJph8IWVvizWmsjT49+7umwS/fxLiupuog1Rqsf
X-Gm-Message-State: AOJu0YxQtGigFkl8rfFT/b6VpmLSLwy6FXHBADqfMLRWEzYixFFMYlPE
 CWhAFv+4UZMbVcQrmoe3ARJKQhQyHxIjZJqn6yDNXvb4sUKGNLbLBHLoipqkHFs=
X-Google-Smtp-Source: AGHT+IH5LcNBBvazaEKssJnMeMAyotZ96eCbr8ZzTbSTlyDpQMPwItgx0NclxJA6qJmSyFP0VT+hUQ==
X-Received: by 2002:a50:8e03:0:b0:56e:2356:bce4 with SMTP id
 3-20020a508e03000000b0056e2356bce4mr5481687edw.31.1712560820897; 
 Mon, 08 Apr 2024 00:20:20 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05640243cf00b0056c2d0052c0sm3738769edc.60.2024.04.08.00.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 00:20:20 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 09:20:06 +0200
Subject: [PATCH net-next v7 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v7-2-c3857c82dadb@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>, 
 Naveen Mamindlapalli <naveenm@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712560813; l=3534;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=JqK9X2irpyaetN9XKh1gA7fVuUNk/TXTEORE3XbD6OA=;
 b=V6wsmdiuVtXEhylg4ufuTkzOxoYGkay/Fm0NiYit67m2pLPiRNcrwMO8HUvw8xY2yucDdelut
 n9Cq5N0BRJSC2ZAZYtbeO6SD/aOeGAtGY+3o0zKSVsXBxWtXkHv9QnF
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
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

This patch introduces a member and the related accessors which can be
used to store descriptor specific additional information. This member
can store, for instance, an ID to differentiate a skb TX buffer type
from a xdpf TX buffer type.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 25 +++++++++++++++++++++++++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 414bcac9dcc6..3c4e576a44db 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
 	size_t			mem_size;
 	size_t			num_desc;
 	struct gen_pool		*gen_pool;
+	void			**desc_infos;
 };
 
 void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
@@ -37,6 +38,8 @@ void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
 		dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 				  pool->dma_addr);
 
+	kfree(pool->desc_infos);
+
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_destroy);
@@ -72,6 +75,14 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 		goto gen_pool_create_fail;
 	}
 
+	pool->desc_infos = kcalloc(pool->num_desc, sizeof(*pool->desc_infos), GFP_KERNEL);
+	if (!pool->desc_infos) {
+		ret = -ENOMEM;
+		dev_err(pool->dev, "pool descriptor infos alloc failed %d\n", ret);
+		kfree_const(pool_name);
+		goto gen_pool_desc_infos_alloc_fail;
+	}
+
 	pool->gen_pool->name = pool_name;
 
 	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
@@ -94,6 +105,8 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 			  pool->dma_addr);
 dma_alloc_fail:
+	kfree(pool->desc_infos);
+gen_pool_desc_infos_alloc_fail:
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 gen_pool_create_fail:
 	devm_kfree(pool->dev, pool);
@@ -144,5 +157,17 @@ void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
 
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info)
+{
+	pool->desc_infos[desc_idx] = info;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
+
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool, int desc_idx)
+{
+	return pool->desc_infos[desc_idx];
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index 3c6aed0bed71..63b96fd53b13 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -28,5 +28,7 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
 size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
 void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info);
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool, int desc_idx);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3

