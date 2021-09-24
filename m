Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D604177B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968836E1D7;
	Fri, 24 Sep 2021 15:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5111A88525;
 Fri, 24 Sep 2021 15:31:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g16so28698587wrb.3;
 Fri, 24 Sep 2021 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
 b=GU9YhU5Pryn0hB8x07xuYZF8M7s+qXgLshbnexafRjeTizxn7h9FRONZ6n23xvPfTf
 UJ2eGR7lgmUiPjoir92KNbFbT5uEYvWIO+IJOxVkyn6iiRLbK5B/INWdcFZAChlFP3TQ
 qa0Mhu4+bkT/yb9oZIjUQJP3L6Qck7I/EtefMbt7uQ/2RCDjAS2GGZV/EaIQz7RNSFms
 vKXHR8Ui3fo8EU7WYsgti/u780Y0A1J2aoWareMMd6+ydH0C8PHT3l9HlqDhVyXjtew9
 nz8JC4ADUXW8vq/Ywl37I3PYeKNtPQRfX80jQ5F+bVAMs/z6aL5eZ+QKBJ1aekzFCe07
 6uNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
 b=VLrHUe9uCQr/haBa0MDrs7xQ1uGAb33dnSzw0CeOPJNlelISH5RKZzXcnOlWEsHmlx
 VAoNP/zG48kU+LsCStvHJbADo1qTA6z157pVu07HdQG6YDliv+Pb2fJN/WI67e9yGTGk
 DxY0uuPTZXj+txbw8TcwsIIPjHmwDbhXj4tYO5BpKu5hWpjsRf3kMvBHyYstivUhcaK2
 alUkfrNpgth35NfgUF/rSmh7pZqXsP4c1n8wN2xeHhVbY00vY33hZix9nTIMDxYiIZda
 BbkkqY73ohYaUhA8CaiKKa56p9HIwYSci00fUeeglDDOd+gKfg20gwLhOb9/o7xOGp46
 xgqQ==
X-Gm-Message-State: AOAM533jHNi0L1g32FDyLAjcthNHi/YhRRTihDJKsYQTw/d7zyLImOc8
 yiNiUHilU4WIPwB8Tf6dSWE=
X-Google-Smtp-Source: ABdhPJwpe/xR1soLgzkh2xZshodGJdGysorueiWodthKrz5USEQ/vTDRlUoA0X5iRPY+P7LFZUt8ow==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr12092772wrw.381.1632497488865; 
 Fri, 24 Sep 2021 08:31:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/27] drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
Date: Fri, 24 Sep 2021 17:30:58 +0200
Message-Id: <20210924153113.2159-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

No need to actually allocate an array of fences here.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6b15cad78de9..e42dd79ed6f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2090,30 +2090,14 @@ static void amdgpu_vm_free_mapping(struct amdgpu_device *adev,
 static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 {
 	struct dma_resv *resv = vm->root.bo->tbo.base.resv;
-	struct dma_fence *excl, **shared;
-	unsigned i, shared_count;
-	int r;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-	r = dma_resv_get_fences(resv, &excl, &shared_count, &shared);
-	if (r) {
-		/* Not enough memory to grab the fence list, as last resort
-		 * block for all the fences to complete.
-		 */
-		dma_resv_wait_timeout(resv, true, false,
-						    MAX_SCHEDULE_TIMEOUT);
-		return;
-	}
-
-	/* Add a callback for each fence in the reservation object */
-	amdgpu_vm_prt_get(adev);
-	amdgpu_vm_add_prt_cb(adev, excl);
-
-	for (i = 0; i < shared_count; ++i) {
+	dma_resv_for_each_fence(&cursor, resv, true, fence) {
+		/* Add a callback for each fence in the reservation object */
 		amdgpu_vm_prt_get(adev);
-		amdgpu_vm_add_prt_cb(adev, shared[i]);
+		amdgpu_vm_add_prt_cb(adev, fence);
 	}
-
-	kfree(shared);
 }
 
 /**
-- 
2.25.1

