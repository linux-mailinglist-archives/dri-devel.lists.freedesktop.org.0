Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154673719BD
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FC16E93D;
	Mon,  3 May 2021 16:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6B76E939;
 Mon,  3 May 2021 16:36:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF8C1613EC;
 Mon,  3 May 2021 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059801;
 bh=KprGEgi2SnO1s/mKEo8xVV/ncCKSK03eyLB1dOpN8Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gNNLzxf8CJzwG2Yg3LaSYfR859s3OX3LHNZZYwnrNOu7rPWUqjxgQ+uA+ZHTLgvzL
 oVHZL90Njn6nwtYM2YYlRXQ6CgnN5LO0CA5rk9VaMs7sRryWr5TK17eOS4uCLAZRKr
 +eyPzZm0Hfi+WQZuP54JFgOZHH0qGjwQi2T7wSNia12JmRwiIgwLnSBD/d3WDBb3Zz
 BUMU2+2dIKedVJ8a2EsERIqX7BV9nBIv7NjHSzLC+6NVhsV68o48D9j6SLttrpMa6H
 xHNGQHghDDd0acM0h1SGqyc8TTPoDZe85NDAnbwyP1shexr12Lk1uA+rQ7H7ZJ5zK+
 yhBr1hG9PaQ9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 056/134] drm/amd/display: fix dml prefetch
 validation
Date: Mon,  3 May 2021 12:33:55 -0400
Message-Id: <20210503163513.2851510-56-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Solomon Chiu <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit 8ee0fea4baf90e43efe2275de208a7809f9985bc ]

Incorrect variable used, missing initialization during validation.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Eric Bernstein <Eric.Bernstein@amd.com>
Acked-by: Solomon Chiu <solomon.chiu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c   | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 0f3f510fd83b..9729cf292e84 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -3437,6 +3437,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			mode_lib->vba.DCCEnabledInAnyPlane = true;
 		}
 	}
+	mode_lib->vba.UrgentLatency = mode_lib->vba.UrgentLatencyPixelDataOnly;
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		locals->FabricAndDRAMBandwidthPerState[i] = dml_min(
 				mode_lib->vba.DRAMSpeedPerState[i] * mode_lib->vba.NumberOfChannels
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index 210c96cd5b03..51098c2c9854 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -3544,6 +3544,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 			mode_lib->vba.DCCEnabledInAnyPlane = true;
 		}
 	}
+	mode_lib->vba.UrgentLatency = mode_lib->vba.UrgentLatencyPixelDataOnly;
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		locals->FabricAndDRAMBandwidthPerState[i] = dml_min(
 				mode_lib->vba.DRAMSpeedPerState[i] * mode_lib->vba.NumberOfChannels
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
