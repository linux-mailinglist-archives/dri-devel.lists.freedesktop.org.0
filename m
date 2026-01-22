Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGwIIG5AcmnpfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 16:21:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30F68A17
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 16:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7224E10E9D4;
	Thu, 22 Jan 2026 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N8ty2CZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B1210E0CB;
 Thu, 22 Jan 2026 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m7WPe6F8DGC50lU0mvCVqA2L8EH/LbaK8/94xDy8uUQ=; b=N8ty2CZOxXAQRr9QXe3tTX1RuE
 23NkiIfIz59cntvLyrtOuG/yQjOyqYAgAvKXSzZSby/1sAYvz9gYX82kHDWIDGvPs6f4LDK1xh9R+
 03SKfnWDpELmr+ZtQjh/xGSC4TjxsV+7B0cTnzBBxos0JZ69qVTSQ3D4h6PUOAEt8EeUdlyGSXlSW
 1Le3yHe8dxI9Hw9Lr/mRpt8rmvrPGjUQFopirQBEVUXvYXZVGjYS1u0N/GOTs30NntDgel8tB+e70
 7NOL65ApAdzbsAjivpErJlTc4Hamx5V0N/5HD+7YH2OwIHqgFO6b1uZf4gX9kqWh2+Z6SiypayTGD
 cKPZvkMw==;
Received: from [189.89.57.42] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1viwUb-008V5R-44; Thu, 22 Jan 2026 16:21:05 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, anthony.koo@amd.com, krunoslav.kovac@amd.com,
 wayne.lin@amd.com
Cc: Alex Hung <Alex.Hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: fix wrong color value mapping on MCM shaper
 LUT
Date: Thu, 22 Jan 2026 12:20:29 -0300
Message-ID: <20260122152058.52036-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 4E30F68A17
X-Rspamd-Action: no action

Some shimmer/colorful points appears when using the steamOS color
pipeline for HDR on gaming with DCN32. These points look like black
values being wrongly mapped to red/blue/green values. It was caused
because the number of hw points in regular LUTs and in a shaper LUT was
treated as the same.

DCN3+ regular LUTs have 257 bases and implicit deltas (i.e. HW
calculates them), but shaper LUT is a special case: it has 256 bases and
256 deltas, as in DCN1-2 regular LUTs, and outputs 14-bit values.

Fix that by setting by decreasing in 1 the number of HW points computed
in the LUT segmentation so that shaper LUT (i.e. fixpoint == true) keeps
the same DCN10 CM logic and regular LUTs go with `hw_points + 1`.

CC: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Fixes: 4d5fd3d08ea9 ("drm/amd/display: PQ tail accuracy")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
index 0690c346f2c5..a4f14b16564c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -163,6 +163,11 @@ bool cm3_helper_translate_curve_to_hw_format(
 			hw_points += (1 << seg_distr[k]);
 	}
 
+	// DCN3+ have 257 pts in lieu of no separate slope registers
+	// Prior HW had 256 base+slope pairs
+	// Shaper LUT (i.e. fixpoint == true) is still 256 bases and 256 deltas
+	hw_points = fixpoint ? (hw_points - 1) : hw_points;
+
 	j = 0;
 	for (k = 0; k < (region_end - region_start); k++) {
 		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
@@ -223,8 +228,6 @@ bool cm3_helper_translate_curve_to_hw_format(
 	corner_points[1].green.slope = dc_fixpt_zero;
 	corner_points[1].blue.slope = dc_fixpt_zero;
 
-	// DCN3+ have 257 pts in lieu of no separate slope registers
-	// Prior HW had 256 base+slope pairs
 	lut_params->hw_points_num = hw_points + 1;
 
 	k = 0;
-- 
2.51.0

