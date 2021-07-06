Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F83BCBA0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10FA6E04A;
	Tue,  6 Jul 2021 11:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682516E047;
 Tue,  6 Jul 2021 11:15:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D45061C31;
 Tue,  6 Jul 2021 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570110;
 bh=Ct3Y7jkwoKYSQltROAjqMjbfy7zwRvvP9DDxZboJejs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uVXUZ9OuLwcb4l5EUVj5qm0Uhp4fkUJzcKQyin/OesamvS9Ettk0x4rb7kpYlsb7B
 pf1d8xyXqgYaDag73ZBsNGZhwsp8JCIAYzg0QeFuv7udrwh8R6XqPGNiZf9d/hSQoo
 YjIIv6c45D4FVlDzNNYpTpEJ7DVjWVKehnY5bq5w/DYur7YjVsaHUAP6iquf02ewdy
 KESZD2Ceu4QJmrcdfznLwSl2upkRKTmw12zdBBsIb9NkEC2mz3Uzdqr0FDkbxbDziq
 KV5WuJaOswN42HRniwVpiYOThfgQ7S3/vieNwBSOZBmj1Ed5u8mC2xlsKq5iLTHLR8
 HtV1Z3iYK9aTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 042/189] drm/amd/pm: fix return value in
 aldebaran_set_mp1_state()
Date: Tue,  6 Jul 2021 07:11:42 -0400
Message-Id: <20210706111409.2058071-42-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Feifei Xu <Feifei.Xu@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Feifei Xu <Feifei.Xu@amd.com>

[ Upstream commit 5051cb794ac5d92154e186d87cdc12cba613f4f6 ]

For default cases,we should return 0. Otherwise resume will
abort because of the wrong return value.

Signed-off-by: Feifei Xu <Feifei.Xu@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index dcbe3a72da09..16ad4683eb69 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1779,10 +1779,8 @@ static int aldebaran_set_mp1_state(struct smu_context *smu,
 	case PP_MP1_STATE_UNLOAD:
 		return smu_cmn_set_mp1_state(smu, mp1_state);
 	default:
-		return -EINVAL;
+		return 0;
 	}
-
-	return 0;
 }
 
 static const struct pptable_funcs aldebaran_ppt_funcs = {
-- 
2.30.2

