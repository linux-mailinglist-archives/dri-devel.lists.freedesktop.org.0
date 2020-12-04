Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A22D0C51
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0FE6E5C3;
	Mon,  7 Dec 2020 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from latitanza.investici.org (latitanza.investici.org
 [IPv6:2001:888:2000:56::19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D59E6E198
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 17:12:06 +0000 (UTC)
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4CnfFR4tBCz8shv;
 Fri,  4 Dec 2020 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1607101467;
 bh=2zSLREyUq7ZQ7biojEerXIWmpTslB1rfxKxJGm0Yl/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xa72QKp0aZec20MikUqt2PG25vYmAO/CK7Ss6PIuxp8TZtHa1bxXlMh1e4Lg1yWEk
 SMGdq6KJMiSdwbQ6bGzHHHjfTCiEYEMDSwfqdWZdn1U1zZzp2fV/wHe9WeQKkZMLsb
 cX3iPRGT5WZxXDH3Hkdz5gYScMYd1g3hEPwOHEuk=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 4CnfFQ6VHJz8sfb; 
 Fri,  4 Dec 2020 17:04:26 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH v1 05/12] renesas: Replace strstarts() by str_has_prefix().
Date: Fri,  4 Dec 2020 18:03:11 +0100
Message-Id: <20201204170319.20383-6-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
References: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francis Laniel <laniel_francis@privacyrequired.com>

The two functions indicates if a string begins with a given prefix.
The only difference is that strstarts() returns a bool while str_has_prefix()
returns the length of the prefix if the string begins with it or 0 otherwise.

Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index fe86a3e67757..3f9972165afa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1016,7 +1016,7 @@ static int rcar_du_crtc_parse_crc_source(struct rcar_du_crtc *rcrtc,
 	} else if (!strcmp(source_name, "auto")) {
 		*source = VSP1_DU_CRC_OUTPUT;
 		return 0;
-	} else if (strstarts(source_name, "plane")) {
+	} else if (str_has_prefix(source_name, "plane")) {
 		unsigned int i;
 
 		*source = VSP1_DU_CRC_PLANE;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
