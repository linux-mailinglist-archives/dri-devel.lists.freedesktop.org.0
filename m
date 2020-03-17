Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E08188742
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259426E1F5;
	Tue, 17 Mar 2020 14:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05hn20330.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FE989F43
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 12:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfPuM8azEc/4zBSzFy1JcaUX1SKeS5WWS9BueRwXQh/xCt61hFy9NHROJ3vsxQ8CER9yvQ6/e9o+ddXvTqF3Kc1E6+k6VX6AyC6kWL/RZ7XPIZZdEG201odfiJIEhc2vJrJbRSNH8kvDiVEMyZawTLbxSLBiTgRbIl2ulTFomNFEDiI+kKfsTCutQ0zjtECng6bFzGVufTFSuX+7oYroWn/n72pdcRdmEC6kf5nKRbC5GmWF18oCOtkG5JU8Tk0nJYOYikQ1y0bvIRKW+7bmXNHf8A6+1v8x2uUqvry2eXMv3ocxwXMVUUpQkETpncFjG8wwq8SvNmq0jOTUPpMe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TifF+yqMN7Hi19t209Yv0ipa5CSWPoH2JL1093iGnA=;
 b=AZP1imZba8+PLC7c0SKn3+ulpotdEraMdWy+br5Ari/JUuKbCgKGmrZqi2dInoyDS5QQ0/WnjstYtjtC2Tib8gg1umAVsYnf8tvokdpv47TDnuQFNTafJwz74XtHhauLzdye6/6VFnfL71oW2rogiRQ/Q7+0y1QHwpQHExKqiwMJCw8hvcy61MCs/7lo1AHt99393VtzNGXFKFhwMNrk4DThDgplrVsq7+2VqND0Z5kn/nXY/1+rRJ2BokTj3YR8MIjcd2F9EG2AgEOzDek8Bzs4hZbVLgNYcQ0UO/zcG+jBaE0akEbnNBrglmtmyAAjD2UosIfH5+2DFX6rU/77xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TifF+yqMN7Hi19t209Yv0ipa5CSWPoH2JL1093iGnA=;
 b=vOmnRUptR37HILak8SDLTb24hlMEbVWS2Hto+7IFJTtvVT/UVrR2hZVO7Fndwj3wtWQiq6p4qXNuPPrps+wscPHNuuUp2gF4qviq5rNZlwV7Q8+zBZ7bHP2xUvj3Kcu/a4L8vKo9FtsCGFMzuVmzmprH2B6DApDlRT/zOvJv/TY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4462.eurprd05.prod.outlook.com (10.171.182.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Tue, 17 Mar 2020 12:32:52 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 12:32:52 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [RFC PATCH 5/7] pwm: replace polarity enum with macros
Date: Tue, 17 Mar 2020 14:32:29 +0200
Message-Id: <20200317123231.2843297-6-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
References: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
X-ClientProxiedBy: GVAP278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:20::16) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (82.193.109.226) by
 GVAP278CA0006.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:20::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.16 via Frontend Transport; Tue, 17 Mar 2020 12:32:52 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.193.109.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee45f29c-4735-4558-538c-08d7ca6f4fb3
