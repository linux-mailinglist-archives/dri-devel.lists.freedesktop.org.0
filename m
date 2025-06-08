Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFBEAD14CF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F5D10ED59;
	Sun,  8 Jun 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RFvrxONQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ciCY7Rjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C610E048
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 14:37:41 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bFcpp06vcz9shj;
 Sun,  8 Jun 2025 16:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749392882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2JmON/MCU2VdgvKI1gSmEPawUTxjBOO8BVtQAB/gBk=;
 b=RFvrxONQspHAFIB1fnb41gw3DxtV6T0noOz+avHGqsjz+plsvRpLx4ShWe04FJZ7e2wWuP
 sPcXU3wq3vvn0CmDvICYR9QLXenhkrBqQc/XcZVBLBK7om4TrG8eC+JnloVfAb1K1x9FiS
 Kaawi8dZsOzfaHFM3wCpLTQj8cRXM13SCeOPAdwJI7gsih7peydionWs8p/bote4KNKK6O
 UwPBjL8Q38OmNYuSIBMGjCOrglJnkRrnNzbiR/YHQuhbbHxbVr/oLO77b345EJmZ0TFF5t
 W25Rpopl3fxMWu1jhZn1fmq8RB5DK8NdJcWcbOFZjOhl6XYyE0O/xJki8nfx1g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749392880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2JmON/MCU2VdgvKI1gSmEPawUTxjBOO8BVtQAB/gBk=;
 b=ciCY7RjhfZzWrTCkLLdxxkpkU+pi3Xs9SArGjJyF5UaxoBVvnJzqinzqCZ95FjtYFlnncj
 cj/PL/ZiV5NHEWx3J9QwgGgIf2SepHYAdiN7x2OEAQaPVelZxLzg87kqSqhQhYb4rZqrXq
 2N9ukMfE3wu0ySkEy7IMRpQHG8u9MdlaAEiDcJqogbhVIfh40PUbKi/wGu+BYhvVtf0OQ9
 bd063WYE79bHwfMzuRvH5UQIthRbhjKJgd47MxZeTtZzSpAWVlF7CMfiIlH6qJnnitmwjX
 gBDRbioaLI/K54DrEmDQ1yTV7+4fheqTfzr9IrNFeKbwHZ2mbpGNNtjUBlp/Cw==
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
Subject: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
Date: Sun,  8 Jun 2025 16:24:50 +0200
Message-ID: <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9zyptzccm9wx43wmat6kx8a3mb7gff8n
X-MBO-RS-ID: 7d50c29a98f040225d0
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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

Implement support for DSI command transfer mode. Transmission of both Short
Packet and Long Packet is implemented, so is command transmission to request
response from peripheral device and transmission of non-read command with BTA.

The AXI memory access mode is currently not implemented, each transfer is
performed purely using controller register interface. Short Packet transfer
can transfer up to 2 Bytes of data, Long Packet transfer can transfer up to
16 Bytes of data.

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
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 215 ++++++++++++++++++
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 125 ++++++++++
 2 files changed, 340 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index c31e0d8f3ff9..bc1151c3ce90 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -938,9 +938,224 @@ static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
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
+	/* Start the transfer, RX with BTA, TX without BTA */
+	if (is_rx_xfer) {
+		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_BTAREQ);
+
+		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+					(status & RXPSR_BTAREQEND),
+					2000, 10000, false, dsi, RXPSR);
+	} else {
+		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_TXREQ);
+
+		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+					(status & TXCMSR_TXREQEND),
+					2000, 10000, false, dsi, TXCMSR);
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
+		/* Transfer with zero-length RX */
+		if (!(reg & RXPSR_RCVACK)) {
+			/* No ACK on RX response received */
+			return -EINVAL;
+		}
+	} else {
+		/* Transfer with non-zero-length RX */
+		if (!(reg & RXPSR_RCVRESP)) {
+			/* No packet header of RX response received */
+			return -EINVAL;
+		}
+
+		if (reg & (RXPSR_CRCERR | RXPSR_WCERR | RXPSR_AXIERR | RXPSR_OVRERR)) {
+			/* Incorrect response payload */
+			return -ENODATA;
+		}
+
+		data = rcar_mipi_dsi_read(dsi, RXPHDR);
+		if (data & RXPHDR_FMT) {	/* Long Packet Response */
+			/* Read Long Packet Response length from packet header. */
+			wc = data & 0xffff;
+			if (wc > msg->rx_len) {
+				dev_warn(dsi->dev,
+					 "Long Packet Response longer than RX buffer (%d), limited to %ld Bytes\n",
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
+		} else {	/* Short Packet Response */
+			if (msg->rx_len >= 1)
+				rx_buf[0] = data & 0xff;
+			if (msg->rx_len >= 2)
+				rx_buf[1] = (data >> 8) & 0xff;
+			if (msg->rx_len >= 3) {
+				dev_warn(dsi->dev,
+					 "Expected Short Packet Response too long (%ld), limited to 2 Bytes\n",
+					 msg->rx_len);
+			}
+		}
+	}
+
+	if (reg & RXPSR_RCVAKE) {
+		/* Acknowledge and Error report received */
+		return -EFAULT;
+	}
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & PPIDL0SR_DIR),
+				2000, 10000, false, dsi, PPIDL0SR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Command RX DIR timeout (0x%08x)\n", status);
+		return ret;
+	}
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				status & PPIDL0SR_STPST,
+				2000, 10000, false, dsi, PPIDL0SR);
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
+	/* Wait a bit between commands */
+	usleep_range(1000, 2000);
+
+	/* Clear the completion interrupt */
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
index b018037e116d..8c5c4fc8a55c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -16,6 +16,127 @@
 #define TXSETR_EOTPEN			BIT(12)
 #define TXSETR_LANECNT_MASK		(0x3 << 0)
 
