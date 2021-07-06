Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9763BC93A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E889E19;
	Tue,  6 Jul 2021 10:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26DE89E1B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:12:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id l1so13159202wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWcWR1KixLijDYq3yaFOHXVbfDivFiiPhz55Z/ncpkI=;
 b=XmygK+nC/kzPdiummiRspIneR4nZhkuhJmlx1ZcM4rhww7vqH3rkpXOn1NP7CsHoGv
 ePu4bo4zdgR/55/VRpa3lhOBrhnlvQa8du0StPr68aSqkuykskZB+JysNb8C0SIG3aYS
 EAj3kO9qvukavPR/Gion8mQ7nzMSntB7wtigQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWcWR1KixLijDYq3yaFOHXVbfDivFiiPhz55Z/ncpkI=;
 b=fCO436Jx+YZvCdX+w3cod1QlOJWGIT7dwDT3sEom4Oby+6H3sEgTXbd3lrnEW4IvGu
 oENYuBc8eRmSsYE+9soDGi0NGWjMn5s6havU6ZW2DQks8kPy1w439+L8xzvdzRtm3yv+
 3GM6OI6NlYx+TOfbl2HNKifGON5wQDzURUDD3OXUvhRtcWqmdD4KxPxrDmSefn2SZoex
 mwMd8KCz2yttxphfTktmGEPgs8yezZulR5cPK/jEhn3x2Jhm76e9GSVRLf35E2xjvnpm
 K3qcmBBQ7MW2F/JRoshYcY/tTqSqDzFqolEZ3X/qy7RtkrMTcucrCV/SIeYEcXag2nHL
 kqPA==
X-Gm-Message-State: AOAM533hmVV8AsEVYqzPaZFffpKBPCsaLYR18vnwnNJrgU5DD9f5DjGW
 0IgzlS0pHAbca5YDSVYMP7AYylJCiV3vig==
X-Google-Smtp-Source: ABdhPJxvsRGLwu8LOhmEBqhWi7vnF88H0eJvpBUkvsy/EpHw/6F/H7OjGx2seYG1MzzWj35IHlXrsw==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr3931259wmr.123.1625566340404; 
 Tue, 06 Jul 2021 03:12:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:12:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/i915: Don't break exclusive fence ordering
Date: Tue,  6 Jul 2021 12:12:08 +0200
Message-Id: <20210706101209.3034092-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
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

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but it probably makes sense to lift this into
dma-resv.c code as a proper concept, so that drivers don't have to
hack up their own solution each on their own. Hence go with the simple
fix for now.

Another option is the fence import ioctl from Jason:

https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

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

