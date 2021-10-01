Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78841EA8A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1D96EDF6;
	Fri,  1 Oct 2021 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0926EDD6;
 Fri,  1 Oct 2021 10:06:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso6344836wmd.5; 
 Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=ggVb8tFWsym5tY2UFXYnp5/+wnnhdTTKklDhpXqU4dN2UZhBEMrcl7xcSW2VYnX7is
 umf7OVYBxPyMxyUR/5R2qTniROZiQo6IJrBeun7y5YjQZ/wYsR8EHazV7oevOeyxLRaA
 ilEl7koiJasAEhERC/Sd9DHlEAcbOxoeyRcAU2PH+ksfq9swgrHqYgV4/Rn7RhfWVkJu
 veQgyB7FNey0VjLsgPOiIn/ZIslZUF0fF+GPAK45UoERalsc1A1MPm7cpaudMkJjn+2A
 eWrNMlXvm6RvQDbesUW/VQdlMi+aEzSk+RVQdBcHw84Gg3IIc04fhqrwSe3KTRfICUID
 2b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=xL9Z09qZkXRHIYJ3t2Ozf1c/V8RfscLg/nD/xQIwZpfOMalc3dOSg+lk8agPRBS5w3
 HJ8Swl2U9ycqHIOeyCD9def3WeEjF7Do6j9U3KhdN6K0bzt8Y0HjdTwzFk3cMyIogSB9
 lqYFudCF9pXIVDdoH8NPOws+IgLmKB19xdmUMSy7f0cPzs11FPwy8se7mV25dwH9KA57
 i2+krdDI5W65v+D4qRnNyehhB4WfzMIBtPbudScJF2N9cs0dGikF1B+dEfPBvb8jGAHC
 YE165wonnKXLePuRKhaQ1aPXpdyFzxZWQRitxVQkoMBT+JWki/04t5+yZcmXveEH7tHw
 aHuA==
X-Gm-Message-State: AOAM533Ibn7whRz41cUptjVrGvkjLZfJ9UdhwjykqU2pp0w/gEQQScpg
 RGTs3YoYA/Tx42jDITKFWI4=
X-Google-Smtp-Source: ABdhPJzFcEw39LPJdVp2bONu8d449hKR3YKtBopmWidnNRqiFqYpNm90jU1PdtiKjjOLulAqsyODpw==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr3574645wmq.79.1633082786509; 
 Fri, 01 Oct 2021 03:06:26 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/28] drm/radeon: use new iterator in radeon_sync_resv
Date: Fri,  1 Oct 2021 12:05:57 +0200
Message-Id: <20211001100610.2899-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..b991ba1bcd51 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_iter cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(&cursor, resv, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

