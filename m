Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A188347FD47
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 14:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C3710E28E;
	Mon, 27 Dec 2021 13:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD5D10E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 13:15:46 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so14324436pjw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 05:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=u+uGmmp1/FPnqLm3iQ1rOAyet9yHGJXkvFtvlVuUEdw=;
 b=J//+r+J/HmtE5ynr8CcgDqXkNxeu3CswRW8IBaWnRsGuwUL3iE1nE9jNwqT2u7svMG
 MYWb0CWtTYaSo1j5ti1u25cx+5FGqy3HAknOmhI8E0T2cJRCI0Dor7kfiip5/CbWGcNL
 P9r40IISRhmUBfxQD9+axdvsoQNmFxsPL5nDkflqLSCavfB4BvXmeVuW35hgetjpTaxq
 pYcrfZMNAuO1jKUM9L36xIDpoX8N4R2ge3rc03CHgu7seZ8Dbgmwoq9ibKkj12+kFi8Y
 7pNHRZILqFMxaCL+IJ59JVjke8LmAZwHpxAci+qrgJfe1tBQQvitu1gptqNk2orVHmdD
 ckuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=u+uGmmp1/FPnqLm3iQ1rOAyet9yHGJXkvFtvlVuUEdw=;
 b=snFqEneR2Keb9ptc27Og0b8jhOKbHmsqOJwHHBi5R2BX4/PeDT7S+tS/KnfDp3luLc
 O26vNGF/3EhRQfOUSjbOEkibPbD53i4C9TQOjsbcSgoW24Lkz7OMFTqmqXycnFJE4cr9
 GoXPTERCzfYkOxwZio4hN3QdD0N187m9xo8/pHrrknYEozAcrIAt6aDT3dfL1iRqphLD
 XW9tpCGd42UetqKjRfJV8+LOtaFmq8IE5rp/wYUgbSjPNq2WvvAbP/lmUaXRJGuD51Hr
 I56D4+D6wJis5PLtq3P3vPYy+uOedHbnk1goDtbJx26aDM2NQ9S8IzLxU11iP4iWh7bT
 NWBQ==
X-Gm-Message-State: AOAM533yJzt+i9mBDSm7PCoFd3iToaX+17Rm1Yv4aZ97clIOdTa41pZr
 HBxJi9S0WyzlE0MTxmveoaY=
X-Google-Smtp-Source: ABdhPJxEoh1kTKRJ6SNXhMXFgTGSrJ/Q41Rg5/Dku4WEHTm1nP9Z9FH4Qp5POr78B1XdWo2mGoS2AA==
X-Received: by 2002:a17:90b:1c86:: with SMTP id
 oo6mr20662990pjb.165.1640610946425; 
 Mon, 27 Dec 2021 05:15:46 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id q9sm18006033pfj.114.2021.12.27.05.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 05:15:46 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/mipi-dsi: Fix error handling in
 mipi_dsi_device_register_full
Date: Mon, 27 Dec 2021 13:15:40 +0000
Message-Id: <20211227131541.9742-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In mipi_dsi_device_alloc(), it calls device_initialize(&dsi->dev);
We need to use put_device() instead freeing directly.

Fixes: 068a002 ("drm: Add MIPI DSI bus support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 18cef04df2f2..609bd9fc1bc5 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -228,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 	ret = mipi_dsi_device_add(dsi);
 	if (ret) {
 		drm_err(host, "failed to add DSI device %d\n", ret);
-		kfree(dsi);
+		put_device(&dsi->dev);
 		return ERR_PTR(ret);
 	}
 
-- 
2.17.1

