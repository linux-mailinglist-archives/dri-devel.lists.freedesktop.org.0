Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368954B466F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A4B10E2B1;
	Mon, 14 Feb 2022 09:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8248F10E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:41:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D966B80DC1;
 Mon, 14 Feb 2022 09:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5989BC340F0;
 Mon, 14 Feb 2022 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644831696;
 bh=9TbKrEy59czhCycBrgr8TptrPB3LMyhS1KggHXhlAo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CjU4KPB/YjfdHgtZfOE3gaCeDDfrNON3ivZmQUS/Ri05jJ4+qaUQYMJ905iGP2bVm
 zZqCyLckySsQNeLr1sKwh03HKK6j/nZ8mgVcjlcDRZADk0ijbBOfKc0THSaOlOw+AV
 hCw1V0s9+05tHGhMEma6N5MgbPrsYPt7HlvgyqNA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5.10 065/116] drm/panel: simple: Assign data from
 panel_dpi_probe() correctly
Date: Mon, 14 Feb 2022 10:26:04 +0100
Message-Id: <20220214092500.993729326@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214092458.668376521@linuxfoundation.org>
References: <20220214092458.668376521@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christoph Niedermaier <cniedermaier@dh-electronics.com>

[ Upstream commit 6df4432a5eca101b5fd80fbee41d309f3d67928d ]

In the function panel_simple_probe() the pointer panel->desc is
assigned to the passed pointer desc. If function panel_dpi_probe()
is called panel->desc will be updated, but further on only desc
will be evaluated. So update the desc pointer to be able to use
the data from the function panel_dpi_probe().

Fixes: 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
To: dri-devel@lists.freedesktop.org
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220201110153.3479-1-cniedermaier@dh-electronics.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 204674fccd646..7ffd2a04ab23a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -557,6 +557,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		err = panel_dpi_probe(dev, panel);
 		if (err)
 			goto free_ddc;
+		desc = panel->desc;
 	} else {
 		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
-- 
2.34.1



