Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED48127C9E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 15:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4346EC3D;
	Fri, 20 Dec 2019 14:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A9F6EC38;
 Fri, 20 Dec 2019 14:30:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 937D1206CB;
 Fri, 20 Dec 2019 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852207;
 bh=0uH/IchrsHYxfzfwr7jz2PTjjfJWnG8AXFV5wuLtNGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AWD1vKuM/auhj8N5AHyuqkU0ymiwfQJJTljACht9louP2GJIUdj1/nicM3ebdnjiJ
 S1K9T2i0BPFqS8d5/VbNOhmedYO6GBjWswhv5uKVVIZ1LcgYcQR3VCTTRgUIvXF9XP
 xsxDkIbnOB1zjMI9Zbvdl4b8j8oKMKB6IC8IqRF4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 09/52] drm/amd/display: Change the delay time
 before enabling FEC
Date: Fri, 20 Dec 2019 09:29:11 -0500
Message-Id: <20191220142954.9500-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <Nikola.Cornij@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Leo (Hanghong) Ma" <hanghong.ma@amd.com>

[ Upstream commit 28fa24ad14e8f7d23c62283eaf9c79b4fd165c16 ]

[why]
DP spec requires 1000 symbols delay between the end of link training
and enabling FEC in the stream. Currently we are using 1 miliseconds
delay which is not accurate.

[how]
One lane RBR should have the maximum time for transmitting 1000 LL
codes which is 6.173 us. So using 7 microseconds delay instead of
1 miliseconds.

Signed-off-by: Leo (Hanghong) Ma <hanghong.ma@amd.com>
Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Reviewed-by: Nikola Cornij <Nikola.Cornij@amd.com>
Acked-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index f5742719b5d9b..b6e68e9c81d11 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3490,7 +3490,14 @@ void dp_set_fec_enable(struct dc_link *link, bool enable)
 	if (link_enc->funcs->fec_set_enable &&
 			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE) {
 		if (link->fec_state == dc_link_fec_ready && enable) {
-			msleep(1);
+			/* Accord to DP spec, FEC enable sequence can first
+			 * be transmitted anytime after 1000 LL codes have
+			 * been transmitted on the link after link training
+			 * completion. Using 1 lane RBR should have the maximum
+			 * time for transmitting 1000 LL codes which is 6.173 us.
+			 * So use 7 microseconds delay instead.
+			 */
+			udelay(7);
 			link_enc->funcs->fec_set_enable(link_enc, true);
 			link->fec_state = dc_link_fec_enabled;
 		} else if (link->fec_state == dc_link_fec_enabled && !enable) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
