Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE92E1B35
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9786E918;
	Wed, 23 Dec 2020 10:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC0689B27;
 Wed, 23 Dec 2020 08:04:04 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c12so9910299pfo.10;
 Wed, 23 Dec 2020 00:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YwhKeQ95NsQxO4i1B4M2YvP1DI+YaSx95x3VhWlw4c0=;
 b=Z3p9ls8iU7RsPuqa6E0pHKrw+VfFahKvI/G4pCscJDgbZD3I7rVQe4mY4hVO4k2P4B
 ltT6ecB0vN9YE3JcXLuhsbtB826TEKOYWlE2QYC7ah8pld+3MGvaNa8fOGjdnpelC5Z+
 1p8ipojt0lDJeBVCq1oPg5Or+WPyLlsu5PbtGSjdZ3w71UZa7AAPemC1GAtAvtyw4J16
 Eso7rJ9xlH61h1rY5eZrVSM2vlgZNx3w1kLwRDbPHOYy1cRcH/11W+PyuXIeurEnime3
 uo9Yz0Ng0muKjkxb3cmyitn8I/RGln+wot+TEeazojATMxzCh8BBfXaOVzQePegh4He/
 a9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YwhKeQ95NsQxO4i1B4M2YvP1DI+YaSx95x3VhWlw4c0=;
 b=XbsWV1tnWtSC9lBWv3lFAYBC48MwUz/q5ttBqsvcuah7qX0MK/Xgjfcmy8hPDy8hih
 fXRvAtTOR8scHiSOwCLJtq6fxQWewf2o0t7Nbr96pDHQcfr2MwJPb6HudpnapnDN6OMa
 EDuI0M7bZDtcEe4tf3Txr/EiRAH/1UsyLBnBoec3APyxeuyu4Onjh9PuNx6jicvbZOgy
 5f5/Cagw0YgIwZ+BK803WNsVg/P0HH64ep+KDAHYmZrX6TrO4s2UUny+++ukZNErzAd/
 1SeIbciMuBOAbotNDv/3+MWy9RMPO8SKf9bTh6Xqgel+AsgmT+1TMEp/Vc9chnVKq0er
 1NTw==
X-Gm-Message-State: AOAM531eZd72sKUuJAY2k45Oj/kVt79A1mHNY4lQmsf7eO7ovRWlf6zL
 ivkiZfV0U30OIcNIWwGhOBU=
X-Google-Smtp-Source: ABdhPJym+vMqd6iwnr4LOe1QbzeKgsfM8RMzZvjWO1mt7guqxTu6K3LZTyO/2YtpSyRGzypACKxcbw==
X-Received: by 2002:a63:4c4b:: with SMTP id m11mr23409784pgl.20.1608710644608; 
 Wed, 23 Dec 2020 00:04:04 -0800 (PST)
Received: from localhost.localdomain ([122.10.161.207])
 by smtp.gmail.com with ESMTPSA id iq3sm21735654pjb.57.2020.12.23.00.04.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 00:04:04 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nirmoy.das@amd.com, luben.tuikov@amd.com,
 Hawking.Zhang@amd.com, le.ma@amd.com, yejune.deng@gmail.com
Subject: [PATCH] drm/amdgpu: kref_put() may not require a lock.
Date: Wed, 23 Dec 2020 16:03:54 +0800
Message-Id: <1608710634-5118-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kref_put() can be outside of mutex_lock(),and use amdgpu_ctx_put()
instead of kref_put().

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 0350205..af26ec2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -282,6 +282,15 @@ static void amdgpu_ctx_do_release(struct kref *ref)
 	amdgpu_ctx_fini(ref);
 }
 
+int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
+{
+	if (ctx == NULL)
+		return -EINVAL;
+
+	kref_put(&ctx->refcount, amdgpu_ctx_do_release);
+	return 0;
+}
+
 static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 {
 	struct amdgpu_ctx_mgr *mgr = &fpriv->ctx_mgr;
@@ -289,10 +298,9 @@ static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 
 	mutex_lock(&mgr->lock);
 	ctx = idr_remove(&mgr->ctx_handles, id);
-	if (ctx)
-		kref_put(&ctx->refcount, amdgpu_ctx_do_release);
 	mutex_unlock(&mgr->lock);
-	return ctx ? 0 : -EINVAL;
+
+	return amdgpu_ctx_put(ctx);
 }
 
 static int amdgpu_ctx_query(struct amdgpu_device *adev,
@@ -439,15 +447,6 @@ struct amdgpu_ctx *amdgpu_ctx_get(struct amdgpu_fpriv *fpriv, uint32_t id)
 	return ctx;
 }
 
-int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
-{
-	if (ctx == NULL)
-		return -EINVAL;
-
-	kref_put(&ctx->refcount, amdgpu_ctx_do_release);
-	return 0;
-}
-
 void amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
 			  struct drm_sched_entity *entity,
 			  struct dma_fence *fence, uint64_t *handle)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
