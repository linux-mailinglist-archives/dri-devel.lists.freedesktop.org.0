Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CD3E133C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB06E9AE;
	Thu,  5 Aug 2021 10:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EEF6E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:29 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x90so7685586ede.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+O0NLMnfogG+Z9PX8PPl1SCZ+nU4Y6Ls0Qs3FnIFi80=;
 b=eOrLq/xf6IUJOL3VfN+6kXz8C6LT232hKyocEM7F9ArdUOCc9fJU0XsY8alqwz24Oc
 8WVH0Yhah/+fQ44vBEBTqPmC6p2irEINVAdF9/P0kGFx660khokDvpDvVdOTp2JFj9+R
 sDZnVha3YuhlpCkXh/+jr/X7xAB88nY0w5zRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+O0NLMnfogG+Z9PX8PPl1SCZ+nU4Y6Ls0Qs3FnIFi80=;
 b=XrW7Z3xw5XEfNYsXCfz6v56wyuhtN2vgsNuq/0P05ODzn1Oe7EDBnQrxV8ER6F6KZS
 kDRptyRyc4fSa1OoYHuo1vbF3d8ByzlJds4vFpYlHG3D9641Ge/Wu7lq22LSA6mLEHM/
 5weKXS0AVxg6RaUJj1mVzjGddW80rZtpHd5EhtLrpc6yA+6/EvRmmZgmygiDK1fSk4Kb
 1I1KFkgwBSHG0OsxTolPvXaxmKa2YHTG744/Pzb0frzI6O25RAWpMZSYgkfQLfwh+XA4
 SL/LevBrjqnDbHgLTN2hMBUoUgH7yV2yFYhhVfPdPnvllIIrBvODoM6kAdKE2XZIU5lM
 3t4g==
X-Gm-Message-State: AOAM5307jHNcMcq46F6JHhl55qk6PUwz9PSYKRRAdFE9KrGjKAtWY/f1
 BEvjPE4oFqeIbMR6BS4vywTxYeUUNGXEaQ==
X-Google-Smtp-Source: ABdhPJxQJ+y1h0QvQWqECXT3TK+z0aLjIcNf8i5FijOuQyg3boIa+GlW8Zu8BKGxdjSwK1CHi+Wvrg==
X-Received: by 2002:a05:6402:518c:: with SMTP id
 q12mr5547393edd.205.1628160448182; 
 Thu, 05 Aug 2021 03:47:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH v5 19/20] drm/i915: Don't break exclusive fence ordering
Date: Thu,  5 Aug 2021 12:47:04 +0200
Message-Id: <20210805104705.862416-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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
index 1ed7475de454..25ba2765d27d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2240,6 +2240,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 		struct i915_vma *vma = ev->vma;
 		unsigned int flags = ev->flags;
 		struct drm_i915_gem_object *obj = vma->obj;
+		bool async, write;
 
 		assert_vma_held(vma);
 
@@ -2271,7 +2272,10 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
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

