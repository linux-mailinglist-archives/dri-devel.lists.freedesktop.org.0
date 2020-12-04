Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829072CF67D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1455B6E060;
	Fri,  4 Dec 2020 22:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0254A6E060
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:01:48 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F907FD8;
 Fri,  4 Dec 2020 23:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607119306;
 bh=+uOFXfjOaWvtsFQMWqqNF/iEBBOc5nMtwer/V3B36lM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q5DgGSnoLGn/G+63L4hFOCJ3aem7fLG2dHfW00dnBMR7JTmkQAFRoCQTPTRXQDC9d
 l2t35kgw+YQec8cNPpYm5sm+zKdb5X9yN6g/NAL6Z1eaJVLEhDd+eEriKiDhg9ve74
 ObaiAGAmNWK33PTCRbRNHTlMvEMZLP5G+NzII6QM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm: rcar-du: Drop unneeded encoder cleanup in error path
Date: Sat,  5 Dec 2020 00:01:33 +0200
Message-Id: <20201204220139.15272-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The encoder->name field can never be non-null in the error path, as that
can only be possible after a successful call to
drm_simple_encoder_init(). Drop the cleanup.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 2d40da98144b..0edce24f2053 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -124,11 +124,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	}
 
 done:
-	if (ret < 0) {
-		if (encoder->name)
-			encoder->funcs->destroy(encoder);
+	if (ret < 0)
 		devm_kfree(rcdu->dev, renc);
-	}
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
