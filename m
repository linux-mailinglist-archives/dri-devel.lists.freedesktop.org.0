Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315565C02B8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C789A10E9BC;
	Wed, 21 Sep 2022 15:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA0810E9AB;
 Wed, 21 Sep 2022 15:54:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C7D96315F;
 Wed, 21 Sep 2022 15:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15FC433C1;
 Wed, 21 Sep 2022 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775651;
 bh=Gl9io5BLtE9CCwEPd3iswAcZ+PjuZKqsZXFtnvw+MfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ntjpyL4/iDL2Zndu2V1kyZ4g18XN3AkYLOqIZkInx80P8qHcv0rOajUaxNyHGULm2
 09wLyj/l2ULGoRHbIbviOIQEvAYvOMGx7rTjHQCa0pnUgtPm5ZRW3wGxiSyiHx69ob
 ydMMy2g7LvzYgvBcpPOJ4/nldZiXle9MNNeE/f7jnOJX6BicDyFjpCpoG6fZaPhKMy
 DamdVxNeP3E6eyB6j9SU500bQTqdJhgYSh1s0rqNUNqPVJsBn1ybHIwVam/e1piJYa
 EDHD4+BV0lkP2XMwywoo+7g06znXnWKlxAU+oB+twsv3DHUKE+FcQoqabvSBgmJLwz
 W2Jjhc3HZWWBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/10] drm/amd/pm: disable BACO entry/exit
 completely on several sienna cichlid cards
Date: Wed, 21 Sep 2022 11:54:01 -0400
Message-Id: <20220921155407.235132-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155407.235132-1-sashal@kernel.org>
References: <20220921155407.235132-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, sathishkumar.sundararaju@amd.com,
 Xinhui.Pan@amd.com, Guchun Chen <guchun.chen@amd.com>, airlied@linux.ie,
 danijel.slivka@amd.com, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 Mohammadzafar.ziya@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 7c6fb61a400bf3218c6504cb2d48858f98822c9d ]

To avoid hardware intermittent failures.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 79976921dc46..c71d50e82168 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -358,6 +358,17 @@ static void sienna_cichlid_check_bxco_support(struct smu_context *smu)
 		smu_baco->platform_support =
 			(val & RCC_BIF_STRAP0__STRAP_PX_CAPABLE_MASK) ? true :
 									false;
+
+		/*
+		 * Disable BACO entry/exit completely on below SKUs to
+		 * avoid hardware intermittent failures.
+		 */
+		if (((adev->pdev->device == 0x73A1) &&
+		    (adev->pdev->revision == 0x00)) ||
+		    ((adev->pdev->device == 0x73BF) &&
+		    (adev->pdev->revision == 0xCF)))
+			smu_baco->platform_support = false;
+
 	}
 }
 
-- 
2.35.1

