Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015E4915DE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730FF1128DE;
	Tue, 18 Jan 2022 02:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0B1128E4;
 Tue, 18 Jan 2022 02:32:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33E60B811FF;
 Tue, 18 Jan 2022 02:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFB2C36AF3;
 Tue, 18 Jan 2022 02:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473126;
 bh=FpFOz55NDArr1D4SGMUr6c5B/Pd266OUahPpfqk8l5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JLExkustGTrB2paIJ8K2dJOgN0/pJ3SUoUs0RCAStRQpP3k7WZXDXbKQYKO6S17K5
 dtQjQQQnZYYLCIKFwSnDUn7SYstR2C2gsSD2VIyWkGmWRzYCCMbhERx9sTApnwbzZt
 jjRKs24LOrmzEEdM/KI7f/sFABMHSfZzzowWP5pet7hqRWcRXGdpgzL2hOV5eyv8ZX
 eV6KwJ3uHkIr7G2yw0CQh7AUz+yR+PWF7DVGgHKqcvKaV9r8xVGkZwZzZPkr93inzB
 e+UXC8hiK3dJ/SL+B1y93RIpHv9RJMgAeIbxx++e9Mm5g6GRd8c1jYCw8qZHxGelQ/
 O/3wj9gD+TmCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 007/188] drm/lima: fix warning when
 CONFIG_DEBUG_SG=y & CONFIG_DMA_API_DEBUG=y
Date: Mon, 17 Jan 2022 21:28:51 -0500
Message-Id: <20220118023152.1948105-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, lima@lists.freedesktop.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qiang Yu <yuq825@gmail.com>

[ Upstream commit 89636a06fa2ee7826a19c39c19a9bc99ab9340a9 ]

Otherwise get following warning:

DMA-API: lima 1c40000.gpu: mapping sg segment longer than device claims to support [len=4149248] [max=65536]

See: https://gitlab.freedesktop.org/mesa/mesa/-/issues/5496

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211031041604.187216-1-yuq825@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/lima/lima_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 65fdca366e41f..36c9905894278 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -357,6 +357,7 @@ int lima_device_init(struct lima_device *ldev)
 	int err, i;
 
 	dma_set_coherent_mask(ldev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(ldev->dev, UINT_MAX);
 
 	err = lima_clk_init(ldev);
 	if (err)
-- 
2.34.1

