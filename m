Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E20783F69
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC810E31E;
	Tue, 22 Aug 2023 11:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739C10E31E;
 Tue, 22 Aug 2023 11:37:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6C7A653AC;
 Tue, 22 Aug 2023 11:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E3C433C7;
 Tue, 22 Aug 2023 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704245;
 bh=bLV1Oul/+3CAMawbNhlLErzDeDDRG0Wd8DXwh938PNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETV1sBRLTyKai9YixH5AShvsKuGC3AiNj9IpBN004O/n/+oAxjjC6OKud+PKTT8q0
 0oqLBWkQW3L1KDR19XTGU4l8ea5JONFEN6AmT6wYGwfeMlrO8pn2YTNqBKI/9bp4bx
 X8Wa6f6aDEd5SRgUhOKX8GP9NpJL+Woj5C0U7wKS2quHdDehMB29Ev6L8p1kHkwTUB
 ZvKy3LSl8obljnfHiRqWFKRBCUUzsAqcljeQq4suLwjQOG/q9tWCM3FkhLuLu0WR/O
 UGHNOKlKTlaVXNFuHo32VR5pebn69Uf8SJgDA6Z7SnSM38Sl1jfsy+roT67HuscSN6
 I8TJvYcP2BGlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 3/3] drm/amdkfd: ignore crat by default
Date: Tue, 22 Aug 2023 07:37:19 -0400
Message-Id: <20230822113719.3551639-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113719.3551639-1-sashal@kernel.org>
References: <20230822113719.3551639-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.191
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
index 86b4dadf772e3..61fea0d268b96 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -749,11 +749,7 @@ static bool kfd_ignore_crat(void)
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

