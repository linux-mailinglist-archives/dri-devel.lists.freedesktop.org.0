Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8089119757
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01866E994;
	Tue, 10 Dec 2019 21:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819626E994
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:33:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91EB2207FF;
 Tue, 10 Dec 2019 21:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013581;
 bh=fb4PJ8U/D/CVP8XUSCaluP/R05IDtDuzZIo04hwjT8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rnUFdA5XQ3SVdr0fDthpNBRKxEG0fQ0A7Uy8QX9tpBQu35jvlOuGU84JvsX8prUS8
 rdVsB8Foqg/lybjF61E5QRuiQKushyq0Kbl2esAwb6dEcTWpuE5zTCm9PyzE99Tr/L
 ZnP5wmxOj1zV9xCYCr8EEVFQ2yzN7vZR/U3Y+sCY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 033/177] drm/bridge: dw-hdmi: Refuse DDC/CI
 transfers on the internal I2C controller
Date: Tue, 10 Dec 2019 16:29:57 -0500
Message-Id: <20191210213221.11921-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Matthias Kaehlcke <mka@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Kaehlcke <mka@chromium.org>

[ Upstream commit bee447e224b2645911c5d06e35dc90d8433fcef6 ]

The DDC/CI protocol involves sending a multi-byte request to the
display via I2C, which is typically followed by a multi-byte
response. The internal I2C controller only allows single byte
reads/writes or reads of 8 sequential bytes, hence DDC/CI is not
supported when the internal I2C controller is used. The I2C
transfers complete without errors, however the data in the response
is garbage. Abort transfers to/from slave address 0x37 (DDC) with
-EOPNOTSUPP, to make it evident that the communication is failing.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Sean Paul <sean@poorly.run>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20191002124354.v2.1.I709dfec496f5f0b44a7b61dcd4937924da8d8382@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5971976284bf9..fb396d550275c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -39,6 +39,7 @@
 
 #include <media/cec-notifier.h>
 
+#define DDC_CI_ADDR		0x37
 #define DDC_SEGMENT_ADDR	0x30
 
 #define HDMI_EDID_LEN		512
@@ -320,6 +321,15 @@ static int dw_hdmi_i2c_xfer(struct i2c_adapter *adap,
 	u8 addr = msgs[0].addr;
 	int i, ret = 0;
 
+	if (addr == DDC_CI_ADDR)
+		/*
+		 * The internal I2C controller does not support the multi-byte
+		 * read and write operations needed for DDC/CI.
+		 * TOFIX: Blacklist the DDC/CI address until we filter out
+		 * unsupported I2C operations.
+		 */
+		return -EOPNOTSUPP;
+
 	dev_dbg(hdmi->dev, "xfer: num: %d, addr: %#x\n", num, addr);
 
 	for (i = 0; i < num; i++) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
