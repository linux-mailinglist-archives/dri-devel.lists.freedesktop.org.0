Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B95A05CF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6CCD083E;
	Thu, 25 Aug 2022 01:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD432D07A0;
 Thu, 25 Aug 2022 01:35:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F12E1B825ED;
 Thu, 25 Aug 2022 01:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B81C43140;
 Thu, 25 Aug 2022 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391309;
 bh=lrrNFEl0vGA+79mhCUIz0uHj9v5/rtnv5eKLywRXP48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fFEYdUxtF2CeqZFJddlsbl3k6EuPgE4emZuTv4qE7SQl6ArgrX4TB1xEp5D3hcmER
 Rohr0UvzX3As1We0iaoeGSSEjLiOYuAhUDIWdwDI7jeN+IUCa4jU1ffSdclTV+YTZJ
 5Z9SnwMAIA0jLKRNnWd6ka654YG5DW6ARFPHpygOiPDpYfSu5LBXU8jUsDqPul/Ikx
 AwdzXIzVAWpEWUs3h4xdg/0um5q7XRZ5n1RHNnzuZdp8QVIuivRovCKCbXRUxWlda+
 hgQEBpWbY+1DjnE6+SfOE8+QYbyyLSEnTRqE7BkIc8P5dl/LKJp/24OlBhqHdgQbzd
 mmp1EPtVmy3aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 11/38] drm/amd/display: Fix TDR eDP and USB4
 display light up issue
Date: Wed, 24 Aug 2022 21:33:34 -0400
Message-Id: <20220825013401.22096-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, Rodrigo.Siqueira@amd.com, Samson.Tam@amd.com,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>,
 Sasha Levin <sashal@kernel.org>, po-tchen@amd.com, wenjing.liu@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, Jerry.Zuo@amd.com,
 michael.strauss@amd.com, alvin.lee2@amd.com, George.Shen@amd.com,
 joshua.aberback@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 martin.leung@amd.com, hanghong.ma@amd.com, Tom Chung <chiahsuan.chung@amd.com>,
 Xinhui.Pan@amd.com, christian.koenig@amd.com, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>

[ Upstream commit 30456ffa65469d1d2e5e1da05017e6728d24c11c ]

[Why]
After TDR recovery, eDP and USB4 display does not light up. Because
dmub outbox notifications are not enabled after dmub reload and link
encoder assignments for the streams are not cleared before dc state
reset.

[How]
- Dmub outbox notification is enabled after tdr recovery by issuing
  inbox command to dmub.
- Link encoders for the streams are unassigned before dc state reset.

Reviewed-by: Jimmy Kizito <Jimmy.Kizito@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index f14449401188..7d69341acca0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3783,6 +3783,7 @@ void dc_enable_dmub_outbox(struct dc *dc)
 	struct dc_context *dc_ctx = dc->ctx;
 
 	dmub_enable_outbox_notification(dc_ctx->dmub_srv);
+	DC_LOG_DC("%s: dmub outbox notifications enabled\n", __func__);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index a3c37ee3f849..f96f53c1bc25 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -337,6 +337,7 @@ enum dc_detect_reason {
 	DETECT_REASON_HPDRX,
 	DETECT_REASON_FALLBACK,
 	DETECT_REASON_RETRAIN,
+	DETECT_REASON_TDR,
 };
 
 bool dc_link_detect(struct dc_link *dc_link, enum dc_detect_reason reason);
-- 
2.35.1

