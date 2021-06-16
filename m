Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFC3A94F7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC846E525;
	Wed, 16 Jun 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F986E526
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s6so1520871edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5WMQmwGHbFSsJZWDXuAJvQZzGWBWH2W4bsFT3at8Zrc=;
 b=NVrqaPl19uEslX/a+KyWratsaSC97kBg4iUcUB8MZJukI/CUgyD9y2YUaJ2tOIj3Vb
 ixt1qRYMlSRMZnfCGzpujLwyyLlQeLXocGBTZH8KvIb+6ooOpakMj5YkfcoQRGgqTjPP
 AqYI7SqZDm6uW6UNrRpGRvdMe/7lQOiq5tnaQA0AG3Bs1b6+UKNgmls2Dz05f86K0etC
 UjAVH9NsRWKPjP5uVLJbNEf/l0yLnpTITa6piqgHIcAMbIwpks+BdphqoYZUTQKeDOuE
 KNxiTx8W3IbQw2UyIMREJWGpzjv2/kWL0J1pW9a+ZsrhV+6DA+cLIKnuoF+3a2+/Vmvi
 SY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WMQmwGHbFSsJZWDXuAJvQZzGWBWH2W4bsFT3at8Zrc=;
 b=YaYKyf1L0clSFAaTxshwlbzQWTQHLC+7pGUXRO5i0pALEIR95Zp+9Gmcdo++LDlmpX
 6BsqioFFE4iOrLt456iFiggxqrNWgYkuetlpxW97RAHlAM6hRaWaXAdCLzyw3QcMX2c4
 iMgL81fkRsXdqlf+NH7NFxAgyrTVq/TvtokK6ChhU4UjInhjq1bG50KAzFwBthIvFOZr
 0TNkXKblfQH1bGqyJc4OR+bBaWfg2SMcvJyJbV3p4zhtAe+IftTp1ExGFQxCIfvhnYHj
 4o4RnpfiLZIVa79khCPJomcxleKoH051owYnsnr9uqzPGaJyQS335hXnnVrvuueai6/Z
 KkZQ==
X-Gm-Message-State: AOAM5332tIoJOO9Wkc8PbJUSsF85NWO1GDi7zNs9chv/54F4SZ5sY4DL
 YbWotsku7/h47r1YPd9RftFtFbRElRE=
X-Google-Smtp-Source: ABdhPJwV7+n84rFPY62ZziQgf22oMXHmHw5Wg3+23X3qqR6nGWr7dVvkNQCVJypfg3IWq7wiJAhiTA==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr2758141edu.312.1623832022944; 
 Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: [PATCH 5/7] drm/msm: always wait for the exclusive fence
Date: Wed, 16 Jun 2021 10:26:53 +0200
Message-Id: <20210616082655.111001-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
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

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Completely untested since the driver won't even compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a94a43de95ef..72a07e311de3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -817,17 +817,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.25.1

