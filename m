Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F83DDCC2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493C06E59D;
	Mon,  2 Aug 2021 15:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA756E59D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 15:48:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id hw6so17715662ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tf+mOzcQNKHHz6LJhS8LPXuBWTq0ViZJrfxmoddi+oY=;
 b=LItb+ZEBBDTkvu02ragY4XBmcJInPCvh3yWF6lZIVnYh/IzVk6bfVJ6UCI9YkLUd73
 Azca7MyneJKrEuhahZa3MVZRxBvxHQds9ZqiRdGDphIT0l9l741iLzg6OPCa5ohND9QQ
 QyoK6SaZ3Zt4a6moV6+kwH9xSTJNZA8g6AJe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tf+mOzcQNKHHz6LJhS8LPXuBWTq0ViZJrfxmoddi+oY=;
 b=Cn16qa+Xu9Y8T1diH0XRKt0oelZIYZt4qLZk45FHi0EOpNM6XrpvTODYudorLYhv9n
 5Vu9HaXyzZAFO7U3RhIKfupC7Tan8PPSu2bJ3Nq0cni9AemPkK1srzHKGKLIOokKS7Ys
 b6fC0haBlnMnK8r4XsO3Xr+paIaodcGEJUF4PKEsCyWUCgn3fPPdPgNkdycjM7dF02Su
 PCl1XGklo4fIarr6bbNUlCQ+a+3NkwVsfyjgILh15nwDWVeT/DUxOkGQ5bIWkEJArRUF
 LFhg/2H0qIdRHXKCHOs5BymsplV3gwYgu2FoKbFQghMcZ6Y/4ZuikpohQEAUfN3mn8ZY
 XruQ==
X-Gm-Message-State: AOAM530dl2nsQa7hJurljqqSqXwz8ZhmTV/fFNzI0H3TEKYcQxv5Uaw6
 +Xq4Qme02pQMGc+i+tTmQKMUXXmzyjN5Jw==
X-Google-Smtp-Source: ABdhPJzUm3r2O/eUu5snEzHou7gEUSmGIzdgV1HDEqgOq5ZJRRV+oTMZlqU626BR73biAC1rN/CTOg==
X-Received: by 2002:a17:906:3782:: with SMTP id
 n2mr5954124ejc.368.1627919323760; 
 Mon, 02 Aug 2021 08:48:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m20sm5064020edv.67.2021.08.02.08.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:48:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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
Subject: [PATCH 7/9] drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
Date: Mon,  2 Aug 2021 17:48:04 +0200
Message-Id: <20210802154806.3710472-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802154806.3710472-1-daniel.vetter@ffwll.ch>
References: <20210802154806.3710472-1-daniel.vetter@ffwll.ch>
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

