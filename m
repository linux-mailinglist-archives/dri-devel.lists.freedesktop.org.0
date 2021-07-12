Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68E23C64A8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF9389E36;
	Mon, 12 Jul 2021 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE54889DCF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7319wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6oKtmGiKJUZfXT78MM22rL/3f/JGWmhDhHuPlcib2rg=;
 b=W9ueRzVyj9D3q7BukjJ6iHr9MhfVTz5QTmufVHprO/4ANnggd4/ITxFkWMdruXKdyf
 cpHe21lJ5lBLoodiNss5O7wwifznJblmTTJx25FW5J1Ud9sGcMannDevgJe35bTjtddU
 ibZ0mTs8srCFYvFp++xsKQTJ0mjZG5yYWEq9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oKtmGiKJUZfXT78MM22rL/3f/JGWmhDhHuPlcib2rg=;
 b=aJElr0kcuZm5NVkrRTMfQtzvY8wzMF+TZlvXFm8VUqR/+hWd+sHQvnO9noO9sUwABn
 Ui0dhhYTwEdgZ4WgSm1QzTL7I8PoNlNuo9K/XPQBMrQXlneR5Df9VQXlkrcjsxtyf2iD
 tQnE+YLQ7WTiKnqQk0PJpzHsiIzLey4cyK46XXhVRcoDd8xFAbjOUcyjmhi6iQb2+QcN
 5zPU8cV27p1Z6l6t3QaPjjjolMN3B6R8S8A5iWzlyEaiosyQJ7OUMHNvcnRJ310KviuC
 0Hu6TnV6CMVddP2lcIL6Kdmi5yOP3nLHWEojqZCTwaJ0gTiRrFmWXw522iJ8bEhtlve+
 mPoA==
X-Gm-Message-State: AOAM5300LxKGe9Mr+HwnAXH/9wePe2DM1wv9JFKL9ivePdp768HLlsW3
 spIXgWReRlub9SGG5Kml6tFMTID7o7p1kg==
X-Google-Smtp-Source: ABdhPJwsgW3nmuV4ENvyxT/y/wfkOSh4a2sPmzA9GB/SANA51myrb56haOr+6vHgpdB7dSm2nXrsaA==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr16895377wmb.129.1626120134262; 
 Mon, 12 Jul 2021 13:02:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 17/18] drm/i915: Don't break exclusive fence ordering
Date: Mon, 12 Jul 2021 19:53:51 +0200
Message-Id: <20210712175352.802687-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
index b4a77eba8631..b3d675987493 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1767,6 +1767,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 		struct i915_vma *vma = ev->vma;
 		unsigned int flags = ev->flags;
 		struct drm_i915_gem_object *obj = vma->obj;
+		bool async, write;
 
 		assert_vma_held(vma);
 
@@ -1798,7 +1799,10 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
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

