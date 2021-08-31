Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A915A3FC6F4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36FF89895;
	Tue, 31 Aug 2021 12:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C139989895
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:14:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so2363637wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YO9uC5hNM99y7yKPddUhpObplxDl4Qznr3A7+kNWTLA=;
 b=DAuciB5Ys5bKNgltPm664Y06ygcw4h9Mia6NB9bCVTJk8DpDLayosBSJTi19QSwfBD
 PJInnr4Ii2fCflksyrdSc+H1zKJm9CiULXU6dOIFJtXQNxtN9P7cJCW4pKsUFP7gF3EK
 HcjO6DfsSptrqXo1tHeoMTzuOh0RX2VCgxgRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YO9uC5hNM99y7yKPddUhpObplxDl4Qznr3A7+kNWTLA=;
 b=QuQAhuyJeWI96I9/lv5jMrDxTBXss1MLX7Kk17/4j6HrM/Mf2wrVlz3XkVRVdxa3tX
 Lsf8qQApAlwrL6td3Flf69ZglfsCZ4D3CLeYeIko5N5x4AUrvy7qpJ1aovH80DAGZBiO
 auwfSfpOOGgDvY0qahk6Q+SQHjOQQgjngZ5/mecoyeTtHfgiKs1xXLndGAz8CpWCQUCL
 2wvtO94rltKieYyj56c9NCNC63NNzHR0XZSFYH4icdY4ozFHKM7Xs1BIb/MvvWJ5jgcp
 f9lNzsEeAkZMZbubFsClFaatuvhspqaiiayR93w9Y/XFfwp8Ma94pPQgYbkI9oNT+uJG
 PN/g==
X-Gm-Message-State: AOAM530wR4PImnmVP2S6gO+susFRKnH/i7JgjAlYCizFk5n7mXOOoaKZ
 KaCXTVDgdmAcNoZTmjsYZ+KXXiH72uhqkw==
X-Google-Smtp-Source: ABdhPJyZO8Dxk//4ns9/TlFKg5I4yLK+WS2cXfD0fmIx+i53ilX6GkBBBAMiChk68tiSC32mQqn7eg==
X-Received: by 2002:a1c:9a91:: with SMTP id c139mr3923817wme.106.1630412074466; 
 Tue, 31 Aug 2021 05:14:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 19sm2327961wmo.39.2021.08.31.05.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:14:33 -0700 (PDT)
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
Subject: [PATCH] drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
Date: Tue, 31 Aug 2021 14:14:26 +0200
Message-Id: <20210831121426.689019-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210813203033.3179400-10-daniel.vetter@ffwll.ch>
References: <20210813203033.3179400-10-daniel.vetter@ffwll.ch>
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

v2: kref_get_unless_zero is no longer required (Maarten)

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
 drivers/gpu/drm/i915/i915_drv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index be2392bbcecc..d89ff55d8fc8 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1874,11 +1874,11 @@ i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
 {
 	struct i915_address_space *vm;
 
-	rcu_read_lock();
+	xa_lock(&file_priv->vm_xa);
 	vm = xa_load(&file_priv->vm_xa, id);
-	if (vm && !kref_get_unless_zero(&vm->ref))
-		vm = NULL;
-	rcu_read_unlock();
+	if (vm)
+		kref_get(&vm->ref);
+	xa_unlock(&file_priv->vm_xa);
 
 	return vm;
 }
-- 
2.33.0

