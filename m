Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21816066A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739966E1F6;
	Sun, 16 Feb 2020 21:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC33C6E1C0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:03:38 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55F05D9B;
 Sun, 16 Feb 2020 22:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887016;
 bh=4Q7IXT9ZvnU5s+aQI9FZHW3uMR5P06K/rpEMoQ99ibs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SK0AlPKlIy4mokcqgwzJkfCwafiWBkLz6+R54gkBejc7Su9cQR6j0TvwURyvxHGYe
 +DrehLY/G2pnfOLo+aLETQB8UhS3CuB3tqxNiAb214O3sdW6Peyon15TlX0aRXRRn7
 Q2YE4uSge+DPgR/b4hAkRmKvEePMeJN4BIHpsEF8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 05/51] drm/bridge: Add interlace_allowed flag to drm_bridge
Date: Sun, 16 Feb 2020 23:02:22 +0200
Message-Id: <20200216210308.17312-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for a connector creation helper based on a chain of
bridges, add a flag to the drm_bridge structure to report support for
interlaced modes. This will be used to set the connector's
interlace_allowed flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/drm/drm_bridge.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ba9b7c84f11e..d55bf5f61758 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -712,6 +712,11 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @interlace_allowed: Indicate that the bridge can handle interlaced
+	 * modes.
+	 */
+	bool interlace_allowed;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
