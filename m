Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB7ECrx4fGmWNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:24:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E3B8E15
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB91710E959;
	Fri, 30 Jan 2026 09:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D50210E959
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:24:08 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-01 (Coremail) with SMTP id qwCowADHM2+feHxpxCe7Bg--.232S2;
 Fri, 30 Jan 2026 17:23:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, mehdi.djait@bootlin.com,
 u.kleine-koenig@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/sharp-memory: Fix IS_ERR() vs NULL check in
 sharp_memory_probe()
Date: Fri, 30 Jan 2026 17:22:59 +0800
Message-Id: <20260130092300.3426214-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADHM2+feHxpxCe7Bg--.232S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry7tw1kWr1Dur17XryUGFg_yoW8Aw43pF
 s7JFyjyrWDKrZ2kw4xta1kCF1fCw10gay8Gr929wsruwnruryFya4fG3ySvF1UJFW8A3W3
 t3ZxZa15uFZrZaUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
 6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72
 CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
 M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uw
 CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
 6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
 vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUw4SOUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lanzano.alex@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:mehdi.djait@bootlin.com,m:u.kleine-koenig@baylibre.com,m:linux-kernel@vger.kernel.org,m:nichen@iscas.ac.cn,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,bootlin.com,baylibre.com];
	FORGED_SENDER(0.00)[nichen@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.848];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: AF3E3B8E15
X-Rspamd-Action: no action

The devm_drm_dev_alloc() function returns an ERR_PTR encoded error
pointer on failure, not NULL. devm_gpiod_get_optional() may return
ERR_PTR in case of genuine GPIO acquisition errors, not just NULL which
indicates the legitimate absence of an optional GPIO.

Replace the NULL check after devm_drm_dev_alloc() with IS_ERR() and add
a missing IS_ERR() check after devm_gpiod_get_optional(). On error,
return the error code from the probe function to ensure proper failure
handling rather than proceeding with invalid pointers.

Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 64272cd0f6e2..5e6a54a0696c 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -541,8 +541,9 @@ static int sharp_memory_probe(struct spi_device *spi)
 
 	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
 				 struct sharp_memory_device, drm);
-	if (!smd)
-		return -ENOMEM;
+	if (IS_ERR(smd))
+		return dev_err_probe(dev, PTR_ERR(smd),
+				     "Failed to allocate drm device\n");
 
 	spi_set_drvdata(spi, smd);
 
@@ -553,6 +554,9 @@ static int sharp_memory_probe(struct spi_device *spi)
 		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
 
 	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(smd->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(smd->enable_gpio),
+				     "Failed to get gpio 'enable'\n");
 	if (!smd->enable_gpio)
 		dev_warn(dev, "Enable gpio not defined\n");
 
-- 
2.25.1

