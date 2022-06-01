Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DB53A539
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 14:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CCF10E18E;
	Wed,  1 Jun 2022 12:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C55310E147
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 12:40:36 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id e66so1784170pgc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ZLseM0j1fIYmiOxZxbQaK6URNKftcTa3kMSVl2a+08=;
 b=HkCOxiwD+gJhf/bA0w4IRDoAeEudGlKGDNflidFMyLb70xIffJkQ4YdCkpimkLe+m5
 ySGwHVqVjs/T1zoFZSmri0o9u2GfZQxEovs2axeW778HNe6NYUxUeZqjBqFHTATbJcEM
 jboGEljpibBsvjYgprNWVbKq9oLO1lNQOyTfKmuSxdnjaL1UFcD8tvfWl3sNK9gEzjCa
 B8MxrbmmCh9RsRbs2rCxHlKDH+sTHEYywyw7K+MPjmrIvMyq/OPV1U3ykoWuHJkn/dJd
 NS1AcISsPA8DNo5X9orN9YO2nez3qF6vUXUEJjxnpVSONIG90jwqP+lRcFvza83slJIh
 +swA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ZLseM0j1fIYmiOxZxbQaK6URNKftcTa3kMSVl2a+08=;
 b=r9KsDv5ujhqHIRlNPONGOGsghzNWJnrUmcCGer4ZmteO8rhHZ8TsvtYAZ+jhS6InJg
 eS00GIuIHp1LyqIFVCbDRFLUFtjMK0zJc7XqXdfrkqSfSWwlHh4UtvyXxtPfzccpak1W
 lNfFzXaTVZUi6oGg56JA9s6RgzezPXO52x83Qklq2z9NCk/aI/Ko+CnDa9qLk+f82oIi
 6aLVf2mQ23HABps/ei6YgnemdPuPfec9BMnwCqgUrIWQw8k3TIjZV2R+Lu4Jt5om1Fe/
 H+zQ3PKyPHoio4iFq2x7BK2ZsuTWhHVNmj3H98Y4RSExNtvuPGlBddQvxgURubggQe69
 ov/w==
X-Gm-Message-State: AOAM5325huPOmEdF0quWCyTQVBjQQAGpJDGhrtfbirDqM/xMuXfxrGUp
 f6VdqkvMhqdNGlmE64mS1Ew=
X-Google-Smtp-Source: ABdhPJwTibucRxg8FEek4gEW3OiZSKSClrefo8JkcxM3tZB7HJ/KB4r230ulhju0vXmbkj5YKS8WGA==
X-Received: by 2002:a65:508c:0:b0:3fb:882c:85ef with SMTP id
 r12-20020a65508c000000b003fb882c85efmr24066613pgp.39.1654087235696; 
 Wed, 01 Jun 2022 05:40:35 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 s6-20020a170902ea0600b0016232dbd01fsm1423539plg.292.2022.06.01.05.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 05:40:35 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <treding@nvidia.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/mipi-dsi: Fix error handling in
 mipi_dsi_device_register_full
Date: Wed,  1 Jun 2022 16:40:24 +0400
Message-Id: <20220601124024.10137-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
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
index c40bde96cfdf..8cc8deca006f 100644
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
2.25.1

