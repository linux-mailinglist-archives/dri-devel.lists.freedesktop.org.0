Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AA3EBD68
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A458E6E8EC;
	Fri, 13 Aug 2021 20:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507EE6E8E6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:30:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q3so13039723edt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lLPOz3hDp+pT39FE8Q0SxSfBHkEHkZY6Ug3rUm4joY=;
 b=b+yQi9uCU/oAOsKMVQEWFmTsdOH9p8TLfMg8jxRxCCkhpIknfEPlAaA+R12MKE3DKk
 ANzDwIJzOma6lDg9D34917QTbe5e6gOgeqBBXzP8WsRlo825y2LVWcwjTvsk3Q5kLctr
 OkPVIgCUYaC3THEkfCDbx4uhADoOP+SrJf/4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lLPOz3hDp+pT39FE8Q0SxSfBHkEHkZY6Ug3rUm4joY=;
 b=nJWGAAYcHIP1WO1Z0EZOWyeiOLC1TBB+WqPbEyvEyP/Tkzh6oi9jT/XTmWvTBLmb2O
 ofPvafmJ4xXqDDCyWhydVoTZoFWT6gmvvXWiX9Zzyuh9NEIlmNMA/AnyUKzeRL0RqLIZ
 YL5pSaIH5tS4VCfXNJZ+phe4YMkNkRHAextN7l1ESDj54InbCPQFF72IWK8Oh4aD6TVr
 mQs3AP3/88UrkHAsOdveCx+ekwGz/Gl1APfF1XWgQJS2dYAPdW6kFVkfaCECLBtpoRge
 XzL2jB2oqm5i0WSeyHW7/NhRpFJ+hwA1+C3FIhl6/aUAPNsB3A05u4NdEJ5i72EvZqcR
 SGlw==
X-Gm-Message-State: AOAM533xBjzqC9O4tD1vPVekQlDiiCs3ExIDgNUAMQbBKfgTqPo2Ry8B
 dblqpT0Dp+UFTKMJJBUU21kQDTkbDyf7mw==
X-Google-Smtp-Source: ABdhPJzf2k/j+TRIp2L/kPq2yJYzKZz1yLpcbp4q25XZLyxHk4GGKAI8Mgq9BIhTM0VJs+X6rC5LEg==
X-Received: by 2002:aa7:c554:: with SMTP id s20mr5392125edr.198.1628886648886; 
 Fri, 13 Aug 2021 13:30:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm1347027edv.51.2021.08.13.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:30:48 -0700 (PDT)
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
Subject: [PATCH 10/11] drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
Date: Fri, 13 Aug 2021 22:30:32 +0200
Message-Id: <20210813203033.3179400-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
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
index 005b1cec7007..e37fac8fac0c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1881,11 +1881,11 @@ i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
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

