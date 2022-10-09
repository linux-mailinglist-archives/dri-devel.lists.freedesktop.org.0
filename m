Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F67D5F9438
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F058010E5A1;
	Sun,  9 Oct 2022 23:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509D10E59B;
 Sun,  9 Oct 2022 23:53:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C36C60D3D;
 Sun,  9 Oct 2022 23:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7087C433D7;
 Sun,  9 Oct 2022 23:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359621;
 bh=/qVHldP64B5xa9jg2xsijaphwXXl0NsLnQSVOzxEN8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qye1RtXZzAWDQGCdvyQS930HuKPYxoE7sNFL8Vd02tMLH77mhFZqPCwWxFrORraYD
 plswcu2licV313aPEHTMTUs2TvkWJ2jtd4wGPbF5BxCpGDIe3jC3kXW71kU2d09PuT
 CKZ7I3CBDOTfch3yjvymubezGGmG5I0GxpHs5wTIOHpYYiaV5dxQ8zvC/6+RTV99/B
 6hmrYPBQ0Zb1wKO92l02W6xqIVqyGbEOFCL06xyCxLzVol6G0vT95ATKezpMN3Fa9g
 NZXKBza1C9S+dIDAlW1CRjj8LYZDuBp1AZxf/PWaK9FtikF38jifXiS2mDMCS1rRe3
 bP+oc/be8dMQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 26/36] drm/amd/display: correct hostvm flag
Date: Sun,  9 Oct 2022 19:52:12 -0400
Message-Id: <20221009235222.1230786-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Eric.Yang2@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, mwen@igalia.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Sherry Wang <Yao.Wang1@amd.com>,
 michael.strauss@amd.com, dri-devel@lists.freedesktop.org,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, agustin.gutierrez@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sherry Wang <Yao.Wang1@amd.com>

[ Upstream commit 796d6a37ff5ffaf9f2dc0f3f4bf9f4a1034c00de ]

[Why]
Hostvm should be enabled/disabled accordding to
the status of riommu_active, but hostvm always
be disabled on DCN31 which causes underflow

[How]
Set correct hostvm flag on DCN31

Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Sherry Wang <Yao.Wang1@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 3d9f07d4770b..8a0de6bfc716 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -892,7 +892,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.enable_sw_cntl_psr = true,
 	.apply_vendor_specific_lttpr_wa = true,
 	.enable_z9_disable_interface = true, /* Allow support for the PMFW interface for disable Z9*/
-	.dml_hostvm_override = DML_HOSTVM_OVERRIDE_FALSE,
+	.dml_hostvm_override = DML_HOSTVM_NO_OVERRIDE,
 };
 
 static const struct dc_debug_options debug_defaults_diags = {
-- 
2.35.1

