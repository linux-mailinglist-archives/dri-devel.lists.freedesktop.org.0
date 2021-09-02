Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764033FEF5E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DA56E59F;
	Thu,  2 Sep 2021 14:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6EA6E598
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:21:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g138so1401901wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YOmOX7arcziZoRA45kxze5LtueB4TaipRCXT18IYUQA=;
 b=c8PndkG79GfbCbia0KFrKhMRLut5VTI0RejRxo/0d4noeG8hoVDcfa4a1orLkpZeDA
 eW7ZDXKgK5UsL5bPI4tGl4uQWdUTXvqoZ9QwxfoD1ucijNfrUxHucVdwi/VtHGFF64Yi
 Nb47hA1jr9sOkItjFBgkGmVuhL4hp1WwNW6Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YOmOX7arcziZoRA45kxze5LtueB4TaipRCXT18IYUQA=;
 b=M5Wv+AitqE4gxUtq4bLC++yGgsFTrWYf93FOiTxdkAshTFxgUEPVbSckK4f0CBncER
 5XoAjE5/3IsWHXq0MPDhmu5X+9U1gVB7Q9xRNSdduRUW1IqC6V+ElymsVYuBYsUzsFRj
 l1dKatfRJ7QJUzdGJStMo+7mk7KS1I0FTvuhvEGJu1XMHK1FPxGxhqZmaSIT6G4E3hSE
 iuYDNABwE92fJ7cWvQj40PXRSpLYLpTfyAyWI5adwUVTiNBZwQ/kQtd6nloAuaXceG5m
 IHpIEiz0NDChHazd2VpbTJMca+9bEvAPO1ZzNCrUlETcdV1GJnIcN9/DvhbMWOiy3Nty
 knLg==
X-Gm-Message-State: AOAM5312576TBSUYubSBXSd195mpyOUCDJovd9TLoBQ0/dGCp+CPsHz6
 +X7NPacJ58g4M4vCPm5AoPN3ssPcOJ+YQw==
X-Google-Smtp-Source: ABdhPJx9mEK1Dfjs19Ier6VOBTsiAT6aNKqNBWHxrGUMLacEWdjFVHXjycuv3RQRoz6WRzeFDXfkWA==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr3347718wma.117.1630592477075; 
 Thu, 02 Sep 2021 07:21:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm1841811wmi.1.2021.09.02.07.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH 10/11] drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
Date: Thu,  2 Sep 2021 16:20:56 +0200
Message-Id: <20210902142057.929669-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

