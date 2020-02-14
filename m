Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B415DB85
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED996F972;
	Fri, 14 Feb 2020 15:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527046F972
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:49:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5095B2086A;
 Fri, 14 Feb 2020 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695366;
 bh=m2QY89YMDTBv5LbPtFDrXsFu6fj+7Qh5AXzAdmpTi+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgCznXuN1StiYGEH71duvRbOls02tbU4tiOvcaLG6MfBKcF09BXtnJx+D8h+IpNJp
 MVF+8PTvHRXdmwbM33PXK4nklE17cX76V1ALssT5K0XzKL0IGElXpiLgd821slkhH/
 Twn6YXg5HtG/V6s9KouuPGcDK5fytlO66m58JSWk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 024/542] drm: rcar-du: Recognize "renesas,
 vsps" in addition to "vsps"
Date: Fri, 14 Feb 2020 10:40:16 -0500
Message-Id: <20200214154854.6746-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 7b627ce80fbd05885b27f711a5f9820f2b40749a ]

The Renesas-specific "vsps" property lacks a vendor prefix.
Add a "renesas," prefix to comply with DT best practises.
Retain backward compatibility with old DTBs by falling back to "vsps"
when needed.

Fixes: 6d62ef3ac30be756 ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 0d59f390de19a..662d8075f4116 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -542,6 +542,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 {
 	const struct device_node *np = rcdu->dev->of_node;
+	const char *vsps_prop_name = "renesas,vsps";
 	struct of_phandle_args args;
 	struct {
 		struct device_node *np;
@@ -557,15 +558,21 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 	 * entry contains a pointer to the VSP DT node and a bitmask of the
 	 * connected DU CRTCs.
 	 */
-	cells = of_property_count_u32_elems(np, "vsps") / rcdu->num_crtcs - 1;
+	ret = of_property_count_u32_elems(np, vsps_prop_name);
+	if (ret < 0) {
+		/* Backward compatibility with old DTBs. */
+		vsps_prop_name = "vsps";
+		ret = of_property_count_u32_elems(np, vsps_prop_name);
+	}
+	cells = ret / rcdu->num_crtcs - 1;
 	if (cells > 1)
 		return -EINVAL;
 
 	for (i = 0; i < rcdu->num_crtcs; ++i) {
 		unsigned int j;
 
-		ret = of_parse_phandle_with_fixed_args(np, "vsps", cells, i,
-						       &args);
+		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
+						       cells, i, &args);
 		if (ret < 0)
 			goto error;
 
@@ -587,8 +594,8 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 
 		/*
 		 * Store the VSP pointer and pipe index in the CRTC. If the
-		 * second cell of the 'vsps' specifier isn't present, default
-		 * to 0 to remain compatible with older DT bindings.
+		 * second cell of the 'renesas,vsps' specifier isn't present,
+		 * default to 0 to remain compatible with older DT bindings.
 		 */
 		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
 		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
