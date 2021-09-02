Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080CC3FEF58
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED05F6E59B;
	Thu,  2 Sep 2021 14:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91F76E5A9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:21:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u9so3213643wrg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nyb4USdVsshNsLXvfssEQ2tta7l0guLpM/SyZKGcO54=;
 b=kQsznbPQzGcmVFMpyGNO8FOXSbJkohPQuT65FTN+e87qPbbsAWAONG7BhipCXaLRGv
 SsbY05suBguNj8rVw0IukEZ2VHtXILFw9saJUmpnGyRTB0u/fIH3JBVigTQZEDTYwmsx
 JUT1gJKOw/G/EtxjizGeTxQRg8O5YOI8226rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyb4USdVsshNsLXvfssEQ2tta7l0guLpM/SyZKGcO54=;
 b=acQcFe3d+KatSfXZpX36m+kOksNbaQ7CJ9mXURG4ytda+2by632+pUFSSHIlHZYQnm
 jwmq0Rg4tlmv8rSm3ZTpFmBPYpmykjLEWbJ4jyF9Q+1vCARFirgiYPVC/iQfFG+t0Xju
 5v7bviWUUMzaEhGAyT8b54B1TGOM3O7w0NS7ue4gt98PTGnDAhPaZ42ws+4Q2PpUhmot
 x4t9WTgQ7n9a+1YS1fNtfX978Idhb2rneaUfgoJ47Ka59sf9ayDn5HQvagGoxNR4pxAt
 f5hpyFoBL/P8mvzB1RQ5QtT3tZtrVZpoBarhDmtT962R+BAox//co41Gb2vTmASSjRZ0
 T62A==
X-Gm-Message-State: AOAM5301g8Y58i5JalJnoJA+OHfs3Rj47Qhz6bgmVY9qqZtogFQ+Ymhr
 Djyt/lDr/RAGKGOpHmvUDTYAvwDluopqaQ==
X-Google-Smtp-Source: ABdhPJywDNNVdLD7vnVG4QI1Ss8ti/HaCSo27Qw07BUSljT9oKWCbyr1nOjihuTKWGwFMF1jmtmbqg==
X-Received: by 2002:adf:b7c5:: with SMTP id t5mr4058977wre.322.1630592473249; 
 Thu, 02 Sep 2021 07:21:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm1841811wmi.1.2021.09.02.07.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:12 -0700 (PDT)
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
Subject: [PATCH 06/11] drm/i915: Use i915_gem_context_get_eb_vm in ctx_getparam
Date: Thu,  2 Sep 2021 16:20:52 +0200
Message-Id: <20210902142057.929669-6-daniel.vetter@ffwll.ch>
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

Consolidates the "which is the vm my execbuf runs in" code a bit. We
do some get/put which isn't really required, but all the other users
want the refcounting, and I figured doing a function just for this
getparam to avoid 2 atomis is a bit much.

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
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 12e2de1db1a2..7a566fb7cca4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2108,6 +2108,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 	struct drm_i915_gem_context_param *args = data;
 	struct i915_gem_context *ctx;
+	struct i915_address_space *vm;
 	int ret = 0;
 
 	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
@@ -2117,12 +2118,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	switch (args->param) {
 	case I915_CONTEXT_PARAM_GTT_SIZE:
 		args->size = 0;
-		rcu_read_lock();
-		if (rcu_access_pointer(ctx->vm))
-			args->value = rcu_dereference(ctx->vm)->total;
-		else
-			args->value = to_i915(dev)->ggtt.vm.total;
-		rcu_read_unlock();
+		vm = i915_gem_context_get_eb_vm(ctx);
+		args->value = vm->total;
+		i915_vm_put(vm);
+
 		break;
 
 	case I915_CONTEXT_PARAM_NO_ERROR_CAPTURE:
-- 
2.33.0

