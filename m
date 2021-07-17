Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406233CC617
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34F56EAC5;
	Sat, 17 Jul 2021 20:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41DE6EAC5;
 Sat, 17 Jul 2021 20:25:22 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id a127so12401943pfa.10;
 Sat, 17 Jul 2021 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/awU2N3myQptf0uqNzzrSWUhiz408vliBw9X+4I5S6k=;
 b=G+pKWLoZWzEXiW9Tf2ZyRTTszM+6/ldPsDNf9bkXRtMUYkEIBu9NinJBpBq8nOlJu/
 DzEmff5efg/iFbl2mfkG1KAqyxsvkWKTxTZA+eSPftQhtOcH9uptoyoOMXECT2uqoZMy
 dtZXXzwHKLyVYOZaDR7lMfvykSw4PYdRs+KKQZbWcktROnBZO2URVMHvBIA3Di8RNkga
 reS2xUs8vzkBLL/9oleq4gNv2oeqEtxF34Zc8eq4nA4+e+ww0Y/cSNV5eBMtfN0DDe4N
 HvsJmP728ENSS8OxNYfhcyaimp40VCwH7faZpsficBuTA6q7oGR7t/7hoK9dhYaIpLNf
 ir7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/awU2N3myQptf0uqNzzrSWUhiz408vliBw9X+4I5S6k=;
 b=qj6fumuKQY6MD+KzUuuFJormgLjo+XrSXCIaxasHNDBvlLNr0NrW1uZwDz1NyTUFef
 6wIZyIodPAv0bqxrzPdzgCpESHcG8dB5R6FsmzdCceybNk/8WxNaj3QSxO0XBqfjvDxE
 A0mCT4nuRFy/ayNPSsuqStnIFx/s3om4JHfl/sxjO/bTri3rxcuz22o0i03wWFSF20/7
 XxnEEI3TCMZrBR6lw38iMf6Vq4DCp8VLDJVTGqCanJ9rH477ZgEemMvFULlO6KI8/A+6
 Irnqu9SzsdyKY1Brbeprsr8gJJxxDuicM3gJSpSlU1SuLc7ZISrRJG2qGKyyEq4Zc36o
 yQuQ==
X-Gm-Message-State: AOAM5338D0CPdjidLaJrI4U/sJ/WZGqfqY+2X/L58NDgsEvWECBfkmDd
 y/mf19PDm8ak+zW+JHdV/P9ml1H6Sw2Tyw==
X-Google-Smtp-Source: ABdhPJyRFYdP/+zPVj6TMO22FwqlxVRZYcChWjdvdl1Wwqv2QJcWPavOP5m4JY1W3XCCffkN37vdMw==
X-Received: by 2002:aa7:81cd:0:b029:329:fcb0:1b44 with SMTP id
 c13-20020aa781cd0000b0290329fcb01b44mr17048343pfn.5.1626553521718; 
 Sat, 17 Jul 2021 13:25:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 w2sm11365193pjq.5.2021.07.17.13.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] drm/msm: Small submitqueue creation cleanup
Date: Sat, 17 Jul 2021 13:29:04 -0700
Message-Id: <20210717202924.987514-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we don't have a gpu, there is no need to create a submitqueue, which
lets us simplify the error handling and submitqueue creation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index e5eef11ed014..fbea6e7adf40 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,12 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!ctx)
 		return -ENODEV;
 
+	if (!priv->gpu)
+		return -ENODEV;
+
+	if (prio >= priv->gpu->nr_rings)
+		return -EINVAL;
+
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 
 	if (!queue)
@@ -73,15 +79,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-
-	if (priv->gpu) {
-		if (prio >= priv->gpu->nr_rings) {
-			kfree(queue);
-			return -EINVAL;
-		}
-
-		queue->prio = prio;
-	}
+	queue->prio = prio;
 
 	write_lock(&ctx->queuelock);
 
-- 
2.31.1

