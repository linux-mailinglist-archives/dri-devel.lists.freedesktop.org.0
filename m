Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA073B94EB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C316EB5A;
	Thu,  1 Jul 2021 16:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6415D6EB5A;
 Thu,  1 Jul 2021 16:54:41 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id v7so6674174pgl.2;
 Thu, 01 Jul 2021 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hk4Axk4+PmQOI0kATUy1MHuqhx98yhhLacEznPnufxU=;
 b=H5rk+QATHNu5kWtOMCyeQz/AqNtlWNfFVGjFlMSoUBVtW225R0Q/PpLFURKeg94mhQ
 rCIY/kSGGHM+x+dNKOFQIgDVfOKr4dw5QWs3JWWI8vMeEOvEmNyN6sbCXGx7gVpi1nAU
 XPtNr1lZa4yWS+MxXHtIvRzzjLp43ZnK0c7Oqo7FgyxxPaxJiNnXTyTWvsEvN3i9y81F
 FsoBj0sgLAWBaYINyfki4KJxQoGpxQfYTrRmFT1R7lA4cMtPbMbS0OILbsjFnU10owY7
 rj2vUNJz4nHI7wqLayeYTaqLJG2U8Rt/ykXrT4Rqt6dvDc3/vJaVg83yUHe7sLMpYFxW
 zrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hk4Axk4+PmQOI0kATUy1MHuqhx98yhhLacEznPnufxU=;
 b=UUQXc8ckej7CJ9vtrI7b0KUrduerrpIvE1Qkajd3aVoI55KZTl35etkLE7pTJM1Yz+
 U/yJLCwT/H+OQz0hsChaQzA5TYvaFGDnsAg0EcIB9+f4kFfNNbBUNe2UjiJgv1EuqRvu
 fsfAMM/zgsGt3LtKmxcghUenitaig5hRwV1u5yk7+5MZbbltCAYMbuucfOw+piuGzMBc
 INzD+iF7iClHEhtN+tbJLeJ4j9QfX0RKZMsuw0RYtKfIm9+asQYp3BVfckaPpO5FkBYI
 kA6laGRNmXUSX1pfwAY6cmgjMkOhcaTBw23N6p5ORSmNxXg245+z1XJ7Wju4CQ/OpuEB
 rGKQ==
X-Gm-Message-State: AOAM531+PGx02v8BDFaEfMvltaUgKBcEvCrI0thf1IHWd7/+sQYAG/8V
 mKp/C5zoWhTLCQuQeUYELDE=
X-Google-Smtp-Source: ABdhPJwcM4liZfM+/eMxIjvaqJ/4EedP/LLrwHGWzOdveO0AGD90Ae9rpc+eu//8ByUsW1tLKWLiGQ==
X-Received: by 2002:a62:8847:0:b029:30d:4c44:7e99 with SMTP id
 l68-20020a6288470000b029030d4c447e99mr947138pfd.64.1625158480703; 
 Thu, 01 Jul 2021 09:54:40 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:54:40 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v7 2/5] drm: separate locks in __drm_mode_object_find
Date: Fri,  2 Jul 2021 00:53:55 +0800
Message-Id: <20210701165358.19053-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch, _drm_lease_held will dereference drm_file->master
only after making a call to drm_file_get_master. This will increment
the reference count of drm_file->master while holding onto a new
drm_file.master_lock.

In preparation for this, the call to _drm_lease_held should be moved
out from the section locked by &dev->mode_config.idr_mutex. This
avoids creating new lock hierarchies between
&dev->mode_config.idr_mutex and &drm_file->master_lock.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b26588b52795..83e35ff3b13a 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -146,16 +146,18 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 	if (obj && obj->id != id)
 		obj = NULL;
 
-	if (obj && drm_mode_object_lease_required(obj->type) &&
-	    !_drm_lease_held(file_priv, obj->id))
-		obj = NULL;
-
 	if (obj && obj->free_cb) {
 		if (!kref_get_unless_zero(&obj->refcount))
 			obj = NULL;
 	}
 	mutex_unlock(&dev->mode_config.idr_mutex);
 
+	if (obj && drm_mode_object_lease_required(obj->type) &&
+	    !_drm_lease_held(file_priv, obj->id)) {
+		drm_mode_object_put(obj);
+		obj = NULL;
+	}
+
 	return obj;
 }
 
-- 
2.25.1

