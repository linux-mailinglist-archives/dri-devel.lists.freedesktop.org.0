Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009855EF9F9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26ABD10E607;
	Thu, 29 Sep 2022 16:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC5110E607;
 Thu, 29 Sep 2022 16:14:02 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id s206so1866539pgs.3;
 Thu, 29 Sep 2022 09:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=vOkUW7MJ8/7Rwwrghxwplno9BIDga3iCPCaKB4/B+FU=;
 b=VfUwk4stmlVUWGySZzO/lxmvw7oWW7BwskBGCDqha4lJ1BpYt4mELcvRb6FuSpyrP/
 3sqtAxrMrlCI3tuS5xoNLSTBH57R3WWvIJE7XwLuwHFEU8/FGJQ8HURGTQtcXSwuwcMP
 Pv6vN4qq8J8BDJJeVZZoTf54zmD4vxzk9hXrrTxWPgLo73aZ3R2GPXC91wn483uHicaC
 qZE4+FyoLA/w6fASZIiG9E+uIl8p6EAJ8+8i8KrzP5CmVwXsVOe+A0PvhyjTQ2ztmN/W
 kwnBxxdh0XXjEqi/XR55CY3BSO34eA0FXPfgrg5Ugc4MEkYqvZtYtVnDObBbCfUibToo
 4GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vOkUW7MJ8/7Rwwrghxwplno9BIDga3iCPCaKB4/B+FU=;
 b=4TT02FwQzZEEEB5T8OJMacvRKC9s2xCNUGOC6rnP6PIe1a1YTWXeIQQ1Ek7gHTLQzh
 KCOBqd38hU+6kkjamnAZspNTZKYUgUPO2CnhlzW4d6kgagc9gq1gf2yNbWJ2n2SMcasH
 zbiVZDkEcTmoHFDOAAIJ0Lh8irMG3cZkjHP/97pHVyhDwM8SHBJiKCPSTiC6/dyP6QBz
 1woz/+R009kgdnxrimCbaBFJvNKc06ijm5acGe8SrmD+QRyLQ4Ts5NOiB4+xQCNGbnlx
 eKVmMQQNBuau4W0sY5sxz/lTCUsEEI8QgiL5mOQpDCwO2j9YGxoiwENlXhxTYDk26UKf
 9unA==
X-Gm-Message-State: ACrzQf27sbko8WO4eAmuRUGwrqV0NKyiyExwuTtT4GFBA+MMysOaDIrN
 gkV0qetxLard9StigBxFsFqFMIBU0ls=
X-Google-Smtp-Source: AMsMyM5amldVaXPN9Z05f++c7BLsLXiBctbKghsSeOA9pPHmgribXjiC6YCiy3jT6WLTJpm3YlFvNA==
X-Received: by 2002:a63:8942:0:b0:43b:e87e:3fc0 with SMTP id
 v63-20020a638942000000b0043be87e3fc0mr3577693pgd.531.1664468042016; 
 Thu, 29 Sep 2022 09:14:02 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a6542c6000000b004277f43b736sm29618pgp.92.2022.09.29.09.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:14:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix build break with recent mm tree
Date: Thu, 29 Sep 2022 09:14:04 -0700
Message-Id: <20220929161404.2769414-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

9178e3dcb121 ("mm: discard __GFP_ATOMIC") removed __GFP_ATOMIC,
replacing it with a check for not __GFP_DIRECT_RECLAIM.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Sorry, this was reported by Stephen earlier in the month, while
I was on the other side of the globe and jetlagged.  Unfortunately
I forgot about it by the time I got back home.  Applying this patch
after 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
but before or after 9178e3dcb121 ("mm: discard __GFP_ATOMIC") should
resolve the build breakage.

 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 473ced14e520..8f83454ceedf 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -27,7 +27,7 @@ static bool can_swap(void)
 
 static bool can_block(struct shrink_control *sc)
 {
-	if (sc->gfp_mask & __GFP_ATOMIC)
+	if (!(sc->gfp_mask & __GFP_DIRECT_RECLAIM))
 		return false;
 	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
 }
-- 
2.37.2

