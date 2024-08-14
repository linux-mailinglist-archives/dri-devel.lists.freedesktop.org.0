Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3A952131
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336910E4F4;
	Wed, 14 Aug 2024 17:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="bJ1krr0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863CC10E474
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID;
 bh=PSTTA0GMcP2XwcOAB/PPJ3gc6a1JIfylg0irJYbpA1Y=; b=bJ1krr0PLo69ZDK1nQupke5sp4
 expxg4BKDQmqI0Mtu/gc3md1UfQvhJVRfcTFCVLt1Pjx3QIeT86pUw5+ogLVpW4Y2Ncl5KzeL88sZ
 uGPeE5keB6wc8VfFmDCT2M0kvq/BQ0nejjXZoRCN/sFuFfPghvKYJ3GwfwjvMI/4D0vrT2E/l1iE/
 TLZ+cJMcWF2ZDhkVRwTsFxS9NSA+NYaK7fykl9fdSQLDuArjP3Y0xguGOHI2iR0ecbmmV/9UMVMuC
 jl5WeKiTjucpMATT9xJs1Y3S2MPo1rOiQC1afsHXPUGctxD4kIA24ohCCDNL21TOOwt4DvKZav8dq
 xYGFvWcw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1seDm3-0009GT-G2; Wed, 14 Aug 2024 15:10:47 +0200
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <esben@geanix.com>) id 1seDm3-000HEO-08;
 Wed, 14 Aug 2024 15:10:47 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 14 Aug 2024 15:10:37 +0200
Subject: [PATCH 3/3] drm/panel: ili9881c: Add JMO LCM-JM800WX support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-3-22a5e58599be@geanix.com>
References: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-0-22a5e58599be@geanix.com>
In-Reply-To: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-0-22a5e58599be@geanix.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723641045; l=10848;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=js0yOtg4xrbaNHKUd5VuSdtuHV2qMpCCLJemc/q2jGY=;
 b=Is39m16lvNwgP/BjzHAp9HWJG6SIPfnZRlM7iA4GDbYxZJH9lIfaBX6MwNpYqBw2jki36c1ys
 Gam3HbvV5HPClvkGX9OrAjCrZQP/cKKdzCTJfYGSVT+cOsnqwbaRgrU
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27367/Wed Aug 14 10:36:34 2024)
X-Mailman-Approved-At: Wed, 14 Aug 2024 17:32:02 +0000
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

Add support for the LCM-JM800WX panel from JMO Tech.

The init commands are based on information from vendor.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 228 ++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 084c37fa7348..2f9c25c3ca15 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1223,6 +1223,206 @@ static const struct ili9881c_instr am8001280g_init[] = {
 	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
 };
 
