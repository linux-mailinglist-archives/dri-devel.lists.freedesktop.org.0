Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7913BC931
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF0689DFC;
	Tue,  6 Jul 2021 10:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E99989DFD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:12:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f17so814166wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGGvR8F2ScAF8u/HtGFmOCnX+piqwWsn45mE59SOD5k=;
 b=SkCtGPHeuhmTvncOMVLJaqGT0Qki5yFHuY5tlZMYXC+tokTzIwBjaouUq4hgNZKuFX
 ENafAPMtbfpF3K4/nUFsc1TOr8tdb5Z9MnWjwJBpyQQ/JkDc7gl/w7yMHWMCdFAVMo7n
 oNrlWYK5Yzso8czFtPOyvWA9UxExmLPu0bJXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGGvR8F2ScAF8u/HtGFmOCnX+piqwWsn45mE59SOD5k=;
 b=jhV0u1Nb2/rTrEo1Naze1KnKprUUZ7P7wxmARcvFAJfczN830gQ0OiY1EI/Mc8IHV6
 0LJVJblsenJoofhOahI8RrU8YC72lS2BK5I14iXmKZ+pyDP4Mwk5ERzGLPLPY+Gx1Vqf
 VVx0Y68VS/WD55qhPhlFkO86YwA7BepPKzkNwfFTnZPkqtM+xipgVmvrEhFe9TUtQ3YZ
 bMIjPj/FH0EXcrvB4jJ8DN7/ohOMjceNSJZckj7Pd3bYwvJ5KsL/f8rb/J+LPQpqd53T
 4vLQlCSjfJKrIfUqUS3cxCcJ/UGKBjHYAWLedAFL9molczyCDxzrduuhyzGoLC2A9ZQr
 bcqQ==
X-Gm-Message-State: AOAM530lyv8B62m7CfUH9mgxPwYuBMpgj/PFvkzlsFU2HIoUeLYUiCKc
 Nsa4RfHLYIwZeoNCfGh4WsHjrTm9T2+Wbw==
X-Google-Smtp-Source: ABdhPJyhLkHdEPxZtzbMNre3FT7La/p19I2knYbX7f9pqez+JQ6og2WfQfB7J1cY/RYvW5FL6g/TnQ==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr20398859wrs.282.1625566338061; 
 Tue, 06 Jul 2021 03:12:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:12:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/etnaviv: Don't break exclusive fence ordering
Date: Tue,  6 Jul 2021 12:12:05 +0200
Message-Id: <20210706101209.3034092-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but it probably makes sense to lift this into
dma-resv.c code as a proper concept, so that drivers don't have to
hack up their own solution each on their own. Hence go with the simple
fix for now.

Another option is the fence import ioctl from Jason:

https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 92478a50a580..5c4fed2b7c6a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -178,18 +178,20 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
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
 
 		ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
-						   bo->flags & ETNA_SUBMIT_BO_WRITE);
+						   write);
 		if (ret)
 			return ret;
 	}
-- 
2.32.0

