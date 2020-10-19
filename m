Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E9292FF0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5936EAA1;
	Mon, 19 Oct 2020 20:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B596EA9A;
 Mon, 19 Oct 2020 20:46:24 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id y14so668920pgf.12;
 Mon, 19 Oct 2020 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lZOmjAfebeIR7qmEAaLdEquc4ZpzVD3xby9O6rpIYDw=;
 b=KaeucAx9Nj30YybE6s+Jf6uDf6b1cN+oLUXUan8AmuAChdfmpnDNN1NSm47rlazZtF
 TBpVKIftFGFBzbv2LbvpRLD23lBjLepiq1T866p9/tWxlECEVBK/WvA4cgNmQfY8dmlD
 xV5pdA1EwPp0n1zQYbcGQ8ckG+Ft4AIz7E6dTP0kynmdiEq5sElCaHk3uA7Lu0Lv1nal
 hUG3tZSSTuZMPBvcjOjSssYMfINLT83yU+s5ZWqsxJm+IDHy0/7yTy0cL+2dRxLg1VF+
 f6T11cHukNtctrIXRNDwmu99wPM1xlvZ1YghdQySzICISN2fTLAC70HhlIbDTD3ECEbM
 TbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lZOmjAfebeIR7qmEAaLdEquc4ZpzVD3xby9O6rpIYDw=;
 b=JGivAQx1LvNyvjiAExQRKwXmWs53Qh0ug/M5OBwZgkxMfJjw0Aa4rvbH6x5ZcS63Jp
 4bYiRHxyq7JNDhWAHR2o/f4Z5EFbkW17OyT7lMGdkMZIexkLy4vjWZ1x+1/puzrQkdtO
 j/W10Qny/Awjn2BAP6aS12WPVPAUUp8sacCAZqKC73YcCvxCRwW+1JyZLnMU4REwpBAZ
 sa/uO8020ggUsCz32+u1nQ0SH9/ahbFstHDphC4YPM07fdMeBrZ8mWrzMYpTINckSFec
 XPiloBwdop7QTpA1aCwyad8KEw/0JR5dmsqC7l/mPenvTV56HSa14qQkZ6aHBX6vQh6C
 16Ag==
X-Gm-Message-State: AOAM533eIQNoFEB3r12b/rzK5eyZS0/3NsgtrZjwPXUKyPcovOF+VGNr
 JvK8cbB95kOCOghB5Z9qeZ5poBD4fseNPw==
X-Google-Smtp-Source: ABdhPJxTFXUNhuydkPVXKdX4h4Tx8iM7i4oIj42HJR551i80t3OhePRoJxTyglW8CodaOQ5oAL6aQw==
X-Received: by 2002:a63:1a64:: with SMTP id a36mr1328463pgm.153.1603140383538; 
 Mon, 19 Oct 2020 13:46:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u15sm582027pfl.215.2020.10.19.13.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 23/23] drm/msm: Don't implicit-sync if only a single ring
Date: Mon, 19 Oct 2020 13:46:24 -0700
Message-Id: <20201019204636.139997-24-robdclark@gmail.com>
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

If there is only a single ring (no-preemption), everything is FIFO order
and there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d784e97f233f..96832debc3b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
+	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
+			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
 	if (ret)
 		goto out;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
