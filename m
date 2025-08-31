Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71083B3D4CF
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 21:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C06110E059;
	Sun, 31 Aug 2025 19:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MTNMPwOy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kaEHqQbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838610E059
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 19:05:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cFM0D0Qv9z9srX;
 Sun, 31 Aug 2025 21:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756667132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LYrkzdSVot2UghVrRFjmCIq7rxF/j9ybfZxjjo01ooA=;
 b=MTNMPwOyncEzHbjnoS00zzZ8+l541/C6BgkX8bJCX0ce1jdxyJwXnTJ/eHnW64PWKvWhFa
 fxfxf/eH0C5PFru27jVvkS59mf/KnVjzDz3rOMjajvA3yYzIeVfnRzEsHNg7N1HsBrz77e
 Z9RXU1//SCJPYzPCwa+K5hsmbAY0QiaiunVEIaWAtwpweAO7p+jV1v9I7wHn3w1SHxqkJf
 AXWm8/DX1nJFKJG+YI2ezA/MBQQv1nh0PZYiMn/Jdvt8J3iIGruj0IjqvuVYUah746H0t9
 QVwk5b7RllbtAm3lf7VT0b3CNJiG7cOS645wRidz06t5we4BPRhNQNtCYs8Bvg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kaEHqQbb;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756667130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LYrkzdSVot2UghVrRFjmCIq7rxF/j9ybfZxjjo01ooA=;
 b=kaEHqQbbF3rGrvEw6XpC8XCQ6M0U2yEOpalzEfH52CMevXUXIyAdZYXrlGUyQWxv5JCy0T
 VTJaRLcWXAnjy3yx2/mW+gcX5DT7djQkS5q+QV89V+0RW089qXPQptv1NilaQR3QPSuQ5Q
 fNhz7rE3jZpfXJs1lAYtDpVpLoHEJ+KxwUCIimKOg+Sk6TpRTo2lWbK7mPP7Oq6YDPoxpv
 8erjCGO3NLNxd0brz8Z4YDb5kzWxm+9V99zVc90IHgjZGKPo1UtNDc4le73aIbRsKV52ip
 X7SfkROzXuQ4zUd5wTpzI+yEQTo7f9AwBJ7fu3endFIhBwQLkhWvMDgx2LuZAA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/rcar-du: dsi: Implement DSI command support
Date: Sun, 31 Aug 2025 21:04:25 +0200
Message-ID: <20250831190507.327848-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 29e54b7faf7251a3024
X-MBO-RS-META: 3xzgngz7sse3drdqxrbczt6zeffsht7h
X-Rspamd-Queue-Id: 4cFM0D0Qv9z9srX
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

Implement support for DSI command transfer. Transmission of both Short
Packet and Long Packet is implemented, so is command transmission to
request response from peripheral device and transmission of non-read
command with BTA.

The AXI memory access mode is currently not implemented, each transfer
is performed purely using controller register interface. Short Packet
transfer can transfer up to 2 Bytes of data, Long Packet transfer can
transfer up to 16 Bytes of data.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Use %zu instead of %ld to print size_t
    - Drop mode from commit message
    - Increase timeouts to 50ms, which is about 3 frame times
    - Add comments to timeouts
    - Drop use of BIT() macros, the driver will be converted to them
      in separate patch
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 225 ++++++++++++++++++
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 125 ++++++++++
 2 files changed, 350 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 952c3efb74da9..5c73a513f678e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -937,9 +937,234 @@ static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 	return 0;
 }
 
