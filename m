Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671D4EE2DE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8010E3E7;
	Thu, 31 Mar 2022 20:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E12D10E3E7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:47:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h4so1338505wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OaigAmf9HLJxa16DMsmAOftU6jO0cKv4WD1sNiYt+HM=;
 b=BHVQFvupc9m/eDyIV7I1Jubm4zS9XomLiNbx4OEFbP4hbJdz4uBMQBLgCPjmlG6Wy0
 hxy3FhF9cFFtVXLr4lWhnEpka2yWwKsR1rUzGawiduuEF/ei0aBiX2D0UbzZXbGqT2Fj
 HT32sRFN7+YJnjiNkXvHmxejWV80YImoIoVDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OaigAmf9HLJxa16DMsmAOftU6jO0cKv4WD1sNiYt+HM=;
 b=bLqS6adRjajgiz/8Pof8odgE7raIkPlU5qOLhfYFPZIy9znFlj4YSHBlb2WO49DbDB
 YIE3KAPwOEET6CyXpWNBSDCEcDqSyYgdYsnjyGwZgkl3uyUF+6vZP9vRklUAHx7nYdMQ
 6VMCPGiOtmnpZW72xIiBz3amzPtWUUAXExH81ioJn6/oq9wKg1ClIfJeqdUpPF8e1F9w
 4Lo69ujPPxQipbwqro8r2ff+sxD83KeBAcD4vQ8WrggxcZHU0VSNhFMnmVq8AAWsrRAj
 kCFXJBHJlkkd4cmwCMGVmT7RwlGCbCqgyW16KEZOmQkGSCGGTcZ7C4CKwOON81FIK5iz
 V5IQ==
X-Gm-Message-State: AOAM533bHf40Gd/Idpos4xRp46nXKrema+husPmIveDMjlyglCMkG1YG
 vWmeXXSLqKyeYO+UlyAKz+GnF2m5jS3Hd7LT
X-Google-Smtp-Source: ABdhPJwHFf4/uz1nE9SiH+iiaEVhOnoMTbI0bc1+dm7eOmTVB+KJXTtgjTX3Y21nfonb8wLruPkM8A==
X-Received: by 2002:a5d:6092:0:b0:203:f860:a84 with SMTP id
 w18-20020a5d6092000000b00203f8600a84mr5323914wrt.160.1648759618793; 
 Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600018af00b002057c72d45fsm480319wri.77.2022.03.31.13.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/etnaviv: Don't break exclusive fence ordering
Date: Thu, 31 Mar 2022 22:46:51 +0200
Message-Id: <20220331204651.2699107-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.
Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but it probably makes sense to lift this into
dma-resv.c code as a proper concept, so that drivers don't have to
hack up their own solution each on their own. Hence go with the simple
fix for now.

Another option is the fence import ioctl from Jason:

https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

v2: Improve commit message per Lucas' suggestion.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 5f502c49aec2..14c5ff155336 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -178,19 +178,21 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
 		struct dma_resv *robj = bo->obj->base.resv;
+		bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
 
-		if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
+		if (!(write)) {
 			ret = dma_resv_reserve_shared(robj, 1);
 			if (ret)
 				return ret;
 		}
 
-		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
+		/* exclusive fences must be ordered */
+		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
 			continue;
 
 		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
 							      &bo->obj->base,
-							      bo->flags & ETNA_SUBMIT_BO_WRITE);
+							      write);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

