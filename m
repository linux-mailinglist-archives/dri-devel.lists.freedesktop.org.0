Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F766054A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0A010E0B4;
	Fri,  6 Jan 2023 17:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 17:06:19 UTC
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net
 [188.165.48.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ADA10E0B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:06:19 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.138.203])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id C46A12611E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 16:49:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dkv5l (unknown [10.110.171.46])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0C2171FE9B;
 Fri,  6 Jan 2023 16:49:59 +0000 (UTC)
Received: from sk2.org ([37.59.142.107])
 by ghost-submission-6684bf9d7b-dkv5l with ESMTPSA
 id eB+zADdRuGOnAQEAwhnnFg
 (envelope-from <steve@sk2.org>); Fri, 06 Jan 2023 16:49:59 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00109038e94-ae10-4a84-be5c-29fce71eaa6f,
 9FE29456621203A27B372E1E0503D45BE0167874) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH RESEND 2/4] backlight: arcxcnn: Use backlight helper
Date: Fri,  6 Jan 2023 17:48:53 +0100
Message-Id: <20230106164856.1453819-3-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5852146243471509211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsthgvvhgvsehskhdvrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/video/backlight/arcxcnn_bl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
index 555b036643fb..e610d7a1d13d 100644
--- a/drivers/video/backlight/arcxcnn_bl.c
+++ b/drivers/video/backlight/arcxcnn_bl.c
@@ -130,12 +130,9 @@ static int arcxcnn_set_brightness(struct arcxcnn *lp, u32 brightness)
 static int arcxcnn_bl_update_status(struct backlight_device *bl)
 {
 	struct arcxcnn *lp = bl_get_data(bl);
-	u32 brightness = bl->props.brightness;
+	u32 brightness = backlight_get_brightness(bl);
 	int ret;
 
-	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
-
 	ret = arcxcnn_set_brightness(lp, brightness);
 	if (ret)
 		return ret;
-- 
2.30.2

