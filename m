Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2BD586B64
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 14:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F280AA058D;
	Mon,  1 Aug 2022 12:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5A89FF31
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 12:54:39 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 785FC84129;
 Mon,  1 Aug 2022 14:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659358476;
 bh=0Fve/raRkRUtC+TPHMM/FTyDqseIMP9fvPH2rb7HCE8=;
 h=From:To:Cc:Subject:Date:From;
 b=NtppUTFbA7nK3ZvX1I7o+MBQjAEXIk+Tu67bGnhP0RbsScLNijDrfjPLAoxLUPr1I
 ACPTH3yiAqRSKe3ZEsq1EAfESaWunkD/qUPxzZPz5vjzfhE8dLjRriuyb6OtAj7g3i
 YZW1zsfHH3Mo6su63T4PiLmUerjRg4DzcZfEy1K7C7da2ma8bwY4T9UkMs4+3mAqq3
 NNhNwxMuPsYsLxZPaJFl+Jfvwgfr+n1ZFBWXvsn0eIn+JnqKzNbp4Y1jItCGFv4s+5
 iytZ60/I27bRjj5ZVO1vGHkdmQsDaU/HXP/vNYl1AWKqKM1ENBIvHrUUvTQPzd3Xfu
 sOVPWs1CN7MUA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: lvds-codec: Fix error checking of
 drm_of_lvds_get_data_mapping()
Date: Mon,  1 Aug 2022 14:54:19 +0200
Message-Id: <20220801125419.167562-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_of_lvds_get_data_mapping() returns either negative value on
error or MEDIA_BUS_FMT_* otherwise. The check for 'ret' would also
catch the positive case of MEDIA_BUS_FMT_* and lead to probe failure
every time 'data-mapping' DT property is specified.

Fixes: 7c4dd0a266527 ("drm: of: Add drm_of_lvds_get_data_mapping")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/lvds-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 702ea803a743c..39e7004de7200 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -180,7 +180,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 		of_node_put(bus_node);
 		if (ret == -ENODEV) {
 			dev_warn(dev, "missing 'data-mapping' DT property\n");
-		} else if (ret) {
+		} else if (ret < 0) {
 			dev_err(dev, "invalid 'data-mapping' DT property\n");
 			return ret;
 		} else {
-- 
2.35.1

