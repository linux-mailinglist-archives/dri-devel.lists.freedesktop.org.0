Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECFB182AB9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601F06EA8C;
	Thu, 12 Mar 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587836E497
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:34:36 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: TO_DN_SOME, R_MISSING_CHARSET, BROKEN_CONTENT_TYPE, MIME_TRACE,
 ARC_NA, FREEMAIL_ENVRCPT, TO_MATCH_ENVRCPT_SOME, FROM_HAS_DN,
 TAGGED_RCPT, FREEMAIL_TO, RCVD_NO_TLS_LAST, FROM_EQ_ENVFROM,
 ASN, RCVD_VIA_SMTP_AUTH, MID_CONTAINS_FROM, RCPT_COUNT_TWELVE,
 RCVD_COUNT_TWO, SUSPICIOUS_RECIPS
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 7cbb8e7a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 11 Mar 2020 09:34:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 2554C4C335;
 Wed, 11 Mar 2020 16:34:29 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 4/5] drm/sun4i: sun6i_mipi_dsi: fix horizontal timing
 calculation
Date: Thu, 12 Mar 2020 00:33:28 +0800
Message-Id: <20200311163329.221840-5-icenowy@aosc.io>
In-Reply-To: <20200311163329.221840-1-icenowy@aosc.io>
References: <20200311163329.221840-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1583944474;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=U2GxqfdymldYXpFrmpoV6T/L6VN/aPLvUF+27UYMKNM=;
 b=tIV6lwpp+xUu1yh4SMhtRjYtnNU8O1efXGjwMBU6+K4WLy9VFlS6syxUXosBQHHhVI5sXQ
 wqqe/lJ0Z0jZtgQMh+g7fgIPlImrhm2xCibz4wNeaYLAvpCZYuL5mQc6UnYyZk+jw7Rzhd
 dd7JFj4hPaMvnnyRnz+4/VYq9QYocXw=
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The max() function call in horizontal timing calculation shouldn't pad a
length already subtracted with overhead to overhead, instead it should
only prevent the set timing to underflow.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 059939789730..5f2313c40328 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -555,7 +555,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HSA_PACKET_OVERHEAD	10
 		hsa = max((unsigned int)HSA_PACKET_OVERHEAD,
-			  (mode->hsync_end - mode->hsync_start) * Bpp - HSA_PACKET_OVERHEAD);
+			  (mode->hsync_end - mode->hsync_start) * Bpp) - HSA_PACKET_OVERHEAD;
 
 		/*
 		 * The backporch is set using a blanking packet (4
@@ -564,7 +564,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HBP_PACKET_OVERHEAD	6
 		hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
-			  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
+			  (mode->htotal - mode->hsync_end) * Bpp) - HBP_PACKET_OVERHEAD;
 
 		/*
 		 * The frontporch is set using a sync event (4 bytes)
@@ -574,7 +574,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HFP_PACKET_OVERHEAD	16
 		hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
-			  (mode->hsync_start - mode->hdisplay) * Bpp - HFP_PACKET_OVERHEAD);
+			  (mode->hsync_start - mode->hdisplay) * Bpp) - HFP_PACKET_OVERHEAD;
 
 		/*
 		 * The blanking is set using a sync event (4 bytes)
@@ -583,8 +583,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HBLK_PACKET_OVERHEAD	10
 		hblk = max((unsigned int)HBLK_PACKET_OVERHEAD,
-			   (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp -
-			   HBLK_PACKET_OVERHEAD);
+			   (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp) -
+			   HBLK_PACKET_OVERHEAD;
 
 		/*
 		 * And I'm not entirely sure what vblk is about. The driver in
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
