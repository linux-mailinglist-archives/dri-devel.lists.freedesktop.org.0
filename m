Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704975C0286
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B9310E4A1;
	Wed, 21 Sep 2022 15:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB3310E377;
 Wed, 21 Sep 2022 15:53:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4835B830CA;
 Wed, 21 Sep 2022 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A66C433D7;
 Wed, 21 Sep 2022 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775619;
 bh=HQt0Dir2v/OKPiuSGmulQLZyU2gBxDWR9oKGbTv2oXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o7W0LYQrq9i9Eepr3my4AuGabEw4HpLT3Ps9ZWDylKt94pEMqEpKVm79V4zrMt/xF
 YA10fRBOEF3CmE24nwNwiAtNvHBDaWFS7BrPKa/1JAJPb1MQo64tGW8hTOdilGB86R
 6VlyYoOyraf0Rll5ejhdxOBETi9I7gUZa1iqKclVcn+5T4Y43Zfj2T2Rik+3TdmpYC
 NteF3TzHPXkAO33nYwaWYRi9IRsnzcSG/wbGSrf/5CFEenZsxu3VKnWw6phVP5jXUI
 lvVlvmhLUuOCPXbbdi11Eo7Kn0gWdojN8svp9ZIEDa5LWmRt2wW8Qh4SmZbGQkm4tN
 WSQB9TeTx4j/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 06/16] drm/amd/pm: disable BACO entry/exit
 completely on several sienna cichlid cards
Date: Wed, 21 Sep 2022 11:53:22 -0400
Message-Id: <20220921155332.234913-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
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
index 32bb6b1d9526..d13e455c8827 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -368,6 +368,17 @@ static void sienna_cichlid_check_bxco_support(struct smu_context *smu)
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

