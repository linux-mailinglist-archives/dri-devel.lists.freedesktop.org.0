Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC2C97B1AB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 17:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7881010E48C;
	Tue, 17 Sep 2024 15:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ri7YYUgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67110E48C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1726585238; x=1727190038; i=markus.elfring@web.de;
 bh=4/S2yC/kdYw42oxDARzjfzTaoEFcZAO+vlfQhsMk6Ms=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ri7YYUgqsDy/Pxbt7RfWiVeJblQPn9mM1RCtYofMTtReuTTIyVe//X7TQ+vtfUjC
 b6OM8CMwW5TteWquaDMi/nSNxpaN0ixacL0bNAcEgqs+Wek2lSWYjVbvZ61mSaBjI
 wsAZRDDwUbiRWcdO09W9xrwLuNJtMCQ8iXYFPkEfoAKrP3P/PgrZQj2a7D2TE1bj0
 Q9mBH4MZi2BbKDy0OHLwMlgavOyYnedI79/8xYVzvVwwrOMPJSSw32KtgrHur+LUN
 9V69BXp+0ACRTWwOD90pEGu1nKYXENVyplONv6cjPtoLnE15U0PemPhJzMAo2BKUW
 w4pwclkRufl/3pNoGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MY5bV-1sTHYJ0hqv-00JLtP; Tue, 17
 Sep 2024 17:00:38 +0200
Message-ID: <492f8027-f657-4def-b677-34d3f47d8de4@web.de>
Date: Tue, 17 Sep 2024 17:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/bridge: imx: Use of_node_put(remote) call only once in
 imx8qxp_pc_bridge_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JWmSeszK/KH8KKtj8pgGujoStJ/gM3R+Nmlpm1mQ+2BqBo8/aIB
 fRupnSYZy3H34rmR3qpou9g6WXH1i3DH0FG6zc5wmM3XB3HlHA67eTtIlA84zB2VVsMnPS2
 wgW33mr7QxI7DVNaRQHJjJOxhSnxBuFee59Jmop/KFNAbzxU1Bvc2pcRVNlaE36JU/bHkXI
 SpmbFuvkRiFTLYQENAXJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s0vvRLopAFs=;j/jjZEvtcq7ivnsKI1xtfRQ5n49
 Ff3rXD0idMx+PofLBerS296Jhk3ExBBEuEJxxPTpeXFXhgegVJyxfgHwCz8ahJhF07DdE0uiP
 8/9oKZnAPkV+xsjMcbQgNfhHXkXm2g6JTh4vaewKuYvqtdbQ8XvjsdkDXmcVS6pAtBwSMK3on
 /FN4bOdkpiSEvjRbWy4GwaNemGTzH36I5l56fQ3KhfAXafrJBkcruAsXd7H3jJKmTu1FCliFt
 fuAJy6GJDS4cn77wsQ3menWHwJmYigkTSuNmOpPvVtatxW8QlN6au8ycO29VscGpRtDC5JKED
 IcjZL1G7MhpCS07f1qbTS0njZ4RPtjABNqJEKeIOhVXFRedMUfYzEovMKuRkGWBC+aQtk5j3m
 S4vdsPYgZaE9PNU+xstHBl5iuz7Q8IiAVv9okycDMgHtog52OkCmmQ6zMR01I60cxkvMvuMTJ
 EH8MwTENrOpKOxJVRhR327XHutF7aWDQvHt7CIw6ZoNmFq0mX5KV0eSWD3I8JnI1PRa4eRZD6
 smDqs1HredAKgPNvxAiA0LFGFIaIkNXJAGqaJNwW2bl8QMxhamS5cUhNKoPG9q/9/QvUh5kJ9
 pXzoDBDydrrA2eWHo/o1z80URAAoS98mYhpCasSpK9yx1kF162AUTiCKVbY/QIBvZONeN8Z10
 5Xo5q14BUSAGBjuaaxicxLm+V0J0PJkbV7Tb6TFSeGf6AxPwFU1qsQQxhNPCAKERNpG2LDFGF
 ntvLWKtXhYOt4Gb2k87/PLeQvq+87lqQoSor0lTwK4ky2Y8UL4I6YcFc+a0+T21IweYhXHJWQ
 OTE8VKf3VWWqsHadvQPgJBfg==
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
Date: Tue, 17 Sep 2024 16:40:18 +0200

A of_node_put(remote) call was immediately used after a null pointer check
for the data structure member =E2=80=9Cnext_bridge=E2=80=9D in this
function implementation.
Thus use such a function call only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers=
/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index e6dbbdc87ce2..0064d37ad8f6 100644
=2D-- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -321,8 +321,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_dev=
ice *pdev)
 		}

 		ch->next_bridge =3D of_drm_find_bridge(remote);
+		of_node_put(remote);
 		if (!ch->next_bridge) {
-			of_node_put(remote);
 			ret =3D -EPROBE_DEFER;
 			DRM_DEV_DEBUG_DRIVER(dev,
 					     "channel%u failed to find next bridge: %d\n",
@@ -330,8 +330,6 @@ static int imx8qxp_pc_bridge_probe(struct platform_dev=
ice *pdev)
 			goto free_child;
 		}

-		of_node_put(remote);
-
 		ch->bridge.driver_private =3D ch;
 		ch->bridge.funcs =3D &imx8qxp_pc_bridge_funcs;
 		ch->bridge.of_node =3D child;
=2D-
2.46.0

