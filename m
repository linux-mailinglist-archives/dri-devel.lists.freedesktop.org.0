Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7217DF48B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353F610E0C3;
	Thu,  2 Nov 2023 14:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8DA10E0C1;
 Thu,  2 Nov 2023 14:05:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1ca85ff26afso1969465ad.1; 
 Thu, 02 Nov 2023 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698933918; x=1699538718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+E9JqwmhnjEhxbRIH2HvbjlloiERNKW1YLqGvHb+1g=;
 b=EQDdCMzSFbIUKVqmD8mCnNorWwjiN5eObKEqITLiXcq/MepSpwNEnpAp5ZwA2mRFGO
 P+qwh+Km/9XmstmWdnlfg0VIEl9BRREBwYK9zX08PWtfqF6Yoxji+MkCcdmi1SKGzi5a
 PRR4oGtVJIg7VgdgLa/XlCHC027nBN/2TGJ8WDk2a/Sq2P0ad4fTabTL2UPEaZtCYxs1
 NBmcEmBXZiPMD6WkTDSWID9a+fPUWWVIVo0xel1XUJA0bDdLi/uCjX7FGmRYvyXzmq35
 KMycsvsfuXijYxi7T4Zi+H8/yPtPKtvCoN2nvlGNe/BXFWsiFLYsTSRQzLSNBvra+11+
 5rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698933918; x=1699538718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+E9JqwmhnjEhxbRIH2HvbjlloiERNKW1YLqGvHb+1g=;
 b=HQqxq9Py6ooqbUmB+H4BVBeM5FlsLc89f72Az85MUnYDdCvaiMu01QdVB6uex1Rqjz
 DOLEkkpj6UEeVT1lDX/UPyNZqiunu93y+/jErmFu2zyoQAVZiuq7cEt0klK9ajsScCJq
 lzhCj3vWy4xykNnh+3V6cM04pEsfEfNije/4DP81FDpGWFOEMW6MitDVHfFQMYu/0MbJ
 97NwRxlv4bYzqfp/YXprzbQ9/MtVi6IUL8vqxd1ouRybuBsujvL/9x5l6Ci8//hkgODp
 VCHgMGfA3yk0DB+DKnyegkoeG6cIj84IMTH8gBCRwYUoztU/uP8iXsRfjgnNqRqrxdzj
 0jtg==
X-Gm-Message-State: AOJu0YxuPGv+90VEhxgb6ySUg506KCP+ml9bTniqj7YncaZ6uzy6GPRE
 D8ThfW2iR1RKbn1sJ4fviHQbIZ3jmlxAAqVG
X-Google-Smtp-Source: AGHT+IGdzIMqsy2ems3COrZkGEM4pzyV22TYTHY7ap29UbAfRp4lJHS28HUIdWQxffcYObTLZBMCTw==
X-Received: by 2002:a17:90a:b896:b0:280:2bcc:65be with SMTP id
 o22-20020a17090ab89600b002802bcc65bemr14494899pjr.2.1698933918133; 
 Thu, 02 Nov 2023 07:05:18 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090a34c200b0027d09ba2f91sm2700083pjf.34.2023.11.02.07.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 07:05:17 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/amdgpu: Don't implicit sync PRT maps.
Date: Thu,  2 Nov 2023 23:04:34 +0900
Message-ID: <20231102140436.180989-2-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102140436.180989-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are considered map operations rather than unmap, and there is no
point of doing implicit synchronization here.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f5daadcec865..7b9762f1cddd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -902,7 +902,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	/* Implicitly sync to command submissions in the same VM before
 	 * unmapping. Sync to moving fences before mapping.
 	 */
-	if (!(flags & AMDGPU_PTE_VALID))
+	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
 		sync_mode = AMDGPU_SYNC_EQ_OWNER;
 	else
 		sync_mode = AMDGPU_SYNC_EXPLICIT;
-- 
2.42.0

