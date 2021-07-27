Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6E3D75E8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B146E48C;
	Tue, 27 Jul 2021 13:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69956E45D;
 Tue, 27 Jul 2021 13:19:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC8BD61ABB;
 Tue, 27 Jul 2021 13:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391997;
 bh=MDcVSK2GDmf3O0O+rkmm2pczFRVhWr9fQajH+o6Cd1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mf3r8P6bLhnxdqF7Yzijfy7MZwBxnHnFSyzj52xKWNQUUGpUf/4bop04j7TdQiZ1c
 WpQEU4q8RLu4uqkJ0Vo1/z25ZVWRmVgblp45gb9jIz+NaMf7RI91JVqYpJ9QuZJ4Uq
 qmnlpATIN0LdeE+JXExoqqXHj+wKiKw/7NVsks2vDrLBborMJZ3ISrY7DVma4AA1EV
 oxTrXm5BNSuIvwDq6Wes+HGoYkueT6yU1m0eIsyUyxLlUZix9jUUZvCoAMUyHmVcsV
 5M20VEj5ddf2O7e+78Qj6l24Qw1ALfTvF+HJw7c7raiGyzieCzwHcnObveryUWFkVJ
 R3puPLMwXRKbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/17] drm/amd/display: Fix comparison error in
 dcn21 DML
Date: Tue, 27 Jul 2021 09:19:36 -0400
Message-Id: <20210727131938.834920-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131938.834920-1-sashal@kernel.org>
References: <20210727131938.834920-1-sashal@kernel.org>
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
index 367c82b5ab4c..c09bca335068 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -4888,7 +4888,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 			} while ((locals->PrefetchSupported[i][j] != true || locals->VRatioInPrefetchSupported[i][j] != true)
 					&& (mode_lib->vba.NextMaxVStartup != mode_lib->vba.MaxMaxVStartup[0][0]
-						|| mode_lib->vba.NextPrefetchMode < mode_lib->vba.MaxPrefetchMode));
+						|| mode_lib->vba.NextPrefetchMode <= mode_lib->vba.MaxPrefetchMode));
 
 			if (locals->PrefetchSupported[i][j] == true && locals->VRatioInPrefetchSupported[i][j] == true) {
 				mode_lib->vba.BandwidthAvailableForImmediateFlip = locals->ReturnBWPerState[i][0];
-- 
2.30.2