+static ssize_t rcar_mipi_dsi_host_tx_transfer(struct mipi_dsi_host *host,
+					      const struct mipi_dsi_msg *msg,
+					      bool is_rx_xfer)
+{
+	const bool is_tx_long = mipi_dsi_packet_format_is_long(msg->type);
+	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
+	struct mipi_dsi_packet packet;
+	u8 payload[16] = { 0 };
+	u32 status;
+	int ret;
+
+	ret = mipi_dsi_create_packet(&packet, msg);
+	if (ret)
+		return ret;
+
+	/* Configure LP or HS command transfer. */
+	rcar_mipi_dsi_write(dsi, TXCMSETR, (msg->flags & MIPI_DSI_MSG_USE_LPM) ?
+					   TXCMSETR_SPDTYP : 0);
+
+	/* Register access mode for RX transfer. */
+	if (is_rx_xfer)
+		rcar_mipi_dsi_write(dsi, RXPSETR, 0);
+
+	/* Do not use IRQ, poll for completion, the completion is quick. */
+	rcar_mipi_dsi_write(dsi, TXCMIER, 0);
+
+	/*
+	 * Send the header:
+	 * header[0] = Virtual Channel + Data Type
+	 * header[1] = Word Count LSB (LP) or first param (SP)
+	 * header[2] = Word Count MSB (LP) or second param (SP)
+	 */
+	rcar_mipi_dsi_write(dsi, TXCMPHDR,
+			    (is_tx_long ? TXCMPHDR_FMT : 0) |
+			    TXCMPHDR_VC(msg->channel) |
+			    TXCMPHDR_DT(msg->type) |
+			    TXCMPHDR_DATA1(packet.header[2]) |
+			    TXCMPHDR_DATA0(packet.header[1]));
+
+	if (is_tx_long) {
+		memcpy(payload, packet.payload,
+		       min(msg->tx_len, sizeof(payload)));
+
+		rcar_mipi_dsi_write(dsi, TXCMPPD0R,
+				    (payload[3] << 24) | (payload[2] << 16) |
+				    (payload[1] << 8) | payload[0]);
+		rcar_mipi_dsi_write(dsi, TXCMPPD1R,
+				    (payload[7] << 24) | (payload[6] << 16) |
+				    (payload[5] << 8) | payload[4]);
+		rcar_mipi_dsi_write(dsi, TXCMPPD2R,
+				    (payload[11] << 24) | (payload[10] << 16) |
+				    (payload[9] << 8) | payload[8]);
+		rcar_mipi_dsi_write(dsi, TXCMPPD3R,
+				    (payload[15] << 24) | (payload[14] << 16) |
+				    (payload[13] << 8) | payload[12]);
+	}
+
+	/* Start the transfer, RX with BTA, TX without BTA. */
+	if (is_rx_xfer) {
+		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_BTAREQ);
+
+		/* Wait until the transmission, BTA, reception completed. */
+		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+					(status & RXPSR_BTAREQEND),
+					2000, 50000, false, dsi, RXPSR);
+	} else {
+		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_TXREQ);
+
+		/* Wait until the transmission completed. */
+		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+					(status & TXCMSR_TXREQEND),
+					2000, 50000, false, dsi, TXCMSR);
+	}
+
+	if (ret < 0) {
+		dev_err(dsi->dev, "Command transfer timeout (0x%08x)\n",
+			status);
+		return ret;
+	}
+
+	return packet.size;
+}
+
+static ssize_t rcar_mipi_dsi_host_rx_transfer(struct mipi_dsi_host *host,
+					      const struct mipi_dsi_msg *msg)
+{
+	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
+	u8 *rx_buf = (u8 *)(msg->rx_buf);
+	u32 reg, data, status, wc;
+	int i, ret;
+
+	/* RX transfer received data validation and parsing starts here. */
+	reg = rcar_mipi_dsi_read(dsi, TOSR);
+	if (reg & TOSR_TATO) {	/* Turn-Around TimeOut. */
+		/* Clear TATO Turn-Around TimeOut bit. */
+		rcar_mipi_dsi_write(dsi, TOSR, TOSR_TATO);
+		return -ETIMEDOUT;
+	}
+
+	reg = rcar_mipi_dsi_read(dsi, RXPSR);
+
+	if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
+		/* Transfer with zero-length RX. */
+		if (!(reg & RXPSR_RCVACK)) {
+			/* No ACK on RX response received. */
+			return -EINVAL;
+		}
+	} else {
+		/* Transfer with non-zero-length RX. */
+		if (!(reg & RXPSR_RCVRESP)) {
+			/* No packet header of RX response received. */
+			return -EINVAL;
+		}
+
+		if (reg & (RXPSR_CRCERR | RXPSR_WCERR | RXPSR_AXIERR | RXPSR_OVRERR)) {
+			/* Incorrect response payload. */
+			return -ENODATA;
+		}
+
+		data = rcar_mipi_dsi_read(dsi, RXPHDR);
+		if (data & RXPHDR_FMT) {	/* Long Packet Response. */
+			/* Read Long Packet Response length from packet header. */
+			wc = data & 0xffff;
+			if (wc > msg->rx_len) {
+				dev_warn(dsi->dev,
+					 "Long Packet Response longer than RX buffer (%d), limited to %zu Bytes\n",
+					 wc, msg->rx_len);
+				wc = msg->rx_len;
+			}
+
+			if (wc > 16) {
+				dev_warn(dsi->dev,
+					 "Long Packet Response too long (%d), limited to 16 Bytes\n",
+					 wc);
+				wc = 16;
+			}
+
+			for (i = 0; i < msg->rx_len; i++) {
+				if (!(i % 4))
+					data = rcar_mipi_dsi_read(dsi, RXPPD0R + i);
+
+				rx_buf[i] = data & 0xff;
+				data >>= 8;
+			}
+		} else {	/* Short Packet Response. */
+			if (msg->rx_len >= 1)
+				rx_buf[0] = data & 0xff;
+			if (msg->rx_len >= 2)
+				rx_buf[1] = (data >> 8) & 0xff;
+			if (msg->rx_len >= 3) {
+				dev_warn(dsi->dev,
+					 "Expected Short Packet Response too long (%zu), limited to 2 Bytes\n",
+					 msg->rx_len);
+			}
+		}
+	}
+
+	if (reg & RXPSR_RCVAKE) {
+		/* Acknowledge and Error report received. */
+		return -EFAULT;
+	}
+
+	/* Wait until the bus handover to host processor completed. */
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & PPIDL0SR_DIR),
+				2000, 50000, false, dsi, PPIDL0SR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Command RX DIR timeout (0x%08x)\n", status);
+		return ret;
+	}
+
+	/* Wait until the data lane is in LP11 stop state. */
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				status & PPIDL0SR_STPST,
+				2000, 50000, false, dsi, PPIDL0SR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Command RX STPST timeout (0x%08x)\n", status);
+		return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t rcar_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
+					   const struct mipi_dsi_msg *msg)
+{
+	const bool is_rx_xfer = (msg->flags & MIPI_DSI_MSG_REQ_ACK) || msg->rx_len;
+	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
+	int ret;
+
+	if (msg->tx_len > 16 || msg->rx_len > 16) {
+		/* ToDo: Implement Memory on AXI bus command mode. */
+		dev_warn(dsi->dev,
+			 "Register-based command mode supports only up to 16 Bytes long payload\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = rcar_mipi_dsi_host_tx_transfer(host, msg, is_rx_xfer);
+
+	/* If TX transfer succeeded and this transfer has RX part. */
+	if (ret >= 0 && is_rx_xfer) {
+		ret = rcar_mipi_dsi_host_rx_transfer(host, msg);
+		if (ret)
+			return ret;
+
+		ret = msg->rx_len;
+	}
+
+	/*
+	 * Wait a bit between commands, otherwise panels based on ILI9881C
+	 * TCON may fail to correctly receive all commands sent to them.
+	 * Until we can actually test with another DSI device, keep the
+	 * delay here, but eventually this delay might have to be moved
+	 * into the ILI9881C panel driver.
+	 */
+	usleep_range(1000, 2000);
+
+	/* Clear the completion interrupt. */
+	if (!msg->rx_len)
+		rcar_mipi_dsi_write(dsi, TXCMSR, TXCMSR_TXREQEND);
+
+	return ret;
+}
+
 static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
 	.attach = rcar_mipi_dsi_host_attach,
 	.detach = rcar_mipi_dsi_host_detach,
+	.transfer = rcar_mipi_dsi_host_transfer
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index a54c7eb4113b9..76521276e2af8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -15,6 +15,127 @@
 #define TXSETR				0x100
 #define TXSETR_LANECNT_MASK		(0x3 << 0)
 
+/*
+ * DSI Command Transfer Registers
+ */
+#define TXCMSETR			0x110
+#define TXCMSETR_SPDTYP			(1 << 8)	/* 0:HS 1:LP */
+#define TXCMSETR_LPPDACC		(1 << 0)
+#define TXCMCR				0x120
+#define TXCMCR_BTATYP			(1 << 2)
+#define TXCMCR_BTAREQ			(1 << 1)
+#define TXCMCR_TXREQ			(1 << 0)
+#define TXCMSR				0x130
+#define TXCMSR_CLSNERR			(1 << 18)
+#define TXCMSR_AXIERR			(1 << 16)
+#define TXCMSR_TXREQEND			(1 << 0)
+#define TXCMSCR				0x134
+#define TXCMSCR_CLSNERR			(1 << 18)
+#define TXCMSCR_AXIERR			(1 << 16)
+#define TXCMSCR_TXREQEND		(1 << 0)
+#define TXCMIER				0x138
+#define TXCMIER_CLSNERR			(1 << 18)
+#define TXCMIER_AXIERR			(1 << 16)
+#define TXCMIER_TXREQEND		(1 << 0)
+#define TXCMADDRSET0R			0x140
+#define TXCMPHDR			0x150
+#define TXCMPHDR_FMT			(1 << 24)	/* 0:SP 1:LP */
+#define TXCMPHDR_VC(n)			(((n) & 0x3) << 22)
+#define TXCMPHDR_DT(n)			(((n) & 0x3f) << 16)
+#define TXCMPHDR_DATA1(n)		(((n) & 0xff) << 8)
+#define TXCMPHDR_DATA0(n)		(((n) & 0xff) << 0)
+#define TXCMPPD0R			0x160
+#define TXCMPPD1R			0x164
+#define TXCMPPD2R			0x168
+#define TXCMPPD3R			0x16c
+
+#define RXSETR				0x200
+#define RXSETR_CRCEN			(((n) & 0xf) << 24)
+#define RXSETR_ECCEN			(((n) & 0xf) << 16)
+#define RXPSETR				0x210
+#define RXPSETR_LPPDACC			(1 << 0)
+#define RXPSR				0x220
+#define RXPSR_ECCERR1B			(1 << 28)
+#define RXPSR_UEXTRGERR			(1 << 25)
+#define RXPSR_RESPTOERR			(1 << 24)
+#define RXPSR_OVRERR			(1 << 23)
+#define RXPSR_AXIERR			(1 << 22)
+#define RXPSR_CRCERR			(1 << 21)
+#define RXPSR_WCERR			(1 << 20)
+#define RXPSR_UEXDTERR			(1 << 19)
+#define RXPSR_UEXPKTERR			(1 << 18)
+#define RXPSR_ECCERR			(1 << 17)
+#define RXPSR_MLFERR			(1 << 16)
+#define RXPSR_RCVACK			(1 << 14)
+#define RXPSR_RCVEOT			(1 << 10)
+#define RXPSR_RCVAKE			(1 << 9)
+#define RXPSR_RCVRESP			(1 << 8)
+#define RXPSR_BTAREQEND			(1 << 0)
+#define RXPSCR				0x224
+#define RXPSCR_ECCERR1B			(1 << 28)
+#define RXPSCR_UEXTRGERR		(1 << 25)
+#define RXPSCR_RESPTOERR		(1 << 24)
+#define RXPSCR_OVRERR			(1 << 23)
+#define RXPSCR_AXIERR			(1 << 22)
+#define RXPSCR_CRCERR			(1 << 21)
+#define RXPSCR_WCERR			(1 << 20)
+#define RXPSCR_UEXDTERR			(1 << 19)
+#define RXPSCR_UEXPKTERR		(1 << 18)
+#define RXPSCR_ECCERR			(1 << 17)
+#define RXPSCR_MLFERR			(1 << 16)
+#define RXPSCR_RCVACK			(1 << 14)
+#define RXPSCR_RCVEOT			(1 << 10)
+#define RXPSCR_RCVAKE			(1 << 9)
+#define RXPSCR_RCVRESP			(1 << 8)
+#define RXPSCR_BTAREQEND		(1 << 0)
+#define RXPIER				0x228
+#define RXPIER_ECCERR1B			(1 << 28)
+#define RXPIER_UEXTRGERR		(1 << 25)
+#define RXPIER_RESPTOERR		(1 << 24)
+#define RXPIER_OVRERR			(1 << 23)
+#define RXPIER_AXIERR			(1 << 22)
+#define RXPIER_CRCERR			(1 << 21)
+#define RXPIER_WCERR			(1 << 20)
+#define RXPIER_UEXDTERR			(1 << 19)
+#define RXPIER_UEXPKTERR		(1 << 18)
+#define RXPIER_ECCERR			(1 << 17)
+#define RXPIER_MLFERR			(1 << 16)
+#define RXPIER_RCVACK			(1 << 14)
+#define RXPIER_RCVEOT			(1 << 10)
+#define RXPIER_RCVAKE			(1 << 9)
+#define RXPIER_RCVRESP			(1 << 8)
+#define RXPIER_BTAREQEND		(1 << 0)
+#define RXPADDRSET0R			0x230
+#define RXPSIZESETR			0x238
+#define RXPSIZESETR_SIZE(n)		(((n) & 0xf) << 3)
+#define RXPHDR				0x240
+#define RXPHDR_FMT			(1 << 24)	/* 0:SP 1:LP */
+#define RXPHDR_VC(n)			(((n) & 0x3) << 22)
+#define RXPHDR_DT(n)			(((n) & 0x3f) << 16)
+#define RXPHDR_DATA1(n)			(((n) & 0xff) << 8)
+#define RXPHDR_DATA0(n)			(((n) & 0xff) << 0)
+#define RXPPD0R				0x250
+#define RXPPD1R				0x254
+#define RXPPD2R				0x258
+#define RXPPD3R				0x25c
+#define AKEPR				0x300
+#define AKEPR_VC(n)			(((n) & 0x3) << 22)
+#define AKEPR_DT(n)			(((n) & 0x3f) << 16)
+#define AKEPR_ERRRPT(n)			(((n) & 0xffff) << 0)
+#define RXRESPTOSETR			0x400
+#define TACR				0x500
+#define TASR				0x510
+#define TASCR				0x514
+#define TAIER				0x518
+#define TOSR				0x610
+#define TOSR_TATO			(1 << 2)
+#define TOSR_LRXHTO			(1 << 1)
+#define TOSR_HRXTO			(1 << 0)
+#define TOSCR				0x614
+#define TOSCR_TATO			(1 << 2)
+#define TOSCR_LRXHTO			(1 << 1)
+#define TOSCR_HRXTO			(1 << 0)
+
 /*
  * Video Mode Register
  */
@@ -100,6 +221,10 @@
 #define PPICLSCR_HSTOLP			(1 << 27)
 #define PPICLSCR_TOHS			(1 << 26)
 
+#define PPIDL0SR			0x740
+#define PPIDL0SR_DIR			(1 << 10)
+#define PPIDL0SR_STPST			(1 << 6)
+
 #define PPIDLSR				0x760
 #define PPIDLSR_STPST			(0xf << 0)
 
-- 
2.50.1

