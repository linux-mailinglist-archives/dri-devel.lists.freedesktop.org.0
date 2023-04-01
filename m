Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055796D2CAA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 03:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CE910F366;
	Sat,  1 Apr 2023 01:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0EF10F365;
 Sat,  1 Apr 2023 01:42:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 966D562D04;
 Sat,  1 Apr 2023 01:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E24C433D2;
 Sat,  1 Apr 2023 01:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680313358;
 bh=/D4nHdOgubPpYjY6rrUOP3UQHzHPzlTIcnEkY36hxPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZpZT1G6HiKo6+K3SuAd6J230jGEVl1vnrGQSj4wS3LWHCbLjVleQILfdXI2iExhOb
 NMqcoBDIJ2iu5hJq43+6QWTr6cpIFjGDh/rYDN6FaXwNUeJGm1aSWOzxdSiicpOQo3
 DXdwg59ivYSCkX5yOdUsJZdo6u3SeOG7IaqwUGE752tA37HAV5f/QtVlb4QGPBq3OT
 0iVukbnBGhhD+uizgPzk3RINWve4QJhHjCoYwBeHKudw2YGRqaRe/X6+a1k5ILTPN1
 rrON3EtEzAXlvoJNAP8XaHmRkGFdADid6wCwbggjt0g8P31bvMzW8bcpv4d8bhvawP
 etpgaXkXuebcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 24/25] drm/amdgpu/gfx: set cg flags to enter/exit
 safe mode
Date: Fri, 31 Mar 2023 21:41:22 -0400
Message-Id: <20230401014126.3356410-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401014126.3356410-1-sashal@kernel.org>
References: <20230401014126.3356410-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, Xinhui.Pan@amd.com,
 Jane Jian <Jane.Jian@amd.com>, yifan1.zhang@amd.com, kenneth.feng@amd.com,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jane Jian <Jane.Jian@amd.com>

[ Upstream commit e06bfcc1a1c41bcb8c31470d437e147ce9f0acfd ]

sriov needs to enter/exit safe mode in update umd p state
add the cg flag to let it enter or exit while needed

Signed-off-by: Jane Jian <Jane.Jian@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index c748d92cec8e7..ddb7b8651ab4c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1315,6 +1315,11 @@ static int gfx_v11_0_sw_init(void *handle)
 		break;
 	}
 
+	/* Enable CG flag in one VF mode for enabling RLC safe mode enter/exit */
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 3) &&
+		amdgpu_sriov_is_pp_one_vf(adev))
+		adev->cg_flags = AMD_CG_SUPPORT_GFX_CGCG;
+
 	/* EOP Event */
 	r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_GRBM_CP,
 			      GFX_11_0_0__SRCID__CP_EOP_INTERRUPT,
-- 
2.39.2

