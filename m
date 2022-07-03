Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4242565BA1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4144E10E7AA;
	Mon,  4 Jul 2022 16:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97B910E065
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 20:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=KnwEiij4xNuXoZcWFn4HxiH14Eqih+fx7AXtRQFu+44=;
 b=KpYZ6FcnzC34N7V9WwRgFekfT5Lzpt0DBfNscXaT0ovyfjQrPUXPshUuWLCH3B52xOVOjv6Lkf6z4
 sttgD3yFwrrojgglEM7SZa1bpY/SzdyoljFxOFLlvx7AyXoE9EKEjL/4Cb66Mn6sMeizp4mhfTc+So
 K006FIxMELGW3f6XKPfYgjfMfeux8WrxOX79AdMaemyfYNzjlC6YascMwtnpu/iwklgHzKWfDf0tH/
 ZBPdkDBrI9attN3Kd3vrl8OrBBYqjXNbkTyVoLn6m0xrcZyDwOyrFw64Rcm9HVUR9PVm/ntHu/Rn7x
 rOsfwJkNebol1JJJNmTs3mzPWx8cy1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=KnwEiij4xNuXoZcWFn4HxiH14Eqih+fx7AXtRQFu+44=;
 b=t7HTdnX0nmb5c/YNKWAgOo4hEgR0lsyzGeGX5jRZWWAAfv4YOevcIWMwgb6igj45urQrzqriLJEmc
 CC6F42FDw==
X-HalOne-Cookie: 8eba76e26d6c6141cf3e5db96ff6ce8aab346473
X-HalOne-ID: 9089e7cf-fb0e-11ec-a917-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 9089e7cf-fb0e-11ec-a917-d0431ea8a290;
 Sun, 03 Jul 2022 20:27:32 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/1] bridge/ti-sn65dsi86.c: convert to atomic operations
Date: Sun,  3 Jul 2022 22:27:23 +0200
Message-Id: <20220703202724.9553-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is what is left on a previous attempt to make the
ti-sn65dsi86 support DRM_BRIDGE_ATTACH_NO_CONNECTOR.

I ran into several challenges on the way:
- I never found a way to retreive bpc when the driver
  do not create the connector - and the driver needs it.
  There may be ways to change how bpc is used but as I have no access
  to HW it is not easy to change much.
- My understanding of the driver is limited so I dropped trying to
  do the proper implmentation of format negotiation
- I had made a small macro to encapsulate a few of the common functions
  in drm_bridge_funcs - but looking at it with fresh eyes told me
  this is not a good idea.

I dropped previous a-b / r-b as the driver has changed a bit since
last submission.
Especially to Kieran - sorry for letting you wait so long for almost nothing.

Sorry if this is a duplicate - something went wrong when I sent this
mail the first time.

	Sam


Sam Ravnborg (1):
      drm/bridge: ti-sn65dsi86: Use atomic variants of drm_bridge_funcs

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)


