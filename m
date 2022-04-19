Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C4506784
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 11:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259D910EA7A;
	Tue, 19 Apr 2022 09:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2439F10EA7A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:14:41 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220419091439euoutp02bd7639e5992d4e79ba4d7d9abb2be488~nQWJaYQr20409004090euoutp02P
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:14:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220419091439euoutp02bd7639e5992d4e79ba4d7d9abb2be488~nQWJaYQr20409004090euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1650359679;
 bh=jAfvZw6V/Vh2PiEqk6uHpFJ11CtvbhszEZP+WbdC+Gs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=E48rieg4HJKfOjPq15B75LjoY9+RH7w1OMAv2hlrN06L/7vUqIAmgU20+cdWnpvpv
 Vh21W7wQ3VVDoEvf6E7FIxR13PZab9uZU1aLI5FTgguRtyHlOsdQf5jNFkWx8YhTBd
 DdWHJsMxhuxJq/mlxz/aSRycgPo2koMHYx6c5CJ0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220419091438eucas1p2dc991685e59aa2c6f81e3b3c62102d38~nQWI4eb_T1000910009eucas1p2p;
 Tue, 19 Apr 2022 09:14:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C5.F4.09887.E7D7E526; Tue, 19
 Apr 2022 10:14:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c~nQWIZle5z1011210112eucas1p2B;
 Tue, 19 Apr 2022 09:14:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220419091438eusmtrp1af7aa8ecdba291226cdf265b618a1527~nQWIYvUB_1215012150eusmtrp1e;
 Tue, 19 Apr 2022 09:14:38 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-c1-625e7d7efcdf
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 44.09.09522.D7D7E526; Tue, 19
 Apr 2022 10:14:37 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220419091437eusmtip2564609ad0950d69b6c6906c670a1caf6~nQWH2VonJ2929629296eusmtip2e;
 Tue, 19 Apr 2022 09:14:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: panel: Register connector if DRM device is
 already registered
