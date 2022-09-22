Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4E5E5C55
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF3710EA57;
	Thu, 22 Sep 2022 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E4D8921E;
 Thu, 22 Sep 2022 01:27:32 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so652908pjm.1; 
 Wed, 21 Sep 2022 18:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Nn/xaYDr70nfIgJ9YO/J5RCYgkbZZtOIDhcd1yX3ucQ=;
 b=ijl3DG/F/T8LrNkohZukB7Ha4rpNVsYgaiJCuTqk6YSYBh2O/Qipty55Mp0Z8/T77L
 GJ/yFQ1nXMencxNxhzEF87a11t0Ymk44foaOZ2CN+e3rMrB2qjpoSAhDejKnqRnh/fuo
 F4l88/YtIFC1asSQJ8NlmveD5Pg/ShBdm1bK8jXj+zPKtaQieikdM4L9NyFO5/nritGd
 3DImhY2Zf4KPQduCOMIUAXWv1vY1uT4QnFpFj2vu0l/41MlfTCTY/MYcL55udWtrY8PK
 FcPz17l8d3u7nuC3mnoP9rbSTJfo4gBcIsHqYKJCocdEuPnku2WJ8ndLZhvX3LoCHcIW
 BGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Nn/xaYDr70nfIgJ9YO/J5RCYgkbZZtOIDhcd1yX3ucQ=;
 b=NcCIjBXHgUvTpPB84kPP0j8WffnjU84y+qcjhTcyMNBbPzGQcg9SSVxXKvKj0OJfUR
 eCrswCN4HM83AOBH3BMXOJox1lAm27iYk07Q72zIFl8xSAinUR6DmR959/A/ArrOIjql
 K5EVYIyc2SU0wSVfXm4rLPZMvOicvsQQaS1hkPzhbaF6kON4bA2rhwG/1WDqz+pEQayO
 eHh5E0yJZcNk/1Nsf+p3b/PCVq1ZcWUoCs0W3Ql/7JIgMYnvqTH55qUGFmVsNnG1AAzK
 ExBLOzPhZ8cO9lH6ZR+kgBjm75/rRFcNcn0TJXzbYUG+0v/f+hNMME9IBcG2gr5UzhvI
 O97w==
X-Gm-Message-State: ACrzQf0nrAapJnOg1BH08ImIDmP+m6AcqtV6Iu5Eo4QYrUQxcp2J+izq
 MM3n5xgwITiSZ8hNrib8RVV1hbdBWHyySw==
X-Google-Smtp-Source: AMsMyM5TfJLNWJSq/FsUmvKPRz4vhiY7w/WNIT+Tr3OomHvIiUFyp8KLViLkJxk0fltCucrHeWPqUg==
X-Received: by 2002:a17:90a:cc9:b0:203:ab27:78c7 with SMTP id
 9-20020a17090a0cc900b00203ab2778c7mr12336745pjt.123.1663810051382; 
 Wed, 21 Sep 2022 18:27:31 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu.
 [2607:f720:1300:3033::1:4dd]) by smtp.googlemail.com with ESMTPSA id
 n15-20020a63e04f000000b0043b565cb57csm2551492pgj.73.2022.09.21.18.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 18:27:30 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1] drivers:amdgpu: check the return value of amdgpu_bo_kmap
Date: Wed, 21 Sep 2022 18:27:19 -0700
Message-Id: <20220922012719.1676315-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Sep 2022 07:24:23 +0000
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
Cc: jiapeng.chong@linux.alibaba.com, Xinhui.Pan@amd.com, guchun.chen@amd.com,
 airlied@linux.ie, lijo.lazar@amd.com, mario.limonciello@amd.com,
 darren.powell@amd.com, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, Li Zhong <floridsleeves@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
error check and propagate the error.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 1eb4e613b27a..ec055858eb95 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
 {
 	struct pp_hwmgr *hwmgr = handle;
 	struct amdgpu_device *adev = hwmgr->adev;
+	int err;
 
 	if (!addr || !size)
 		return -EINVAL;
@@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
 	*addr = NULL;
 	*size = 0;
 	if (adev->pm.smu_prv_buffer) {
-		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		err = amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		if (err)
+			return err;
 		*size = adev->pm.smu_prv_buffer_size;
 	}
 
-- 
2.25.1

