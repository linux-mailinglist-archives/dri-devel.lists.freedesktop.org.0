Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5A6301D3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 23:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C01F10E819;
	Fri, 18 Nov 2022 22:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 454 seconds by postgrey-1.36 at gabe;
 Fri, 18 Nov 2022 22:53:53 UTC
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org
 [IPv6:2a01:4f8:c010:8611::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FE010E819
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 22:53:53 +0000 (UTC)
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
 id 5F70968F731; Fri, 18 Nov 2022 23:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
 s=2022; t=1668811575;
 bh=LlspP/CA3mDLhx5AvEkQCfgDBdtUPqlu+K6RNIoku6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KuKVH8ytJVbCJPPfClkVqVK/dVOGGWU+fk6eowX6oJJfczzpxGgC3Wv9NCrA79VCu
 PjpMMMixcBbeLppwKyYjjSWahr2tlIrPk+O2AT6OqPZ6TpiTUPMOqLDLfefieggdd1
 jAGbGJ7dbzYJCEVPoG2a7l3wPR9Q8EYXB6P40m6Kvaxks407PlFze8XWz44WGIWyPO
 b1bOrpwmJnFrEE+9HbCOutdTPdzp/pn0W1G7EJzclTU40X9JYohKFu5OZkL4mYHym5
 C9Mr4ocS6IZeufXFM/Xn8n6EdRDpHUPP33C8kzFRUbv9Z9l1ezF5YnG2fGfbEDNUbg
 mla6R1S0pjflQ==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ajay Gupta <ajayg@nvidia.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:36:12 +0100
Message-Id: <20221118224540.619276-39-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 578b738859b9..e0476a5bf84c 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -386,7 +386,7 @@ static const struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
 
 /* I2C driver functions */
 
-static int ch7006_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int ch7006_probe(struct i2c_client *client)
 {
 	uint8_t addr = CH7006_VERSION_ID;
 	uint8_t val;
@@ -495,7 +495,7 @@ static const struct dev_pm_ops ch7006_pm_ops = {
 
 static struct drm_i2c_encoder_driver ch7006_driver = {
 	.i2c_driver = {
-		.probe = ch7006_probe,
+		.probe_new = ch7006_probe,
 		.remove = ch7006_remove,
 
 		.driver = {
-- 
2.38.1

