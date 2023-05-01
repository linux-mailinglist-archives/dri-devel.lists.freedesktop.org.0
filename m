Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD56F2C77
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 05:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7665410E244;
	Mon,  1 May 2023 03:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D5910E244;
 Mon,  1 May 2023 03:00:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47A7E61769;
 Mon,  1 May 2023 03:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBB4C433D2;
 Mon,  1 May 2023 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682910017;
 bh=MdfxqeYAwDXh2VRMUaumN0FZctQaD2Tdai+MJVSkBmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vGgCX8oARn1H2BTpJBb1xNQWJPusx4R/IywPXJ7XFMQNnriQcs5y+OcSvg5arY/xA
 E4lS0omqmqV1nEPDxBIW7fLvsJyHYf2G4KDYua+ZnHtstxrkpxNIgpP0vMWk3RnGma
 Mt6nE09m6D0xfy0ohOkuKljMQ3BHMxUgGdRno3MVmYs5PdxBsraYb9QHZANXjzR+Dr
 F7A+/CKHtnfMrSQ7Py/P0eHkmRe9HmMrQGMN48/+P2lW1XYj6A+Oq6fJTfg1ORs/xx
 +TPIgV/FSsXNXPIe1VZ14Q3wezwUhudCg3+Waxx3xchZjENKYiX01JN0dPOnJyMC7k
 t6jUdetbY1IRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 06/37] drm/amd/display: Enable HostVM based on
 rIOMMU active
Date: Sun, 30 Apr 2023 22:59:14 -0400
Message-Id: <20230501025945.3253774-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025945.3253774-1-sashal@kernel.org>
References: <20230501025945.3253774-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 chiahsuan.chung@amd.com, christian.koenig@amd.com, sunpeng.li@amd.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, duncan.ma@amd.com, amd-gfx@lists.freedesktop.org,
 Gabe Teeger <gabe.teeger@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, trix@redhat.com,
 Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 nicholas.kazlauskas@amd.com, Pavle.Kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gabe Teeger <gabe.teeger@amd.com>

[ Upstream commit 97fa4dfa66fdd52ad3d0c9fadeaaa1e87605bac7 ]

[Why]
There is underflow and flickering occuring. The
underflow stops when hostvm is forced to active.
According to policy, hostvm should be enabled if riommu
is active, but this is not taken into account when
deciding whether to enable hostvm.

[What]
For DCN314, set hostvm to true if riommu is active.

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Gabe Teeger <gabe.teeger@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
index 6a1cf6adea77d..8fa47233bc0a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
@@ -308,6 +308,10 @@ int dcn314_populate_dml_pipes_from_context_fpu(struct dc *dc, struct dc_state *c
 				pipe->plane_state->src_rect.width < pipe->plane_state->dst_rect.width))
 			upscaled = true;
 
+		/* Apply HostVM policy - either based on hypervisor globally enabled, or rIOMMU active */
+		if (dc->debug.dml_hostvm_override == DML_HOSTVM_NO_OVERRIDE)
+			pipes[i].pipe.src.hostvm = dc->vm_pa_config.is_hvm_enabled || dc->res_pool->hubbub->riommu_active;
+
 		/*
 		 * Immediate flip can be set dynamically after enabling the plane.
 		 * We need to require support for immediate flip or underflow can be
-- 
2.39.2

