Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F483CA746
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3C06E8A2;
	Thu, 15 Jul 2021 18:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9F96E89E;
 Thu, 15 Jul 2021 18:50:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232439395"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="232439395"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 11:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="466858112"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 15 Jul 2021 11:50:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Jul 2021 21:50:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm: Introduce drm_modeset_lock_all_ctx_retry()
Date: Thu, 15 Jul 2021 21:49:52 +0300
Message-Id: <20210715184954.7794-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Layer drm_modeset_lock_all_ctx_retry() on top of
drm_modeset_lock_ctx_retry() to make the fairly common
"let's lock everything" pattern nicer.

Currently we have DRM_MODESET_LOCK_ALL_{BEGIN,END}() for this
but I don't really like it due to the magic gotos within,
which makes it hard to use if you want to do multiple steps
between the BEGING/END. One would either have to know the
name of the magic label, or always wrap the whole thing into
a function so only the single call appears between the BEGIN/END.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_modeset_lock.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index 5eaad2533de5..2e2548680aaa 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -223,4 +223,10 @@ void _drm_modeset_lock_end(struct drm_modeset_acquire_ctx *ctx,
 	     _drm_modeset_lock_loop(&(ret)); \
 	     _drm_modeset_lock_end((ctx), (state), &(ret)))
 
+#define drm_modeset_lock_all_ctx_retry(dev, ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret))) \
+		for_each_if(((ret) = drm_modeset_lock_all_ctx((dev), (ctx))) == 0)
+
 #endif /* DRM_MODESET_LOCK_H_ */
-- 
2.31.1