+/*
+ * DSI Command Transfer Registers
+ */
+#define TXCMSETR			0x110
+#define TXCMSETR_SPDTYP			BIT(8)	/* 0:HS 1:LP */
+#define TXCMSETR_LPPDACC		BIT(0)
+#define TXCMCR				0x120
+#define TXCMCR_BTATYP			BIT(2)
+#define TXCMCR_BTAREQ			BIT(1)
+#define TXCMCR_TXREQ			BIT(0)
+#define TXCMSR				0x130
+#define TXCMSR_CLSNERR			BIT(18)
+#define TXCMSR_AXIERR			BIT(16)
+#define TXCMSR_TXREQEND			BIT(0)
+#define TXCMSCR				0x134
+#define TXCMSCR_CLSNERR			BIT(18)
+#define TXCMSCR_AXIERR			BIT(16)
+#define TXCMSCR_TXREQEND		BIT(0)
+#define TXCMIER				0x138
+#define TXCMIER_CLSNERR			BIT(18)
+#define TXCMIER_AXIERR			BIT(16)
+#define TXCMIER_TXREQEND		BIT(0)
+#define TXCMADDRSET0R			0x140
+#define TXCMPHDR			0x150
+#define TXCMPHDR_FMT			BIT(24)	/* 0:SP 1:LP */
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
+#define RXPSETR_LPPDACC			BIT(0)
+#define RXPSR				0x220
+#define RXPSR_ECCERR1B			BIT(28)
+#define RXPSR_UEXTRGERR			BIT(25)
+#define RXPSR_RESPTOERR			BIT(24)
+#define RXPSR_OVRERR			BIT(23)
+#define RXPSR_AXIERR			BIT(22)
+#define RXPSR_CRCERR			BIT(21)
+#define RXPSR_WCERR			BIT(20)
+#define RXPSR_UEXDTERR			BIT(19)
+#define RXPSR_UEXPKTERR			BIT(18)
+#define RXPSR_ECCERR			BIT(17)
+#define RXPSR_MLFERR			BIT(16)
+#define RXPSR_RCVACK			BIT(14)
+#define RXPSR_RCVEOT			BIT(10)
+#define RXPSR_RCVAKE			BIT(9)
+#define RXPSR_RCVRESP			BIT(8)
+#define RXPSR_BTAREQEND			BIT(0)
+#define RXPSCR				0x224
+#define RXPSCR_ECCERR1B			BIT(28)
+#define RXPSCR_UEXTRGERR		BIT(25)
+#define RXPSCR_RESPTOERR		BIT(24)
+#define RXPSCR_OVRERR			BIT(23)
+#define RXPSCR_AXIERR			BIT(22)
+#define RXPSCR_CRCERR			BIT(21)
+#define RXPSCR_WCERR			BIT(20)
+#define RXPSCR_UEXDTERR			BIT(19)
+#define RXPSCR_UEXPKTERR		BIT(18)
+#define RXPSCR_ECCERR			BIT(17)
+#define RXPSCR_MLFERR			BIT(16)
+#define RXPSCR_RCVACK			BIT(14)
+#define RXPSCR_RCVEOT			BIT(10)
+#define RXPSCR_RCVAKE			BIT(9)
+#define RXPSCR_RCVRESP			BIT(8)
+#define RXPSCR_BTAREQEND		BIT(0)
+#define RXPIER				0x228
+#define RXPIER_ECCERR1B			BIT(28)
+#define RXPIER_UEXTRGERR		BIT(25)
+#define RXPIER_RESPTOERR		BIT(24)
+#define RXPIER_OVRERR			BIT(23)
+#define RXPIER_AXIERR			BIT(22)
+#define RXPIER_CRCERR			BIT(21)
+#define RXPIER_WCERR			BIT(20)
+#define RXPIER_UEXDTERR			BIT(19)
+#define RXPIER_UEXPKTERR		BIT(18)
+#define RXPIER_ECCERR			BIT(17)
+#define RXPIER_MLFERR			BIT(16)
+#define RXPIER_RCVACK			BIT(14)
+#define RXPIER_RCVEOT			BIT(10)
+#define RXPIER_RCVAKE			BIT(9)
+#define RXPIER_RCVRESP			BIT(8)
+#define RXPIER_BTAREQEND		BIT(0)
+#define RXPADDRSET0R			0x230
+#define RXPSIZESETR			0x238
+#define RXPSIZESETR_SIZE(n)		(((n) & 0xf) << 3)
+#define RXPHDR				0x240
+#define RXPHDR_FMT			BIT(24)	/* 0:SP 1:LP */
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
+#define TOSR_TATO			BIT(2)
+#define TOSR_LRXHTO			BIT(1)
+#define TOSR_HRXTO			BIT(0)
+#define TOSCR				0x614
+#define TOSCR_TATO			BIT(2)
+#define TOSCR_LRXHTO			BIT(1)
+#define TOSCR_HRXTO			BIT(0)
+
 /*
  * Video Mode Register
  */
@@ -101,6 +222,10 @@
 #define PPICLSCR_HSTOLP			BIT(27)
 #define PPICLSCR_TOHS			BIT(26)
 
+#define PPIDL0SR			0x740
+#define PPIDL0SR_DIR			BIT(10)
+#define PPIDL0SR_STPST			BIT(6)
+
 #define PPIDLSR				0x760
 #define PPIDLSR_STPST			(0xf << 0)
 
-- 
2.47.2

