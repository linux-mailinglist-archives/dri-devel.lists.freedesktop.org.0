Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18EAA6EA3
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1610E8EC;
	Fri,  2 May 2025 10:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kavnNqGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7836410E8E5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:01:13 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ace333d5f7bso325624066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180072; x=1746784872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
 b=kavnNqGJekM9ecfAfdben/1sDKLp3srY1LDJU5qUEYtBh35FsX//+1GE+X0EcSk61Q
 SyCrZxcvfNZhJ4grkXB37gZgnI1VuKHv66FOeyoua5hzsnR4+Tdt8/S1MtWZibTLhzRf
 XfNu5hwQdpqFIZcIBtv20x+VRZhwOZ7Tn+GlnCK9EF8OaEJd/O36jEeevu/sFt4v8vL4
 LDpzZJI0tr0U09fCcy6myfSSRkYTMLLIpM7KI+4rQ/WvWeySiN/2jOiDL0TkGqymVc1a
 3tDrzvZr8sq82TNMGZtQlBe1314VbJTifYSM0e2cGOCtBBSdsQkj6y22XUmf5JnFOfJo
 zAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180072; x=1746784872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
 b=LeMVfZnEAso23xLqZ09zBST3mb7t66Lga6+M6ZOhktEU0FUKWRuaPm2W+dGlkRfG5u
 jC0n1ax155JF+1F/2mU9aCl4rG9PiWSZcArtxU/A+G1lElPi/zDcIQK+jZ0GBdMJ0dx9
 B9feCHmC/QqU0P5MA22cn0hzzZvPqNDLAp9bBdMzL3BrXCqxfuBfkx+95Su5zmM0q2cq
 n7F+hhI9DBW0Wfre7iGpv8JMBtr4hApm8/GifKyekRU+9q+PuAY3h2li7oOr7Qc1dFa4
 nuQAfHCrWFxeqw3g9iOrDKB6IoXIKq2ZGlr/dYM9eHZd9U24gd6c3vSE76iW2RynAK4A
 EmYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwVWtLbB+LTqosOUDkWJ9HTU5PitET6Wk4Xq0F4ctGCthgkgXshg5N/Qs63OSe9yuEgeEg8QgoFPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySVz/4lVEuEcIY72F0xwFc3+WoDZfnOxoNhc+7xjReReadtkjz
 VpWPLCJ3w9kthfsiOHbQNo0tWMKPA1nqaHoBWEqy/Wi1qF1/eRE9gYgaNGm03jk=
X-Gm-Gg: ASbGncs9t+bpHYkogKdkd8MPD/ZvxUiJP9NWAxoz9e92RzZi5dHhpXWzkpHH6LglVp6
 zrLBowtLpjukVO4CozzwQVapMPy5Bs32ceEHimdr0rk8mJthHGVvL054WgeKkiDuO/8cQ8lD7kJ
 aM76zw9mt9LaOob+jno7k3b88xZ6nO5qCHDj1l+cN0Y23S893GOXsCnzJIPU6CDLApZyQFHHuGt
 KfznNveYZM7nFZfuDx1RlY/Vyc4X/H2nKk9gnA2QCSUwCuXUv+N05LeJpCE50GHY2Hc4nIHv0GB
 DQ9OUz7s5x1jul37GBspWqp19B9NrJfDQp595ROvB/9EyCTQ8aUSg9SoK0pJWtiNCcPF0vpxi4r
 KP/BGcTb4Xzts3pXDdoWDvTZPG1LH
X-Google-Smtp-Source: AGHT+IEw/QFZ4Q15wjtCZMc2Ys2EDGftsTen4aFJcOHmrUkANvg/HjzdHRZE7b55C3GGic4/3YhYzw==
X-Received: by 2002:a17:907:74a:b0:acf:15d:2387 with SMTP id
 a640c23a62f3a-ad17ada7132mr232347066b.19.1746180071962; 
 Fri, 02 May 2025 03:01:11 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:01:11 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
Subject: [PATCH v8 10/14] dma-contiguous: export dma_contiguous_default_area
Date: Fri,  2 May 2025 11:59:24 +0200
Message-ID: <20250502100049.1746335-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
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

Export the global variable dma_contiguous_default_area so
dev_get_cma_area() can be called a module.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 kernel/dma/contiguous.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18..eb361794a9c5 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -53,6 +53,7 @@
 #endif
 
 struct cma *dma_contiguous_default_area;
+EXPORT_SYMBOL(dma_contiguous_default_area);
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
-- 
2.43.0

