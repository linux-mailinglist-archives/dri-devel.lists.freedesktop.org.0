Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DAF6A1F53
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F4410E0DB;
	Fri, 24 Feb 2023 16:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200910E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677254807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TKs0bRG7rEN7pThC3p/s4RKGz/X8aopanB/27YkVrjU=;
 b=SldccJB1iKB40+0ibuypjdSgwq8Fs7oFo18lpIbmiT2mA+otXQdbpODoBSQatOKmAyrIeQ
 NGzl1x+nT7x3UPOSZLJcrAE79gUyQ4hUFontKKca5t8ogtbD0lypITfQehsIFKKph2aHP1
 tTx1CO7wpEo1Xsmz8yqYAt6ecAQu0dc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-cKFhjMUDOIOC5RyB_nFkxA-1; Fri, 24 Feb 2023 11:06:45 -0500
X-MC-Unique: cKFhjMUDOIOC5RyB_nFkxA-1
Received: by mail-qk1-f198.google.com with SMTP id
 m25-20020ae9e019000000b007421ddd945eso6252066qkk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 08:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TKs0bRG7rEN7pThC3p/s4RKGz/X8aopanB/27YkVrjU=;
 b=Sd9ULTeau4EmVx0mj7uo1mDVpcMzf+ipGQeRzwooszKtX/T1U6LG6MSvuHbuQ76TU8
 mMRDe+H8Lw5v0B6lv+0iin8kD4SVwz9ag3y8rhwZdyJtx40qbdSV+EezSHMFNN8XUftR
 I07AnXXtxF4ZedKiKQCX+zv+U3/DwjYLNOz3ahl83O1HOKQsjNzsvfqE6QViP51K1V/w
 kXK+4o3SJ7QUiE3iocHs2ahrOqBrrg/GGu4o9p+8JjuAmCyqIrABA4+FgB/I6G2yL5u3
 RgJP2C4okvlxBJ/BIEiCypG7iYVUfWdlMhtK98eCoIeddS9Zzv0kTPe4VKB87dJwh/hp
 NG+A==
X-Gm-Message-State: AO0yUKVEaMhQHPhzdjFUCFnQnNX1FyE97pwXUhuNQQt/YTqlwq1sQH1i
 6rIaR1TYWEc7tHk2m7YZmqPV7lkvDMpt3it518YCoLB59P31bjpKNGTwz+t7ElO8406ZACA4VIT
 qQpKI+pcpKXkryKDpPxMISVr1Ihcn
X-Received: by 2002:a05:622a:60e:b0:3b8:5199:f84a with SMTP id
 z14-20020a05622a060e00b003b85199f84amr11227811qta.3.1677254804923; 
 Fri, 24 Feb 2023 08:06:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/BbyOhn673eNw5A4CgDrYH1j6eDXQFM1WSMGga1HaaL2RQuav6Tbu6lPtvadwRfbvNxh+ATg==
X-Received: by 2002:a05:622a:60e:b0:3b8:5199:f84a with SMTP id
 z14-20020a05622a060e00b003b85199f84amr11227786qta.3.1677254804649; 
 Fri, 24 Feb 2023 08:06:44 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 a24-20020ac87218000000b003bfa66b7484sm6184056qtp.35.2023.02.24.08.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:06:44 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, tao.zhou1@amd.com,
 Hawking.Zhang@amd.com, candice.li@amd.com, Stanley.Yang@amd.com,
 YiPeng.Chai@amd.com
Subject: [PATCH] drm/amdgpu: remove unused variable channel_index
Date: Fri, 24 Feb 2023 11:06:40 -0500
Message-Id: <20230224160640.1577429-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

building with gcc and W=1 reports
drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:437:37: error: variable ‘channel_index’
  set but not used [-Werror=unused-but-set-variable]
  437 |         uint32_t eccinfo_table_idx, channel_index;
      |                                     ^~~~~~~~~~~~~

channel_index is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v8_10.c b/drivers/gpu/drm/amd/amdgpu/umc_v8_10.c
index 66158219f791..3f051dec56e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v8_10.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v8_10.c
@@ -434,7 +434,7 @@ static void umc_v8_10_ecc_info_query_error_address(struct amdgpu_device *adev,
 					uint32_t umc_inst,
 					uint32_t node_inst)
 {
-	uint32_t eccinfo_table_idx, channel_index;
+	uint32_t eccinfo_table_idx;
 	uint64_t mc_umc_status, err_addr;
 
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
@@ -443,11 +443,6 @@ static void umc_v8_10_ecc_info_query_error_address(struct amdgpu_device *adev,
 				  adev->umc.channel_inst_num +
 				  umc_inst * adev->umc.channel_inst_num +
 				  ch_inst;
-	channel_index =
-		adev->umc.channel_idx_tbl[node_inst * adev->umc.umc_inst_num *
-						  adev->umc.channel_inst_num +
-						  umc_inst * adev->umc.channel_inst_num +
-						  ch_inst];
 
 	mc_umc_status = ras->umc_ecc.ecc[eccinfo_table_idx].mca_umc_status;
 
-- 
2.27.0

