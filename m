Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFA50349E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 09:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862CD10EA4E;
	Sat, 16 Apr 2022 07:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8489510EA4E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 07:16:48 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so9899957pjk.4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=ozXCCzZFy+HRu2SLOUddJjWyrd/kjN8vo4xUFqlmf7A=;
 b=VqgpSn2s4VRF2ypGXaHEgF56qrSwD9NV2NEUMXLEo/5nQ5d/oCQwSV58EQiwUt0X65
 JjSzVFP5j9Px9iJ3Nc4IzwWY9U1327qNfVNTpmAKXdD1NTlhB9WRaSQ3SvG4idkRMQSC
 DGyp00+XQY4uZyPTUO6/WWOnQBQ91DL3lHhYtU8+MRvCT3x7gTHQWpyKsJhwqTmxA0Yt
 Xq8nSMagqdGzljFTwy0fd2Tev/z/asivbOTV8/2l8lKCg0svUSirnQa5YeZj69GtQNru
 vWmROyw/0rfJlcuQHSuR4OluNEikQDNE83nSWxr103n4JY4txmedzpDNFvc3lbIia0tj
 toZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ozXCCzZFy+HRu2SLOUddJjWyrd/kjN8vo4xUFqlmf7A=;
 b=HO7dE4H6IpwRGFzDyE1nHhIvv8L5vcoSWBC4l1KOGlfquQGR6mL/FnaG1LiU0JjidM
 i1FXarKaWXD1Rbwr+Ou63lVuYVSiEI1rDOoIhyaFOMGA/au38nSmiQn8UOwKtFIwyYrJ
 GNCsFSnSXQF/iiUqh4UBGWHk75I3SmsEr+pDolcs1slAXDdXah54ZoWYu+3+6BXviIUg
 Iow/gNdgxXXjxpWShz2DMZM3b0Iow9I74OU7mssFAGJ9g2oeZ5LgaNcCUz03eQMkl8Dl
 Xq1nN1Q95hGlomDOavy7UKqNaixkbHIr/nCuowFfA9otBK/ctFwe4OLfDMIbfsHRoEEh
 wuhQ==
X-Gm-Message-State: AOAM532K+MbeZ6JgLPuQLhJLYWH+dzMZU0tqT/Xx2qrjGbPPBBOz/QLf
 /4fYz3lJYAJ3VM5SZ5G0Pm4=
X-Google-Smtp-Source: ABdhPJzXxn2kvERPaatVMAFHISSK95wLaaKsK4u0JDL5ofL+u6wyg7EB7REde1pRKhDLoIn/j+39WA==
X-Received: by 2002:a17:902:ecc4:b0:158:29c6:f9b7 with SMTP id
 a4-20020a170902ecc400b0015829c6f9b7mr2478908plh.21.1650093407985; 
 Sat, 16 Apr 2022 00:16:47 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 h72-20020a62834b000000b0050608e9824asm4909264pfe.122.2022.04.16.00.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 00:16:47 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/armada: Fix a potential double free in armada_drm_bind
Date: Sat, 16 Apr 2022 07:16:41 +0000
Message-Id: <20220416071641.30386-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

priv is a managed resource allocated with devm_drm_dev_alloc(), so there
is no need to call kfree() explicitly or there will be a double
free.

Fixes: 90ad200b4cbc ("drm/armada: Use devm_drm_dev_alloc")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/armada/armada_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..142668cd6d7c 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -99,7 +99,6 @@ static int armada_drm_bind(struct device *dev)
 	if (ret) {
 		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
 			__func__, ret);
-		kfree(priv);
 		return ret;
 	}
 
-- 
2.17.1

