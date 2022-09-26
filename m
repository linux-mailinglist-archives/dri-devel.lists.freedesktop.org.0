Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5B5EBB95
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65E10E56D;
	Tue, 27 Sep 2022 07:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2073 seconds by postgrey-1.36 at gabe;
 Mon, 26 Sep 2022 21:12:48 UTC
Received: from hall.aurel32.net (hall.aurel32.net [IPv6:2001:bc8:30d7:100::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D7E10E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
 Content-Description:In-Reply-To:References:X-Debbugs-Cc;
 bh=6mMntl/NSx3pI8k7cwocEGZTr8TFwyTDRITg/BPF9cE=; b=jsOYLfELogFtxXpumU7TR84MXy
 Eu1UFVHsGD3Cj6UmLrM/ZTUSNvZz/xc6ldsssTnH8FS6td7ee6m/LX31WwRxDiUukhQrcskxUWWkT
 VoPG1wrRFuybvausa2AhjVXJF8dX6aOJ6YQ47vA1lpmZCMp/kUCCS4hSkeY3RDcYntCEbgalmkvXm
 BGUZHDyOTnFsAsPuuxGwC8hDb+YB+3WDlK8eKaoECB53D6G2BeeeYOXlW/V7bdBM+laONV31EMmhv
 9YuLdNrFUlYxWTL81SdBPAz6d/d/i058J3xiyHd5I6RgnRbx8vv/mehnwKmO6yBVImUXYrcJSHKC/
 3ss+EE/Q==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1ocurd-00BDVl-KH; Mon, 26 Sep 2022 22:38:05 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
 (envelope-from <aurelien@aurel32.net>) id 1ocurd-0001Q2-0I;
 Mon, 26 Sep 2022 22:38:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: dw_hdmi: filter regulator -EPROBE_DEFER error
 messages
Date: Mon, 26 Sep 2022 22:37:52 +0200
Message-Id: <20220926203752.5430-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Sep 2022 07:34:59 +0000
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the avdd-0v9 or avdd-1v8 supply are not yet available, EPROBE_DEFER
is returned by rockchip_hdmi_parse_dt(). This causes the following error
message to be printed multiple times:

    dwhdmi-rockchip fe0a0000.hdmi: [drm:dw_hdmi_rockchip_bind [rockchipdrm]] *ERROR* Unable to parse OF data

Fix that by not printing the message when rockchip_hdmi_parse_dt()
returns -EPROBE_DEFER.

Fixes: ca80c4eb4b01 ("drm/rockchip: dw_hdmi: add regulator support")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index c14f88893868..2f4b8f64cbad 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -565,7 +565,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to parse OF data\n");
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(hdmi->dev, "Unable to parse OF data\n");
 		return ret;
 	}
 
-- 
2.35.1

