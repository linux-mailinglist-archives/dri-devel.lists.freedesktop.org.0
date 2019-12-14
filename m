Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476CB11EF03
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 01:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123C26EE25;
	Sat, 14 Dec 2019 00:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB71E6EE25
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 00:09:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q6so547078wro.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ye/hWE82q7CtVjcCPN/tZ9yDb/tbbka1un83bKTcWH4=;
 b=jR+bhPwHkiZC1nrJpcA9fZdtqIFcJ/O61t/kV50tTDEX3gfyMF/HAZd/KF8E4/K/+e
 YvsY9kIxZsR8XhuPUDwRq7s3nK+tdyvL0I2xW9EnOXrQ0WER9S0TckCKHRvKKrXhHate
 8s6R1c9DMxnvHC5ikULbXiMGAq8V5khp3xwxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye/hWE82q7CtVjcCPN/tZ9yDb/tbbka1un83bKTcWH4=;
 b=VWnkE3l+XCVDvUtORf/l2drBGE3tY8ZI9oPlLKVAxasJwarcgGzBcSrqjXfMJWwfAd
 I5hUdrhS7pDHUihL9MkZBTa3HWn7olLzadoH/BI0Y5hNGO389W8fmHzUyNMZtwz0FWt6
 vvV+gMiZmmEJ1uyjNoCGDWl70UTw+Hzpbzeq6HeGrQgNdmQdnVcLt34Ay2mOmJ2agb+V
 mjO0cWYwXMlH80uj4tiMjDdQo/6WEbrgDO7Uc/+wGbhr3GmzxFF68MqhQWi9rHPLnJVz
 Gcu4ZjRBFwqsmebxK6womJadxSNTS5fniK0S2KaZeMO2LPRUXkHuH8QNkiC+zbBVCsps
 usng==
X-Gm-Message-State: APjAAAXsUMza2NDId/st7bErWMw9z2N3IzFpvKP6bE7POl4uxxzXckBI
 gmHEMAH8jjKVzJjM3AzxvTV8tST7bMk=
X-Google-Smtp-Source: APXvYqxCPpP+VvorugNz4F+j3t0xo3UB8O7m2+X0ACwF9J9VmT7MGex/x1iCdvw0CngNj7IYoISpfg==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr16025907wrb.22.1576282173242; 
 Fri, 13 Dec 2019 16:09:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id l2sm11741735wmi.5.2019.12.13.16.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 16:09:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/etnaviv: Use dma_resv locking wrappers
Date: Sat, 14 Dec 2019 01:09:27 +0100
Message-Id: <20191214000927.1616384-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125094356.161941-2-daniel.vetter@ffwll.ch>
References: <20191125094356.161941-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'll add more fancy logic to them soon, so everyone really has to use
them. Plus they already provide some nice additional debug
infrastructure on top of direct ww_mutex usage for the fences tracked
by dma_resv.

v2: Fix the lost _interruptible (Michael)

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index aa3e4c3b063a..3b0afa156d92 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -113,7 +113,7 @@ static void submit_unlock_object(struct etnaviv_gem_submit *submit, int i)
 	if (submit->bos[i].flags & BO_LOCKED) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
-		ww_mutex_unlock(&obj->resv->lock);
+		dma_resv_unlock(obj->resv);
 		submit->bos[i].flags &= ~BO_LOCKED;
 	}
 }
@@ -133,8 +133,7 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
 		contended = i;
 
 		if (!(submit->bos[i].flags & BO_LOCKED)) {
-			ret = ww_mutex_lock_interruptible(&obj->resv->lock,
-							  ticket);
+			ret = dma_resv_lock_interruptible(obj->resv, ticket);
 			if (ret == -EALREADY)
 				DRM_ERROR("BO at index %u already on submit list\n",
 					  i);
@@ -161,8 +160,7 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
 		obj = &submit->bos[contended].obj->base;
 
 		/* we lost out in a seqno race, lock and retry.. */
-		ret = ww_mutex_lock_slow_interruptible(&obj->resv->lock,
-						       ticket);
+		ret = dma_resv_lock_slow_interruptible(obj->resv, ticket);
 		if (!ret) {
 			submit->bos[contended].flags |= BO_LOCKED;
 			slow_locked = contended;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
