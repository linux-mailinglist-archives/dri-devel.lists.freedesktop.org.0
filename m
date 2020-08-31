Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D4E257C75
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7F6E373;
	Mon, 31 Aug 2020 15:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD726E358;
 Mon, 31 Aug 2020 15:30:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FD32207EA;
 Mon, 31 Aug 2020 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887830;
 bh=XeKscrXj7WbziYvkv0A54es1/smVegRQF/4zdzIrzso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bctM+zbeIT2GqpIpva1JM4S8FHi2zoMdSjAYgsaN9AwFijvVS2ZQSBPmejsoQQCgt
 hXYwkqe98ZBjxpNc3L9rhwaGCPQUbVn9Wz++hNOcwSvW1c9I4VtcPyUXfR3FBXnKPF
 gzt0JLksnp3cCiyWGx9sEEnNOj6q5MpCW+/nrZDI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 37/42] drm/amd/display: Fix passive dongle
 mistaken as active dongle in EDID emulation
Date: Mon, 31 Aug 2020 11:29:29 -0400
Message-Id: <20200831152934.1023912-37-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Samson Tam <Samson.Tam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samson Tam <Samson.Tam@amd.com>

[ Upstream commit efbde23a3b0164cef27fd394e7d548f46af5b51d ]

[Why]
dongle_type is set during dongle connection but for passive dongles,
dongle_type is not set. If user starts with an active dongle and
then switches to a passive dongle, it will still report as an active
dongle. Trying to emulate the wrong connecter type results in display
not lighting up.

[How]
Set dpcd_caps.dongle_type for passive dongles in detect_dp().

Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Reviewed-by: Joshua Aberback <Joshua.Aberback@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index bdddb46727b1f..885beb0bcc199 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -767,6 +767,7 @@ static bool detect_dp(struct dc_link *link,
 		sink_caps->signal = dp_passive_dongle_detection(link->ddc,
 								sink_caps,
 								audio_support);
+		link->dpcd_caps.dongle_type = sink_caps->dongle_type;
 	}
 
 	return true;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
