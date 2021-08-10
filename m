Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A53E5119
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 04:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A5E89E03;
	Tue, 10 Aug 2021 02:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Tue, 10 Aug 2021 02:39:53 UTC
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C200589E03
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 02:39:53 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 320741A065C;
 Tue, 10 Aug 2021 04:32:28 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EF6D81A05B5;
 Tue, 10 Aug 2021 04:32:27 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 81DC4183AD28; Tue, 10 Aug 2021 10:32:26 +0800 (+08)
From: Sandor.yu@nxp.com
To: liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: Sandor.yu@nxp.com
Subject: [PATCH] drm/arm/malidp: fix mode_valid couldn't cull invalid modes
 issue
Date: Tue, 10 Aug 2021 10:43:31 +0800
Message-Id: <20210810024331.14050-1-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
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

From: Sandor Yu <Sandor.yu@nxp.com>

In function malidp_crtc_mode_valid, mode->crtc_mode = 0 when run
in drm_helper_probe_single_connector_modes.
Invalid video modes are not culled
and all modes move to the connector's modes list.
It is not expected by mode_valid.

Replace mode->crtc_clock with mode->clock to fix the issue.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 494075ddbef6..55890334385d 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -31,7 +31,7 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
 	 * check that the hardware can drive the required clock rate,
 	 * but skip the check if the clock is meant to be disabled (req_rate = 0)
 	 */
-	long rate, req_rate = mode->crtc_clock * 1000;
+	long rate, req_rate = mode->clock * 1000;
 
 	if (req_rate) {
 		rate = clk_round_rate(hwdev->pxlclk, req_rate);
-- 
2.17.1

