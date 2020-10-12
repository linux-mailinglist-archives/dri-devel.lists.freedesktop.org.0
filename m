Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620D28ABC4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289B16E210;
	Mon, 12 Oct 2020 02:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD86E210;
 Mon, 12 Oct 2020 02:09:32 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c20so1528751pfr.8;
 Sun, 11 Oct 2020 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/TFR+2oS8aXAXQSVrSXxUZHArJIJxnLPvbb0HwdP28=;
 b=T5eHSyohXJkOLlo42v+Hi4QsriRdqy23BLoyzBTOrjdq9FBsd41nbdePj0h5LRzXHa
 08YC8PkYjvPxlIHrFUnl1RfWL2SRs9qszqeM7CyIrPnUr6YHKypPLYU0KgnCaRc+rDd2
 JyD3DJvFrOdFXEaYedVspZh4cPgjq1ov2o/tFLC/H+aSQkh3W3LSFQcq8DsyQCnUMeiQ
 gCnrCSQcU9/rfwfJnaRW9iPRo/3JF870WsYTTmbf4rtUuzp5vKqn2Kv++svKwGm9kJWC
 et1wlh9pMBw5cYhdS2hqhx/Sksmk62iupSXXf1b4SVbpOtZUEhlPZ+KumNkcxYg/DyDo
 Ri4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/TFR+2oS8aXAXQSVrSXxUZHArJIJxnLPvbb0HwdP28=;
 b=A8Pe4A7oeDBe+bedQ/Zd9LGySGdWIO3AhsNMNV9jTtXidZVaXQlUAh5RfKF0+aAcgA
 sk2eHG3hV8UztGDW7c4wEzbKWCtqIr/T8W2kRzFDnBiBS/JPOrocfSzDRGXwglaOtmRe
 +DJ0QMjcBUsDbsRuo7vZeu2/qhORTBbq3rJQNVUEeXEUW+iAjbS8RSZa5s9HFBQSXWEk
 57mMTB5IQIuW07LNq+UwJZC3PXjXRmsVEuwGdBjZGIiOLJs6c3nLn+zvqTCobfLcEpqj
 XZDP0qNXdhHUL/o1oG0jP6/rQ2o6WjgBKlbtZrSVMjR8p5Sd90BgnhhDYqIF9BUkFuo2
 LvYw==
X-Gm-Message-State: AOAM53280c6ISY/vnq142U+pgQEslJKrBFfsgErztphhRqDL/Mrt5Q1I
 FA0CgxiCiUfim4ae3/55rlCin1a7+AMKWJmE
X-Google-Smtp-Source: ABdhPJxaWc5G/1wsqt+UdJIQsybc5F/w1jq2ins3zBia7tRzGL51TsgYMNfBcPQwZZHYWheq6MVeIw==
X-Received: by 2002:a63:5914:: with SMTP id n20mr10707355pgb.69.1602468571975; 
 Sun, 11 Oct 2020 19:09:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 fa12sm12653649pjb.25.2020.10.11.19.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/22] drm/msm: Drop struct_mutex in free_object() path
Date: Sun, 11 Oct 2020 19:09:45 -0700
Message-Id: <20201012020958.229288-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index cdbbdd848fe3..9ead1bf223e9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -934,8 +934,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -972,20 +970,14 @@ void msm_gem_free_work(struct work_struct *work)
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