Date: Tue, 19 Apr 2022 11:14:22 +0200
Message-Id: <20220419091422.4255-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djP87p1tXFJBjOfSFn0njvJZHF/8WcW
 i//bJjJbXPn6ns3iy6YJbBbP569jtDj55iqLRefEJewWa4/cZbc41Bdt8WnWQ2YHbo+1H++z
 ery/0crusffbAhaPnbPusnvM7pjJ6rF4z0smjxMTLjF53Lm2h81j+7cHrB73u48zefRtWcUY
 wB3FZZOSmpNZllqkb5fAlfHm+HTWgmc8FavX/GBsYHzK1cXIySEhYCKxaOkfxi5GLg4hgRWM
 Eos+9bNDOF8YJfp/tTJBOJ8ZJboP3GeHabmz7itUy3JGiXunnyG0bLnbzAZSxSZgKNH1tgvM
 FhFQlvg7cRVYB7PAfGaJ6z3zmUASwgKxEiv6XoGNZRFQlTgw+xNLFyMHB6+AjcSyQyYQ2+Ql
 Vm84wAzSKyFwhkNizYffLBAJF4mH724xQdjCEq+Ob4E6T0bi9OQesDkSAvkSf2cYQ4QrJK69
 XsMMYVtL3Dn3iw2khFlAU2L9Ln2IsKPEnTUvWSE6+SRuvBUECTMDmZO2TWeGCPNKdLQJQVSr
 Scw6vg5u58ELl6CGe0g0vW0Es4WA/js6v5VlAqPcLIRdCxgZVzGKp5YW56anFhvlpZbrFSfm
 Fpfmpesl5+duYgQmm9P/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeHuWRCcJ8aYkVlalFuXHF5Xm
 pBYfYpTmYFES503O3JAoJJCeWJKanZpakFoEk2Xi4JRqYOLd3HiiYo/3rEXu1W5Wj2XOem1j
 M7acF7PjxFSpmEf+lesPxzwMe8TlIyu5/84bxsafnPNf7Z5ho9THZ7FowX/9L57TWDgTK+LN
 VezfH5ELvu+eNzvWUal9679akT0h95beu5xSxcuR1Zv3/uHlP5m8TwJins/VSGPJmveo/PzX
 aJ9zzTPsP29bEyZVFLQwQX/LppbYl1t6mhhNm7xczDRPfv1l/8xC5uU8h+68WnkGt2MvlR9W
 fc+KZzmbueZFYsoPV/n9N3jdRU9eexbpdu/vJoVjUS4fLxt5S8w0XbJ5X/DZ01cL3/lJGCZt
 +t0/e4ZM0JSH//3cHU7/SjqfnmUaskK6Q+sAf9rOikOpH5VYijMSDbWYi4oTASumQYKlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsVy+t/xe7q1tXFJBisazS16z51ksri/+DOL
 xf9tE5ktrnx9z2bxZdMENovn89cxWpx8c5XFonPiEnaLtUfuslsc6ou2+DTrIbMDt8faj/dZ
 Pd7faGX32PttAYvHzll32T1md8xk9Vi85yWTx4kJl5g87lzbw+ax/dsDVo/73ceZPPq2rGIM
 4I7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3hz
 fDprwTOeitVrfjA2MD7l6mLk5JAQMJG4s+4rYxcjF4eQwFJGibaeyawQCRmJk9MaoGxhiT/X
 utggij4xSkx59wQswSZgKNH1FiTBySEioCzxd+IqsEnMAsuZJZa9mwZWJCwQLdH6dhcziM0i
 oCpxYPYnli5GDg5eARuJZYdMIBbIS6zecIB5AiPPAkaGVYwiqaXFuem5xYZ6xYm5xaV56XrJ
 +bmbGIGBvu3Yz807GOe9+qh3iJGJg/EQowQHs5IIb8+S6CQh3pTEyqrUovz4otKc1OJDjKZA
 6yYyS4km5wNjLa8k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgSlH
 5KKiVPwxQcU9Gafrr+zJCZv98xu/4429k48+E5nh7Wzrm/utMmDJu987eucsvypa7jR51twD
 dzeslK1cYqe1/0n7BnnzvkcSPpbShit6BIVZgq8eXTEt7PXvO0oNs14vCygw3ld3/3bFYtlU
 u1BptqxXrh5/9jhFRq1w+VoR7CpbfZSx6MAi/eb+J9/Fv2S7fPpumc607bxQrNp1oxsyiyX8
 7+Zsvlq7WGnfj//K/O7aTtxulfy5YjaRIsclDp9YX5uuvMndwkL72+bXTk7rI996To671n5p
 YkDE3D2b7zruEFnS7hBt2zVzWm796y1XRf4XMwres7TZki87c0+T1r/KFfbZjmuehNh3nFZi
 Kc5INNRiLipOBADhznBv/QIAAA==
X-CMS-MailID: 20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c
References: <CGME20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c@eucas1p2.samsung.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If panel_bridge_attach() happens after DRM device registration, the
created connector will not be registered by the DRM core anymore. Fix
this by registering it explicitely in such case.

This fixes the following issue observed on Samsung Exynos4210-based Trats
board with a DSI panel (the panel driver is registed after the Exynos DRM
component device is bound):

$ ./modetest -c -Mexynos
could not get connector 56: No such file or directory
Segmentation fault

While touching this, move the connector reset() call also under the DRM
device registered check, because otherwise it is not really needed.

Fixes: 934aef885f9d ("drm: bridge: panel: Reset the connector state pointer")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Here is a bit more backgroud on this issue is available in this thread:
https://lore.kernel.org/all/f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com/
---
 drivers/gpu/drm/bridge/panel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index ff1c37b2e6e5..0ee563eb2b6f 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -83,8 +83,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&panel_bridge->connector,
 					  bridge->encoder);
 
-	if (connector->funcs->reset)
-		connector->funcs->reset(connector);
+	if (bridge->dev->registered) {
+		if (connector->funcs->reset)
+			connector->funcs->reset(connector);
+		drm_connector_register(connector);
+	}
 
 	return 0;
 }
-- 
2.17.1