+static const struct ili9881c_instr lcm_jm800wx_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x53),
+	ILI9881C_COMMAND_INSTR(0x04, 0x53),
+	ILI9881C_COMMAND_INSTR(0x05, 0x13),
+	ILI9881C_COMMAND_INSTR(0x06, 0x04),
+	ILI9881C_COMMAND_INSTR(0x07, 0x02),
+	ILI9881C_COMMAND_INSTR(0x08, 0x02),
+	ILI9881C_COMMAND_INSTR(0x09, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0E, 0x00),
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
+	ILI9881C_COMMAND_INSTR(0x1E, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x1F, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x02),
+	ILI9881C_COMMAND_INSTR(0x21, 0x09),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x55),
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
+	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
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
+	ILI9881C_COMMAND_INSTR(0x5E, 0x01),
+	ILI9881C_COMMAND_INSTR(0x5F, 0x08),
+	ILI9881C_COMMAND_INSTR(0x60, 0x02),
+	ILI9881C_COMMAND_INSTR(0x61, 0x02),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x63, 0x15),
+	ILI9881C_COMMAND_INSTR(0x64, 0x14),
+	ILI9881C_COMMAND_INSTR(0x65, 0x02),
+	ILI9881C_COMMAND_INSTR(0x66, 0x11),
+	ILI9881C_COMMAND_INSTR(0x67, 0x10),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x6A, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x6B, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x6D, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x6F, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x02),
+	ILI9881C_COMMAND_INSTR(0x72, 0x02),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x06),
+	ILI9881C_COMMAND_INSTR(0x76, 0x02),
+	ILI9881C_COMMAND_INSTR(0x77, 0x02),
+	ILI9881C_COMMAND_INSTR(0x78, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x79, 0x15),
+	ILI9881C_COMMAND_INSTR(0x7A, 0x14),
+	ILI9881C_COMMAND_INSTR(0x7B, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7C, 0x10),
+	ILI9881C_COMMAND_INSTR(0x7D, 0x11),
+	ILI9881C_COMMAND_INSTR(0x7E, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7F, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x80, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x81, 0x02),
+	ILI9881C_COMMAND_INSTR(0x82, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x83, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x84, 0x08),
+	ILI9881C_COMMAND_INSTR(0x85, 0x02),
+	ILI9881C_COMMAND_INSTR(0x86, 0x02),
+	ILI9881C_COMMAND_INSTR(0x87, 0x02),
+	ILI9881C_COMMAND_INSTR(0x88, 0x02),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x30),
+	ILI9881C_COMMAND_INSTR(0x6F, 0x33),
+	ILI9881C_COMMAND_INSTR(0x8D, 0x1F),
+	ILI9881C_COMMAND_INSTR(0x87, 0xBA),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xB2, 0xd1),
+	ILI9881C_COMMAND_INSTR(0x35, 0x1f),
+	ILI9881C_COMMAND_INSTR(0x33, 0x14),
+	ILI9881C_COMMAND_INSTR(0x3A, 0xa9),
+	ILI9881C_COMMAND_INSTR(0x3B, 0x98),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00), /* BIST mode = 0x01 */
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x09), /* BGR, SS */
+	ILI9881C_COMMAND_INSTR(0x31, 0x00), /* Zigzag type3 inversion */
+	ILI9881C_COMMAND_INSTR(0x50, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x51, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x53, 0x47),
+	ILI9881C_COMMAND_INSTR(0x55, 0x7a),
+	ILI9881C_COMMAND_INSTR(0x60, 0x28),
+	ILI9881C_COMMAND_INSTR(0x61, 0x05),
+	ILI9881C_COMMAND_INSTR(0x62, 0x19),
+	ILI9881C_COMMAND_INSTR(0x63, 0x05),
+	ILI9881C_COMMAND_INSTR(0x2e, 0xc8),
+	ILI9881C_COMMAND_INSTR(0xA0, 0x01),
+	ILI9881C_COMMAND_INSTR(0xA1, 0x10), /* VP251 */
+	ILI9881C_COMMAND_INSTR(0xA2, 0x1b), /* VP247 */
+	ILI9881C_COMMAND_INSTR(0xA3, 0x0c), /* VP243 */
+	ILI9881C_COMMAND_INSTR(0xA4, 0x14), /* VP239 */
+	ILI9881C_COMMAND_INSTR(0xA5, 0x25), /* VP231 */
+	ILI9881C_COMMAND_INSTR(0xA6, 0x1a), /* VP219 */
+	ILI9881C_COMMAND_INSTR(0xA7, 0x1D), /* VP203 */
+	ILI9881C_COMMAND_INSTR(0xA8, 0x68), /* VP175 */
+	ILI9881C_COMMAND_INSTR(0xA9, 0x1b), /* VP144 */
+	ILI9881C_COMMAND_INSTR(0xAA, 0x26), /* VP111 */
+	ILI9881C_COMMAND_INSTR(0xAB, 0x5b), /* VP80 */
+	ILI9881C_COMMAND_INSTR(0xAC, 0x1b), /* VP52 */
+	ILI9881C_COMMAND_INSTR(0xAD, 0x17), /* VP36 */
+	ILI9881C_COMMAND_INSTR(0xAE, 0x4f), /* VP24 */
+	ILI9881C_COMMAND_INSTR(0xAF, 0x24), /* VP16 */
+	ILI9881C_COMMAND_INSTR(0xB0, 0x2a), /* VP12 */
+	ILI9881C_COMMAND_INSTR(0xB1, 0x4e), /* VP8 */
+	ILI9881C_COMMAND_INSTR(0xB2, 0x5f), /* VP4 */
+	ILI9881C_COMMAND_INSTR(0xB3, 0x39), /* VP0 */
+	ILI9881C_COMMAND_INSTR(0xC0, 0x0f), /* VN255 GAMMA N */
+	ILI9881C_COMMAND_INSTR(0xC1, 0x1b), /* VN251 */
+	ILI9881C_COMMAND_INSTR(0xC2, 0x27), /* VN247 */
+	ILI9881C_COMMAND_INSTR(0xC3, 0x16), /* VN243 */
+	ILI9881C_COMMAND_INSTR(0xC4, 0x14), /* VN239 */
+	ILI9881C_COMMAND_INSTR(0xC5, 0x28), /* VN231 */
+	ILI9881C_COMMAND_INSTR(0xC6, 0x1d), /* VN219 */
+	ILI9881C_COMMAND_INSTR(0xC7, 0x21), /* VN203 */
+	ILI9881C_COMMAND_INSTR(0xC8, 0x6c), /* VN175 */
+	ILI9881C_COMMAND_INSTR(0xC9, 0x1b), /* VN144 */
+	ILI9881C_COMMAND_INSTR(0xCA, 0x26), /* VN111 */
+	ILI9881C_COMMAND_INSTR(0xCB, 0x5b), /* VN80 */
+	ILI9881C_COMMAND_INSTR(0xCC, 0x1b), /* VN52 */
+	ILI9881C_COMMAND_INSTR(0xCD, 0x1b), /* VN36 */
+	ILI9881C_COMMAND_INSTR(0xCE, 0x4f), /* VN24 */
+	ILI9881C_COMMAND_INSTR(0xCF, 0x24), /* VN16 */
+	ILI9881C_COMMAND_INSTR(0xD0, 0x2a), /* VN12 */
+	ILI9881C_COMMAND_INSTR(0xD1, 0x4e), /* VN8 */
+	ILI9881C_COMMAND_INSTR(0xD2, 0x5f), /* VN4 */
+	ILI9881C_COMMAND_INSTR(0xD3, 0x39), /* VN0 */
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00), /* Normal mode */
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -1441,6 +1641,25 @@ static const struct drm_display_mode am8001280g_default_mode = {
 	.height_mm	= 151,
 };
 
+static const struct drm_display_mode lcm_jm800wx_default_mode = {
+	.clock		= 73000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 50,
+	.hsync_end	= 800 + 50 + 20,
+	.htotal		= 800 + 50 + 20 + 54,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 15,
+	.vsync_end	= 1280 + 15 + 6,
+	.vtotal		= 1280 + 15 + 6 + 15,
+
+	.width_mm	= 108,
+	.height_mm	= 172,
+
+	.flags		= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
 static int ili9881c_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -1590,6 +1809,14 @@ static const struct ili9881c_desc am8001280g_desc = {
 		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
 };
 
+static const struct ili9881c_desc lcm_jm800wx_desc = {
+	.init = lcm_jm800wx_init,
+	.init_length = ARRAY_SIZE(lcm_jm800wx_init),
+	.mode = &lcm_jm800wx_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_HSE |
+		      MIPI_DSI_MODE_LPM,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
@@ -1597,6 +1824,7 @@ static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
 	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
+	{ .compatible = "jmo,lcm-jm800wx", .data = &lcm_jm800wx_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9881c_of_match);

-- 
2.46.0

