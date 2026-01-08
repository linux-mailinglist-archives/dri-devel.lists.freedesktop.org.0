Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED64D06408
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 22:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76BE10E7CD;
	Thu,  8 Jan 2026 21:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DBP7ccRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3C410E7CD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
 b=DBP7ccRO5XKN/tWp43v8x/8tzODTumWHcNOItnpbD7BDDRyI559hppbi2yk2gG7RlR0tyr
 F6OW7HBGYs79+aqPtLHWhSLRGhIqY8CNsCFyz0/CZ9XqCE47BWvJQte2YuBTA0CBiv2gpq
 09QDqdsEvEBcQ5H+cqFiQCP19Ko5PRA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-PuAc2oOPMou9ekcl1J1wtw-1; Thu, 08 Jan 2026 16:19:17 -0500
X-MC-Unique: PuAc2oOPMou9ekcl1J1wtw-1
X-Mimecast-MFC-AGG-ID: PuAc2oOPMou9ekcl1J1wtw_1767907157
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-94120e0acbdso3871896241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 13:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907157; x=1768511957;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
 b=dW1xEWL5IBfPgtQVZZS2lpxAjgcSMACGydMZlccES2tEcb7K04lPGSfCmO+8nIBMTl
 9IAd5cDBQWu/GN/XM0qqn/FevyWpg7AlRHkeQSWRx4QRle8fxyJsitPoG7zikXUH6/xq
 82eDfdCFjQDSvaniGsAlnxhdIpRPJN3ymR0zwG9DK1wDCepi+C4AJv1x2mk1MprbVri2
 MVp77i5cwOkwrU0j9MGPjFEOSEse4lmzBOoM+F/00g3xFPhT9hoGmdXAJiP+z27Q52I/
 ALDJNKaMDIXURPI7bbVHZ2W8H/jb2uDbFjO1HjN2pgfUVtkQVgSF+gcmmfxYnfysq9Rg
 SLlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8eAT5ABT7NEZWzQ7Fp1M20nvVovD0TNQjHcKHBqUhrtneLi+fdseypANCARnfIOLaKNQ3jX94IcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY5LcOnVmJjDWk4y1edqd4zsI7fVJYu1f9Wff1S2dKZfgQx8VE
 c6YRiATxWYcVkzMdCAYLIdU+BD2n9fHb0pVtKMjmCyfd5YgzUvzRnVs75uSYZR12OsKHuvadYE5
 01Ztfr/ljVJq9NQ7DahoHiUHI42pGrm3FqBPbXRE5u06Q/fCQ0J3ZtzzkUdIfc5JpU2DDoQ==
X-Gm-Gg: AY/fxX6iHq1iMxsXjuDD7ehJWsk7Y3Vm1RhF+fxlnW/QH6DuEvsH+ZzZCd/nATfiVXZ
 E58NaYuYtCRglcmF33RJMHo1RGMZs0w9TBLEzEDYuipglyYUEHl2rOnx4rJ33d6JMxhd5cSCMsv
 LQ1GHiwXqvNYEI+aHwUnJ9PEpgKi3rGoYsAJ4gxreME9ctAjaKRQtenim6cXr7X0EDq2khxe3wu
 C7AMqCEcI05W1ieqW9qdBhGOPs5Ly7p9cCqzOETiXLG1zldZpKyXR/i8C2MyIe8F06+otKPOy6F
 z2SREgjfKYoevjFqXmYQ1hh+QyMWq3DI6xua1AS8e5fAgKMpmztNgvD9DTtTgFdDVe+4IN42bVd
 uv8axxmVovDp+y/8=
X-Received: by 2002:a05:6102:3a0f:b0:5dd:83de:badc with SMTP id
 ada2fe7eead31-5ecb690ac30mr2675975137.38.1767907157173; 
 Thu, 08 Jan 2026 13:19:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0uRMIjA7XLKaSnU3wOhkRdxgxZI3Tqx0E2gNf3CGsOIh420QNoFs2vKVMT8dIcPxOmBSZqA==
X-Received: by 2002:a05:6102:3a0f:b0:5dd:83de:badc with SMTP id
 ada2fe7eead31-5ecb690ac30mr2675959137.38.1767907156687; 
 Thu, 08 Jan 2026 13:19:16 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:19:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:42 -0500
Subject: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sZzvWmWZLBAg2O8T5kHMnq76Z89GPT7Dybdt2RJStY0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb1v5vpP9/g2Zw1x0vb3l5Xs8vY4qIY9ZTV6M3/p
 vSpfvMlO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIVyGG/znrI46vWXPXmZ1n
 evhLw6XT1O2//926j2222YecHWXuxbMZ/mm/r2e/wuzs0x9mvcteoup47ENm0fYpEwKEL07zVn7
 mzAEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BQga_Sq5seeiyzQNG5Ey2NRx5VxBP95x_llz8XmWzjU_1767907157
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index fdefcbd9c2848a1c76414a41b811b29e5fed9ddc..a156c7e7cea83286e7ad47aa9818761670c68e89 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -628,12 +628,7 @@ static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
 
 	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL,
-				       postdiv->width,
-				       postdiv->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, NULL, postdiv->width, postdiv->flags);
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

