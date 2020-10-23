Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B13297510
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183D96F8E4;
	Fri, 23 Oct 2020 16:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDE56F900;
 Fri, 23 Oct 2020 16:50:59 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 10so1794255pfp.5;
 Fri, 23 Oct 2020 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3n/W2hBHdYFkNX33oVXA/c4AmlMUnQ6/c07ibiZgNA=;
 b=R6xegtTENd9s9cRtgkN8d2Fcnu/DqggarHuf3eV++GtmVU1V0WM2Y1/05cF4lhfE0W
 G5n3o6YcFhTZ/Zu5LiHjnEjyyqxGVP0aH8fsBfmDxImp08C0R1y3ZGq/skOJqZFya2TB
 jz4Pi+dOugOOVlbK4sKKF3lqgM0haUR4aw8ca6CMG6VnZKRnQ3+EbaUBHWAAnV1VigMZ
 6dAt2p9bsa27X/bF7oVjb691ev0jizEYw1E/KGkUDD9aPwVijwxvnLYHlJHqYscAzzwj
 of1jyhs5jjZC9JKZJHzrMX1CnHcyZ9ZCHYS2+TnQ/eREl5t72c9gfBgt4y39/KBau4IO
 2CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T3n/W2hBHdYFkNX33oVXA/c4AmlMUnQ6/c07ibiZgNA=;
 b=uFBU9jZgbbEceZ0HofXdWlvCXpMGdFFxx0A4RAvNvNwyuxXiVksLXi+Fw749UVRMqf
 zpwi72wW98uZggmiZE1xd4f1mDpMw3i/u7sL6jX/HCx3qGXYBF2FWQ9mdzNMLqt43Vb2
 yrmRt9tbiX7Kh8691KgohaApCthL+suwm7ukBURV2iG75gjZtl2oiUFuRc2XEjr0O9iV
 Eq3Fv3c7hDBTsm5VtcnHdSOzLR7uuQYW9dYPAj3Y2PnzEFmTsU+aTJFI9zIHkGH4QxAa
 +KOpeRUENJBpuDhApXJGlyidjimXP0RTaSp+i0sDYQxksGToC7bWuEvO7cF4i5XBjw6/
 1u2Q==
X-Gm-Message-State: AOAM532W9URi9NtN+XGvOWBVUZ8qEsnvoZImJv4ewfDzLslos5SxxikL
 cYWUJnHNyajpx955PyneuKbteymQOSEudQ==
X-Google-Smtp-Source: ABdhPJzIt2rBdXxh/2GoY4AOMK55pcFLFr/zrcSvKk+/BeuQVksIgw5DuPtrN6AF4BTLVGrbii/BWg==
X-Received: by 2002:a63:4083:: with SMTP id n125mr2869692pga.290.1603471858103; 
 Fri, 23 Oct 2020 09:50:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 204sm2658740pfz.74.2020.10.23.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 19/23] drm/msm: Drop struct_mutex in free_object() path
Date: Fri, 23 Oct 2020 09:51:20 -0700
Message-Id: <20201023165136.561680-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that active_list/inactive_list is protected by mm_lock, we no longer
need dev->struct_mutex in the free_object() path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b9de19462109..5d555750943e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -949,8 +949,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -992,20 +990,14 @@ void msm_gem_free_work(struct work_struct *work)
 {
 	struct msm_drm_private *priv =
 		container_of(work, struct msm_drm_private, free_work);
-	struct drm_device *dev = priv->dev;
 	struct llist_node *freed;
 	struct msm_gem_object *msm_obj, *next;
 
 	while ((freed = llist_del_all(&priv->free_list))) {
-
-		mutex_lock(&dev->struct_mutex);
-
 		llist_for_each_entry_safe(msm_obj, next,
 					  freed, freed)
 			free_object(msm_obj);
 
-		mutex_unlock(&dev->struct_mutex);
-
 		if (need_resched())
 			break;
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
