Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB382A2A7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3162310E65E;
	Wed, 10 Jan 2024 20:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552AD10E65B;
 Wed, 10 Jan 2024 20:46:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA0BC618EB;
 Wed, 10 Jan 2024 20:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5333C433F1;
 Wed, 10 Jan 2024 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704919615;
 bh=Xg9lnyE22VXBwPU3Db8PJTmAlrZRAYVmPEj0reyp/xk=;
 h=From:Date:Subject:To:Cc:From;
 b=ddUka3t7mdfb7aNEzNWt0XPMdGO8JhXJrDJZP9a6oDnAytItdEoD109gfkGMn8Yto
 ydF/Ld5JzHMD/xSELZsIua5ZOFI9VtemkNUiEAeY4071m5cFTkFsRPXMg40W8eb9ma
 he3Q2wU5l1t7D4lww4Crmv7BJXYfbZJki6+RAOu0m3p1Vmn3OxGWxLcRxJsM8mB00Q
 o1iI1xy0rzG5qvK/NBDFCitsDl2R6hbL65XJbS01RdjFBeoTgFNP4uVSmTMKWz68qz
 6MkiFE9uWzbxsyNde0ycmxnUmwehzMGvyxJWtdw/sx8OR76G1j/t2TUIsHftP/jY95
 mNRssX/YTxtNw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 10 Jan 2024 13:46:47 -0700
Subject: [PATCH] drm/amd/display: Avoid enum conversion warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-amdgpu-display-enum-enum-conversion-v1-1-953ae94fe15e@kernel.org>
X-B4-Tracking: v=1; b=H4sIADYCn2UC/yWNQQqDMBBFryKz7kASUgpeRVxMzZgOmBgSFEW8u
 9FuHrzF+/+Awlm4QNsckHmVInOsol8NDD+KnlFcdTDKWKW1QgrOpwWdlDTRjhyX8Mcwx5Xz3SM
 b+9bkvqOlD9SllHmU7Xnp+vO8ANYejTt1AAAA
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Xg9lnyE22VXBwPU3Db8PJTmAlrZRAYVmPEj0reyp/xk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKnzmezmflB5KuXzq2ftB+Yf0q8vq8t/8jP2v7fI1bukf
 4eE7ZqIjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRlbcZ/scdubnz1PZVen46
 6h0fI09tVYic6uAwP6y0/pew3GzBI66MDI8cDxxJ3vRmmfSsb847Dv75b89ePy/wx8W54T7/3j0
 yn8wOAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, Nathan Chancellor <nathan@kernel.org>,
 peichen.huang@amd.com, cruise.hung@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns (or errors with CONFIG_WERROR=y) when performing arithmetic
with different enumerated types, which is usually a bug:

    drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:548:24: error: arithmetic between different enumeration types ('const enum dc_link_rate' and 'const enum dc_lane_count') [-Werror,-Wenum-enum-conversion]
      548 |                         link_cap->link_rate * link_cap->lane_count * LINK_RATE_REF_FREQ_IN_KHZ * 8;
          |                         ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
    1 error generated.

In this case, there is not a problem because the enumerated types are
basically treated as '#define' values. Add an explicit cast to an
integral type to silence the warning.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1976
Fixes: 5f3bce13266e ("drm/amd/display: Request usb4 bw for mst streams")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
index 4ef1a6a1d129..dd0d2b206462 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
@@ -544,8 +544,9 @@ int link_dp_dpia_get_dp_overhead_in_dp_tunneling(struct dc_link *link)
 		 */
 		const struct dc_link_settings *link_cap =
 			dc_link_get_link_cap(link);
-		uint32_t link_bw_in_kbps =
-			link_cap->link_rate * link_cap->lane_count * LINK_RATE_REF_FREQ_IN_KHZ * 8;
+		uint32_t link_bw_in_kbps = (uint32_t)link_cap->link_rate *
+					   (uint32_t)link_cap->lane_count *
+					   LINK_RATE_REF_FREQ_IN_KHZ * 8;
 		link_mst_overhead = (link_bw_in_kbps / 64) + ((link_bw_in_kbps % 64) ? 1 : 0);
 	}
 

---
base-commit: 6e7a29f011ac03a765f53844f7c3f04cdd421715
change-id: 20240110-amdgpu-display-enum-enum-conversion-e2451adbf4a7

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

