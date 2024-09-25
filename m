Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E03985905
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF810E955;
	Wed, 25 Sep 2024 11:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKnpdKct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878710E955;
 Wed, 25 Sep 2024 11:49:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 693485C5C64;
 Wed, 25 Sep 2024 11:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21B6C4CEC7;
 Wed, 25 Sep 2024 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264954;
 bh=gjTH1Eu975+Nj/evwLe8wgP6Kq0WnfEk+LdENP6QqEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XKnpdKcts00dQzFdtM3aOVtWlTKC3qXQUBII6Z9dNPWJ++oUmw9LtDj/K7SjHywfG
 67IMu+dg6jxbF83vR0ysKTiySu6KjrnwHiF35V1W470nNtICkPtTc/HvBnX0JBfRPC
 jrh474oTLQ2MYc/WnPDOZStKYRlNvbpf8sGbdxcyNmGCLBdDbaDm2LJLhlOIiIOoXB
 KkTYOq6xtlOrhbYPBraX9v5gKyKhyXtqoBWntgnYdSJ5PyyrXoAJifqD2c5GWKqbw8
 BxqDHxEqQMV5psnFbUVOa4dYAcjQHGy2ejM9ksaYSBUHJ12zSd9xgdbgDpQy/BIlgG
 hJdqidji5qTuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, aurabindo.pillai@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 185/244] drm/amd/display: Increase array size of
 dummy_boolean
Date: Wed, 25 Sep 2024 07:26:46 -0400
Message-ID: <20240925113641.1297102-185-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 6d64d39486197083497a01b39e23f2f8474b35d3 ]

[WHY]
dml2_core_shared_mode_support and dml_core_mode_support access the third
element of dummy_boolean, i.e. hw_debug5 = &s->dummy_boolean[2], when
dummy_boolean has size of 2. Any assignment to hw_debug5 causes an
OVERRUN.

[HOW]
Increase dummy_boolean's array size to 3.

This fixes 2 OVERRUN issues reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index 1343b744eeb31..67e32a4ab0114 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -865,7 +865,7 @@ struct dml2_core_calcs_mode_support_locals {
 	unsigned int dpte_row_bytes_per_row_l[DML2_MAX_PLANES];
 	unsigned int dpte_row_bytes_per_row_c[DML2_MAX_PLANES];
 
-	bool dummy_boolean[2];
+	bool dummy_boolean[3];
 	unsigned int dummy_integer[3];
 	unsigned int dummy_integer_array[36][DML2_MAX_PLANES];
 	enum dml2_odm_mode dummy_odm_mode[DML2_MAX_PLANES];
-- 
2.43.0

