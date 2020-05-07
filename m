Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42881C93E5
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6C36E9F6;
	Thu,  7 May 2020 15:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2968F6E9F5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:10:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so6960777wmk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/O1Nj8qk8sZlH0a3oHiSPbMbrBJi7rrOKK+IKdDEQyU=;
 b=r4i9d3/i0JWokryH7xquxYPlVg2IMp0ojsuoT+DVxHeNC5cRfgmlUxl/dZdizqT2Gy
 wzROJm5e6117RxKMm7b70/077eJv27PucgI+UNozIjK2o06unU74cTYePmSW/AAUPr0s
 kQ9vv8B/n+eDcBPJw2XC056FSj9lvYQdl0Wafcplrs53shpJGWgntSuvcHn5pvHSy6pn
 wdi8eeefGyXuqxymZ/6+9lQ9/F1/1ipVKKRI2As5mPqI7jQpVYkKbYxYAGf9+rzmaiTV
 WB1Tk0iG8d8og2NoBuYI8ebJx+6bejHdDuJ2SYHiHL1QvVScTugYQ6kQ+QtDb1dVUkUu
 6zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/O1Nj8qk8sZlH0a3oHiSPbMbrBJi7rrOKK+IKdDEQyU=;
 b=HtX0VETJCFDPS4GtGqkkwjPftgnvdPeAga5sPx7nI0kuUqtTAiKxJDG57fFvRKSYoL
 D/TUlqCre7lJUfwQZVNUVk+SdpT+Tlkqdo6zThcOjgGLXjVTBagMiNWZAMVxmgDt/2W4
 o2r0xa4LiKuLS7YIXM3LkjJb7Csx+eet7/0joL+Qdgkdx083rO/+ON2VTi06YvKfDcdi
 X2kvwNPb2Tut5jcL/DRx7fTTBwmaZpl9CRMBld3JIJhU/hl/toO24WxrUqV9DPFbC3zq
 kjc3F4Spabst8++aURpsrZNkco2mNbLV2m9jQ5miSB0qf3anqqrDIONZKl7rWuAIfRbb
 iE6g==
X-Gm-Message-State: AGi0PubPvb7+2p4QzNj4K2BWPdG/MlJNHPx0vmodsyvHrmOT1iHr6Xnt
 1FA9RnnIZksxWvOvYCGW6e4Q61Xj
X-Google-Smtp-Source: APiQypKl7fLiH+FGcphXVeI6GrOlhfvLrAzMxKZDXEvurZQkIDIxR02vuKrzvbrWZnqXPnWOGpc15A==
X-Received: by 2002:a1c:8049:: with SMTP id b70mr10845194wmd.162.1588864253523; 
 Thu, 07 May 2020 08:10:53 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:52 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/36] drm/gem: use _unlocked reference in
 drm_gem_objects_lookup docs
Date: Thu,  7 May 2020 16:07:48 +0100
Message-Id: <20200507150822.114464-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Use the drm_gem_object_put_unlocked in the documentation for
drm_gem_objects_lookup. The locked version of the helper should be used
solely by people who know exactly what they are doing.

Should prevent issues like ones adddressed with the next patch.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e13023..918d1ba25f63 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -690,7 +690,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
  * Returns:
  *
  * @objs filled in with GEM object pointers. Returned GEM objects need to be
- * released with drm_gem_object_put(). -ENOENT is returned on a lookup
+ * released with drm_gem_object_put_unlocked(). -ENOENT is returned on a lookup
  * failure. 0 is returned on success.
  *
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
