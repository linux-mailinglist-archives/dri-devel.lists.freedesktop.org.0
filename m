Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC214FD48
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 14:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5FF6E05D;
	Sun,  2 Feb 2020 13:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754856E04B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2020 13:21:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so3591855wrt.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2020 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHVArCA0NkObFToWw2KI8ZjIcDBFbLQ6CdfkkiPE81Q=;
 b=TEmmVDj0++o7kGG6MrcVufIc0rC2Ax9HAq77FmojxCjZjUSr5dqABRzdgmF8NGVnHu
 js8FDD/Qp4TZdq1MNW36F0UpJQl6GLudC3zw+UVQ1VuV17JsX3oWa1ozfFlo8pOyQGFg
 8KHsNNsXC6AxkKPkwLq0kkIuN1xrz3F5pttoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHVArCA0NkObFToWw2KI8ZjIcDBFbLQ6CdfkkiPE81Q=;
 b=UzMo1y4UGqN/5zJZqT/bVWtxJgB7/VVIYL1eYUOgogeRv93z0aVdk81coHchT0DvL1
 xfIAaa/wjNbSwEbiw/QX2WlPy3TBaXnIFlaOkM4NGRpzvZbaxoGSaxDMqd3+fZDwMj93
 V3qEhH/YCsmCZrxvvTbhXYoVfVNDMP2omk6ISiBWEsYXEmicmxRHcZigxCvNkGGoFSmE
 Cur/xY1jrtAzROLoWc2M9/UMewpMffDo+Y4Plb6gn07D/+6MK1UNf2xFjuGpO1sASC/v
 KTntnMQxngIV5PwIeNCUuIYj+Fk2fjvUVounjZzWjf54a1OE4tr8honFdIohCVFdM7lr
 GUjw==
X-Gm-Message-State: APjAAAXz4XO1W08jbJD5+xysuydDyAJMxZDb06MvDQrryMvZ9JmhW+/G
 +RPHaI7WCP+hHFfLjm2hljQe6bvKFtCQiw==
X-Google-Smtp-Source: APXvYqzLITzGUKwVkpTTZzU1yF022BgipZxUFF6BYrWBoVFzhnOw14rw22j/lRkTRORr3x8FXrIIag==
X-Received: by 2002:a5d:4052:: with SMTP id w18mr4250553wrp.112.1580649698793; 
 Sun, 02 Feb 2020 05:21:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b18sm20994530wru.50.2020.02.02.05.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 05:21:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vgem: Close use-after-free race in vgem_gem_create
Date: Sun,  2 Feb 2020 14:21:33 +0100
Message-Id: <20200202132133.1891846-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Rob Clark <robdclark@chromium.org>, Hillf Danton <hdanton@sina.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's two references floating around here (for the object reference,
not the handle_count reference, that's a different thing):

- The temporary reference held by vgem_gem_create, acquired by
  creating the object and released by calling
  drm_gem_object_put_unlocked.

- The reference held by the object handle, created by
  drm_gem_handle_create. This one generally outlives the function,
  except if a 2nd thread races with a GEM_CLOSE ioctl call.

So usually everything is correct, except in that race case, where the
access to gem_object->size could be looking at freed data already.
Which again isn't a real problem (userspace shot its feet off already
with the race, we could return garbage), but maybe someone can exploit
this as an information leak.

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hillf Danton <hdanton@sina.com>
Cc: Reported-by: syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Eric Anholt <eric@anholt.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 5bd60ded3d81..909eba43664a 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -196,9 +196,10 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 		return ERR_CAST(obj);
 
 	ret = drm_gem_handle_create(file, &obj->base, handle);
-	drm_gem_object_put_unlocked(&obj->base);
-	if (ret)
+	if (ret) {
+		drm_gem_object_put_unlocked(&obj->base);
 		return ERR_PTR(ret);
+	}
 
 	return &obj->base;
 }
@@ -221,7 +222,9 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	args->size = gem_object->size;
 	args->pitch = pitch;
 
-	DRM_DEBUG("Created object of size %lld\n", size);
+	drm_gem_object_put_unlocked(gem_object);
+
+	DRM_DEBUG("Created object of size %llu\n", args->size);
 
 	return 0;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
