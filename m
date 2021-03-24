Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F028347412
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7A56E101;
	Wed, 24 Mar 2021 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 24 Mar 2021 09:00:48 UTC
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947EE6E101
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:00:48 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id OzGelwIG0CAEGOzGhlZ4uS; Wed, 24 Mar 2021 09:53:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1616576018; bh=yUW/RaeQJPREro1UhJl7zUUe5GW6I7n4sN+UfTklbiA=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=t7mS48/If8c2VqZG3sdGugENOzCZVV+x8kySCc6gu5VNEdk5xlh8cmhWSmOTfneSU
 jbxRogAbefyflOyiDQzASJ4/OnMikr/OiCdZXx+agTzbJODGLO9qjHEMOgvr8N9wkO
 5sLzz5+vl1XL+Yh6oaNihRRvlaSVZoMgvsSHrGQbuwDnOEZK7rXmM3gXU46RpMB8/J
 2n4TuVYPULIaT9hR0Seb8iDtHYcETlB9LRkBhw9qT1kJIJOlOHAbm0LBGYxjIaZVwN
 zM9EnAcOEBa9GckvpLZbS28C48gf1Vph0kTP/9RQpCImedfVsMeozHpIiiMgJPFTh9
 BGYmj/0mKMXWg==
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
Message-ID: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
Date: Wed, 24 Mar 2021 09:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4xfNrjgwN9wqpC/KjMFiHEs1iNMh4C3iRxaZNAhNJJGzyKMVaiJjuAzQsRH2IcUY8myNGkUwwSf4ycnPWcKTzdq8rT+VqdjWa3i2Yci2OzPUbVcdjHf2i+
 BSMUhjnjgUr6GL5+faqXubZJjxHPBbaw5ZJIMXnAWm8cbBqxjoxhwKIqbajScraLFAQBGW+Qi5FZyrLZWNKpsClQcGHGGB0yrgxiflAECegagcW6zOsOdrT/
 j7nZehzZfeBL4bM97wwZ85uf0lPM0tPnA2We7yvmOtLZ/y/X1zkQyHRi07Bk5FUcYMqKGWqt0XESUiuxEupYMqz2PefBTZy7pCKwWPtaWUimF/RO8mMrJf+K
 jCypa6QQjyh4SX1yCMSWxzq2dthHuA==
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
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Archit Taneja <architt@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While testing support for large (> 256 bytes) EDIDs on the Renesas
Koelsch board I noticed that the adv7511 bridge driver only read the
first two blocks.

The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
handled this correctly.

Besides a simple bug when setting the segment register (it was set to the
block number instead of block / 2), the logic of the code was also weird.
In particular reading the DDC_STATUS is odd: this is unrelated to EDID
reading.

The reworked code just waits for any EDID segment reads to finish (this
does nothing if the a segment is already read), checks if the desired
segment matches the read segment, and if not, then it requests the new
segment and waits again for the EDID segment to be read.

Finally it checks if the currently buffered EDID segment contains the
desired EDID block, and if not it will update the EDID buffer from
the adv7511.

Tested with my Koelsch board and with EDIDs of 1, 2, 3 and 4 blocks.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Testing on the Renesas board also requires these two adv7604 patches
if you want to test with an HDMI cable between the HDMI input and output:

https://patchwork.linuxtv.org/project/linux-media/patch/00882808-472a-d429-c565-a701da579ead@xs4all.nl/
https://patchwork.linuxtv.org/project/linux-media/patch/c7093e76-ffb4-b19c-f576-b264f935a3ce@xs4all.nl/
---
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..9e8db1c60167 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -328,6 +328,7 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,
 static void __adv7511_power_on(struct adv7511 *adv7511)
 {
 	adv7511->current_edid_segment = -1;
+	adv7511->edid_read = false;

 	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
 			   ADV7511_POWER_POWER_DOWN, 0);
@@ -529,29 +530,35 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 	struct adv7511 *adv7511 = data;
 	struct i2c_msg xfer[2];
 	uint8_t offset;
+	unsigned int cur_segment;
 	unsigned int i;
 	int ret;

 	if (len > 128)
 		return -EINVAL;

-	if (adv7511->current_edid_segment != block / 2) {
-		unsigned int status;
+	/* wait for any EDID segment reads to finish */
+	adv7511_wait_for_edid(adv7511, 200);

-		ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
-				  &status);
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_EDID_SEGMENT, &cur_segment);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * If the current read segment does not match what we need, then
+	 * write the new segment and wait for it to be read.
+	 */
+	if (cur_segment != block / 2) {
+		adv7511->edid_read = false;
+		cur_segment = block / 2;
+		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
+			     cur_segment);
+		ret = adv7511_wait_for_edid(adv7511, 200);
 		if (ret < 0)
 			return ret;
+	}

-		if (status != 2) {
-			adv7511->edid_read = false;
-			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
-				     block);
-			ret = adv7511_wait_for_edid(adv7511, 200);
-			if (ret < 0)
-				return ret;
-		}
-
+	if (adv7511->current_edid_segment != cur_segment) {
 		/* Break this apart, hopefully more I2C controllers will
 		 * support 64 byte transfers than 256 byte transfers
 		 */
@@ -579,7 +586,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 			offset += 64;
 		}

-		adv7511->current_edid_segment = block / 2;
+		adv7511->current_edid_segment = cur_segment;
 	}

 	if (block % 2 == 0)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
