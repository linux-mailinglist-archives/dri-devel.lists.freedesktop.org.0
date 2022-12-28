Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F977658B01
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 10:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CB210E24E;
	Thu, 29 Dec 2022 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Wed, 28 Dec 2022 15:12:19 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA6D10E1A9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1672239432; x=1674831432;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGvnyn0duUAqhMmSJfLpbfIJNJ2IKj7YIrD6ZlQLoj8=;
 b=Igta/bR+DgUPr+NC5bEzkuslQdtljdI+WGy9YcNCE2ryfUw8+fC2C1Sphu40X0ym
 VbptcC+9O0s8WkJnhFj+r+lmIaEEq/40TBVtFY/wXBTgg/HMAbyJuJHiZ1C6pvmy
 0AmPKSH3Kx0titRvY3rBOygz3pBPsCYWFHYGJeISeyY=;
X-AuditID: ac14000a-923ff70000007ecb-a0-63ac59484e2b
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A8.26.32459.8495CA36;
 Wed, 28 Dec 2022 15:57:12 +0100 (CET)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 28 Dec
 2022 15:57:12 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <upstream@lists.phytec.de>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/bridge: sii902x: Allow reset line to be tied to a sleepy
 GPIO controller
Date: Wed, 28 Dec 2022 15:57:04 +0100
Message-ID: <20221228145704.939801-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWyRpKBR9cjck2ywdfJ+hYnri9isri/+DOL
 xf9tE5ktrnx9z2bxfP46RouTb66yWHROXMJucXnXHDaL9ztvMVp8mvWQ2aL7nboDt8febwtY
 PHbOusvuMbtjJqvH4j0vmTxOTLjE5HHn2h42j/vdx5k8+rtbWD0+b5IL4IzisklJzcksSy3S
 t0vgylh8/QFLwUv2iu4Pm5kbGC+xdTFyckgImEjcXHWSvYuRi0NIYDGTRMPaO6wQzhNGid+f
 17ODVLEJqEvc2fCNFcQWEUiWmHbtHjNIEbPANUaJvrvLWUASwgKxEkfa+sFsFgFViddTvoI1
 8wpYSMxeOQNqnbzEzEvfoeKCEidnPgGrZwaKN2+dzQxhS0gcfPECzBYCir+4BDEfpHfaudfM
 EHaoxJFNq5kmMArMQjJqFpJRs5CMWsDIvIpRKDczOTu1KDNbryCjsiQ1WS8ldRMjKGJEGLh2
 MPbN8TjEyMTBeIhRgoNZSYRX4+zqZCHelMTKqtSi/Pii0pzU4kOM0hwsSuK893uYEoUE0hNL
 UrNTUwtSi2CyTBycUg2MbcvVLY9WP83JOCenmKfUMJNRcWVpxPa3K//atz98/NtFcm1Sp9cd
 Y7WtR1pM9/Rv3ugu6la64GvVqaeCOov57wbPuOMol737trHqxaYTnvssJs9psrrvPX1J4DUr
 Ha3sy4cPz9mqvKWNJ/vOVCnVR/MEM+J81vvf0EyQ+TB1cdSBQ6JNof8alFiKMxINtZiLihMB
 8gCn7oYCAAA=
X-Mailman-Approved-At: Thu, 29 Dec 2022 09:30:01 +0000
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, jonas@kwiboo.se, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to gpiod_set_value_cansleep() in sii902x_reset().
This is relevant if the reset line is tied to a I2C GPIO
controller.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 drivers/gpu/drm/bridge/sii902x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 878fb7d3732b..980611aec2f6 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -240,12 +240,12 @@ static void sii902x_reset(struct sii902x *sii902x)
 	if (!sii902x->reset_gpio)
 		return;
 
-	gpiod_set_value(sii902x->reset_gpio, 1);
+	gpiod_set_value_cansleep(sii902x->reset_gpio, 1);
 
 	/* The datasheet says treset-min = 100us. Make it 150us to be sure. */
 	usleep_range(150, 200);
 
-	gpiod_set_value(sii902x->reset_gpio, 0);
+	gpiod_set_value_cansleep(sii902x->reset_gpio, 0);
 }
 
 static enum drm_connector_status sii902x_detect(struct sii902x *sii902x)
-- 
2.34.1

