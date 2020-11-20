Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9912BB290
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 19:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAA66E8FA;
	Fri, 20 Nov 2020 18:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5405A6E8FA;
 Fri, 20 Nov 2020 18:24:44 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B1C52224C;
 Fri, 20 Nov 2020 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605896684;
 bh=F9oY8QqIOYHoDKOxegk1orF7e6RDnnMuym8/27lt+ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wL76BqgQ2cuxRvIAM08Eh1T29sfwwzqMJvw6FOnTn8mDOC9ACCJaKMed4tTudCL9K
 MjnpSALFurqwkJXrc9ARo7i9xw7XU2Yvo9Zew9OkOwvKKHZvsyTfp/nQVnIJ36XZLF
 FcY0q1NEDnltkG0FVVnZojYVG1uFZd1brPnfjuB8=
Date: Fri, 20 Nov 2020 12:24:49 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 005/141] drm/radeon: Fix fall-through warnings for Clang
Message-ID: <4737ca598d8548f06e5cae6333c0e100b74ffa65.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding multiple fallthrough pseudo-keyword macros,
as replacement for /* fall through */ comments.

Notice that Clang doesn't recognize /* fall through */ comments as
implicit fall-through markings.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 2 +-
 drivers/gpu/drm/radeon/r300.c   | 1 +
 drivers/gpu/drm/radeon/si_dpm.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index 886e9959496f..3d0a2e81b2de 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -4860,8 +4860,8 @@ static void ci_request_link_speed_change_before_state_change(struct radeon_devic
 		case RADEON_PCIE_GEN2:
 			if (radeon_acpi_pcie_performance_request(rdev, PCIE_PERF_REQ_PECI_GEN2, false) == 0)
 				break;
+			fallthrough;
 #endif
-			/* fall through */
 		default:
 			pi->force_pcie_gen = ci_get_current_pcie_speed(rdev);
 			break;
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 73f67bf222e1..213dc49b6322 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -1162,6 +1162,7 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 		/* valid register only on RV530 */
 		if (p->rdev->family == CHIP_RV530)
 			break;
+		fallthrough;
 		/* fallthrough do not move */
 	default:
 		goto fail;
diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index d1c73e9db889..d19c08e0ad5a 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -5748,8 +5748,8 @@ static void si_request_link_speed_change_before_state_change(struct radeon_devic
 		case RADEON_PCIE_GEN2:
 			if (radeon_acpi_pcie_performance_request(rdev, PCIE_PERF_REQ_PECI_GEN2, false) == 0)
 				break;
+			fallthrough;
 #endif
-			/* fall through */
 		default:
 			si_pi->force_pcie_gen = si_get_current_pcie_speed(rdev);
 			break;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
