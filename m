Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4694A8D8D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401AE10E709;
	Thu,  3 Feb 2022 20:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89B110E67E;
 Thu,  3 Feb 2022 20:31:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56D5961AB9;
 Thu,  3 Feb 2022 20:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9AAC340EF;
 Thu,  3 Feb 2022 20:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643920297;
 bh=Vv//BExRI3t85Qsd/+tzwcI53cblzmjE6OyXjRNe/UE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=guzqe2jqKMS06lrroT4FRQg0LZNUoxZoIQ4whJ91bk137i7hL+u495EIo86FeD9Cb
 3ADAlKU1yzCfBhOI9N+3547t1juie0WS9McJ4HApZJnDJ4bf/9p00oJ8GlR3c4XjRX
 ZskJymJPMXuYtdGmxIu8fv5RWcX9hifcIP5G77IZR85CBQ6KEgi8RZpNI3nvr29FkS
 Ch1GDuYAkzSEkri6PBzkMX/QetJWi9rfBMckb77SlAsCV2e71O7+21gQ0dhbJ5lynz
 srTG0aP6drX6u+m4B7+5I2Dj4rrgoapiymrQFQom7Ey3bPEzNSX1ywaBoNv8s/MdVc
 ksQXrmP3nx+EQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 40/52] drm/amdgpu/display: use msleep rather than
 udelay for long delays
Date: Thu,  3 Feb 2022 15:29:34 -0500
Message-Id: <20220203202947.2304-40-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203202947.2304-1-sashal@kernel.org>
References: <20220203202947.2304-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com,
 Wesley.Chalmers@amd.com, sunpeng.li@amd.com, wenjing.liu@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, Jerry.Zuo@amd.com, dri-devel@lists.freedesktop.org,
 George.Shen@amd.com, Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 christian.koenig@amd.com, Jimmy.Kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 98fdcacb45f7cd2092151d6af2e60152811eb79c ]

Some architectures (e.g., ARM) throw an compilation error if the
udelay is too long.  In general udelays of longer than 2000us are
not recommended on any architecture.  Switch to msleep in these
cases.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 01ac1a64c78b9..d1b47c0d7791a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -6038,7 +6038,7 @@ bool dpcd_write_128b_132b_sst_payload_allocation_table(
 			}
 		}
 		retries++;
-		udelay(5000);
+		msleep(5);
 	}
 
 	if (!result && retries == max_retries) {
@@ -6090,7 +6090,7 @@ bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link)
 			break;
 		}
 
-		udelay(5000);
+		msleep(5);
 	}
 
 	if (result == ACT_FAILED) {
-- 
2.34.1

