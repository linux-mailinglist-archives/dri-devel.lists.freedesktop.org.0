Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA473E031C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF426EA9C;
	Wed,  4 Aug 2021 14:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6D76EA8A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:25:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b11so2491076wrx.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tf+mOzcQNKHHz6LJhS8LPXuBWTq0ViZJrfxmoddi+oY=;
 b=bnLvdu+PYARfSfh7ErwMLlrG3mqedWgi0snpQM/SHog8chW5Z+JRfsyQ7XAfFlTkRE
 gZ74DIPEpRPqtT8lb/aLI1Kyt6JSO9KnqC20mjdJX5c4NQVTIOeY0st/HG+1zGlV/DU2
 UMQqb3wMyIgxuzuzMYyHNenpzC3EjnkXy/mDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tf+mOzcQNKHHz6LJhS8LPXuBWTq0ViZJrfxmoddi+oY=;
 b=H1OpfdVz6UDo1TCvbGGhrrYLfhFDx+4Lt35ds3GW0Vct18t10YSosQnSw8ThcO3VVK
 bfjfiLLz4uw3aB3h/PYTfb4rAqMt4HBkVmCallboYSTMUKX+8gGBROfYcpVDctvBiX/d
 B1mq7kN974pkmhreLX+i+aKvv/GEiXIPRU3PSwLJhTmxEYGmIADM+Jh1Zz0+b7MtZlXh
 XD1pQpIupuhsymP7MPehi0IDyvCU2jbCSJYW9J4V55CoJpD4DIO9h+fDkQg49/LOCK/A
 ehiqf5078cSDTyeQr9h2tuOhR4pxiNBKvtePgudP0SGZmV2H+py73kZ4EcdxcA7DrvyD
 Bd4w==
X-Gm-Message-State: AOAM531aFv8b/yLL1bT7yR0KwftihVWQWQCNqiRYOzVOTXPFizHi15/B
 8xtQ+RarGc0dwfByHDAjiFHjkQ==
X-Google-Smtp-Source: ABdhPJznaAR9bPeMCyNq1rztAYlZmYDPpn9wN4TXqRrAzfj/f9xMuRLpnAwRbpa5nr7ZivB71j7voA==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr28685761wrm.59.1628087139168; 
 Wed, 04 Aug 2021 07:25:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm3222682wrn.9.2021.08.04.07.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:25:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH v2 7/9] drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
Date: Wed,  4 Aug 2021 16:25:20 +0200
Message-Id: <20210804142522.4113021-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804142522.4113021-1-daniel.vetter@ffwll.ch>
References: <20210804142522.4113021-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We don't need the absolute speed of rcu for this. And
i915_address_space in general dont need rcu protection anywhere else,
after we've made gem contexts and engines a lot more immutable.

Note that this semantically reverts

commit aabbe344dc3ca5f7d8263a02608ba6179e8a4499
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Aug 30 19:03:25 2019 +0100

    drm/i915: Use RCU for unlocked vm_idr lookup

except we have the conversion from idr to xarray in between.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/i915_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1488d166d91c..df2d723c894a 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1880,11 +1880,11 @@ i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
 {
 	struct i915_address_space *vm;
 
-	rcu_read_lock();
+	xa_lock(&file_priv->vm_xa);
 	vm = xa_load(&file_priv->vm_xa, id);
 	if (vm && !kref_get_unless_zero(&vm->ref))
 		vm = NULL;
-	rcu_read_unlock();
+	xa_unlock(&file_priv->vm_xa);
 
 	return vm;
 }
-- 
2.32.0

