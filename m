Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F8577749
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 18:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8A210F3D2;
	Sun, 17 Jul 2022 16:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6575210E919;
 Sun, 17 Jul 2022 16:20:51 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id v21so7112406plo.0;
 Sun, 17 Jul 2022 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3QM0VGwZJMhBsJE0onY0hM94jbomNudisRDkMA5phA=;
 b=XC49hl0Qoew2RD7oOXd1YLrAttGqaR8lA/xJayGMOA7KPOtm69P5LIAUTNSjlTIZBF
 baH7+u+MkADowl23la0Ld7o2G1TyHaouqxPWE586BiPJNGyP1xxHHKeeqvroWR/uf+gO
 9DhwKT4yDJHVTpieh7AIIaEzxnXdEuzC64nnTyPLU6+ygByfJAp7BHdWb9H5PPuXKhkc
 NrbfQnOhxeYsVuhtGRBB39jn6q5iGyj67CohnEhYfYHOxu5hqW0GDCW4p0rRNO0JM+3O
 lNTNvVRPno+ytNlKfCV2ikbLNUOjDepKmZVj5pc4Goxpiwz6xNMLou90aLu1s/XlDWjU
 EL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=u3QM0VGwZJMhBsJE0onY0hM94jbomNudisRDkMA5phA=;
 b=lKHc7P/kqRGisFgtOdFCTfbhiRZv+DpMCRhFkGsvsEK3SCrhPdnFoQb49Ul6haPhjE
 lycjq1Z4BupH1B/SZblBmiGYgdpVJQsnf9kbhfPnVrPvvWWTTfLT7taUrBgmH0Sy/TB3
 NKKSyILVm5l6fKyTpGPKiVDJEkrW/DbwEyO7MlaAcDGvJSmAKjN+ao0oGKtrOoGtN5RQ
 PFLzF30esXFiYX1cD+tdl72YJzzix1U/TMU5j+RFx2uXdHNmkTwzrEbuCxUBSkXFXLvz
 N5zMG6k9/J05py9MyLS/WkH7WCjQ0wH9nHWwdrYcfg6Byn02CWNyoxHPL2RElUVPAOmW
 WdHQ==
X-Gm-Message-State: AJIora81HFIGBmdnjclFaiki+w5PvBaxqi2IHUGfXJfaeJ/l98wkB3fo
 qVXlBLqlDWbN2Xf0BksoDuA=
X-Google-Smtp-Source: AGRyM1ve/k7uBaojTv42vcU8qIxzNJZnzgL1eV24bkOlshzh2Z01ipo8jmARjSC9DhQ4kvDO93eO/Q==
X-Received: by 2002:a17:90b:1a81:b0:1f0:77a7:907f with SMTP id
 ng1-20020a17090b1a8100b001f077a7907fmr29012948pjb.49.1658074850832; 
 Sun, 17 Jul 2022 09:20:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u142-20020a627994000000b0051c758a3957sm7690289pfc.149.2022.07.17.09.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 09:20:49 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/i915: Fix 32-bit build
Date: Sun, 17 Jul 2022 09:20:46 -0700
Message-Id: <20220717162046.710290-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit aff1e0b09b54 ("drm/i915/ttm: fix sg_table construction") introduces
an additional parameter to i915_rsgt_from_mm_node(). The parameter is used
to calculate segment_pages. This in turn is used in DIV_ROUND_UP() as
divisor. So far segment_pages was a constant and handled without divide
operation. Since it is no longer constant, a divide operation is now
necessary. This results in build errors on 32-bit builds.

x86_64-linux-ld: drivers/gpu/drm/i915/i915_scatterlist.o:
	in function `i915_rsgt_from_mm_node':
i915_scatterlist.c:(.text+0x196): undefined reference to `__udivdi3'

Fix the problem by using DIV_ROUND_UP_ULL() instead of DIV_ROUND_UP().

Fixes: aff1e0b09b54 ("drm/i915/ttm: fix sg_table construction")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I took a stab at the problem. Please ignore the noise if it has already
been fixed with a different patch.

 drivers/gpu/drm/i915/i915_scatterlist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index f63b50b71e10..b81d5658c222 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -96,7 +96,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 
 	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
 	st = &rsgt->table;
-	if (sg_alloc_table(st, DIV_ROUND_UP(node->size, segment_pages),
+	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
 			   GFP_KERNEL)) {
 		i915_refct_sgt_put(rsgt);
 		return ERR_PTR(-ENOMEM);
-- 
2.36.2

