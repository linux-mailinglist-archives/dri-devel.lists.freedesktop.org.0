Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6303B8494AF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 08:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AD510F709;
	Mon,  5 Feb 2024 07:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="urXEWM6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5554710F730
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1707118987; x=1707723787; i=markus.elfring@web.de;
 bh=AxdYsP6oLNahu2CGfWbIq/ChSY6kKHQ4bD+IV/b5DPo=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=urXEWM6H88RRnvo2wx51zt/6F9Xh3OzoyPxLxudqBGAzokcQuK5+n1TwOjXCohVs
 I3yFzryJhKL8Xmw/DxDA0uOgiHyW8LzYyMuAVCueiOwBu18HKXVJhPgHOMqGf59kn
 jX7XiuLhtU1op4IOhEb2V/hyRP8slyQ9aKsF+xm4n5wy125F39ZQEtOXCTwHqwZCO
 quI1cyic8rftaHLB3y+lUt5VtkwUyBldag/52c3J10ch3vGylj5Wu4L2iUXhBki2L
 iKM/YKeZxbv1dPJMuQ1cJXuS2CFsaYFtj87AMCTPOE0lR24HPnG3bR8wzd9N2/w0Z
 IY00F3dh8795o+zuqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTfkd-1rRmqs2kW5-00UD5b; Mon, 05
 Feb 2024 08:43:07 +0100
Message-ID: <9a813af3-78d4-406e-8b52-8c5f9fb38ab9@web.de>
Date: Mon, 5 Feb 2024 08:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/bridge: analogix_dp: Use
 devm_platform_get_and_ioremap_resource() in analogix_dp_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3K/MEaMRl+s4NjAocVjMdC6VZ89Q8uMyvO7kjR32V0J3KJHx1R+
 kh63HCBgVZ9a0jmvBAJQjSdKecHpxHA7wwh6noZBOxvJckDsbFDuDRZDjgMVphkCXZt245q
 3PjkeNhjQ3OxiypCII1khkRy6jLv/5lsLBoXfo+1t9cX0itdQYo/Si+Y+W5O4jwv7VrOep5
 Vj/b6m+o1t/Av3LcCCoPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MEg7XKrwYaw=;sOBSqyIYPafqcZY3WCorM9ubImF
 tICMIZ4cFg3cPvRwoMWrOp/2smYb298c1FzDvLD9ZqtOcCzL9UJrcr89rGQbqU7U5HLRxXd6m
 mYdyNYMPieKQmJQCcpIaWFxr7+JXX4nfeTo1MtckvQXOmSLW4B8vPVe4kRw+WXX38rAopLxVB
 OnY2j0Y9e3CUxJKU5/uBxaAPUwvrJc9AGjtJ5UJmMvjXbTmSCk1SM0DSCS44QmfMS571G+2Yk
 Xlw5A8ROZf56LZwUOYqv34Tc0SsL6zWGJrStPRWs41zSUM8TOQzxXY/WI4IDFWgFpOjPuiahI
 rqre0HmcG2PwApHJFYk3fu4Lk9Zf9C6Emta2guF19UArdJmQRMCz/kG3mVRdqI806RmUnERlT
 0yjrkY0KRlZBobJ1+iMv4aWHe5D7CZCzt2FQnIeQHywEQSvp9amDjL/pLQpjsg0q4OqLOdabF
 eROShr9xspTzg5F2eGbbKTQhQbkb45+8A3X/kLjeBuT1AL1jxl/L8Ie/bbIfoN1Dwa8MY1nne
 MOHmJQAZW5x5wrpvi6ByfmVwqe/pZqISTyBUtL3YpJuWN6Xaqr9jZ48MLCy+OTvs+/zgY4iGS
 AGxroPhHaE30GU7K8UR6JU/BvWGHYZG9pzUuuyAMsYrCLgwK0mB9DjLIzpO8nQ10duhM7wvLy
 oo8rnBRJlwIm1QjKGBgxWsxWgTakG0jbqhpZiMDMyPv7i4bJLFwcFjLJO73tEuURUXfOm5EpA
 jeDohQGtxV0+WP61bc/ObnPOWSrYMxDaeb5I4dMOy/+d/lkvSr9RoLSq31snmFepORDyiqWON
 kwiN0oMVL81ldQTAcgSsFnAexyE3DuuMnh4vrPa9+yvDM=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Feb 2024 08:30:57 +0100

A wrapper function is available since the commit 890cc39a879906b63912482df=
c41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()").
Thus reuse existing functionality instead of keeping duplicate source code=
.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_core.c
index df9370e0ff23..1c7dbf1ced77 100644
=2D-- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1739,10 +1739,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
 	}

 	clk_prepare_enable(dp->clock);
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dp->reg_base)) {
 		ret =3D PTR_ERR(dp->reg_base);
 		goto err_disable_clk;
=2D-
2.43.0

