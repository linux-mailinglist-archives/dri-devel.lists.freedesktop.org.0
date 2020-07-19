Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039C225896
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732DC6E090;
	Mon, 20 Jul 2020 07:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jul 2020 17:10:52 UTC
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72A6E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 17:10:52 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id ADC2C3ECDF;
 Sun, 19 Jul 2020 19:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id D566B2A3B2;
 Sun, 19 Jul 2020 13:10:49 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1595178649;
 bh=he9kIrjkhiKUK6NeKAGxd57j0ZOBmfqoe/6lxjCQAnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nd6geu3LT1idRMXx+9lFTPb9L5XZJElmsUYq27ZMBnOrhM+NU9685iGjpvG14csBP
 crzR+n54iATk3Hb6gEA/F3i5tG0BpQVUKia7h13toTvzkvzue6vo7GlZ+jR3lJGuz8
 MrvjYy0KoAy01CVzJxg2nJbRB5/3k+Xx5C2toRhA=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2ac3Xxdxbiq; Sun, 19 Jul 2020 13:10:48 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sun, 19 Jul 2020 13:10:48 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 9BB0040856;
 Sun, 19 Jul 2020 17:10:47 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=aosc.io header.i=@aosc.io header.b="RkzvKmfZ"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.163.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 159C240856;
 Sun, 19 Jul 2020 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1595178637; bh=he9kIrjkhiKUK6NeKAGxd57j0ZOBmfqoe/6lxjCQAnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RkzvKmfZnjZoKgXPW4gz33ue2VtUnJDNrZCmLJqcCqPkCRyXwHUe5fuYEQpcst+au
 2XZ76nFoquiKkcUMxLGRk0OHRy9BE3lxJuDU6EQ1wc0EuZBQ0Rjo4y8ITo88zoFTAV
 0KHghREZehGGmHhgA/Lfz2s0qG16QAeUGsv+QeGY=
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 3/4] drm/panel: ilitek-ili9881c: add support for Feixin
 K101-IM2BYL02 panel
Date: Mon, 20 Jul 2020 01:10:05 +0800
Message-Id: <20200719171007.276383-2-icenowy@aosc.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200719170411.275812-1-icenowy@aosc.io>
References: <20200719170411.275812-1-icenowy@aosc.io>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9BB0040856
X-Spamd-Result: default: False [6.40 / 20.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 ML_SERVERS(-3.10)[148.251.23.173]; DKIM_TRACE(0.00)[aosc.io:+];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[gmail.com,ravnborg.org,kernel.org];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.163.116:received];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[aosc.io:s=default];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[aosc.io];
 MID_CONTAINS_FROM(1.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
 RCVD_COUNT_TWO(0.00)[2]; SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: mail20.mymailcheap.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:36 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Feixin K101-IM2BYL02 is a new panel by Feixin designed as a replacement
to their K101-IM2BA02 panel. This panel utilizes the Ilitek ILI9881C
controller.

Add this panel's initialzation sequence and timing to ILI9881C driver.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 217 ++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 4f8e6865029f1..638108c519f02 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -260,6 +260,199 @@ static const struct ili9881c_instr lhr050h41_init[] = {
 	ILI9881C_COMMAND_INSTR(0xD3, 0x3F),
 };
 
