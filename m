Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3063D75DA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E3F6E2EF;
	Tue, 27 Jul 2021 13:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885696E2EF;
 Tue, 27 Jul 2021 13:19:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CD1061AA2;
 Tue, 27 Jul 2021 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391972;
 bh=z2FjiORDyxIYRNRSzL6v0RUHqVEtdMKdX2dCqsCiIac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JSc3d82AhyYyfhtpPR648CLNGQh/zrpDfoN1qWxgsBtUrZamqmDhgG1gRnix5tlK2
 HzwUaSu3IjxK2PQyc8Rgnr+y2iETJOQqfD9/dRmPRTDlLs5fFIG3As8nbhxmz3XCGm
 4sEAiFtA9EJrw2RVW8aLIY6pmvVMmsP017b+GyxKJFVsDF1Aws/i73JZq4uvVcNtUE
 6kqlDSQjqWT8XuGoaRnZMvBXhO5FdMKbPXANjs8kID3PUY5rZCc5aBEd7iCZ2d2LHQ
 vNkj5ATYFSLy5tuZ3pFLkxVaDzFqgk/0kC356Q8SbMo//MPVUkEnlKRTYCyhYA1xCF
 FGk1RGwIPGS+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 17/21] drm/amd/display: Fix comparison error in
 dcn21 DML
Date: Tue, 27 Jul 2021 09:19:04 -0400
Message-Id: <20210727131908.834086-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131908.834086-1-sashal@kernel.org>
References: <20210727131908.834086-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Victor Lu <victorchengchi.lu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Yongqiang Sun <Yongqiang.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[ Upstream commit ec3102dc6b36c692104c4a0546d4119de59a3bc1 ]

[why]
A comparison error made it possible to not iterate through all the
specified prefetch modes.

[how]
Correct "<" to "<="

Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Yongqiang Sun <Yongqiang.Sun@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 398210d1af34..f49743929357 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -4889,7 +4889,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 			} while ((locals->PrefetchSupported[i][j] != true || locals->VRatioInPrefetchSupported[i][j] != true)
 					&& (mode_lib->vba.NextMaxVStartup != mode_lib->vba.MaxMaxVStartup[0][0]
-						|| mode_lib->vba.NextPrefetchMode < mode_lib->vba.MaxPrefetchMode));
+						|| mode_lib->vba.NextPrefetchMode <= mode_lib->vba.MaxPrefetchMode));
 
 			if (locals->PrefetchSupported[i][j] == true && locals->VRatioInPrefetchSupported[i][j] == true) {
 				mode_lib->vba.BandwidthAvailableForImmediateFlip = locals->ReturnBWPerState[i][0];
-- 
2.30.2

