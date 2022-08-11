Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380305901F6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA9EB49D4;
	Thu, 11 Aug 2022 16:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B68B49E4;
 Thu, 11 Aug 2022 16:01:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6FD3B82156;
 Thu, 11 Aug 2022 16:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B555C433D6;
 Thu, 11 Aug 2022 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233710;
 bh=AH4rjKg5ZroZTkBP6QpCnmt+aw11B2aDjOteBLnr7Q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mL1EFyn9Jq43w5V0yjlkVBU+PotQTpjJSAq5rou0L8sKucSGDfCQ1hVIrCKkHz3/H
 UICF5zlnMFKDiNrq5ni4tPGW0F5i1xaEZrNA6PRAW+8tU35BkL1j7/YJ0ROHOqOW+K
 dXw1cV9b/d3o+J+14GlbkeiVrkzRh/ghBE3u3HeAFPet39Cx+3j+Y5iZYvMPrb1MDR
 8Js+WKKRPR/PFit4Zjvhb1aZAXVEGwOajv+HFjcmYjz055zVs7IS9OciABgx26EJIi
 it5NzG0y8aV3Lr6dP4R56GxKQqEVDsuL3UXNPUSPzmevqXozhGWHB5aKKbEQ5/fC4q
 IgsGzngmUQjIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 44/69] drm/amd/display: Guard against ddc_pin
 being NULL for AUX
Date: Thu, 11 Aug 2022 11:55:53 -0400
Message-Id: <20220811155632.1536867-44-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, baihaowen@meizu.com, arnd@arndb.de,
 sunpeng.li@amd.com, Anthony.Koo@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jing.Zhou@amd.com, christian.koenig@amd.com,
 meenakshikumar.somasundaram@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Michael Strauss <Michael.Strauss@amd.com>, amd-gfx@lists.freedesktop.org,
 wyatt.wood@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit bc19909f19fdc8253d720d11c948935786fbfa08 ]

[Why]
In the case where we don't support DMUB aux but we have DPIA links
in the configuration we might try to message AUX using the legacy
path - where DDC pin is NULL. This causes a NULL pointer dereference.

[How]
Guard against NULL DDC pin, return a failure for aux engine acquire.

Reviewed-by: Michael Strauss <Michael.Strauss@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
index 3c3347341103..ae9c0df1a844 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
@@ -563,6 +563,11 @@ int dce_aux_transfer_raw(struct ddc_service *ddc,
 	memset(&aux_req, 0, sizeof(aux_req));
 	memset(&aux_rep, 0, sizeof(aux_rep));
 
+	if (ddc_pin == NULL) {
+		*operation_result = AUX_RET_ERROR_ENGINE_ACQUIRE;
+		return -1;
+	}
+
 	aux_engine = ddc->ctx->dc->res_pool->engines[ddc_pin->pin_data->en];
 	if (!acquire(aux_engine, ddc_pin)) {
 		*operation_result = AUX_RET_ERROR_ENGINE_ACQUIRE;
-- 
2.35.1

