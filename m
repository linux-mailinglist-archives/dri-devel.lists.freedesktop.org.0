Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4E81AEEEB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 16:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6685C6EC9C;
	Sat, 18 Apr 2020 14:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F36EC94;
 Sat, 18 Apr 2020 14:41:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DD1121974;
 Sat, 18 Apr 2020 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220873;
 bh=t42lwvzvRuq+EdPO2A4ahvdJe7rqQ1zQNaWJvazif4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y/2W7rDJT+om6ZLVNOXlRd3v4danOoVeY8MzWmPiT4YgR9KL38Xop1vWcqx4F6HTQ
 VIkawfknhvV+IdNFZWZD+acOLg2bQUrmsEoURMgSuDnDFL5aCV7KfS2c1C1RFx5FBs
 18AvH2UNDNFTraICEDkfNoBBHm0ZWe+7FgAWz0+I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 21/78] drm/amd/display: Update stream adjust in
 dc_stream_adjust_vmin_vmax
Date: Sat, 18 Apr 2020 10:39:50 -0400
Message-Id: <20200418144047.9013-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Isabel Zhang <isabel.zhang@amd.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Alvin Lee <Alvin.Lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Isabel Zhang <isabel.zhang@amd.com>

[ Upstream commit 346d8a0a3c91888a412c2735d69daa09c00f0203 ]

[Why]
After v_total_min and max are updated in vrr structure, the changes are
not reflected in stream adjust. When these values are read from stream
adjust it does not reflect the actual state of the system.

[How]
Set stream adjust values equal to vrr adjust values after vrr adjust
values are updated.

Signed-off-by: Isabel Zhang <isabel.zhang@amd.com>
Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 4704aac336c29..89bd0ba3db1df 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -283,6 +283,8 @@ bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 	int i = 0;
 	bool ret = false;
 
+	stream->adjust = *adjust;
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