X-MS-TrafficTypeDiagnostic: VI1PR05MB4462:|VI1PR05MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB4462F602DF424D55DCA4598AF9F60@VI1PR05MB4462.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:SPM;
 SFS:(10019020)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(199004)(66946007)(6666004)(66476007)(66556008)(5660300002)(7406005)(36756003)(7416002)(30864003)(1076003)(4326008)(26005)(6496006)(44832011)(52116002)(54906003)(81166006)(81156014)(2906002)(8676002)(55236004)(316002)(186003)(8936002)(956004)(478600001)(2616005)(6486002)(86362001)(16526019)(23200700001);
 DIR:OUT; SFP:1501; SCL:5; SRVR:VI1PR05MB4462;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; CAT:OSPM; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6FVABgTOElCvqJCw7C3aHmgbToG1N63JwEp9RaJX+3raiEo7ARC9GecQYXHe33cV0OqYi87WI1bDTUAh/3X/LOrklafIc2lAX1BKxiuZrdtGjRPOm0fBbHDVJjFcO7LUJX1E0y/9bpF0YgONb3USfqmNOodYTfHkswEzZOa3H6OXdusyZqX8cEyH8s+rhEp+MI7W2LQz0VY9in6OE6rnrKosYYc8TG2IDkqwdaT666A1ZfJOr7Cj0tCLD4g9urd1Wf6HCg2n0zcq4YrCcskS0/ttlQNN91NhrJHZ50tuD2b1/CQKgQyEsYTKUZNkKqT3qo2o2PMsFxoeCVD+lqGR/5tc8C2rGG15R1mGeYPGK5yd8RunQ6WmkJhSyfGNJlCMzWDPo5n2G+1m4XOd2vYzfaOagsPpbWdTuCuAZ2DmjuhTRF+s8UteaLZIr1qfZEivu38TVWmg5uCVfduY7d2M7QJkRsXdi83ei3UZh8HiKtiK4AtlUMzJN60ycINyT9Au0IwQJeyyKIe4Z1eQj7LW9pnsOR1QoDJmpKKjRLsp/DPxRhccnnoqdqnfnR6rBw1WQ74dtuB3agKacQ8Syzl6KoR49XFoONOqNsRAv1nObnpyK3hVvPLd+EoVRvUXy2qPDmKNlr5AyxpZbiQl37LtbRu4qUGHKb5b9SEsnf8QubfXyzaYjT5IwgbwGMw5lheQTtf18HYwoUJsl1AfPwFoaosZkqtUdpVEuy+cc5eLszVJ7pFfebMWJx+z8m4MoXVGMyzIW5aB0gElXs/1mpGnw==
X-MS-Exchange-AntiSpam-MessageData: fe/bhJdTlPbNMMFWKzLEwDjSaHkfkw8kTHweRlY1Cgo+EIrt4TDUlWj/vhpiCXoBRENVMDpoXHqD+u1MWfskemaYtBmVy8//TzBDTc6P119/hwsx+NEBhpOpZ9d8xk690qLj11arhod152xarD0Gxg==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee45f29c-4735-4558-538c-08d7ca6f4fb3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 12:32:52.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY+98B556Otirv30b5k0ppvMxixXby0tItwfbj7loJfif2LskUDbXcwEUo4WYLWnCLBktIasdnRlOJ3eZeWXCCj3gmkfl6QdZv7GAvmp2k8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4462
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Milo Kim <milo.kim@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Ingo Molnar <mingo@redhat.com>, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Ray Jui <rjui@broadcom.com>, Johan Hovold <johan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Paul Barker <pbarker@konsulko.com>, linux-rpi-kernel@lists.infradead.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Alex Elder <elder@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid duplication of pwm polarity definitions,
remove "enum pwm_polarity" and use macros instead.

