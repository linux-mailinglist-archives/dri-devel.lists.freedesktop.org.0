Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EF67470E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 00:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E7310E0A4;
	Thu, 19 Jan 2023 23:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FFD10E0A4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 23:17:31 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id c6so3800010pls.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LoPT1qZTZAiwXdlOT9grX8TQ8vUdaTmpWhI7QC60cXs=;
 b=awbv6pu4ENIEU6blOT7ognTpQESQ7PK3rksK/Li2rhuFEXMIgQPIVEQJgFOhFvQZMM
 z1qM4WyqdoS2qycGh4iuFu9CzCkCDEfCbVYcbnocOQ7X1mUJgZVJhmNsgz3AlsXZgPUB
 RX97qZm5KkyND7oXpFMe0e2zN0iJX9R+1xiaDmDggFxLobRLz1OMtHlXQkYCe1wVVC5R
 KpQzyTJyUjkfG++QAB7DBxJVT/mrBUa9OaNpwR4qPXrRx41TB4YSI7k8VM5lQxsLN+O5
 M99Y6PF0ogupxXhew39KKeCyvLrEVzlAYA2tabdXeE7cqz/2SrRlENPKajqHTlez5Hwt
 udUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoPT1qZTZAiwXdlOT9grX8TQ8vUdaTmpWhI7QC60cXs=;
 b=XY9zvtqLD05szIEmOPv+CjQwKTD73Mq/2k0E/EvJnzYAcS/0sGqKGR4FC5xrdQFXTq
 V/M4k5CZFcAQCCTNC34xUA3dJ88a7TS/8O5XwBQUEH1MwM/H2VLjdt1Ghih1g3lxTO8R
 oH4nW4hpCFJRrO2jZ0i/a8RGrY4GyeLkQ1Z38u8gfkahY7gHA2sND3UX1p/DcfQHiV2z
 1TRGG7BTw7fbqi9p4ezSLA4F6gcrQbidrHnQpmMeYaCuj+8HFYVqDPDdB7htZmqacH3N
 IuIA+NRmEoWxkYKpTPttdrSV5tsRCIap6LVFjKI41f0IIlobot9ae4BGE7iu9qH7IlIZ
 jpyg==
X-Gm-Message-State: AFqh2kqzD4s3Tin4BBaYp+33XOBLtuFwaDIUgSeo82Y8Dh0clEVXSVQ/
 TGm7HjFpppCd7nrCDbBr58oZ9rFzqao=
X-Google-Smtp-Source: AMrXdXsVdDw+YB0Zgvq034UW+xelPx2PPY4N5TAKF0D/Jclal3YFKMREgNQamm7c8VfVvfM/mVcIug==
X-Received: by 2002:a17:903:200b:b0:194:ab2a:b74a with SMTP id
 s11-20020a170903200b00b00194ab2ab74amr11069280pla.38.1674170250390; 
 Thu, 19 Jan 2023 15:17:30 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a170903120f00b00188fce6e8absm22498801plh.280.2023.01.19.15.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 15:17:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: Drop unbalanced obj unref
Date: Thu, 19 Jan 2023 15:17:34 -0800
Message-Id: <20230119231734.2884543-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, Sandy Huang <hjc@rock-chips.com>,
 Daniel Kurtz <djkurtz@chromium.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the error path, rockchip_drm_gem_object_mmap() is dropping an obj
reference that it doesn't own.

Fixes: 41315b793e13 ("drm/rockchip: use drm_gem_mmap helpers")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 6edb7c52cb3d..19b46c00dcbf 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -262,9 +262,6 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
 	else
 		ret = rockchip_drm_gem_object_mmap_dma(obj, vma);
 
-	if (ret)
-		drm_gem_vm_close(vma);
-
 	return ret;
 }
 
-- 
2.38.1

