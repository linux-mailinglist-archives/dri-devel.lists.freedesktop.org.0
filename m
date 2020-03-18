Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1C1893BA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B136E851;
	Wed, 18 Mar 2020 01:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B59E89198;
 Wed, 18 Mar 2020 00:25:13 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r2so8347654otn.6;
 Tue, 17 Mar 2020 17:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RthWSSAwfQ1m/fIyaMgHoqmV5M148uMDMgR2Z75pZn8=;
 b=nYKHpY6nByhG0uRCsowUHUQJDn8lvAmj1r6pTXxO+446VW4lMe+YgRICjtX4GAia1C
 niVY8FgXbE31dNwHG5RfG1MjyEthgGJTIdiuHqLgzLyfjtmtr8WqehWj1A/7hbst7MvT
 TxuNCCpWqcMTj3ehMffTAne8xCq1PVAGU3OpM/AuUmCRblWQHrtl+9BLgz8VdKDHSMeS
 GTnKkvg+dZHvUevq3Bv8Rsx5l7r4PDB5ZKT8kO72UvOF3UhK+DkJF5nH+C4ffxUeimVt
 2iAkONfQ+6AmNmy3q0v1aR2mp+UJyCK3F2P/Ey32/jCril3wDx3aMfDdNeaRcfwgipZ4
 qYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RthWSSAwfQ1m/fIyaMgHoqmV5M148uMDMgR2Z75pZn8=;
 b=fgNPp07XNI9ILimm4Ap7V3Qdo0Xvop2jOa49veCn1T1EBgCK/95kngfKVkI8rumZ+E
 fXDwAMlVKjhEBHxDouvdHOn36zsvoEEAEA93t53NX/tp/YFG5FkSSEAD41Muap+B5tEp
 r4V3Yzisvj5pnwr6uTSbSdVradvFx3cggoPhwu1axY8CEbHSHz7EEqr2/xZ8sceoY1lo
 FeR2/MpdEirdZiLjFKWAaXKVPwreE4kPFAQPlL5tpOmHwbflcoE2vgRikebWZBOT5vQe
 2qSU5nCjvBkxM7hz95V9K2lRlVz1Ve/6Xpb70YoyYM/MfYPcyc+fXKpA0lYPxLJRl4bj
 P1Jg==
X-Gm-Message-State: ANhLgQ0MD78DaZxQ+F0AYemjl3BlwHcHYBcO5ATLKcGaIS12hxGNf7aE
 84JSlPYotecJ4g17peZRd6U=
X-Google-Smtp-Source: ADFU+vtt2GDTqaDqobRqfbJiRXx+3kKCoi5fhOgvoNclVJWr5EiPhuO5Az9mcy0rzvDzM8NfX7xUGA==
X-Received: by 2002:a9d:53c2:: with SMTP id i2mr1714115oth.11.1584491112227;
 Tue, 17 Mar 2020 17:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b26sm1569129oti.3.2020.03.17.17.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 17:25:11 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH] drm/amdgpu: Initialize shadow to false in gfx_v9_0_rlcg_wreg
Date: Tue, 17 Mar 2020 17:25:00 -0700
Message-Id: <20200318002500.52471-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0.rc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang warns:

drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'
is used uninitialized whenever 'if' condition is
false [-Wsometimes-uninitialized]
        if (offset == grbm_cntl || offset == grbm_idx)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:757:6: note: uninitialized use
occurs here
        if (shadow) {
            ^~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:2: note: remove the 'if' if
its condition is always true
        if (offset == grbm_cntl || offset == grbm_idx)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the
variable 'shadow' to silence this warning
        bool shadow;
                   ^
                    = 0
1 warning generated.

It is not wrong so initialize shadow to false to ensure shadow is always
used initialized.

Fixes: 2e0cc4d48b91 ("drm/amdgpu: revise RLCG access path")
Link: https://github.com/ClangBuiltLinux/linux/issues/936
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7bc2486167e7..affbff76758c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -735,7 +735,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
 	static void *spare_int;
 	static uint32_t grbm_cntl;
 	static uint32_t grbm_idx;
-	bool shadow;
+	bool shadow = false;
 
 	scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
 	scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
-- 
2.26.0.rc1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
