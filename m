Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E5292FE1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210DE6EAA3;
	Mon, 19 Oct 2020 20:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DBC6EACD;
 Mon, 19 Oct 2020 20:46:15 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g29so700406pgl.2;
 Mon, 19 Oct 2020 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=22Jlev5gAzt2xdCMyh1bV9HE1I+PJVS0r6/a1b11meI=;
 b=F/JS5BSQUzZBgIosKtn3TjchC81I0HCUqgLhuGxddGfI29vzgf0/Ac+CvyfgjYVX7Y
 9fnF/gV2IXCYc/v/KgfMuGWeKiO5LNpRVkzAIdMRgZsQCXcqbakNFumug8d7X4GbaqYA
 0v03SCROmNrVe/c0el2xA2+fhPkTmMso332FVWDaggSahQQnMCzm69dluPdhPWQ2fxtG
 FAHuK740cXxPj6WXkaHi0e8eBpUTMpb+LolIpkW8Gs6Ymm3X2WaYzuDs2JM6w0+pc14l
 V2DgxHZ9q0CNDsabOz/bjoQq538V1ErhcL75B+/up0bZSyblJgUWzzeRSA3BQh/stxj7
 Y0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=22Jlev5gAzt2xdCMyh1bV9HE1I+PJVS0r6/a1b11meI=;
 b=thAmU7aFf531OcV6epidGH8213aV/EV1vz0e6kXp676gxZl48ahBtt8+zoicvfRuUl
 2C5mwthzTUhb3MYjK8M9+y4ZOzHpMxbgXozxiGZ10EW3BiH59fQJlcezoybrhzAX8tKy
 KBKUqMOV4fHGVLfcIK9H1QgCkF9cocj+hAGpjNEg7tmAXt66a23SeTYyOlfpEBObIph+
 /hWArIvtgHCy1Pahy9+bYBymM4zCdF7w07ek7jU41sDrOe9G7xpMx5tCovh3lnM16XPh
 d7t/It/2I826YX8woGUAG4TilUUsVHhLdlVE5CbAHdB5G3H4ZRxEiQ+vZQ7V5a2/baIc
 nacg==
X-Gm-Message-State: AOAM532yiiMqKoghqyA6+jXRbMoC+ybyhZ4LnRatAjsp9T5e2uKAuX8b
 uCEeT6Y3TJq6ZBpvn7lW6v/jEE/q/CbXqA==
X-Google-Smtp-Source: ABdhPJwdzx2KBhZc3edpmg8ERbRwwRTRFA0QkUXk+3oFfZHlQ54Q/dXufyuu8YqMSWhzmvx0D3JrxA==
X-Received: by 2002:a63:3fc7:: with SMTP id m190mr1281127pga.293.1603140375067; 
 Mon, 19 Oct 2020 13:46:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 s20sm590362pfc.201.2020.10.19.13.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 19/23] drm/msm: Drop struct_mutex in free_object() path
Date: Mon, 19 Oct 2020 13:46:20 -0700
Message-Id: <20201019204636.139997-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that active_list/inactive_list is protected by mm_lock, we no longer
need dev->struct_mutex in the free_object() path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e4876498be47..af1abddca78e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -949,8 +949,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -987,20 +985,14 @@ void msm_gem_free_work(struct work_struct *work)
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
