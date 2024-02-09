Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34CE84F951
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6D10F596;
	Fri,  9 Feb 2024 16:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fw6XIdkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3689110F4B1;
 Fri,  9 Feb 2024 16:08:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4105a6be071so6824215e9.1; 
 Fri, 09 Feb 2024 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707494910; x=1708099710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TzLKSpIbztwzPT6C+IS9b5enm2u51uagMPSnubcJ8hg=;
 b=Fw6XIdkPWqbSMnCXuvoW1v6YbJ8rouDGV8/gg1gEDAUdsKZAImHQyS/zqTUS9/CSeG
 iLTk2aXHarYo4uQZNDiG43tZGfi9ZJ1WNqFqtUJtZOW6nqqkAwOjMeC+AqfI3oQ2Q7p+
 sqENcCPikOKOjskEILNWBmzU0qyrV4EIfRyS+ZwKTXtLDSDALVHMWzzlWgNO6J9+C35J
 WWq7GuyVJnKoAKYbU5ihnOc2yHa2cY3UZgSeME3M09TycAiq9yBMyhz/2mMlVJq4L5bt
 fau/MzcKqWMHdOHmYiteu3N681n6ppdBxYWl9aoGHF7y7QqzC8gq5SDmdPOJRbzC44PC
 hDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707494910; x=1708099710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TzLKSpIbztwzPT6C+IS9b5enm2u51uagMPSnubcJ8hg=;
 b=NhybQN496rEPpl9zCeZj6EPSXPWHdesZcuFXricE559zqoAhwoikjwan2M1Vn86OqN
 ZEe+042DKnKg0yigZCNh+UAjmBys+w4T3IcXI0x+6P1R4KNaP/cWcVDsNroZdCC78Wuw
 +fn8zS48pw+vVNYtK5BvuM2JkijAHyc+uGqtqU7znEPV9tdm1slE+Qu5jBLNEyPYQoYL
 Kf8aHYzJ20CYN7DoAbqxdxb4eEyKWsmZNiTW+J5NmeveuZs6j/7yEcxZ0tMc4sJ2aMpn
 he9JnPUwn+iCWqXGV4ooIVK+RvXD3TzcM137R1F7pV5tMSB09zIRkJ+Ml4DfI2Drwb2Q
 cDnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Rq/W7qZNnC1mSmnA0v+hv+bKVUC2UOBdYROKE5gcEKaMgSRxssxp7Z47tCg9TtInCXqeKbM4lHlVnrnf5RL977UI6UotnSvnauZ0o9rJwWXp51C9LmdUaLPaf05tFaRQe+qlMVJG0NP8+8MdlCEncYgdHtjd8XnsEJN6LOd0iSUwVgAOXf+gUUInPx/OZS7+cgK/NQ==
X-Gm-Message-State: AOJu0YyLEzBE39Qx46/kQdUdYzTwtvx2AtTfWOQcYKFN1wnJPQHAyywC
 49ooDvTPkZI6bKYwIQill8J6rBsS6HXkh7gqD0aDvC3bQ6kCskTS
X-Google-Smtp-Source: AGHT+IGG4FUlez14b7GsJi67PNeZ+8sCc1WWZLXozkMxO09v6l31xu/rN0T+bT/YmhzLPY8b6U5upA==
X-Received: by 2002:a05:600c:1551:b0:410:8782:cf7b with SMTP id
 f17-20020a05600c155100b004108782cf7bmr49204wmg.20.1707494910424; 
 Fri, 09 Feb 2024 08:08:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVC2z7Iy56PqWUKiYFwZYuHACZNPyFNI1Bh1wkW+1/C/J2VPGzeszoYxrJtoEFiPtlYewdKOl7pOPY/mikYD9y5huVYlBzwgEWfljjhovrCN0O3JhAzKdfP7TyoAxkND+nzoWivMJLaHrbLbgl5TkDP4FqKbB1YMzI6k0j21dpqOzt7b4K6jABPVM+JrJ9TIgWfcEF/nVxPa8p704bXXhA0qHu6mGT4HIwVK6Jqu60yZsNSDYA8xLMsr96IAZRYgcF6RPFI3C9GXW3gFV9nMhI3jW19m6MM6uAAdZ+V3KTUhmuPx7UE5rzF/i3Efvg9l/yNsTjc9+zT+pakLtc6E6L1afh6AXKcQEoxv3hbb58FEIXC3Sl0p3vEmwVqI+uDVMOEqteaBdq3alng5ziOtfQkcZ/scLzVAJU3hXNG/iCzMVyg1t66V5wq/Sg8y1yVOZSqUsGWsU1P5gROsp6Xshk3QSVDIQHRxOdiM1JYjPs=
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b0033b583ba5e0sm2124312wrw.92.2024.02.09.08.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 08:08:29 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/gvt: remove redundant assignment to pointer map
Date: Fri,  9 Feb 2024 16:08:29 +0000
Message-Id: <20240209160829.3930396-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pointer map is being initialized with a value that is never
read, it is being re-assigned later on in a for-loop. The
initialization is redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/i915/gvt/interrupt.c:346:28: warning: Value stored to
'map' during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gvt/interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index c8e7dfc9f791..8c8e37f50a45 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -343,7 +343,7 @@ static void update_upstream_irq(struct intel_vgpu *vgpu,
 {
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	struct intel_gvt_irq *irq = &vgpu->gvt->irq;
-	struct intel_gvt_irq_map *map = irq->irq_map;
+	struct intel_gvt_irq_map *map;
 	struct intel_gvt_irq_info *up_irq_info = NULL;
 	u32 set_bits = 0;
 	u32 clear_bits = 0;
-- 
2.39.2

