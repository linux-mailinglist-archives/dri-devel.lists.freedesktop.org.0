Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A42BB2AD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 19:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5056E8F9;
	Fri, 20 Nov 2020 18:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AE66E8F9;
 Fri, 20 Nov 2020 18:35:06 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B1E02408E;
 Fri, 20 Nov 2020 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897306;
 bh=Av3CctImS5px+vH5aOGnfmJT/5+na98GlyjEbLF9eUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SiVBZsccUC4NpRfbtlFuQWAATL1H4zKKttK6TJDLyoZ2uVPo2X6uKTUx1XRKQlP93
 uHYUqgPcpUxfYsRPpY5AWv+tQjsO4NlMncEEPFijghWTxd9rWv6EqC0UF/TShGbmsQ
 74m3R9JKdJbglFn0+W6xDXty1JSgikm3ASMagTfY=
Date: Fri, 20 Nov 2020 12:35:11 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 078/141] drm/amd/pm: Fix fall-through warnings for Clang
Message-ID: <b73d98f74902b495689069177ffde953e1a061fb.1605896059.git.gustavoars@kernel.org>
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
of warnings by explicitly adding a break statement instead of letting
the code fall through to the next case, and a fallthrough pseudo-keyword
as a replacement for a /* fall through */ comment,

Notice that Clang doesn't recognize /* fall through */ comments as
implicit fall-through markings.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c                  | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
index b5986d19dc08..afa1711c9620 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
@@ -6200,8 +6200,8 @@ static void si_request_link_speed_change_before_state_change(struct amdgpu_devic
 		case AMDGPU_PCIE_GEN2:
 			if (amdgpu_acpi_pcie_performance_request(adev, PCIE_PERF_REQ_PECI_GEN2, false) == 0)
 				break;
+			fallthrough;
 #endif
-			/* fall through */
 		default:
 			si_pi->force_pcie_gen = si_get_current_pcie_speed(adev);
 			break;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
index c3d2e6dcf62a..7d7d698c7976 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
@@ -2272,6 +2272,7 @@ static int polaris10_update_smc_table(struct pp_hwmgr *hwmgr, uint32_t type)
 		break;
 	case SMU_BIF_TABLE:
 		polaris10_update_bif_smc_table(hwmgr);
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
