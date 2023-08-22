Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CC783F55
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DDE10E315;
	Tue, 22 Aug 2023 11:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356B410E314;
 Tue, 22 Aug 2023 11:36:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CFC565391;
 Tue, 22 Aug 2023 11:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95410C433CB;
 Tue, 22 Aug 2023 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704213;
 bh=N4SqmXXQhEcY5bDuFGlg59WumSLsxtUNvYbPeKbHN5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M//S0kPAH7w7OP0TUGt24TdFd86no1CrfDrjLr5vYQLqpKc0GTZA1fhGKOsvaY19R
 ldJtAg8VLStg2KLd2NUgM+H8YDSQD7uj5B4AM3MSsXlCfI8H4dnqH57iGn/i5n6s3W
 cgzhNm0Sw2w9Yf2+SaViEtVaq+eNBCvcHEMQ0JTVg0lQuWj8hQwNflGb/3bH0UZ1/0
 oRyQaGMz85koTkYcDeI1p325f+QtSKLDOh6eH+sioAhJkrknD+Y6Aqskqw4Ye2fW7Y
 MvHPXFYL+sb02DqwWpInN0pKThUtE0viDY2idDuHnqpb1feEMvCal60ViGCtRXkI5/
 VNWIoA4AzuK2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 08/10] drm/amdkfd: ignore crat by default
Date: Tue, 22 Aug 2023 07:36:26 -0400
Message-Id: <20230822113628.3551393-8-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113628.3551393-1-sashal@kernel.org>
References: <20230822113628.3551393-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.46
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit a6dea2d64ff92851e68cd4e20a35f6534286e016 ]

We are dropping the IOMMUv2 path, so no need to enable this.
It's often buggy on consumer platforms anyway.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Tested-by: Mike Lothian <mike@fireburn.co.uk>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index e45c6bc8d10bb..a9fa4772b2d35 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -1543,11 +1543,7 @@ static bool kfd_ignore_crat(void)
 	if (ignore_crat)
 		return true;
 
-#ifndef KFD_SUPPORT_IOMMU_V2
 	ret = true;
-#else
-	ret = false;
-#endif
 
 	return ret;
 }
-- 
2.40.1