Prepare to use both polarity flags in DTs.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 drivers/pwm/core.c                  |  2 +-
 drivers/pwm/pwm-atmel-tcb.c         |  8 ++++----
 drivers/pwm/pwm-bcm-kona.c          |  2 +-
 drivers/pwm/pwm-bcm2835.c           |  2 +-
 drivers/pwm/pwm-berlin.c            |  2 +-
 drivers/pwm/pwm-ep93xx.c            |  2 +-
 drivers/pwm/pwm-hibvt.c             |  2 +-
 drivers/pwm/pwm-lpc18xx-sct.c       |  2 +-
 drivers/pwm/pwm-omap-dmtimer.c      |  2 +-
 drivers/pwm/pwm-renesas-tpu.c       |  4 ++--
 drivers/pwm/pwm-samsung.c           |  2 +-
 drivers/pwm/pwm-stm32.c             |  2 +-
 drivers/pwm/pwm-tiecap.c            |  2 +-
 drivers/pwm/pwm-tiehrpwm.c          |  4 ++--
 drivers/pwm/pwm-vt8500.c            |  2 +-
 drivers/pwm/sysfs.c                 |  2 +-
 drivers/staging/greybus/pwm.c       |  2 +-
 drivers/video/backlight/lp8788_bl.c |  2 +-
 include/linux/mfd/lp8788.h          |  2 +-
 include/linux/pwm.h                 | 29 ++++++++---------------------
 include/trace/events/pwm.h          |  2 +-
 21 files changed, 33 insertions(+), 46 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 08afbb5b98aa..2cb9db8d545b 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -257,7 +257,7 @@ static bool pwm_ops_check(const struct pwm_ops *ops)
  * Returns: 0 on success or a negative error code on failure.
  */
 int pwmchip_add_with_polarity(struct pwm_chip *chip,
-			      enum pwm_polarity polarity)
+			      unsigned int polarity)
 {
 	struct pwm_device *pwm;
 	unsigned int i;
diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index 98526a286347..9e8a0b4b1751 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -31,7 +31,7 @@
 				 ATMEL_TC_BEEVT | ATMEL_TC_BSWTRG)
 
 struct atmel_tcb_pwm_device {
-	enum pwm_polarity polarity;	/* PWM polarity */
+	unsigned int polarity;		/* PWM polarity */
 	unsigned div;			/* PWM clock divider */
 	unsigned duty;			/* PWM duty expressed in clk cycles */
 	unsigned period;		/* PWM period expressed in clk cycles */
@@ -60,7 +60,7 @@ static inline struct atmel_tcb_pwm_chip *to_tcb_chip(struct pwm_chip *chip)
 
 static int atmel_tcb_pwm_set_polarity(struct pwm_chip *chip,
 				      struct pwm_device *pwm,
-				      enum pwm_polarity polarity)
+				      unsigned int polarity)
 {
 	struct atmel_tcb_pwm_device *tcbpwm = pwm_get_chip_data(pwm);
 
@@ -147,7 +147,7 @@ static void atmel_tcb_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	unsigned group = pwm->hwpwm / 2;
 	unsigned index = pwm->hwpwm % 2;
 	unsigned cmr;
-	enum pwm_polarity polarity = tcbpwm->polarity;
+	unsigned int polarity = tcbpwm->polarity;
 
 	/*
 	 * If duty is 0 the timer will be stopped and we have to
@@ -206,7 +206,7 @@ static int atmel_tcb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	unsigned group = pwm->hwpwm / 2;
 	unsigned index = pwm->hwpwm % 2;
 	u32 cmr;
-	enum pwm_polarity polarity = tcbpwm->polarity;
+	unsigned int polarity = tcbpwm->polarity;
 
 	/*
 	 * If duty is 0 the timer will be stopped and we have to
diff --git a/drivers/pwm/pwm-bcm-kona.c b/drivers/pwm/pwm-bcm-kona.c
index 02da511814f1..83eab0cc51ce 100644
--- a/drivers/pwm/pwm-bcm-kona.c
+++ b/drivers/pwm/pwm-bcm-kona.c
@@ -174,7 +174,7 @@ static int kona_pwmc_config(struct pwm_chip *chip, struct pwm_device *pwm,
 }
 
 static int kona_pwmc_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-				  enum pwm_polarity polarity)
+				  unsigned int polarity)
 {
 	struct kona_pwmc *kp = to_kona_pwmc(chip);
 	unsigned int chan = pwm->hwpwm;
diff --git a/drivers/pwm/pwm-bcm2835.c b/drivers/pwm/pwm-bcm2835.c
index 91e24f01b54e..2110aef85f19 100644
--- a/drivers/pwm/pwm-bcm2835.c
+++ b/drivers/pwm/pwm-bcm2835.c
@@ -107,7 +107,7 @@ static void bcm2835_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 }
 
 static int bcm2835_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-				enum pwm_polarity polarity)
+				unsigned int polarity)
 {
 	struct bcm2835_pwm *pc = to_bcm2835_pwm(chip);
 	u32 value;
diff --git a/drivers/pwm/pwm-berlin.c b/drivers/pwm/pwm-berlin.c
index b91c477cc84b..1a080bf33047 100644
--- a/drivers/pwm/pwm-berlin.c
+++ b/drivers/pwm/pwm-berlin.c
@@ -127,7 +127,7 @@ static int berlin_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm_dev,
 
 static int berlin_pwm_set_polarity(struct pwm_chip *chip,
 				   struct pwm_device *pwm_dev,
-				   enum pwm_polarity polarity)
+				   unsigned int polarity)
 {
 	struct berlin_pwm_chip *pwm = to_berlin_pwm_chip(chip);
 	u32 value;
diff --git a/drivers/pwm/pwm-ep93xx.c b/drivers/pwm/pwm-ep93xx.c
index 02345b6f9fe8..71897ad5f6a0 100644
--- a/drivers/pwm/pwm-ep93xx.c
+++ b/drivers/pwm/pwm-ep93xx.c
@@ -111,7 +111,7 @@ static int ep93xx_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 }
 
 static int ep93xx_pwm_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-			       enum pwm_polarity polarity)
+			       unsigned int polarity)
 {
 	struct ep93xx_pwm *ep93xx_pwm = to_ep93xx_pwm(chip);
 	int ret;
diff --git a/drivers/pwm/pwm-hibvt.c b/drivers/pwm/pwm-hibvt.c
index c57a94e7da0f..7e39abce0c14 100644
--- a/drivers/pwm/pwm-hibvt.c
+++ b/drivers/pwm/pwm-hibvt.c
@@ -116,7 +116,7 @@ static void hibvt_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static void hibvt_pwm_set_polarity(struct pwm_chip *chip,
 					struct pwm_device *pwm,
-					enum pwm_polarity polarity)
+					unsigned int polarity)
 {
 	struct hibvt_pwm_chip *hi_pwm_chip = to_hibvt_pwm_chip(chip);
 
diff --git a/drivers/pwm/pwm-lpc18xx-sct.c b/drivers/pwm/pwm-lpc18xx-sct.c
index 5ff11145c1a3..3ebb7cca0204 100644
--- a/drivers/pwm/pwm-lpc18xx-sct.c
+++ b/drivers/pwm/pwm-lpc18xx-sct.c
@@ -225,7 +225,7 @@ static int lpc18xx_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static int lpc18xx_pwm_set_polarity(struct pwm_chip *chip,
 				    struct pwm_device *pwm,
-				    enum pwm_polarity polarity)
+				    unsigned int polarity)
 {
 	return 0;
 }
diff --git a/drivers/pwm/pwm-omap-dmtimer.c b/drivers/pwm/pwm-omap-dmtimer.c
index 082ccec93133..ebbd1fe57d57 100644
--- a/drivers/pwm/pwm-omap-dmtimer.c
+++ b/drivers/pwm/pwm-omap-dmtimer.c
@@ -210,7 +210,7 @@ static int pwm_omap_dmtimer_config(struct pwm_chip *chip,
 
 static int pwm_omap_dmtimer_set_polarity(struct pwm_chip *chip,
 					 struct pwm_device *pwm,
-					 enum pwm_polarity polarity)
+					 unsigned int polarity)
 {
 	struct pwm_omap_dmtimer_chip *omap = to_pwm_omap_dmtimer_chip(chip);
 
diff --git a/drivers/pwm/pwm-renesas-tpu.c b/drivers/pwm/pwm-renesas-tpu.c
index 32beeb93ade1..3c594cef2d5a 100644
--- a/drivers/pwm/pwm-renesas-tpu.c
+++ b/drivers/pwm/pwm-renesas-tpu.c
@@ -72,7 +72,7 @@ struct tpu_pwm_device {
 	struct tpu_device *tpu;
 	unsigned int channel;		/* Channel number in the TPU */
 
-	enum pwm_polarity polarity;
+	unsigned int polarity;
 	unsigned int prescaler;
 	u16 period;
 	u16 duty;
@@ -325,7 +325,7 @@ static int tpu_pwm_config(struct pwm_chip *chip, struct pwm_device *_pwm,
 }
 
 static int tpu_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *_pwm,
-				enum pwm_polarity polarity)
+				unsigned int polarity)
 {
 	struct tpu_pwm_device *pwm = pwm_get_chip_data(_pwm);
 
diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 87a886f7dc2f..7bf4f76e25bc 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -413,7 +413,7 @@ static void pwm_samsung_set_invert(struct samsung_pwm_chip *chip,
 
 static int pwm_samsung_set_polarity(struct pwm_chip *chip,
 				    struct pwm_device *pwm,
-				    enum pwm_polarity polarity)
+				    unsigned int polarity)
 {
 	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
 	bool invert = (polarity == PWM_POLARITY_NORMAL);
diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index d3be944f2ae9..a83ea66f36c9 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -383,7 +383,7 @@ static int stm32_pwm_config(struct stm32_pwm *priv, int ch,
 }
 
 static int stm32_pwm_set_polarity(struct stm32_pwm *priv, int ch,
-				  enum pwm_polarity polarity)
+				  unsigned int polarity)
 {
 	u32 mask;
 
diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index b96b388f0969..744144f83355 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -109,7 +109,7 @@ static int ecap_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 }
 
 static int ecap_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-				 enum pwm_polarity polarity)
