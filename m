Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD459D490
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 10:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1E1B12ED;
	Tue, 23 Aug 2022 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987BEB12D7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 08:29:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79211B81C35;
 Tue, 23 Aug 2022 08:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C2CC433D6;
 Tue, 23 Aug 2022 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661243338;
 bh=P3egnqUA6ktWyvgwGA+OKZtXZmA0Wg8B7BsVUmsHoUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0sqMs1IWECNXUVTNltDtq3Yq9aA0N75+Cis2sYghkAGYi3yVmGig3SNqpX58ux9f5
 VcFk6nH1oQVf4iONanwANwM4SrHlhTCsKGKfKwsfBt9DMsnR9MJbcEk8g8wmGZ5EEe
 8bSBADDFeyajfCHhXx8EUAAWDINUx6MU6MkEJUpg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5.19 246/365] drm/bridge: lvds-codec: Fix error checking of
 drm_of_lvds_get_data_mapping()
Date: Tue, 23 Aug 2022 10:02:27 +0200
Message-Id: <20220823080128.500334591@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823080118.128342613@linuxfoundation.org>
References: <20220823080118.128342613@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

[ Upstream commit 2bba782002c5dab6ca8d608b778b386fb912adff ]

The drm_of_lvds_get_data_mapping() returns either negative value on
error or MEDIA_BUS_FMT_* otherwise. The check for 'ret' would also
catch the positive case of MEDIA_BUS_FMT_* and lead to probe failure
every time 'data-mapping' DT property is specified.

Fixes: 7c4dd0a266527 ("drm: of: Add drm_of_lvds_get_data_mapping")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220801125419.167562-1-marex@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 702ea803a743..39e7004de720 100644
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



