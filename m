Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4554E85B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 19:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4334B10E265;
	Thu, 16 Jun 2022 17:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 2.mo575.mail-out.ovh.net (2.mo575.mail-out.ovh.net
 [46.105.52.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A5510E265
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 17:08:42 +0000 (UTC)
Received: from player779.ha.ovh.net (unknown [10.108.16.43])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 9B76621DA4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 17:08:40 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 64B292B9393D5;
 Thu, 16 Jun 2022 17:08:32 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059eda0aa4-c3b8-493b-af8c-1b5db0bc1ce2,
 EEA695ED62D0B30D35F9F30395731DD21189161B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2] drm: shmobile: Use backlight helper
Date: Thu, 16 Jun 2022 19:08:21 +0200
Message-Id: <20220616170821.1348169-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7176486009031853787
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeeh
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
Cc: Stephen Kitt <steve@sk2.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This started with work on the removal of backlight_properties'
deprecated fb_blank field, much of which can be taken care of by using
helper functions provided by backlight.h instead of directly accessing
fields in backlight_properties. This patch series doesn't involve
fb_blank, but it still seems useful to use helper functions where
appropriate.

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
Changes since v1: clarified commit message, this doesn't touch fb_blank
---
 drivers/gpu/drm/shmobile/shmob_drm_backlight.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
index f6628a5ee95f..794573badfe8 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
@@ -18,11 +18,7 @@ static int shmob_drm_backlight_update(struct backlight_device *bdev)
 	struct shmob_drm_connector *scon = bl_get_data(bdev);
 	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
 	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
-	int brightness = bdev->props.brightness;
-
-	if (bdev->props.power != FB_BLANK_UNBLANK ||
-	    bdev->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
+	int brightness = backlight_get_brightness(bdev);
 
 	return bdata->set_brightness(brightness);
 }

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.30.2

