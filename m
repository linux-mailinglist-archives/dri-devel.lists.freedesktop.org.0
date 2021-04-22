Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BB3686AC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 20:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7866E59B;
	Thu, 22 Apr 2021 18:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD936E59B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 18:39:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g17so54004960edm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xeakXfmAJOS4QPn/pFkDvo7FQKYVhQEklCs4O1KqYzg=;
 b=Te3StrIurIlXM7JD0tojCAKgXyZmenFjxEvny1HGsbiD5E7hyVbsxG4Aj4pxpRpPbD
 +PyuBGAcSh0IeQpGQpaCI2OSd64pl6ayBmKaG465/3kmXYrlfAiDoAKL6KvwhuAvJV6M
 OxiF52j1YskkcEHtYxLIp8dTvkQRBC8VVMqbeSeL0GSd71w7kZdhCFditMGTuHXjjtwP
 qtWSM4YSG/jU38tDcjNXFFaZk7ER4QPrPFg/GfIJqjF6G6vP3OA+Hj4lFbIMh47fwYz5
 gE+YI74DF3vdpQkbZG1jvWZatfWYnahtIfpib4OazwOIa8IN4a1KsfV24ReaCy1o5802
 bnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xeakXfmAJOS4QPn/pFkDvo7FQKYVhQEklCs4O1KqYzg=;
 b=pG++Hbn9pFLyUenFewNbLhCd8e/zoBCwmImZju9Wj+vSaQyKD1Z8vB40aX78gbq8cS
 QSXBOivCngg+z9RbTy+2oEAnvJejUyaSROHklkFUaN5ecYC5TC0WCuYHweJlnQ2CO3FU
 md21dMEvYNY6/trGsPRGFy4JJojTcNI5QsSuk4yw3QFdLEGNsPBl1XK6UpSfM3YXstox
 8cqu1ge+aPb43R8hWTbqMEHwaRlAjjG1QgbOdCeoWTxZIfGb4ecAKB8Oo1JDk1o1IiHc
 wpUHzzYyin2PWvD7sxjres5WElTpe4IHetrGmZk8Oq/q1LM9mxI2QaqqHnbmHuNS1mrU
 ytMQ==
X-Gm-Message-State: AOAM533qbs55vQ4U0YDKEE4j5/6K+Cawb1u/zhFxa00qELg8or0PteqF
 +McMbTygMDrD5Mm56RGlMtY=
X-Google-Smtp-Source: ABdhPJyrkgyuKenetMv/b2b/dzOblKLM356T2egkkIzB73xGh5E19RA5LUF8Sg+TyrLsgOrN2y5QIw==
X-Received: by 2002:aa7:c7da:: with SMTP id o26mr5636731eds.244.1619116766695; 
 Thu, 22 Apr 2021 11:39:26 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id c12sm3152896edx.54.2021.04.22.11.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 11:39:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2] drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_lock_all
 with drm_modeset_lock
Date: Thu, 22 Apr 2021 20:39:19 +0200
Message-Id: <20210422183919.14959-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_modeset_lock_all() is not needed here, so it is replaced with
drm_modeset_lock(). The crtc list around which we are looping never
changes, therefore the only lock we need is to protect access to
crtc->state.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---

Changes from v1: Removed unnecessary braces around single statement
block.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 671ec1002230..adfeec2b17c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1439,17 +1439,15 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 	if (amdgpu_device_has_dc_support(adev)) {
 		struct drm_crtc *crtc;
 
-		drm_modeset_lock_all(drm_dev);
-
 		drm_for_each_crtc(crtc, drm_dev) {
-			if (crtc->state->active) {
+			drm_modeset_lock(&crtc->mutex, NULL);
+			if (crtc->state->active)
 				ret = -EBUSY;
+			drm_modeset_unlock(&crtc->mutex);
+			if (ret < 0)
 				break;
-			}
 		}
 
-		drm_modeset_unlock_all(drm_dev);
-
 	} else {
 		struct drm_connector *list_connector;
 		struct drm_connector_list_iter iter;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
