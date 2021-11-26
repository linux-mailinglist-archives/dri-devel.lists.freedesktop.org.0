Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B677345E495
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 03:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E72A6E4C1;
	Fri, 26 Nov 2021 02:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712726E4A5;
 Fri, 26 Nov 2021 02:32:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7D51611CB;
 Fri, 26 Nov 2021 02:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893970;
 bh=jK80ZHaxoeA8DYw/BapI3GJl6uWcr+lliEp3Ys1Uwmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AyI0I4gXmCtTljydgdR6irJ+LgeXzsTSoSQRSTzw/CFHBWKMCGxJF5uM+0mBrtWvC
 CdPCb8ebi1dbhPeKyi/LMSOCh/PBvW0UdUGk2F6Z7fpaFKOf/o/L78oghwEGFMbVLX
 LG2aUERT0fX8GivdNCjNH+wHDTPRfY8yy69dHlRLkLkdyXB40MuacvS7VXhiHoSWnz
 gGBZAHkUDZk2j9JM2GyedYI4ZO+uhGx/6MDN/sfp3coZ/TV+jlCOxoupc/xQsccXih
 at/yuMo9iaIqBi6h2M3tnxAW2FwA4wnNwqewclCRi1YlM4k6Yr3qw0JLqMlhJdTJcC
 n1Gv0WGgG2Y4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 24/39] drm/amd/pm: Remove artificial freq level
 on Navi1x
Date: Thu, 25 Nov 2021 21:31:41 -0500
Message-Id: <20211126023156.441292-24-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023156.441292-1-sashal@kernel.org>
References: <20211126023156.441292-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@linux.ie,
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org, darren.powell@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 lee.jones@linaro.org, christian.koenig@amd.com, david.nieto@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit be83a5676767c99c2417083c29d42aa1e109a69d ]

Print Navi1x fine grained clocks in a consistent manner with other SOCs.
Don't show aritificial DPM level when the current clock equals min or max.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index b1ad451af06bd..dfba0bc732073 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1265,7 +1265,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 			enum smu_clk_type clk_type, char *buf)
 {
 	uint16_t *curve_settings;
-	int i, size = 0, ret = 0;
+	int i, levels, size = 0, ret = 0;
 	uint32_t cur_value = 0, value = 0, count = 0;
 	uint32_t freq_values[3] = {0};
 	uint32_t mark_index = 0;
@@ -1319,14 +1319,17 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 			freq_values[1] = cur_value;
 			mark_index = cur_value == freq_values[0] ? 0 :
 				     cur_value == freq_values[2] ? 2 : 1;
-			if (mark_index != 1)
-				freq_values[1] = (freq_values[0] + freq_values[2]) / 2;
 
-			for (i = 0; i < 3; i++) {
+			levels = 3;
+			if (mark_index != 1) {
+				levels = 2;
+				freq_values[1] = freq_values[2];
+			}
+
+			for (i = 0; i < levels; i++) {
 				size += sysfs_emit_at(buf, size, "%d: %uMhz %s\n", i, freq_values[i],
 						i == mark_index ? "*" : "");
 			}
-
 		}
 		break;
 	case SMU_PCIE:
-- 
2.33.0

