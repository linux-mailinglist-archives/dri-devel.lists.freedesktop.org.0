Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27741194A1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F46E96A;
	Tue, 10 Dec 2019 21:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3F26E975;
 Tue, 10 Dec 2019 21:17:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3080224691;
 Tue, 10 Dec 2019 21:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012081;
 bh=eS9xvF9rq5NfJcNEJkfhvmpa8K7NKLijEPXsZ/nbijw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PZZUJEbmqlgu0VdrBoDEALQomMBux8FUppITGZeExTINrBlHJRwsv1pEekHZfgaD7
 uZFGcaE2TeH9Ksp0LcWiKO3sK/RyYvF45a+pOhrBG5jnS01ssHJA1u2K8MyNJL5rAa
 hhpCRjv9LFtHE/KLjxLwY9Z1ieGZILwT3CPPv7SU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 060/350] drm/amd/display: fix struct init in
 update_bounding_box
Date: Tue, 10 Dec 2019 16:02:45 -0500
Message-Id: <20191210210735.9077-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Raul E Rangel <rrangel@chromium.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Raul E Rangel <rrangel@chromium.org>

[ Upstream commit 960b6f4f2d2e96d5f7ffe2854e0040b46cafbd36 ]

dcn20_resource.c:2636:9: error: missing braces around initializer [-Werror=missing-braces]
  struct _vcs_dpi_voltage_scaling_st calculated_states[MAX_CLOCK_LIMIT_STATES] = {0};
         ^

Fixes: 7ed4e6352c16f ("drm/amd/display: Add DCN2 HW Sequencer and Resource")

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index ebe67c34dabf6..78b2cc2e122fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -3041,7 +3041,7 @@ static void cap_soc_clocks(
 static void update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_st *bb,
 		struct pp_smu_nv_clock_table *max_clocks, unsigned int *uclk_states, unsigned int num_states)
 {
-	struct _vcs_dpi_voltage_scaling_st calculated_states[MAX_CLOCK_LIMIT_STATES] = {0};
+	struct _vcs_dpi_voltage_scaling_st calculated_states[MAX_CLOCK_LIMIT_STATES];
 	int i;
 	int num_calculated_states = 0;
 	int min_dcfclk = 0;
@@ -3049,6 +3049,8 @@ static void update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_
 	if (num_states == 0)
 		return;
 
+	memset(calculated_states, 0, sizeof(calculated_states));
+
 	if (dc->bb_overrides.min_dcfclk_mhz > 0)
 		min_dcfclk = dc->bb_overrides.min_dcfclk_mhz;
 	else
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
