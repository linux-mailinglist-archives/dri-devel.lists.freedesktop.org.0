Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380133C1880
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6D86E983;
	Thu,  8 Jul 2021 17:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62106E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g10so4614696wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rb+Oe0toTeOgIa8IYANnZUAlOMPcqkeH94RTQyNbWo4=;
 b=S3rdQIP9Mqjn5JnmJiqkQWCpNxC+MXmVCjZrYyp+UUFekxglKz26txWDkt8+TK6w5z
 3jQBJPqBEsJkixQ9YJ7VT/U136DfVY641fjDJTuXuEbzRal1cga6BIPxorcVs0lgjkur
 JHmP+2xCaow84P9nS3UB58FbevmgfN3vdVUKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rb+Oe0toTeOgIa8IYANnZUAlOMPcqkeH94RTQyNbWo4=;
 b=sP9HdaGaPzTrh4kRbKooSYpIj+wdW6YhFMyMf8pg6QV3sSs/MSG4d+xZZobEHkRAw+
 IXsE29l9tg2nUAjR+2CoQSzJpxvtV40NbIL98tlXdylQ8MFGb6MJXA47hh+HZH2n3dH9
 mpBplyEvzg93vnODWEdlk40WCFVaBeiXGyJrFxZ8tLfkRBSZkJwkublN4IulG/H2MTks
 tdUSWCoyfItZ90G7KH6xFltWoCLlzgvw/nHOb0GjVBbbpdzp/Bh4AfHaXZ6wKthLv5tG
 NGlGw4SKT/zBfregP65ZV2d8E/Uw7A8J23eCUD3/OBBQLt9+++catebHC2Q+S25J2I5x
 i98Q==
X-Gm-Message-State: AOAM5311HYPlaeLRzY3o2lpUiQEZRW3XXw+T3UR6iETNYliOc7oEDoxL
 vET0W3piGIz6cVSk5eP005zhw6q95onDVw==
X-Google-Smtp-Source: ABdhPJzARFjuD8o/FtezQB2TZDKit1O5wm4srPP68GzbT+W98oCNxqARdhWL/s5uhK8xov1cfyseeg==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr6529631wmc.15.1625765907304;
 Thu, 08 Jul 2021 10:38:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 19/20] drm/i915: Don't break exclusive fence ordering
Date: Thu,  8 Jul 2021 19:37:53 +0200
Message-Id: <20210708173754.3877540-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.
Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but it probably makes sense to lift this into
dma-resv.c code as a proper concept, so that drivers don't have to
hack up their own solution each on their own. Hence go with the simple
fix for now.

Another option is the fence import ioctl from Jason:

https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

v2: Improve commit message per Lucas' suggestion.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 47e07179347a..9d717c8842e2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1775,6 +1775,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 		struct i915_vma *vma = ev->vma;
 		unsigned int flags = ev->flags;
 		struct drm_i915_gem_object *obj = vma->obj;
+		bool async, write;
 
 		assert_vma_held(vma);
 
@@ -1806,7 +1807,10 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 				flags &= ~EXEC_OBJECT_ASYNC;
 		}
 
-		if (err == 0 && !(flags & EXEC_OBJECT_ASYNC)) {
+		async = flags & EXEC_OBJECT_ASYNC;
+		write = flags & EXEC_OBJECT_WRITE;
+
+		if (err == 0 && (!async || write)) {
 			err = i915_request_await_object
 				(eb->request, obj, flags & EXEC_OBJECT_WRITE);
 		}
-- 
2.32.0

