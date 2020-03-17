Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB5188721
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470856E194;
	Tue, 17 Mar 2020 14:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312F96E0B6;
 Tue, 17 Mar 2020 11:56:59 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 7so11623800pgr.2;
 Tue, 17 Mar 2020 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=reLOWOkyOr/OEERg8SMjO4vQQYztbY0LPaW1Ag7Mvu0=;
 b=a5dL+3hZYsRgN+XL4RosZQPVyQLcy0j1su9Kf57V6u2Jr/P3sqGGhHYMIWlZv3oIxF
 ztkVNkJhzj/t8Ru4sXhR0EvUpnx0W6rGsUGJyS22tr3oGpybjDfSlAwLNMT07FKcGPx5
 gQP/ymAfjCI1/QEnZdEqDRx2MBdhJhGm5gU8YpiNj2lQw0dUYhggrlbrtaCUgOPRAD5P
 HxMfha+m+rLlO223wfXTmat4mLe4LZMQLtE+k7wQZcIBMIu5IpeYh7o+M4Os3Nm2hIo7
 54gmj3aPVEPKNuPumepEG6kl4kMGKz4qS1rwIM7Pn9NA4D+vx79sLBh1Rd3l2fjYPnaO
 p75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=reLOWOkyOr/OEERg8SMjO4vQQYztbY0LPaW1Ag7Mvu0=;
 b=DQCm82hNaWPR8lbazadJI4aYWmMnxsZkFNUuLGyl6DQ0Kvk5v6Z0NKD+d+MO4VEWMT
 PY2OJ78ci+Py96XHHffqAIDu0/EgTs5ilM+BUeERcXG29t/sE0P1CRp1EMIK8lk+V0tP
 vFPbUmr846uSFq0EnkYP8qkNUffze9spJo7lUl5FYTjGp2bO9akVzb+CIcsa3uaJTLGx
 L8in43mahslqD8hi+GLJ42A2du5qCaeXrdls3IR+sd9Hkr0BHqhY7DZirBq7KqeQwbPV
 X52IjBMbNttPfUJHOsKzk53J70kWsjTAjr3vH3LPTX/OXXz+GPY5s5IUG4kNLx6r4ISI
 glsw==
X-Gm-Message-State: ANhLgQ3aH9S3tg+Zyn/0pripwb9QTyIQPMrYkknbVDsw0dw0T03FzdQv
 GTMoiQ65FbS2jX9PpBtQxFk=
X-Google-Smtp-Source: ADFU+vsonZ4VgH7OBfq/2iUoI9YURQEAVqgFARtnFAPYb/E8KAYpc3AGx2SzdldWShrappeNUHCsMA==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr4561213pgk.96.1584446218828; 
 Tue, 17 Mar 2020 04:56:58 -0700 (PDT)
Received: from localhost ([161.117.239.120])
 by smtp.gmail.com with ESMTPSA id 8sm3129051pfv.65.2020.03.17.04.56.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 04:56:58 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: evan.quan@amd.com,
	alexander.deucher@amd.com
Subject: [PATCH] drm/amd/powerplay: remove redundant check in
 smu_set_soft_freq_range
Date: Tue, 17 Mar 2020 19:56:53 +0800
Message-Id: <20200317115653.9463-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, Qiujun Huang <hqjagain@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

min(max) is type of uint32_t, min < 0(max < 0) is never true.
move it.

Addressed-Coverity: ("Unsigned compared against 0")
Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 96e81c7bc266..fdaea0cc2828 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -222,9 +222,6 @@ int smu_set_soft_freq_range(struct smu_context *smu, enum smu_clk_type clk_type,
 {
 	int ret = 0;
 
-	if (min < 0 && max < 0)
-		return -EINVAL;
-
 	if (!smu_clk_dpm_is_enabled(smu, clk_type))
 		return 0;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
