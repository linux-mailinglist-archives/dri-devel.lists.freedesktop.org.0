Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534661194B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB666E982;
	Tue, 10 Dec 2019 21:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A8E6E967;
 Tue, 10 Dec 2019 21:17:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93D2C24684;
 Tue, 10 Dec 2019 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012125;
 bh=5EhyCug/9vprCrA0ONIhYKS5pO1gYpNAEwSkpe81XlM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MXc4yRo0xZT7Ab+373jz10x8xrJCRk575Gs9R3/IDZY0EMZUtoj3vXXF7Wg0MtHtk
 hDXirvn4TdqQueHeQ06A5Qfucdh0h3VJyQTcxhRS/512CxMrcW+R1L63QSfipFpaCM
 bqS/+98E+wl8HhTS31uKzWE1J5+UHUw3nmJgazw8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 095/350] drm/amd/display: Properly round nominal
 frequency for SPD
Date: Tue, 10 Dec 2019 16:03:20 -0500
Message-Id: <20191210210735.9077-56-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Anthony Koo <Anthony.Koo@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

[ Upstream commit c59802313e84bede954235b3a5dd0dd5325f49c5 ]

[Why]
Some displays rely on the SPD verticle frequency maximum value.
Must round the calculated refresh rate to the nearest integer.

[How]
Round the nominal calculated refresh rate to the nearest whole
integer.

Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/modules/freesync/freesync.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index ec70c9b12e1aa..0978c698f0f85 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -743,6 +743,10 @@ void mod_freesync_build_vrr_params(struct mod_freesync *mod_freesync,
 	nominal_field_rate_in_uhz =
 			mod_freesync_calc_nominal_field_rate(stream);
 
+	/* Rounded to the nearest Hz */
+	nominal_field_rate_in_uhz = 1000000ULL *
+			div_u64(nominal_field_rate_in_uhz + 500000, 1000000);
+
 	min_refresh_in_uhz = in_config->min_refresh_in_uhz;
 	max_refresh_in_uhz = in_config->max_refresh_in_uhz;
 
@@ -996,14 +1000,13 @@ unsigned long long mod_freesync_calc_nominal_field_rate(
 			const struct dc_stream_state *stream)
 {
 	unsigned long long nominal_field_rate_in_uhz = 0;
+	unsigned int total = stream->timing.h_total * stream->timing.v_total;
 
-	/* Calculate nominal field rate for stream */
+	/* Calculate nominal field rate for stream, rounded up to nearest integer */
 	nominal_field_rate_in_uhz = stream->timing.pix_clk_100hz / 10;
 	nominal_field_rate_in_uhz *= 1000ULL * 1000ULL * 1000ULL;
-	nominal_field_rate_in_uhz = div_u64(nominal_field_rate_in_uhz,
-						stream->timing.h_total);
-	nominal_field_rate_in_uhz = div_u64(nominal_field_rate_in_uhz,
-						stream->timing.v_total);
+
+	nominal_field_rate_in_uhz =	div_u64(nominal_field_rate_in_uhz, total);
 
 	return nominal_field_rate_in_uhz;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