+static const struct ili9881c_instr k101_im2byl02_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x73),
+	ILI9881C_COMMAND_INSTR(0x04, 0x00),
+	ILI9881C_COMMAND_INSTR(0x05, 0x00),
+	ILI9881C_COMMAND_INSTR(0x06, 0x08),
+	ILI9881C_COMMAND_INSTR(0x07, 0x00),
+	ILI9881C_COMMAND_INSTR(0x08, 0x00),
+	ILI9881C_COMMAND_INSTR(0x09, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0A, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0B, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0D, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0E, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x10, 0x00),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1E, 0x40),
+	ILI9881C_COMMAND_INSTR(0x1F, 0xC0),
+	ILI9881C_COMMAND_INSTR(0x20, 0x06),
+	ILI9881C_COMMAND_INSTR(0x21, 0x01),
+	ILI9881C_COMMAND_INSTR(0x22, 0x06),
+	ILI9881C_COMMAND_INSTR(0x23, 0x01),
+	ILI9881C_COMMAND_INSTR(0x24, 0x88),
+	ILI9881C_COMMAND_INSTR(0x25, 0x88),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x3B),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2E, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x00), /* GPWR1/2 non overlap time 2.62us */
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x00),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3E, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x50, 0x01),
+	ILI9881C_COMMAND_INSTR(0x51, 0x23),
+	ILI9881C_COMMAND_INSTR(0x52, 0x45),
+	ILI9881C_COMMAND_INSTR(0x53, 0x67),
+	ILI9881C_COMMAND_INSTR(0x54, 0x89),
+	ILI9881C_COMMAND_INSTR(0x55, 0xAB),
+	ILI9881C_COMMAND_INSTR(0x56, 0x01),
+	ILI9881C_COMMAND_INSTR(0x57, 0x23),
+	ILI9881C_COMMAND_INSTR(0x58, 0x45),
+	ILI9881C_COMMAND_INSTR(0x59, 0x67),
+	ILI9881C_COMMAND_INSTR(0x5A, 0x89),
+	ILI9881C_COMMAND_INSTR(0x5B, 0xAB),
+	ILI9881C_COMMAND_INSTR(0x5C, 0xCD),
+	ILI9881C_COMMAND_INSTR(0x5D, 0xEF),
+	ILI9881C_COMMAND_INSTR(0x5E, 0x00),
+	ILI9881C_COMMAND_INSTR(0x5F, 0x01),
+	ILI9881C_COMMAND_INSTR(0x60, 0x01),
+	ILI9881C_COMMAND_INSTR(0x61, 0x06),
+	ILI9881C_COMMAND_INSTR(0x62, 0x06),
+	ILI9881C_COMMAND_INSTR(0x63, 0x07),
+	ILI9881C_COMMAND_INSTR(0x64, 0x07),
+	ILI9881C_COMMAND_INSTR(0x65, 0x00),
+	ILI9881C_COMMAND_INSTR(0x66, 0x00),
+	ILI9881C_COMMAND_INSTR(0x67, 0x02),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x05),
+	ILI9881C_COMMAND_INSTR(0x6A, 0x05),
+	ILI9881C_COMMAND_INSTR(0x6B, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x6D, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x6F, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x70, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x71, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x72, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x73, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x01),
+	ILI9881C_COMMAND_INSTR(0x76, 0x01),
+	ILI9881C_COMMAND_INSTR(0x77, 0x06),
+	ILI9881C_COMMAND_INSTR(0x78, 0x06),
+	ILI9881C_COMMAND_INSTR(0x79, 0x07),
+	ILI9881C_COMMAND_INSTR(0x7A, 0x07),
+	ILI9881C_COMMAND_INSTR(0x7B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x7C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x7D, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7E, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7F, 0x05),
+	ILI9881C_COMMAND_INSTR(0x80, 0x05),
+	ILI9881C_COMMAND_INSTR(0x81, 0x02),
+	ILI9881C_COMMAND_INSTR(0x82, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x83, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x84, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x85, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x86, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x87, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x88, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x89, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x3B, 0xC0), /* ILI4003D sel */
+	ILI9881C_COMMAND_INSTR(0x6C, 0x15), /* Set VCORE voltage = 1.5V */
+	ILI9881C_COMMAND_INSTR(0x6E, 0x2A), /* di_pwr_reg=0 for power mode 2A, VGH clamp 18V */
+	ILI9881C_COMMAND_INSTR(0x6F, 0x33), /* pumping ratio VGH=5x VGL=-3x */
+	ILI9881C_COMMAND_INSTR(0x8D, 0x1B), /* VGL clamp -10V */
+	ILI9881C_COMMAND_INSTR(0x87, 0xBA), /* ESD */
+	ILI9881C_COMMAND_INSTR(0x3A, 0x24), /* POWER SAVING */
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0A), /* BGR, SS */
+	ILI9881C_COMMAND_INSTR(0x31, 0x00), /* Zigzag type3 inversion */
+	ILI9881C_COMMAND_INSTR(0x40, 0x53), /* ILI4003D sel */
+	ILI9881C_COMMAND_INSTR(0x43, 0x66),
+	ILI9881C_COMMAND_INSTR(0x53, 0x4C),
+	ILI9881C_COMMAND_INSTR(0x50, 0x87),
+	ILI9881C_COMMAND_INSTR(0x51, 0x82),
+	ILI9881C_COMMAND_INSTR(0x60, 0x15),
+	ILI9881C_COMMAND_INSTR(0x61, 0x01),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x63, 0x00),
+	ILI9881C_COMMAND_INSTR(0xA0, 0x00),
+	ILI9881C_COMMAND_INSTR(0xA1, 0x13), /* VP251 */
+	ILI9881C_COMMAND_INSTR(0xA2, 0x23), /* VP247 */
+	ILI9881C_COMMAND_INSTR(0xA3, 0x14), /* VP243 */
+	ILI9881C_COMMAND_INSTR(0xA4, 0x16), /* VP239 */
+	ILI9881C_COMMAND_INSTR(0xA5, 0x29), /* VP231 */
+	ILI9881C_COMMAND_INSTR(0xA6, 0x1E), /* VP219 */
+	ILI9881C_COMMAND_INSTR(0xA7, 0x1D), /* VP203 */
+	ILI9881C_COMMAND_INSTR(0xA8, 0x86), /* VP175 */
+	ILI9881C_COMMAND_INSTR(0xA9, 0x1E), /* VP144 */
+	ILI9881C_COMMAND_INSTR(0xAA, 0x29), /* VP111 */
+	ILI9881C_COMMAND_INSTR(0xAB, 0x74), /* VP80 */
+	ILI9881C_COMMAND_INSTR(0xAC, 0x19), /* VP52 */
+	ILI9881C_COMMAND_INSTR(0xAD, 0x17), /* VP36 */
+	ILI9881C_COMMAND_INSTR(0xAE, 0x4B), /* VP24 */
+	ILI9881C_COMMAND_INSTR(0xAF, 0x20), /* VP16 */
+	ILI9881C_COMMAND_INSTR(0xB0, 0x26), /* VP12 */
+	ILI9881C_COMMAND_INSTR(0xB1, 0x4C), /* VP8 */
+	ILI9881C_COMMAND_INSTR(0xB2, 0x5D), /* VP4 */
+	ILI9881C_COMMAND_INSTR(0xB3, 0x3F), /* VP0 */
+	ILI9881C_COMMAND_INSTR(0xC0, 0x00), /* VN255 GAMMA N */
+	ILI9881C_COMMAND_INSTR(0xC1, 0x13), /* VN251 */
+	ILI9881C_COMMAND_INSTR(0xC2, 0x23), /* VN247 */
+	ILI9881C_COMMAND_INSTR(0xC3, 0x14), /* VN243 */
+	ILI9881C_COMMAND_INSTR(0xC4, 0x16), /* VN239 */
+	ILI9881C_COMMAND_INSTR(0xC5, 0x29), /* VN231 */
+	ILI9881C_COMMAND_INSTR(0xC6, 0x1E), /* VN219 */
+	ILI9881C_COMMAND_INSTR(0xC7, 0x1D), /* VN203 */
+	ILI9881C_COMMAND_INSTR(0xC8, 0x86), /* VN175 */
+	ILI9881C_COMMAND_INSTR(0xC9, 0x1E), /* VN144 */
+	ILI9881C_COMMAND_INSTR(0xCA, 0x29), /* VN111 */
+	ILI9881C_COMMAND_INSTR(0xCB, 0x74), /* VN80 */
+	ILI9881C_COMMAND_INSTR(0xCC, 0x19), /* VN52 */
+	ILI9881C_COMMAND_INSTR(0xCD, 0x17), /* VN36 */
+	ILI9881C_COMMAND_INSTR(0xCE, 0x4B), /* VN24 */
+	ILI9881C_COMMAND_INSTR(0xCF, 0x20), /* VN16 */
+	ILI9881C_COMMAND_INSTR(0xD0, 0x26), /* VN12 */
+	ILI9881C_COMMAND_INSTR(0xD1, 0x4C), /* VN8 */
+	ILI9881C_COMMAND_INSTR(0xD2, 0x5D), /* VN4 */
+	ILI9881C_COMMAND_INSTR(0xD3, 0x3F), /* VN0 */
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -393,6 +586,23 @@ static const struct drm_display_mode lhr050h41_default_mode = {
 	.height_mm	= 110,
 };
 
+static const struct drm_display_mode k101_im2byl02_default_mode = {
+	.clock		= 69700,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 6,
+	.hsync_end	= 800 + 6 + 15,
+	.htotal		= 800 + 6 + 15 + 16,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 8,
+	.vsync_end	= 1280 + 8 + 48,
+	.vtotal		= 1280 + 8 + 48 + 52,
+
+	.width_mm	= 135,
+	.height_mm	= 217,
+};
+
 static int ili9881c_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -485,8 +695,15 @@ static const struct ili9881c_desc lhr050h41_desc = {
 	.mode = &lhr050h41_default_mode,
 };
 
+static const struct ili9881c_desc k101_im2byl02_desc = {
+	.init = k101_im2byl02_init,
+	.init_length = ARRAY_SIZE(k101_im2byl02_init),
+	.mode = &k101_im2byl02_default_mode,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
+	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9881c_of_match);
-- 
2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
