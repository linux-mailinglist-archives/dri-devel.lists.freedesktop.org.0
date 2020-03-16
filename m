Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A473186642
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 09:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8F9895C4;
	Mon, 16 Mar 2020 08:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6DC6E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 07:18:27 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id nu11so4892831pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eYiMJvzhgU8cefu9p/MQZ5kiTc4aQrMez5IEQVm5JBQ=;
 b=ph0i383Trlk3tr0BOHQ3ZTIv3dERcGn4yWxpSSs6S/wrY+6zqgZXPwiFfJHWt1FDzu
 nj0hvpHu7uTzjAZndTAYwvLRSQmpiJxAfdDCBkXGHYbGndjiiHjBeD9UXs7YMx/hSSM4
 eRvnqere1oSk7E3qTRQozUBhOK5LDOZ7ZpwGEta9Twx2/hs5Yq2prnbabIVPwok42HT6
 jE5k3QLttsVttRGloBRHySlYUeXhTCxdNEgw9W0ItWwXz1cgb/llw+sTGplvdoPS8UCG
 52onSfRLjWDZFpDzg4Oqhtlva4FaUWhPVMh2C4iXRXUQnNofg4IcO6oO969suLvkCBid
 eeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eYiMJvzhgU8cefu9p/MQZ5kiTc4aQrMez5IEQVm5JBQ=;
 b=B4sh23IIFj5LIu2Aw1LGOQ7uf1Hbe1dssodJQE9azq3vE1WUR86F42CE3+dGq7Jvtr
 +JguUMlnZpx7lFmzI5LlWrQ9zCOVxHcKUIc/QL3NNaQ6G3xKezSjs087FxF4KUQvnYwP
 BO12XOqmJjOtyDVmNH5ixJlEsJeTdJu5NEdsN8EKY3KJwppmygu7agHOWuNjvUnIkTrG
 LNKFcOczeUuEdmQjjFjy6kTGN4D5k/w4bI7RohPqxZCqTfi1gZ/ZpqJyVv8ET2qop3RV
 7XHMWfa/GKMw+FyMhmtPd0Kj8aWzOlk6bFprA+fj8TQPr4ND+Hq8F+17mpJVd+IV4bJG
 40HA==
X-Gm-Message-State: ANhLgQ2hvjaWCEAP/g9HPerutRc2BDMgSbEpxokjWdgg7pyRujCNerXt
 xzAfePSYaAI1Y/c6GWjVrYM=
X-Google-Smtp-Source: ADFU+vsyHvb9S+87dueVvHsTA4hufzgoTni9cVQgu2qepNbFJTvGvm2nK8xbbO+q+yDYBQV43X4KZw==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr25968701plp.304.1584343107104; 
 Mon, 16 Mar 2020 00:18:27 -0700 (PDT)
Received: from VM_0_35_centos.localdomain ([150.109.62.251])
 by smtp.gmail.com with ESMTPSA id e9sm22170618pfl.179.2020.03.16.00.18.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Mar 2020 00:18:26 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH RESEND] drm/lease: fix potential race in fill_object_idr
Date: Mon, 16 Mar 2020 15:18:23 +0800
Message-Id: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 16 Mar 2020 08:21:33 +0000
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
Cc: Qiujun Huang <hqjagain@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should hold idr_mutex for idr_alloc.

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/gpu/drm/drm_lease.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index b481caf..427ee21 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -418,6 +418,7 @@ static int fill_object_idr(struct drm_device *dev,
 		goto out_free_objects;
 	}
 
+	mutex_lock(&dev->mode_config.idr_mutex);
 	/* add their IDs to the lease request - taking into account
 	   universal planes */
 	for (o = 0; o < object_count; o++) {
@@ -437,7 +438,7 @@ static int fill_object_idr(struct drm_device *dev,
 		if (ret < 0) {
 			DRM_DEBUG_LEASE("Object %d cannot be inserted into leases (%d)\n",
 					object_id, ret);
-			goto out_free_objects;
+			goto out_unlock;
 		}
 		if (obj->type == DRM_MODE_OBJECT_CRTC && !universal_planes) {
 			struct drm_crtc *crtc = obj_to_crtc(obj);
@@ -445,20 +446,22 @@ static int fill_object_idr(struct drm_device *dev,
 			if (ret < 0) {
 				DRM_DEBUG_LEASE("Object primary plane %d cannot be inserted into leases (%d)\n",
 						object_id, ret);
-				goto out_free_objects;
+				goto out_unlock;
 			}
 			if (crtc->cursor) {
 				ret = idr_alloc(leases, &drm_lease_idr_object, crtc->cursor->base.id, crtc->cursor->base.id + 1, GFP_KERNEL);
 				if (ret < 0) {
 					DRM_DEBUG_LEASE("Object cursor plane %d cannot be inserted into leases (%d)\n",
 							object_id, ret);
-					goto out_free_objects;
+					goto out_unlock;
 				}
 			}
 		}
 	}
 
 	ret = 0;
+out_unlock:
+	mutex_unlock(&dev->mode_config.idr_mutex);
 out_free_objects:
 	for (o = 0; o < object_count; o++) {
 		if (objects[o])
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
