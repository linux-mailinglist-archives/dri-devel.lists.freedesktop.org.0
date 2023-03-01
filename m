Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99F6A6DB1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 15:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BCB10E29D;
	Wed,  1 Mar 2023 14:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752210E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CL8E0O6RN+NrPQ/BLg0Ur8+SgAnEDTABwI3zVV7mIYc=;
 b=EFpxE6TSKZGeaGLRENm3z6rRdkbJ9UJDjKn6yTpzRu8jV3nkLsmk4Dgun+z/IWFXh9Ppzp
 CRr5tqB38yb10oURxnQJa+2Z9DJ/gx8zdWEoDe+uRqXnmhmpXJbjoHnk/1qI2WEY7lbeZu
 dOBVa6YPE0IRkssTczh49o6ut5Y5EXw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-rWb4nHuJMPKldLbqjo46Dw-1; Wed, 01 Mar 2023 09:00:07 -0500
X-MC-Unique: rWb4nHuJMPKldLbqjo46Dw-1
Received: by mail-qk1-f198.google.com with SMTP id
 19-20020a370c13000000b007428253bb55so8060552qkm.23
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Mar 2023 06:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CL8E0O6RN+NrPQ/BLg0Ur8+SgAnEDTABwI3zVV7mIYc=;
 b=n7ald7SvKUE7Jdxhx0XnwIuCikpTpi30LWSVzzEYoG84Fpc+DoGC87UQ9Pfb4r0VMx
 HcJpdRaB8Zkrcf841EyQ7NqG1M6hwYoKrWtlwdu506Bc3GtTiU5yC2NNcTFTr0/dxS/0
 asTBoOO48hjjUnD1tBVtSbr1kYDOaRkOLVDjADCpgC8WNT11f+GcooU9D8I2yk21OLua
 Sh4/t3NQXDFwXfE/WnvAFpdKxCsheJdObYACNenKNmbZtIDXXeguvTEeYTV8YvdhibUb
 MbshUPOi5a7m1o0QO9dGP/xnoGYPCfKkzxWD9xbTsOn/FKYHigLo54ocp7ZVNRyL/TC9
 fQpA==
X-Gm-Message-State: AO0yUKUyK9ZK9Qt2mXgAq7TeJDRkU5oLiGvvwwNmnWr4WJbRvAJjf1Tb
 k6vKnal/Rl++DLatzNjpAqOiLDyGUEtcEyF9o3EhALHf/n78a7VS58wBHnNNG78YQZKOeMXXQmA
 UBJyR7hAl4ixBnAyi5hEuCFFcrABu
X-Received: by 2002:ac8:5a4e:0:b0:3bf:e320:ba5d with SMTP id
 o14-20020ac85a4e000000b003bfe320ba5dmr11526511qta.17.1677679205436; 
 Wed, 01 Mar 2023 06:00:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8dWK4c13zlMSqeRkUXAOU6QC6GcZMEJsa/xNpp+NtbXPm/fld3f2OETxlRbgVc4VZpjYjcQw==
X-Received: by 2002:ac8:5a4e:0:b0:3bf:e320:ba5d with SMTP id
 o14-20020ac85a4e000000b003bfe320ba5dmr11526351qta.17.1677679204525; 
 Wed, 01 Mar 2023 06:00:04 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 t128-20020ae9df86000000b0073d7e81f8b5sm8801235qkf.35.2023.03.01.06.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:00:03 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 andrealmeid@igalia.com, kevinyang.wang@amd.com, li.ma@amd.com,
 Kun.Liu2@amd.com
Subject: [PATCH] drm/amd/pm: set vangogh_set_apu_thermal_limit
 storage-class-specifier to static
Date: Wed,  1 Mar 2023 09:00:00 -0500
Message-Id: <20230301140000.2719608-1-trix@redhat.com>
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

gcc with W=1 reports
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5:
  error: no previous prototype for ‘vangogh_set_apu_thermal_limit’ [-Werror=missing-prototypes]
 1600 | int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vangogh_set_apu_thermal_limit is only used in vangogh_ppt.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 016d5621e0b3..24046af60933 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -1597,7 +1597,7 @@ static int vangogh_get_apu_thermal_limit(struct smu_context *smu, uint32_t *limi
 					      0, limit);
 }
 
-int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
+static int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
 {
 	return smu_cmn_send_smc_msg_with_param(smu,
 					      SMU_MSG_SetReducedThermalLimit,
-- 
2.27.0

