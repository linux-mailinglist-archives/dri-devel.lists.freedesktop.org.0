Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD27FA016
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 13:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154710E25E;
	Mon, 27 Nov 2023 12:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE4D10E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 12:56:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso28989575e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 04:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701089796; x=1701694596; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIYOB2eU2H+bluz3T89WDZtEixLUpIjEWJSjNBKPfQM=;
 b=G6QxIhaJV9BVgb+e4xa7j14bogl1llp0lw72u8Fqiet/Llxwy/CW8pg3Lp3P8q3Dts
 lFgvP7BNNkfEqhu0qhHeBi3BGDk+bXLIhLt/bfSUN/WS8PWwbC2quWqfhoYDpZn59UIn
 6gjjBQOxYi+FGPCcnGyTStrrniE8kNCF2WHo8wIMIi1WnUA5LL285GoGBKRKDfmWrHGA
 kMUmW1y7K7ZbQ8D9OwaiQo0zs8zDoqth7YxLs00YiEaUSH2M748sTrPpbZyAR0SHTF/t
 2PdINBJlB56MX9ZF+CsqGeFCqZQ7jPQmJmhfrC5wihUJzFULCZ0fgsJdA1iApsTz8vla
 mgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701089796; x=1701694596;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIYOB2eU2H+bluz3T89WDZtEixLUpIjEWJSjNBKPfQM=;
 b=QH3KcAy5YzegsgJHIuNP7s/D9SYX0WmjWC1wbnT4YxDnp6HC3EfgpxDXvl2y1ZDxxJ
 8t9zvYvGdC+a+Vi+jsAlqUEk5KayQa2YV8KJXIdqpL+t8PEDtStDN6T+hVBxt4XorC+H
 qtvZ7jL498uGWnvscDN+7JIcdnO9KidwDu/MnnzhXfwo7IQfRuqv4enitBm9S0MsYBMB
 US9FXEgoOdWtfh71kOyVNLUoUBT+NMG4Ut+MadO2DM3/KGc6Qn+OjXzKfHF5KDgrJQwG
 2Xs7jDZOibrr43MH+QrNnUYY2xtomnQMMDENSSQWo4bil7xVPrvI/0OfpJ44+TCfS/6f
 L7Dg==
X-Gm-Message-State: AOJu0YxQDtyZdiolYc/A3984h0iEvC2mL6A5Zfm+p3OhcWXhZPUK+Ng4
 2x8ren/fRkYsjYSGvRySsd1E2A==
X-Google-Smtp-Source: AGHT+IFPPTGfLzqzJNgYs1IpQL1hsJuI8oapdRcXNEpwBLbJewMCagBAP3dI7Z2zilUHv4TqflpLPA==
X-Received: by 2002:a05:600c:45cf:b0:3f6:58ad:ed85 with SMTP id
 s15-20020a05600c45cf00b003f658aded85mr8311151wmo.10.1701089796257; 
 Mon, 27 Nov 2023 04:56:36 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z15-20020a05600c220f00b003fe1fe56202sm13576241wml.33.2023.11.27.04.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 04:56:36 -0800 (PST)
Date: Mon, 27 Nov 2023 15:56:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] nouveau/gsp/r535: remove a stray unlock in r535_gsp_rpc_send()
Message-ID: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This unlock doesn't belong here and it leads to a double unlock in
the caller, r535_gsp_rpc_push().

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index dc44f5c7833f..818e5c73b7a6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -365,10 +365,8 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	}
 
 	ret = r535_gsp_cmdq_push(gsp, rpc);
-	if (ret) {
-		mutex_unlock(&gsp->cmdq.mutex);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	if (wait) {
 		msg = r535_gsp_msg_recv(gsp, fn, repc);
-- 
2.42.0

