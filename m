Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94ADD337CA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 17:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045B10E8E5;
	Fri, 16 Jan 2026 16:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="R7UoTvfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83D910E8E0;
 Fri, 16 Jan 2026 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bajJ8+dHjXtYGex+f+95AY2w8V9C1KU0EX1kMHyVDnA=; b=R7UoTvfZHJo9Hvaby3Es4ZyfZ2
 D07hpRs61oCGUIyz5NE5eJi/5A5Rvs87oQyzRmhSBKi4U3ldNttqSawZnYSNDJHVPD+WSHuZFSxu2
 CNTUb1R1o8RsWQC14TG/pcyhxdHGtOtcWoZkjP69R7KATZtZbQkoDYFgB9bt1RlElpueAVQGAKiDI
 K8Yum0sPMnh3QX/croHq5HCobdqr0EmQpB35YLKsXl40OH0cq3ftwwbgawyc59HpBVCRtpHxPGEBI
 LKQmpJ8076eC1u9ZMXV5uE+N8rdwFY3Z/32feUZan5okGHf8GuS6G39sQb/bE1gSlnI/wjBLSiBaQ
 8jeI6Brg==;
Received: from [189.89.57.42] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vgmfq-006Egk-KD; Fri, 16 Jan 2026 17:27:47 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Alvin Lee <Alvin.Lee2@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [RFC PATCH] drm/amd/display: fix screen blinking when exits SubVP to
 MPO
Date: Fri, 16 Jan 2026 13:26:01 -0300
Message-ID: <20260116162741.89743-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Whenever transitioning from SubVP to MPO in a high refresh rate and high
resolution display, for example, 4k@120Hz or higher, screen blinks as a
white flash. On gamescope, it happens every time the cursor disappears
because it stops composing in a single plane and returns using primary +
one/two overlay planes. According to [1] SubVP + MPO isn't supported and
the white flash seems to occur exactly when exiting SubVP.

It happens with DCN321 and DCN401, at least. As there is no transition
from SubVP to MPO if SubVP is disabled (ofc), there is no blink when
moving from single plane to multiple planes. Check [2] for more details.

[1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/14eb72ff580d
[2] https://gitlab.freedesktop.org/drm/amd/-/issues/4877

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

I wonder if the problem could be solved by adding more steps between
first totally disabling SubVP (and its PHANTOM pipe), and only after
that enabling more than one plane. To me, it seems related to the
sequence in which the driver removes and adds pipes with different
features. My attempts to fix it were unsuccessful, and I'm not sure if
the feature can function stably.

Can you guys take a look at this?

Thanks,

Melissa

 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index b276fec3e479..9cca249bdd6f 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -716,7 +716,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 		}
 	},
 	.use_max_lb = true,
-	.force_disable_subvp = false,
+	.force_disable_subvp = true,
 	.exit_idle_opt_for_cursor_updates = true,
 	.using_dml2 = false,
 	.using_dml21 = false, // TODO : Temporary for N-1 validation. Remove after N-1 is done.
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 3466ca34c93f..6388e95c89aa 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -712,7 +712,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 		}
 	},
 	.use_max_lb = true,
-	.force_disable_subvp = false,
+	.force_disable_subvp = true,
 	.exit_idle_opt_for_cursor_updates = true,
 	.enable_single_display_2to1_odm_policy = true,
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 875ae97489d3..789139f549b4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -707,7 +707,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 		}
 	},
 	.use_max_lb = true,
-	.force_disable_subvp = false,
+	.force_disable_subvp = true,
 	.disable_force_pstate_allow_on_hw_release = false,
 	.exit_idle_opt_for_cursor_updates = true,
 	.using_dml2 = true,
-- 
2.51.0