+				 unsigned int polarity)
 {
 	struct ecap_pwm_chip *pc = to_ecap_pwm_chip(chip);
 	u16 value;
diff --git a/drivers/pwm/pwm-tiehrpwm.c b/drivers/pwm/pwm-tiehrpwm.c
index 71c337443dd5..cde0231e835a 100644
--- a/drivers/pwm/pwm-tiehrpwm.c
+++ b/drivers/pwm/pwm-tiehrpwm.c
@@ -109,7 +109,7 @@ struct ehrpwm_pwm_chip {
 	unsigned long clk_rate;
 	void __iomem *mmio_base;
 	unsigned long period_cycles[NUM_PWM_CHANNEL];
-	enum pwm_polarity polarity[NUM_PWM_CHANNEL];
+	unsigned int polarity[NUM_PWM_CHANNEL];
 	struct clk *tbclk;
 	struct ehrpwm_context ctx;
 };
@@ -306,7 +306,7 @@ static int ehrpwm_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static int ehrpwm_pwm_set_polarity(struct pwm_chip *chip,
 				   struct pwm_device *pwm,
-				   enum pwm_polarity polarity)
+				   unsigned int polarity)
 {
 	struct ehrpwm_pwm_chip *pc = to_ehrpwm_pwm_chip(chip);
 
diff --git a/drivers/pwm/pwm-vt8500.c b/drivers/pwm/pwm-vt8500.c
index fc434965c5ed..076c9f207d64 100644
--- a/drivers/pwm/pwm-vt8500.c
+++ b/drivers/pwm/pwm-vt8500.c
@@ -158,7 +158,7 @@ static void vt8500_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 
 static int vt8500_pwm_set_polarity(struct pwm_chip *chip,
 				   struct pwm_device *pwm,
-				   enum pwm_polarity polarity)
+				   unsigned int polarity)
 {
 	struct vt8500_chip *vt8500 = to_vt8500_chip(chip);
 	u32 val;
diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
index 769ac09c56c2..7cf787ac5e23 100644
--- a/drivers/pwm/sysfs.c
+++ b/drivers/pwm/sysfs.c
@@ -180,7 +180,7 @@ static ssize_t polarity_store(struct device *child,
 {
 	struct pwm_export *export = child_to_pwm_export(child);
 	struct pwm_device *pwm = export->pwm;
-	enum pwm_polarity polarity;
+	unsigned int polarity;
 	struct pwm_state state;
 	int ret;
 
diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 891a6a672378..338c76c4be9b 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -213,7 +213,7 @@ static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 };
 
 static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-			       enum pwm_polarity polarity)
+			       unsigned int polarity)
 {
 	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
 
diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index ba42f3fe0c73..a589d5e51865 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -37,7 +37,7 @@ struct lp8788_bl_config {
 	enum lp8788_bl_full_scale_current full_scale;
 	enum lp8788_bl_ramp_step rise_time;
 	enum lp8788_bl_ramp_step fall_time;
-	enum pwm_polarity pwm_pol;
+	unsigned int pwm_pol;
 };
 
 struct lp8788_bl {
diff --git a/include/linux/mfd/lp8788.h b/include/linux/mfd/lp8788.h
index 3d5c480d58ea..e0321aedf4c0 100644
--- a/include/linux/mfd/lp8788.h
+++ b/include/linux/mfd/lp8788.h
@@ -227,7 +227,7 @@ struct lp8788_backlight_platform_data {
 	enum lp8788_bl_full_scale_current full_scale;
 	enum lp8788_bl_ramp_step rise_time;
 	enum lp8788_bl_ramp_step fall_time;
-	enum pwm_polarity pwm_pol;
+	unsigned int pwm_pol;
 	unsigned int period_ns;
 };
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 38b7ed8ef913..c7b35f0602fa 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -5,26 +5,13 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <dt-bindings/pwm/pwm.h>
 
 struct pwm_capture;
 struct seq_file;
 
 struct pwm_chip;
 
-/**
- * enum pwm_polarity - polarity of a PWM signal
- * @PWM_POLARITY_NORMAL: a high signal for the duration of the duty-
- * cycle, followed by a low signal for the remainder of the pulse
- * period
- * @PWM_POLARITY_INVERTED: a low signal for the duration of the duty-
- * cycle, followed by a high signal for the remainder of the pulse
- * period
- */
-enum pwm_polarity {
-	PWM_POLARITY_NORMAL,
-	PWM_POLARITY_INVERTED,
-};
-
 /**
  * struct pwm_args - board-dependent PWM arguments
  * @period: reference period
@@ -40,7 +27,7 @@ enum pwm_polarity {
  */
 struct pwm_args {
 	unsigned int period;
-	enum pwm_polarity polarity;
+	unsigned int polarity;
 };
 
 enum {
@@ -58,7 +45,7 @@ enum {
 struct pwm_state {
 	unsigned int period;
 	unsigned int duty_cycle;
-	enum pwm_polarity polarity;
+	unsigned int polarity;
 	bool enabled;
 };
 
@@ -135,7 +122,7 @@ static inline unsigned int pwm_get_duty_cycle(const struct pwm_device *pwm)
 	return state.duty_cycle;
 }
 
-static inline enum pwm_polarity pwm_get_polarity(const struct pwm_device *pwm)
+static inline unsigned int pwm_get_polarity(const struct pwm_device *pwm)
 {
 	struct pwm_state state;
 
@@ -268,7 +255,7 @@ struct pwm_ops {
 	int (*config)(struct pwm_chip *chip, struct pwm_device *pwm,
 		      int duty_ns, int period_ns);
 	int (*set_polarity)(struct pwm_chip *chip, struct pwm_device *pwm,
-			    enum pwm_polarity polarity);
+			    unsigned int polarity);
 	int (*enable)(struct pwm_chip *chip, struct pwm_device *pwm);
 	void (*disable)(struct pwm_chip *chip, struct pwm_device *pwm);
 };
@@ -391,7 +378,7 @@ int pwm_set_chip_data(struct pwm_device *pwm, void *data);
 void *pwm_get_chip_data(struct pwm_device *pwm);
 
 int pwmchip_add_with_polarity(struct pwm_chip *chip,
-			      enum pwm_polarity polarity);
+			      unsigned int polarity);
 int pwmchip_add(struct pwm_chip *chip);
 int pwmchip_remove(struct pwm_chip *chip);
 struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
@@ -471,7 +458,7 @@ static inline int pwmchip_add(struct pwm_chip *chip)
 	return -EINVAL;
 }
 
-static inline int pwmchip_add_inversed(struct pwm_chip *chip)
+static inline int pwmchip_add_inverted(struct pwm_chip *chip)
 {
 	return -EINVAL;
 }
@@ -569,7 +556,7 @@ struct pwm_lookup {
 	const char *dev_id;
 	const char *con_id;
 	unsigned int period;
-	enum pwm_polarity polarity;
+	unsigned int polarity;
 	const char *module; /* optional, may be NULL */
 };
 
diff --git a/include/trace/events/pwm.h b/include/trace/events/pwm.h
index cf243de41cc8..e3f40ba2ab9c 100644
--- a/include/trace/events/pwm.h
+++ b/include/trace/events/pwm.h
@@ -18,7 +18,7 @@ DECLARE_EVENT_CLASS(pwm,
 		__field(struct pwm_device *, pwm)
 		__field(u64, period)
 		__field(u64, duty_cycle)
-		__field(enum pwm_polarity, polarity)
+		__field(unsigned int, polarity)
 		__field(bool, enabled)
 	),
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
