Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC171F503
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 23:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AD910E5DA;
	Thu,  1 Jun 2023 21:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE8189FA7;
 Thu,  1 Jun 2023 21:48:27 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64f48625615so61747b3a.0; 
 Thu, 01 Jun 2023 14:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685656106; x=1688248106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EE0EfDU+u9u4+ui1uHS92kS3GcLRsqU5zsR2pwsCo3A=;
 b=WEaxs8UwIO7EwC/BTfzutEb2uSeNq0jr0HNk4pRSoK779Y/EvUB2N3h6JqWrrbfcR4
 J9VdrgcVD9S0BAnpqkqVUthUpOsBQkjSfFfs1+pn6R4EMC2cUkE72AmC/O+uWoJedjv+
 ZAg3guMXwcyzco3vBuVFty98F/aL2Nmhf0yS5VIVgKC/YDhiKBP3MtfUsMTpbVo0jMok
 D3mX56z2yK3YXOfzY/aw7E1wHDD7y7fsQbhqDyqu4RfupdIf9ewV6trSc0rbUxT4FAod
 bpCxu4BQzGSsDpWpkpRsinnx6JJOcZvftKEJei1re13T0/yDNIO/w1zknCFST0JTCkLk
 PJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685656106; x=1688248106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EE0EfDU+u9u4+ui1uHS92kS3GcLRsqU5zsR2pwsCo3A=;
 b=fNNVa4QO4OZjoy08Ctq4WPCK4FJ+gzDcsUkIedED/JEXjSOAsqn33aSJ95luFmImav
 9raOXcAkIwWn2GSl85YNT0Nl6Z2yU08LDaoqbqb0d+9mOpIcb6lh8iiO2S3kjOIRmVF3
 S/ozlL/cmBhWnp4A9JP4WaokdK//249ks6jW5z5aYWLSpX7lhmzTDig+sZzj8U6OypYc
 k56BQPDCdfnbG/yko+C7n5zk5pBIWG3QBzqq++ZLKAnvCbZUbhKgT9BdbkNfMOlOwRfX
 kzV+TdidgJoKqZjzUQRtpBSrfNDclsHRqFUqeIWhMDMHlWhzjJxr2FrgM+JQKdMJIZ6S
 mbyQ==
X-Gm-Message-State: AC+VfDwc2mJzUwj90jXsr5HSrKlS9SZyDdnIv3r1UGFQRs31u5dpwXSR
 /ci7zGZANI4YuUFJ8kAC3/iP1kY8a0zsNQ==
X-Google-Smtp-Source: ACHHUZ5xoaMF2HMTwWkn/jqMaSKTXJVeou8EUHzdO27JS9u25qqVrUjzfjUHLz1MWt6p/Gvfs7pCQw==
X-Received: by 2002:a05:6a00:99d:b0:652:a91c:558e with SMTP id
 u29-20020a056a00099d00b00652a91c558emr783245pfg.1.1685656105839; 
 Thu, 01 Jun 2023 14:48:25 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa783cf000000b0064d2ad04cccsm5614994pfn.175.2023.06.01.14.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:48:25 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix xclk freq on CHIP_STONEY
Date: Thu,  1 Jun 2023 14:48:08 -0700
Message-ID: <20230601214814.2329224-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Alex, most APUs from that time seem to have the same issue
(vbios says 48Mhz, actual is 100Mhz).  I only have a CHIP_STONEY so I
limit the fixup to CHIP_STONEY
---
 drivers/gpu/drm/amd/amdgpu/vi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 770f2d7a371fc..6a8494f98d3ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -542,8 +542,15 @@ static u32 vi_get_xclk(struct amdgpu_device *adev)
 	u32 reference_clock = adev->clock.spll.reference_freq;
 	u32 tmp;
 
-	if (adev->flags & AMD_IS_APU)
-		return reference_clock;
+	if (adev->flags & AMD_IS_APU) {
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			/* vbios says 48Mhz, but the actual freq is 100Mhz */
+			return 10000;
+		default:
+			return reference_clock;
+		}
+	}
 
 	tmp = RREG32_SMC(ixCG_CLKPIN_CNTL_2);
 	if (REG_GET_FIELD(tmp, CG_CLKPIN_CNTL_2, MUX_TCLK_TO_XCLK))
-- 
2.41.0.rc0.172.g3f132b7071-goog

