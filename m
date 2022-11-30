Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DF63E05F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 19:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA86410E4B0;
	Wed, 30 Nov 2022 18:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209E10E4B0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 18:57:58 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id q71so16922282pgq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HARMmg9a8K/b5vAg5+2jWHn5nGF+ldiYt0bz7xqmdnE=;
 b=WGTJiF3yAhGqZTID6d08gJEXQ4pOpw/F8IW70Fk4DX3/XKK4GX6O6O5z6sEg6z3ZxA
 nKoCubP1Y5g7MDxpafjnlDV+EId4HA5w7daSh2YvcN6HdV0obI9+UFlyKjmkKYqFR72y
 gMWy1dzzql8GfeFzdH/WmENL31+zec2xHdtXcCkYXTjR8m3n4QiPg3PrzBzgOcwPIHS6
 AaR7qidp6vLsXCgkZT4up/CQ2btS/YTKnCNO3QAxE+f6yYpnKWixbNMgPaXlio5w8zOX
 hxUDE2u3oizkjBG0c3nPpcxfw2PyzrMLfX65HIkSY8twjcXL4M+p+vy8Z5yNr+rm4yNn
 JTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HARMmg9a8K/b5vAg5+2jWHn5nGF+ldiYt0bz7xqmdnE=;
 b=DWSjiKIXC/TeUNNdIZ8KtlrD+o72iOmD1s6OBLyNU+LHnTOfbVF4KOjw7oyrSNuqBZ
 mCw3c4oOSSTjdYTF9jrvKuepGiv29GJdyjEg5ymDbpYwCljrRts3s3kn/pGPAYBvo3di
 1YLn9RkDSLRngSzpoK9NGUplgJpkPvFuxeZZfzul17xcheHIcHNcphfTjJct/JxVQg+x
 gC7tllzIkb6nXh6EQX4hdU+dfhxwgxvFkLqpKUoWBOznD65J4BrvG733lUJt9SmHevu9
 rXyg4vOkLIa2kmu2z1YDsgXPp0tivpJp8pF+Hs2U3+MOvWxVHSCJOkFj4SYNLhaDzJEZ
 8aNg==
X-Gm-Message-State: ANoB5pnWdsAlTZJLswNe/VEoFHo/rlzrOzus3kcq/zCPY3eU8KnL7Gba
 8CorgMLfEEWCC/j88IhgUAglKWj7ZTc=
X-Google-Smtp-Source: AA0mqf6ofi5Ziug2zS6ibi211SCEqrDs35lHLQWBZK6VgQEsxw0C1v/30PItrefwpLD/4ByygYUD8w==
X-Received: by 2002:a63:f506:0:b0:470:14fa:a294 with SMTP id
 w6-20020a63f506000000b0047014faa294mr37579508pgh.361.1669834678336; 
 Wed, 30 Nov 2022 10:57:58 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q14-20020aa7842e000000b00575cc2f74ffsm1735664pfn.35.2022.11.30.10.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 10:57:57 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/shmem-helper: Avoid vm_open error paths
Date: Wed, 30 Nov 2022 10:57:48 -0800
Message-Id: <20221130185748.357410-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130185748.357410-1-robdclark@gmail.com>
References: <20221130185748.357410-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

vm_open() is not allowed to fail.  Fortunately we are guaranteed that
the pages are already pinned, thanks to the initial mmap which is now
being cloned into a forked process, and only need to increment the
refcnt.  So just increment it directly.  Previously if a signal was
delivered at the wrong time to the forking process, the
mutex_lock_interruptible() could fail resulting in the pages_use_count
not being incremented.

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 3b7b71391a4c..b602cd72a120 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -571,12 +571,20 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
 
 	WARN_ON(shmem->base.import_attach);
 
-	ret = drm_gem_shmem_get_pages(shmem);
-	WARN_ON_ONCE(ret != 0);
+	mutex_lock(&shmem->pages_lock);
+
+	/*
+	 * We should have already pinned the pages when the buffer was first
+	 * mmap'd, vm_open() just grabs an additional reference for the new
+	 * mm the vma is getting copied into (ie. on fork()).
+	 */
+	if (!WARN_ON_ONCE(!shmem->pages_use_count))
+		shmem->pages_use_count++;
+
+	mutex_unlock(&shmem->pages_lock);
 
 	drm_gem_vm_open(vma);
 }
-- 
2.38.1

