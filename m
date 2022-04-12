Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403334FCA1B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE210FAEE;
	Tue, 12 Apr 2022 00:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375C610FB05;
 Tue, 12 Apr 2022 00:49:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAED6617D9;
 Tue, 12 Apr 2022 00:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10D7C385A3;
 Tue, 12 Apr 2022 00:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724558;
 bh=x2XT2LhA0V8ntU79yMIwn8Lz1NtA66WsDke6W8W6bBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A/bcz0LA9nBTeMyfWJNCnAa8gfxM+vroXE0CHTTCTl3S4jLVCggdKBXp28nhRO/4w
 44AZcfU83IlKSyn/if84XJYeXi41RFDMdkqmBjMgejOnu0eXS8gHkkjerjKlIfVhPx
 d9AHIg34zCVV9D8WLYB9nfwAFuHLsZ0+CL92c1UDdnqot0haJywrQnetwF2EpDIHDl
 bNaef6EKcdfR62a4hQ3A9mWqa9H95qPc1DbIM6pvVsNDP+NJfRcDa5IdA4BtZLNBOP
 4LjG4AKVVU1mQO4Px4Km5/xuLrVi+GOIPbFybzCUjuGT7tlu95ZCLVEZC7niay/tA8
 8lFsIgBlo8p6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/30] drm/amd/display: fix audio format not
 updated after edid updated
Date: Mon, 11 Apr 2022 20:48:38 -0400
Message-Id: <20220412004906.350678-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004906.350678-1-sashal@kernel.org>
References: <20220412004906.350678-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 meenakshikumar.somasundaram@amd.com, Jun.Lei@amd.com, Jimmy.Kizito@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Jerry.Zuo@amd.com, eric.bernstein@amd.com, Alvin Lee <Alvin.Lee2@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Martin.Leung@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 Dmytro.Laktyushkin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charlene Liu <Charlene.Liu@amd.com>

[ Upstream commit 5e8a71cf13bc9184fee915b2220be71b4c6cac74 ]

[why]
for the case edid change only changed audio format.
driver still need to update stream.

Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 5f4cdb05c4db..a21f1141fbb0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1698,8 +1698,8 @@ bool dc_is_stream_unchanged(
 	if (old_stream->ignore_msa_timing_param != stream->ignore_msa_timing_param)
 		return false;
 
-	// Only Have Audio left to check whether it is same or not. This is a corner case for Tiled sinks
-	if (old_stream->audio_info.mode_count != stream->audio_info.mode_count)
+	/*compare audio info*/
+	if (memcmp(&old_stream->audio_info, &stream->audio_info, sizeof(stream->audio_info)) != 0)
 		return false;
 
 	return true;
-- 
2.35.1

