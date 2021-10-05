Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73157422549
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6076EB5A;
	Tue,  5 Oct 2021 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737B36EB53;
 Tue,  5 Oct 2021 11:37:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s15so8594188wrv.11;
 Tue, 05 Oct 2021 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
 b=LCvgpUtqtCFxZnEQNDktDxpTf4dbhSEuao8ulRT0SvsaoA8Q7G6vuvDJm0ATWn380e
 ph7rlM/02ybXRGIALicADHzImLyuITvggahikLgwr+WnchjLZJwwjNlcS/C7pYXMHLQa
 WJ5lDXq6iXbCeW4mD9We3x3wSLiofrbesUFcdlp5ss2j4Rf16009jjr+FVx9AII3lpeQ
 kNDlruJNyqqiaiEZLINludd1tkyIlWGWVKuW9KTJ9NHtVdeGbdPaVosnxC0edQS7WpE/
 YRlMmi7PwxaKCu/E/uVaRKMHz7b3NhVM9ZujvN2iNYiqJGCverCNmcllaEfuwiD9OkIX
 I6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
 b=mYXb5Vhfrtr/p2hMLqu9N2jK2iHdZN4xigKrl46nytecoPOCvRRSSDcMP8tf1fo4x4
 4UaMUBrr+9GJTYK4uPlixXcFDHrIijvoX4VM0EZ3ismKTH08U50BdRQPCEAyK9+h/boE
 1d1q+v3l4NwJ+j+4ECWpTieQ6a8f/UcoS5OB/HKrC0+gTPRrH7HCX+OkZ/e+9uAN8/Nb
 UIWM4iAYen3etVvdHh2RzBnTKgb+odJk7vEsEbtEmd4vA9UcUfqeabeJZ9+J/s6Giy9N
 PATJdrMcF3OOA8o34U9as4dhWkJEUT03TCL/ibcjEa9wxQJo8fW18qS8Zg21Hb3Dszhs
 JHgg==
X-Gm-Message-State: AOAM532J/Hwb0OJ64sVekA3jWRq5xJO/ndpv7D9zdPIEIqXZEo/hvoT8
 VoL2YG+vHtDn3XaPeCBajUc=
X-Google-Smtp-Source: ABdhPJwePTy3csOdl5nEHpPWGGqYgsw75JbeDEP7lumwo4i8kiGor/0gxjulTHy+w9OF8dVoRMX7rA==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr17313160wrb.259.1633433876888; 
 Tue, 05 Oct 2021 04:37:56 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/28] drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
Date: Tue,  5 Oct 2021 13:37:27 +0200
Message-Id: <20211005113742.1101-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

