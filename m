Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E441F4FC9AE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD05010FABA;
	Tue, 12 Apr 2022 00:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1637310FAB9;
 Tue, 12 Apr 2022 00:45:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97FF4612A8;
 Tue, 12 Apr 2022 00:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC8CC385AC;
 Tue, 12 Apr 2022 00:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724357;
 bh=FFtHTLViO7Kk3k4dRDhJk2ARFMqmxQ2ReCqBcHvNwIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o9ful9W01zJvCky67lrNLXbqXSbvaaKX2naQ3QiC4+70A1Rvj5oEdAV4jp5B0Dv4R
 gGUKdlzU6VTcJemSVFWXXJ7K94T444bzK8m+NsWqnY8Ru8M5lDLB/HWLKx6tw011Hh
 OI87oTIJYmAX6bsAQP3mMXFWlmYYfAatafoKbNZc6SFAbcKK8ys0w5AD1M2Vs10CSf
 jAzgVES3ML9qlbl4AU5fEwHSLF5/w6jbzGXgrpvB4aZK+V5bOx5zpE3S/x49PnF5SF
 GWDpSigZtwr8zE/WfYrORl9QWrReSsRXD2HhSzCA5muhkOWqwpy2GpRKo8T/t/lBSa
 1P0tUhz2TmavQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 35/49] drm/amd/display: Correct Slice reset
 calculation
Date: Mon, 11 Apr 2022 20:43:53 -0400
Message-Id: <20220412004411.349427-35-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004411.349427-1-sashal@kernel.org>
References: <20220412004411.349427-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, MarkAlbert.Morra@amd.com,
 Chris Park <Chris.Park@amd.com>, tzimmermann@suse.de,
 Alex Hung <alex.hung@amd.com>, Rodrigo.Siqueira@amd.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, mikita.lipski@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Park <Chris.Park@amd.com>

[ Upstream commit 862a876c3a6372f2fa9d0c6510f1976ac94fc857 ]

[Why]
Once DSC slice cannot fit pixel clock, we incorrectly
reset min slices to 0 and allow max slice to operate,
even when max slice itself cannot fit the pixel clock
properly.

[How]
Change the sequence such that we correctly determine
DSC is not possible when both min slices and max
slices cannot fit pixel clock per slice.

Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Chris Park <Chris.Park@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 9c74564cbd8d..8973d3a38f9c 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -864,11 +864,11 @@ static bool setup_dsc_config(
 		min_slices_h = inc_num_slices(dsc_common_caps.slice_caps, min_slices_h);
 	}
 
+	is_dsc_possible = (min_slices_h <= max_slices_h);
+
 	if (pic_width % min_slices_h != 0)
 		min_slices_h = 0; // DSC TODO: Maybe try increasing the number of slices first?
 
-	is_dsc_possible = (min_slices_h <= max_slices_h);
-
 	if (min_slices_h == 0 && max_slices_h == 0)
 		is_dsc_possible = false;
 
-- 
2.35.1

