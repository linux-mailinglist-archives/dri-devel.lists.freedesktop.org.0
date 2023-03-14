Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018706B9435
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47810E7BA;
	Tue, 14 Mar 2023 12:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02D210E7B4;
 Tue, 14 Mar 2023 12:43:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBC10B81900;
 Tue, 14 Mar 2023 12:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666F5C433D2;
 Tue, 14 Mar 2023 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678797804;
 bh=0dAsUUsgUobG2WHT+WO/aLw5FxGTZnOUTozglYp1H50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UoBydzffEkjnK8K+kNZoza6fzJhSeI/pYAqfbg0/fkaTjAih84V4IhZ7GJyNMErUh
 4owSbACYtKEr0G2W1RAKkwkwMkqQGJA8s9sh2wYGkx5hpj7wMcv10pP48m/NZKrJNA
 IiUnJMhIAvpdQBHTnNHwWjYCC8MPf+nOkJ7/ZMijG6TNwIkL7AvnFdvK1T/HCuM6j4
 azuOg2rb2g0OiG13En0B5lXuVitAhQnnnDlOOudRUEAmkhPq+A9aIgc6Z7Vc0+lFwf
 k+d+01yjyBAHomHUc4+Fip/UrTmCNqDKYVFl0W6yuwagURETfepvWxdJP/PEMfowCT
 DvbmsJWO2CUsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 13/13] drm/amd/display: fix shift-out-of-bounds in
 CalculateVMAndRowBytes
Date: Tue, 14 Mar 2023 08:43:05 -0400
Message-Id: <20230314124305.470657-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314124305.470657-1-sashal@kernel.org>
References: <20230314124305.470657-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Alex Hung <alex.hung@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 031f196d1b1b6d5dfcb0533b431e3ab1750e6189 ]

[WHY]
When PTEBufferSizeInRequests is zero, UBSAN reports the following
warning because dml_log2 returns an unexpected negative value:

  shift exponent 4294966273 is too large for 32-bit type 'int'

[HOW]

In the case PTEBufferSizeInRequests is zero, skip the dml_log2() and
assign the result directly.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 379729b028474..c3d75e56410cc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -1802,7 +1802,10 @@ static unsigned int CalculateVMAndRowBytes(
 	}
 
 	if (SurfaceTiling == dm_sw_linear) {
-		*dpte_row_height = dml_min(128, 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch), 1));
+		if (PTEBufferSizeInRequests == 0)
+			*dpte_row_height = 1;
+		else
+			*dpte_row_height = dml_min(128, 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch), 1));
 		*dpte_row_width_ub = (dml_ceil(((double) SwathWidth - 1) / *PixelPTEReqWidth, 1) + 1) * *PixelPTEReqWidth;
 		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqWidth * *PTERequestSize;
 	} else if (ScanDirection != dm_vert) {
-- 
2.39.2

