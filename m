Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D46257C74
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BC76E356;
	Mon, 31 Aug 2020 15:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A096E378;
 Mon, 31 Aug 2020 15:30:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 047D8214D8;
 Mon, 31 Aug 2020 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887832;
 bh=fT+Gl91n+3w+s/Fj+AVwPmeQvf8Pt8+tmLBCik5m63s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbuBf1gTQpvKxmyBrV+3qFgBJoArJzSYAyxyZSQArBZH77bI36mvJVm1KSAS91Qs8
 9/2k1yrbzKcvFe1ZdIyjxAPTWWSo1lx9MTirID4mmf0VtgBGDukw1Rve2tnrHRcwRU
 8gfRiJQJUbylSy4kBT7+6FrX1dF0c01wXeE4oV5o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 38/42] drm/amd/display: Keep current gain when ABM
 disable immediately
Date: Mon, 31 Aug 2020 11:29:30 -0400
Message-Id: <20200831152934.1023912-38-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eryk Brol <eryk.brol@amd.com>,
 amd-gfx@lists.freedesktop.org, Brandon Syu <Brandon.Syu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brandon Syu <Brandon.Syu@amd.com>

[ Upstream commit cba4b52e431e5de3d8012281cfe194f1c39a9052 ]

[Why]
When system enters s3/s0i3, backlight PWM would set user level.

[How]
ABM disable function add keep current gain to avoid it.

Signed-off-by: Brandon Syu <Brandon.Syu@amd.com>
Reviewed-by: Josip Pavic <Josip.Pavic@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_stream.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 49aad691e687e..ccac2315a903a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -222,7 +222,7 @@ struct dc_stream_state {
 	union stream_update_flags update_flags;
 };
 
-#define ABM_LEVEL_IMMEDIATE_DISABLE 0xFFFFFFFF
+#define ABM_LEVEL_IMMEDIATE_DISABLE 255
 
 struct dc_stream_update {
 	struct dc_stream_state *stream;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
