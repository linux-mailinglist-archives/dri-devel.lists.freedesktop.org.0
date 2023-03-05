Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA26AB226
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 21:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1DB10E049;
	Sun,  5 Mar 2023 20:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A8910E049
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 20:51:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 16AA585A1F;
 Sun,  5 Mar 2023 21:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1678049479;
 bh=1IIZ5cXT9MjyR4m8kfZh5MLkgJE2lkLpDwB+TkI3y0Y=;
 h=From:To:Cc:Subject:Date:From;
 b=YkLzueQasv7qLjavzVqEITMfHl1saqCyf3udKNeSCggAACg+jtf0czHeCUV+zg8Fm
 JjRVE1dAdGR2ZOIjOjyHOb5dYMw/UC4PejWZdMnc/DCuOSG0xc7EV0Z3VEyVANr6Rr
 Q/rdykJl6so42S7bZsB9pQa3TivCtHlGPhMM/hCLYCdkyDmAoFuAkWrP57FCke3mEt
 e6mcwOCTs8kq6YCsdEmn3+mkQdPsxoSVScPsz8hNHaT6IZSdJ8HditB/r2NzOvOqwg
 5VytB3U2pLL7Sd5LD2SGnuu8TG1jApGERkRFf+ic7RHJWvQJlZPVAh51Dk+dpdEyUl
 zssuffYUD9pqA==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Subject: [PATCH] media: stm32-dcmi: Enable incoherent buffer allocation
Date: Sun,  5 Mar 2023 21:51:07 +0100
Message-Id: <20230305205107.772931-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set allow_cache_hints to 1 for the vb2_queue capture queue in the
STM32MP15xx DCMI V4L2 driver. This allows us to allocate buffers
with the V4L2_MEMORY_FLAG_NON_COHERENT set. On STM32MP15xx SoCs,
this enables caching for this memory, which improves performance
when being read from CPU.

This change should be safe from race conditions since videobuf2
already invalidates or flushes the appropriate cache lines in
its prepare() and finish() methods.

Tested on a STM32MP157F SoC. Resulted in 4x buffer access speedup.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index ad8e9742e1ae7..2ac508da5ba36 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2084,6 +2084,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_buffers_needed = 2;
+	q->allow_cache_hints = 1;
 	q->dev = &pdev->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2

