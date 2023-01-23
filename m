Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0A767766A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C699710E31C;
	Mon, 23 Jan 2023 08:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Mon, 23 Jan 2023 07:55:28 UTC
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4772510E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:55:28 +0000 (UTC)
Delivered-To: me@linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1674459531; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kJSVjiBGey7PVwV/4nMWTP/G6+g8MDZ43/FkajO9YVi/6uyjpyERoFYuBEubvm80AP2fJOLtxzUKnSWEhZBi2gLPHJbfn805a6Q2Wo235g+t0RZtxj2wDs7O/ThdjESeJIwv13AAQ9HMv88ihn41oxUp9kkV7sWZLgVbY9rGtG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1674459531;
 h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=/HbOmTsfsAE0PeDwPuTNqk+ILlFiNTENNlIrOT/p52Q=; 
 b=ltb+kFVPBVXR/0n6nyv0OBFzvG/TxUER8bvy66Tk2ngNQJSBu1GmRRi1H6V4a+3Tc3RVI1e3Rv7ISq002U5ZThrGq1PaOGTBdvzS6NkWs5kxKtqd8o6uyTTSYpabEMiQEa66sXMPeIlP6rpZKlxhzLO9jVZ5ODm0qbwxmYh6fW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<lchen@ambarella.com>
Received: from shbuild9.ambarella.net (116.246.37.178 [116.246.37.178]) by
 mx.zohomail.com with SMTPS id 1674459528808218.12408287063113;
 Sun, 22 Jan 2023 23:38:48 -0800 (PST)
From: Li Chen <lchen@ambarella.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Li Chen <me@linux.beauty>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 10/15] serial: ambarella: add support for Ambarella uart_port
Date: Mon, 23 Jan 2023 15:32:25 +0800
Message-Id: <20230123073305.149940-11-lchen@ambarella.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123073305.149940-1-lchen@ambarella.com>
References: <20230123073305.149940-1-lchen@ambarella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Mon, 23 Jan 2023 08:39:49 +0000
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Li Chen <lchen@ambarella.com>, "moderated list:ARM/Ambarella SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver add support for Ambarella's uart, which
can be used for console and etc.

Signed-off-by: Li Chen <lchen@ambarella.com>
Change-Id: Ie68af7ad2187e21853e58d52cd97fd7145303730
---
 MAINTAINERS                         |    1 +
 drivers/tty/serial/Kconfig          |   16 +
 drivers/tty/serial/Makefile         |    1 +
 drivers/tty/serial/ambarella_uart.c | 1581 +++++++++++++++++++++++++++
 drivers/tty/serial/ambarella_uart.h |  120 ++
 5 files changed, 1719 insertions(+)
 create mode 100644 drivers/tty/serial/ambarella_uart.c
 create mode 100644 drivers/tty/serial/ambarella_uart.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 080412535e26..ee1d201dd89a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,6 +1909,7 @@ F:	drivers/clk/ambarella/clk-pll-common.h
 F:	drivers/clk/ambarella/clk-pll-normal.c
 F:	drivers/soc/ambarella/Makefile
 F:	drivers/soc/ambarella/soc.c
+F:	drivers/tty/serial/ambarella_uart.c
 F:	include/soc/ambarella/misc.h
 
 ARM/Amlogic Meson SoC CLOCK FRAMEWORK
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index c55b947f3cdb..27216ecc3161 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -18,6 +18,22 @@ source "drivers/tty/serial/8250/Kconfig"
 
 comment "Non-8250 serial port support"
 
+config SERIAL_AMBARELLA
+	tristate "Ambarella Media Soc serial port support"
+	depends on ARCH_AMBARELLA
+	select SERIAL_CORE
+	help
+	  If you have a machine based on an Ambarella Media SoC you
+	  can enable its onboard serial ports by enabling this option.
+
+config SERIAL_AMBARELLA_CONSOLE
+	bool "Console on Ambarella Media SoC serial port"
+	depends on SERIAL_AMBARELLA=y
+	select SERIAL_CORE_CONSOLE
+	help
+	  If you have enabled the serial port on the Ambarella Media SoC
+	  you can make it the console by answering Y to this option.
+
 config SERIAL_AMBA_PL010
 	tristate "ARM AMBA PL010 serial port support"
 	depends on ARM_AMBA || COMPILE_TEST
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index 238a9557b487..00e454e06976 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the kernel serial device drivers.
 #
 
+obj-$(CONFIG_SERIAL_AMBARELLA) += ambarella_uart.o
 obj-$(CONFIG_SERIAL_CORE) += serial_core.o
 
 obj-$(CONFIG_SERIAL_EARLYCON) += earlycon.o
diff --git a/drivers/tty/serial/ambarella_uart.c b/drivers/tty/serial/ambarella_uart.c
new file mode 100644
index 000000000000..54de84fbb623
--- /dev/null
+++ b/drivers/tty/serial/ambarella_uart.c
@@ -0,0 +1,1581 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Author: Anthony Ginger <hfjiang@ambarella.com>
+ *
+ * Copyright (C) 2023, Ambarella, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#if defined(CONFIG_SERIAL_AMBARELLA_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
+#define SUPPORT_SYSRQ
+#endif
+
+#include <asm-generic/types.h>
+#include "ambarella_uart.h"
+#include <asm-generic/errno-base.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/clk.h>
+#include <linux/syscore_ops.h>
+#include <linux/console.h>
+#include <linux/sysrq.h>
+#include <linux/slab.h>
+#include <linux/serial_reg.h>
+#include <linux/tty.h>
+#include <linux/tty_flip.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
+
+#define	AMBA_UART_MAX_NUM			8
+
+#define AMBA_UART_RX_DMA_BUFFER_SIZE PAGE_SIZE
+#define AMBA_UART_MIN_DMA			16
+#define AMBA_UART_LSR_ANY \
+	(UART_LSR_OE | UART_LSR_BI | UART_LSR_PE | UART_LSR_FE)
+
+#define AMBA_UART_RESET_FLAG			0 /* bit 0 */
+
+struct ambarella_uart_port {
+	struct uart_port port;
+	struct clk *uart_pll;
+	struct clk *parent_pll;
+	unsigned long flags;
+	u32 msr_used : 1;
+	u32 tx_fifo_fix : 1;
+	u32 less_reg : 1;
+	u32 txdma_used:1;
+	u32 rxdma_used:1;
+	u32 mcr;
+	u32 c_cflag;
+	/* following are for dma transfer */
+	struct dma_chan *rx_dma_chan;
+	struct dma_chan *tx_dma_chan;
+	unsigned char *rx_dma_buf_virt;
+	unsigned char *tx_dma_buf_virt;
+	dma_addr_t rx_dma_buf_phys;
+	dma_addr_t tx_dma_buf_phys;
+	struct dma_async_tx_descriptor *tx_dma_desc;
+	struct dma_async_tx_descriptor *rx_dma_desc;
+	dma_cookie_t tx_cookie;
+	dma_cookie_t rx_cookie;
+	int tx_bytes_requested;
+	int rx_bytes_requested;
+	bool tx_in_progress;
+	bool rx_in_progress;
+	bool ignore_fe;
+#ifdef CONFIG_PM
+	u32 clk_rate;
+#endif
+};
+
+static struct ambarella_uart_port ambarella_port[AMBA_UART_MAX_NUM];
+
+static void __serial_ambarella_stop_tx(struct uart_port *port, u32 tx_fifo_fix)
+{
+	struct ambarella_uart_port *amb_port;
+	struct circ_buf *xmit = &port->state->xmit;
+	struct dma_tx_state state;
+	u32 ier, iir;
+	int count;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (tx_fifo_fix) {
+		ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+		if ((ier & UART_IE_PTIME) != UART_IE_PTIME)
+			writel_relaxed(ier | UART_IE_PTIME | UART_IE_ETBEI,
+					port->membase + UART_IE_OFFSET);
+
+		iir = readl_relaxed(port->membase + UART_II_OFFSET);
+		writel_relaxed(ier & ~(UART_IE_PTIME | UART_IE_ETBEI),
+				port->membase + UART_IE_OFFSET);
+		(void)(iir);
+	} else {
+		ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+		writel_relaxed(ier & ~UART_IE_ETBEI, port->membase + UART_IE_OFFSET);
+	}
+
+	if (amb_port->txdma_used && amb_port->tx_in_progress) {
+		dmaengine_tx_status(amb_port->tx_dma_chan, amb_port->tx_cookie, &state);
+		dmaengine_terminate_all(amb_port->tx_dma_chan);
+		count = amb_port->tx_bytes_requested - state.residue;
+		xmit->tail = (xmit->tail + count) & (UART_XMIT_SIZE - 1);
+		port->icount.tx += count;
+		amb_port->tx_in_progress = false;
+	}
+}
+
+static u32 __serial_ambarella_read_ms(struct uart_port *port, u32 tx_fifo_fix)
+{
+	u32 ier, ms;
+
+	if (tx_fifo_fix) {
+		ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+		if ((ier & UART_IE_EDSSI) != UART_IE_EDSSI)
+			writel_relaxed(ier | UART_IE_EDSSI,
+					port->membase + UART_IE_OFFSET);
+
+		ms = readl_relaxed(port->membase + UART_MS_OFFSET);
+		if ((ier & UART_IE_EDSSI) != UART_IE_EDSSI)
+			writel_relaxed(ier, port->membase + UART_IE_OFFSET);
+	} else {
+		ms = readl_relaxed(port->membase + UART_MS_OFFSET);
+	}
+
+	return ms;
+}
+
+static void __serial_ambarella_enable_ms(struct uart_port *port)
+{
+	u32 ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+
+	writel_relaxed(ier | UART_IE_EDSSI, port->membase + UART_IE_OFFSET);
+}
+
+static void __serial_ambarella_disable_ms(struct uart_port *port)
+{
+	u32 ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+
+	writel_relaxed(ier & ~UART_IE_EDSSI, port->membase + UART_IE_OFFSET);
+}
+
+static inline void wait_for_tx(struct uart_port *port)
+{
+	u32 ls;
+
+	ls = readl_relaxed(port->membase + UART_LS_OFFSET);
+	while ((ls & UART_LS_TEMT) != UART_LS_TEMT) {
+		cpu_relax();
+		ls = readl_relaxed(port->membase + UART_LS_OFFSET);
+	}
+}
+
+static inline void wait_for_rx(struct uart_port *port)
+{
+	u32 ls;
+
+	ls = readl_relaxed(port->membase + UART_LS_OFFSET);
+	while ((ls & UART_LS_DR) != UART_LS_DR) {
+		cpu_relax();
+		ls = readl_relaxed(port->membase + UART_LS_OFFSET);
+	}
+}
+
+static inline int tx_fifo_is_full(struct uart_port *port)
+{
+	return !(readl_relaxed(port->membase + UART_US_OFFSET) & UART_US_TFNF);
+}
+
+/* ==========================================================================*/
+static void serial_ambarella_hw_setup(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (!test_and_set_bit(AMBA_UART_RESET_FLAG, &amb_port->flags)) {
+		port->uartclk = clk_get_rate(amb_port->uart_pll);
+		/* reset the whole UART only once */
+		writel_relaxed(0x01, port->membase + UART_SRR_OFFSET);
+		mdelay(1);
+		writel_relaxed(0x00, port->membase + UART_SRR_OFFSET);
+	}
+
+	writel_relaxed(DEFAULT_AMBARELLA_UART_IER | UART_IE_PTIME,
+			port->membase + UART_IE_OFFSET);
+	writel_relaxed(UART_FC_FIFOE | UART_FC_RX_2_TO_FULL | UART_FC_TX_EMPTY |
+			UART_FC_XMITR | UART_FC_RCVRR, port->membase + UART_FC_OFFSET);
+	writel_relaxed(DEFAULT_AMBARELLA_UART_IER, port->membase + UART_IE_OFFSET);
+
+	if (amb_port->txdma_used || amb_port->rxdma_used) {
+		/*
+		 * we must use 14bytes as trigger, because if we use 8bytes, FIFO may
+		 * be empty due to dma burst size is also set to 8bytes before dma complete,
+		 * in this case, if FIFO is empty, but no more data is received, timeout irq
+		 * can't be trigged after, we don't have chance to push the data that dma has
+		 * transferred any more.
+		 */
+		writel_relaxed(UART_FC_FIFOE | UART_FC_RX_2_TO_FULL |
+			UART_FC_TX_EMPTY | UART_FC_XMITR | UART_FC_RCVRR |
+			UART_FCR_DMA_SELECT, port->membase + UART_FC_OFFSET);
+		writel_relaxed((amb_port->txdma_used << 1) | amb_port->rxdma_used,
+			port->membase + UART_DMAE_OFFSET);
+
+		writel_relaxed(UART_IE_ETOI, port->membase + UART_IE_OFFSET);
+	}
+}
+
+static inline void serial_ambarella_receive_chars(struct uart_port *port,
+	u32 tmo)
+{
+	struct ambarella_uart_port *amb_port;
+	u32 ch, flag, ls;
+	int max_count;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	ls = readl_relaxed(port->membase + UART_LS_OFFSET);
+	max_count = port->fifosize;
+
+	do {
+		flag = TTY_NORMAL;
+		if (unlikely(ls & (UART_LS_BI | UART_LS_PE |
+					UART_LS_FE | UART_LS_OE))) {
+			if (ls & UART_LS_BI) {
+				ls &= ~(UART_LS_FE | UART_LS_PE);
+				port->icount.brk++;
+
+				if (uart_handle_break(port))
+					goto ignore_char;
+			}
+			if ((ls & UART_LS_FE) && !amb_port->ignore_fe)
+				port->icount.frame++;
+			if (ls & UART_LS_PE)
+				port->icount.parity++;
+			if (ls & UART_LS_OE)
+				port->icount.overrun++;
+
+			ls &= port->read_status_mask;
+
+			if (ls & UART_LS_BI)
+				flag = TTY_BREAK;
+			else if (ls & UART_LS_FE && !amb_port->ignore_fe)
+				flag = TTY_FRAME;
+			else if (ls & UART_LS_PE)
+				flag = TTY_PARITY;
+			else if (ls & UART_LS_OE)
+				flag = TTY_OVERRUN;
+
+			if (ls & UART_LS_OE)
+				pr_debug("%s: OVERFLOW\n", __func__);
+		}
+
+		if (likely(ls & UART_LS_DR)) {
+			ch = readl_relaxed(port->membase + UART_RB_OFFSET);
+			port->icount.rx++;
+			tmo = 0;
+
+			if (uart_handle_sysrq_char(port, ch))
+				goto ignore_char;
+
+			uart_insert_char(port, ls, UART_LS_OE, ch, flag);
+		} else {
+			if (tmo) {
+				ch = readl_relaxed(port->membase + UART_RB_OFFSET);
+				/* printk(KERN_DEBUG "False TMO get %d\n", ch); */
+			}
+		}
+
+ignore_char:
+		ls = readl_relaxed(port->membase + UART_LS_OFFSET);
+	} while ((ls & (UART_LS_DR | UART_LSR_BI)) && (max_count-- > 0));
+
+	tty_flip_buffer_push(&port->state->port);
+}
+
+static void serial_ambarella_transmit_chars(struct uart_port *port)
+{
+	struct circ_buf *xmit = &port->state->xmit;
+	struct ambarella_uart_port *amb_port;
+	int count;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (port->x_char) {
+		writel_relaxed(port->x_char, port->membase + UART_TH_OFFSET);
+		port->icount.tx++;
+		port->x_char = 0;
+		return;
+	}
+
+	if (uart_tx_stopped(port) || uart_circ_empty(xmit)) {
+		__serial_ambarella_stop_tx(port, amb_port->tx_fifo_fix);
+		return;
+	}
+
+	count = port->fifosize;
+	while (count-- > 0) {
+		if (!amb_port->less_reg && tx_fifo_is_full(port))
+			break;
+		writel_relaxed(xmit->buf[xmit->tail], port->membase + UART_TH_OFFSET);
+		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
+		port->icount.tx++;
+		if (uart_circ_empty(xmit))
+			break;
+	}
+
+	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
+	if (uart_circ_empty(xmit))
+		__serial_ambarella_stop_tx(port, amb_port->tx_fifo_fix);
+}
+
+static inline void serial_ambarella_check_modem_status(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+	u32 ms;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (amb_port->msr_used) {
+		ms = __serial_ambarella_read_ms(port, amb_port->tx_fifo_fix);
+
+		if (ms & UART_MS_RI)
+			port->icount.rng++;
+		if (ms & UART_MS_DSR)
+			port->icount.dsr++;
+		if (ms & UART_MS_DCTS)
+			uart_handle_cts_change(port, (ms & UART_MS_CTS));
+		if (ms & UART_MS_DDCD)
+			uart_handle_dcd_change(port, (ms & UART_MS_DCD));
+
+		wake_up_interruptible(&port->state->port.delta_msr_wait);
+	}
+}
+
+static char serial_ambarella_decode_rx_error(struct ambarella_uart_port *amb_port,
+			unsigned long lsr)
+{
+	char flag = TTY_NORMAL;
+
+	if (unlikely(lsr & AMBA_UART_LSR_ANY)) {
+		if (lsr & UART_LSR_OE) {
+			/* Overrun error */
+			flag |= TTY_OVERRUN;
+			amb_port->port.icount.overrun++;
+		}
+		if (lsr & UART_LSR_PE) {
+			/* Parity error */
+			flag |= TTY_PARITY;
+			amb_port->port.icount.parity++;
+		}
+		if ((lsr & UART_LSR_FE) && !amb_port->ignore_fe) {
+			flag |= TTY_FRAME;
+			amb_port->port.icount.frame++;
+		}
+		if (lsr & UART_LSR_BI) {
+			amb_port->port.icount.brk++;
+			/* If FIFO read error without any data, reset Rx FIFO */
+			if (!(lsr & UART_LSR_DR) && (lsr & UART_LSR_FIFOE))
+				writel_relaxed(UART_FCR_CLEAR_RCVR,
+					amb_port->port.membase + UART_SRR_OFFSET);
+		}
+	}
+	return flag;
+}
+
+static void serial_ambarella_handle_rx_pio(struct ambarella_uart_port *amb_port,
+		struct tty_port *tty)
+{
+	int cnt;
+
+	for (cnt = 0; cnt < amb_port->port.fifosize; cnt++) {
+		char flag = TTY_NORMAL;
+		unsigned long lsr = 0;
+		unsigned char ch;
+
+		lsr = readl_relaxed(amb_port->port.membase + UART_LS_OFFSET);
+		if (!(lsr & UART_LS_DR))
+			break;
+
+		flag = serial_ambarella_decode_rx_error(amb_port, lsr);
+		ch = (unsigned char) readl_relaxed(amb_port->port.membase + UART_RB_OFFSET);
+		amb_port->port.icount.rx++;
+
+		if (!uart_handle_sysrq_char(&amb_port->port, ch) && tty)
+			tty_insert_flip_char(tty, ch, flag);
+	}
+
+	/* do a dummy read to clear interrupt */
+	if (!cnt)
+		readl_relaxed(amb_port->port.membase + UART_RB_OFFSET);
+}
+
+static void serial_ambarella_copy_rx_to_tty(struct ambarella_uart_port *amb_port,
+		struct tty_port *tty, int count);
+static int serial_ambarella_start_rx_dma(struct ambarella_uart_port *amb_port);
+
+static void serial_ambarella_dma_rx_irq(struct ambarella_uart_port *amb_port)
+{
+	struct tty_port *port = &amb_port->port.state->port;
+	struct dma_tx_state state;
+	size_t pending;
+	u32 value;
+
+	dmaengine_pause(amb_port->rx_dma_chan);
+	value = readl_relaxed(amb_port->port.membase + UART_DMAE_OFFSET);
+	writel_relaxed(value & ~0x1, amb_port->port.membase + UART_DMAE_OFFSET);
+
+	dmaengine_tx_status(amb_port->rx_dma_chan, amb_port->rx_cookie, &state);
+	dmaengine_terminate_async(amb_port->rx_dma_chan);
+
+	pending = amb_port->rx_bytes_requested - state.residue;
+	BUG_ON(pending > AMBA_UART_RX_DMA_BUFFER_SIZE);
+
+	serial_ambarella_copy_rx_to_tty(amb_port, port, pending);
+	serial_ambarella_handle_rx_pio(amb_port, port);
+
+	tty_flip_buffer_push(port);
+
+	writel_relaxed(value, amb_port->port.membase + UART_DMAE_OFFSET);
+	dmaengine_resume(amb_port->rx_dma_chan);
+
+	serial_ambarella_start_rx_dma(amb_port);
+}
+
+static irqreturn_t serial_ambarella_irq(int irq, void *dev_id)
+{
+	struct uart_port *port = dev_id;
+	struct ambarella_uart_port *amb_port;
+	int rval = IRQ_HANDLED;
+	unsigned long flags;
+	u32 ii;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	ii = readl_relaxed(port->membase + UART_II_OFFSET);
+	switch (ii & 0x0F) {
+	case UART_II_MODEM_STATUS_CHANGED:
+		serial_ambarella_check_modem_status(port);
+		break;
+
+	case UART_II_THR_EMPTY:
+		serial_ambarella_transmit_chars(port);
+		break;
+
+	case UART_II_RCV_STATUS:
+	case UART_II_RCV_DATA_AVAIL:
+		serial_ambarella_receive_chars(port, 0);
+		break;
+	case UART_II_CHAR_TIMEOUT:
+		if (amb_port->rxdma_used && amb_port->rx_dma_chan)
+			serial_ambarella_dma_rx_irq(amb_port);
+		else
+			serial_ambarella_receive_chars(port, 1);
+		break;
+
+	case UART_II_NO_INT_PENDING:
+		break;
+	default:
+		pr_debug("%s: 0x%x\n", __func__, ii);
+		break;
+	}
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return rval;
+}
+
+/* ==========================================================================*/
+static void serial_ambarella_enable_ms(struct uart_port *port)
+{
+	__serial_ambarella_enable_ms(port);
+}
+
+static void serial_ambarella_start_next_tx(struct ambarella_uart_port *amb_port);
+
+static void serial_ambarella_tx_dma_complete(void *args)
+{
+	struct ambarella_uart_port *amb_port = args;
+	struct circ_buf *xmit = &amb_port->port.state->xmit;
+	struct dma_tx_state state;
+	unsigned long flags;
+	int count;
+
+	dmaengine_tx_status(amb_port->tx_dma_chan, amb_port->tx_cookie, &state);
+	count = amb_port->tx_bytes_requested - state.residue;
+	spin_lock_irqsave(&amb_port->port.lock, flags);
+	xmit->tail = (xmit->tail + count) & (UART_XMIT_SIZE - 1);
+	amb_port->tx_in_progress = false;
+	amb_port->port.icount.tx += count;
+	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
+		uart_write_wakeup(&amb_port->port);
+	serial_ambarella_start_next_tx(amb_port);
+	spin_unlock_irqrestore(&amb_port->port.lock, flags);
+}
+
+static int serial_ambarella_start_tx_dma(struct ambarella_uart_port *amb_port,
+		unsigned long count)
+{
+	struct circ_buf *xmit = &amb_port->port.state->xmit;
+	dma_addr_t tx_phys_addr;
+	int tx_bytes;
+
+	dma_sync_single_for_device(amb_port->port.dev, amb_port->tx_dma_buf_phys,
+				UART_XMIT_SIZE, DMA_TO_DEVICE);
+
+	tx_bytes = count & ~(0xF);
+	tx_phys_addr = amb_port->tx_dma_buf_phys + xmit->tail;
+	amb_port->tx_dma_desc = dmaengine_prep_slave_single(amb_port->tx_dma_chan,
+				tx_phys_addr, tx_bytes, DMA_MEM_TO_DEV,
+				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!amb_port->tx_dma_desc) {
+		dev_err(amb_port->port.dev, "Not able to get desc for Tx\n");
+		return -EIO;
+	}
+
+	amb_port->tx_dma_desc->callback = serial_ambarella_tx_dma_complete;
+	amb_port->tx_dma_desc->callback_param = amb_port;
+	amb_port->tx_bytes_requested = tx_bytes;
+	amb_port->tx_in_progress = true;
+	amb_port->tx_cookie = dmaengine_submit(amb_port->tx_dma_desc);
+	dma_async_issue_pending(amb_port->tx_dma_chan);
+
+	return 0;
+}
+
+static void serial_ambarella_start_next_tx(struct ambarella_uart_port *amb_port)
+{
+	struct circ_buf *xmit = &amb_port->port.state->xmit;
+	struct uart_port *port;
+	unsigned long tail, count;
+
+	port = &amb_port->port;
+
+	tail = (unsigned long)&xmit->buf[xmit->tail];
+	count = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);
+	if (!count)
+		return;
+
+	if (count < AMBA_UART_MIN_DMA) {
+		wait_for_tx(port);
+		serial_ambarella_transmit_chars(port);
+		serial_ambarella_start_next_tx(amb_port);
+	} else {
+		serial_ambarella_start_tx_dma(amb_port, count);
+	}
+}
+
+static void serial_ambarella_start_tx(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+	u32 ier;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (amb_port->txdma_used) {
+		if (uart_tx_stopped(port) || amb_port->tx_in_progress)
+			return;
+		serial_ambarella_start_next_tx(amb_port);
+	} else {
+		ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+		writel_relaxed(ier | UART_IE_ETBEI, port->membase + UART_IE_OFFSET);
+
+		/*
+		 * if FIFO status register is not provided, we have no idea about
+		 * the Tx FIFO is full or not, so we need to wait for the Tx Empty
+		 * Interrupt coming, then we can start to transfer data.
+		 */
+		if (amb_port->less_reg)
+			return;
+
+		serial_ambarella_transmit_chars(port);
+	}
+}
+
+static void serial_ambarella_copy_rx_to_tty(struct ambarella_uart_port *amb_port,
+		struct tty_port *tty, int count)
+{
+	int copied;
+
+	amb_port->port.icount.rx += count;
+	if (!tty) {
+		dev_err(amb_port->port.dev, "No tty port\n");
+		return;
+	}
+
+	dma_sync_single_for_cpu(amb_port->port.dev, amb_port->rx_dma_buf_phys,
+		AMBA_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
+	copied = tty_insert_flip_string(tty, amb_port->rx_dma_buf_virt, count);
+	if (copied != count)
+		pr_warn_ratelimited("%s:Unable to push data ret %d_bytes %d\n",
+			__func__, copied, count);
+}
+
+static void serial_ambarella_rx_dma_complete(void *args)
+{
+	struct ambarella_uart_port *amb_port = args;
+	struct uart_port *u = &amb_port->port;
+	struct tty_port *port = &u->state->port;
+	int count = amb_port->rx_bytes_requested;
+	unsigned long flags;
+
+	spin_lock_irqsave(&u->lock, flags);
+	serial_ambarella_copy_rx_to_tty(amb_port, port, count);
+	tty_flip_buffer_push(port);
+	serial_ambarella_start_rx_dma(amb_port);
+	spin_unlock_irqrestore(&u->lock, flags);
+}
+
+static int serial_ambarella_start_rx_dma(struct ambarella_uart_port *amb_port)
+{
+	unsigned int count = AMBA_UART_RX_DMA_BUFFER_SIZE;
+
+	amb_port->rx_dma_desc = dmaengine_prep_slave_single(amb_port->rx_dma_chan,
+				amb_port->rx_dma_buf_phys, count, DMA_DEV_TO_MEM,
+				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+
+	if (!amb_port->rx_dma_desc) {
+		dev_err(amb_port->port.dev, "Not able to get desc for Rx\n");
+		return -EIO;
+	}
+
+	amb_port->rx_dma_desc->callback = serial_ambarella_rx_dma_complete;
+	amb_port->rx_dma_desc->callback_param = amb_port;
+	dma_sync_single_for_device(amb_port->port.dev, amb_port->rx_dma_buf_phys,
+		count, DMA_FROM_DEVICE);
+	amb_port->rx_bytes_requested = count;
+	amb_port->rx_cookie = dmaengine_submit(amb_port->rx_dma_desc);
+	dma_async_issue_pending(amb_port->rx_dma_chan);
+
+	return 0;
+}
+
+static void serial_ambarella_stop_tx(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+	__serial_ambarella_stop_tx(port, amb_port->tx_fifo_fix);
+}
+
+static void serial_ambarella_stop_rx(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port = (struct ambarella_uart_port *)(port->private_data);
+	struct tty_port *tty_port = &port->state->port;
+	struct dma_tx_state state;
+	size_t pending;
+	u32 ier;
+
+	if (amb_port->rxdma_used) {
+		if (!amb_port->rx_in_progress)
+			return;
+
+		ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+		writel_relaxed(ier & ~UART_IE_ETOI, port->membase + UART_IE_OFFSET);
+
+		amb_port->rx_in_progress = false;
+		dmaengine_tx_status(amb_port->rx_dma_chan, amb_port->rx_cookie, &state);
+		dmaengine_terminate_async(amb_port->rx_dma_chan);
+
+		pending = amb_port->rx_bytes_requested - state.residue;
+		BUG_ON(pending > AMBA_UART_RX_DMA_BUFFER_SIZE);
+
+		serial_ambarella_copy_rx_to_tty(amb_port, tty_port, pending);
+		serial_ambarella_handle_rx_pio(amb_port, tty_port);
+
+		tty_flip_buffer_push(tty_port);
+	} else {
+		ier = readl_relaxed(port->membase + UART_IE_OFFSET);
+		writel_relaxed(ier & ~UART_IE_ERBFI, port->membase + UART_IE_OFFSET);
+	}
+
+}
+
+static unsigned int serial_ambarella_tx_empty(struct uart_port *port)
+{
+	unsigned int lsr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	lsr = readl_relaxed(port->membase + UART_LS_OFFSET);
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return ((lsr & (UART_LS_TEMT | UART_LS_THRE)) ==
+		(UART_LS_TEMT | UART_LS_THRE)) ? TIOCSER_TEMT : 0;
+}
+
+static unsigned int serial_ambarella_get_mctrl(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+	u32 ms, mctrl = 0;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (amb_port->msr_used) {
+		ms = __serial_ambarella_read_ms(port, amb_port->tx_fifo_fix);
+
+		if (ms & UART_MS_CTS)
+			mctrl |= TIOCM_CTS;
+		if (ms & UART_MS_DSR)
+			mctrl |= TIOCM_DSR;
+		if (ms & UART_MS_RI)
+			mctrl |= TIOCM_RI;
+		if (ms & UART_MS_DCD)
+			mctrl |= TIOCM_CD;
+	}
+
+	return mctrl;
+}
+
+static void serial_ambarella_set_mctrl(struct uart_port *port,
+	unsigned int mctrl)
+{
+	struct ambarella_uart_port *amb_port;
+	u32 mcr, mcr_new = 0;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (amb_port->msr_used) {
+		mcr = readl_relaxed(port->membase + UART_MC_OFFSET);
+
+		if (mctrl & TIOCM_DTR)
+			mcr_new |= UART_MC_DTR;
+		if (mctrl & TIOCM_RTS)
+			mcr_new |= UART_MC_RTS;
+		if (mctrl & TIOCM_OUT1)
+			mcr_new |= UART_MC_OUT1;
+		if (mctrl & TIOCM_OUT2)
+			mcr_new |= UART_MC_OUT2;
+		if (mctrl & TIOCM_LOOP)
+			mcr_new |= UART_MC_LB;
+
+		mcr_new |= amb_port->mcr;
+		if (mcr_new != mcr) {
+			if ((mcr & UART_MC_AFCE) == UART_MC_AFCE) {
+				mcr &= ~UART_MC_AFCE;
+				writel_relaxed(mcr, port->membase + UART_MC_OFFSET);
+			}
+			writel_relaxed(mcr_new, port->membase + UART_MC_OFFSET);
+		}
+	}
+}
+
+static void serial_ambarella_break_ctl(struct uart_port *port, int break_state)
+{
+	u32 lcr = readl_relaxed(port->membase + UART_LC_OFFSET);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	if (break_state != 0)
+		writel_relaxed(lcr | UART_LC_BRK, port->membase + UART_LC_OFFSET);
+	else
+		writel_relaxed(lcr & ~UART_LC_BRK, port->membase + UART_LC_OFFSET);
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static void serial_ambarella_dma_channel_free(struct ambarella_uart_port *amb_port,
+		bool dma_to_memory)
+{
+	struct dma_chan *dma_chan;
+
+	if (dma_to_memory) {
+		kfree(amb_port->rx_dma_buf_virt);
+
+		dma_chan = amb_port->rx_dma_chan;
+		amb_port->rx_dma_chan = NULL;
+		amb_port->rx_dma_buf_phys = 0;
+		amb_port->rx_dma_buf_virt = NULL;
+	} else {
+		dma_unmap_single(amb_port->port.dev, amb_port->tx_dma_buf_phys,
+			UART_XMIT_SIZE, DMA_TO_DEVICE);
+		dma_chan = amb_port->tx_dma_chan;
+		amb_port->tx_dma_chan = NULL;
+		amb_port->tx_dma_buf_phys = 0;
+		amb_port->tx_dma_buf_virt = NULL;
+	}
+	dma_release_channel(dma_chan);
+}
+
+static int serial_ambarella_dma_channel_allocate(struct ambarella_uart_port *amb_port,
+			bool dma_to_memory)
+{
+	struct dma_chan *dma_chan;
+	struct dma_slave_config dma_sconfig;
+	dma_addr_t dma_phys;
+	unsigned char *dma_buf;
+	int ret;
+
+	dma_chan = dma_request_slave_channel(amb_port->port.dev,
+		dma_to_memory ? "rx" : "tx");
+	if (!dma_chan) {
+		ret = PTR_ERR(dma_chan);
+		if (ret != -EPROBE_DEFER)
+			dev_err(amb_port->port.dev,
+				"Dma channel is not available: %d\n", ret);
+		return ret;
+	}
+
+	if (dma_to_memory) {
+		/* use double buffer to handle rx */
+		dma_buf = kmalloc(AMBA_UART_RX_DMA_BUFFER_SIZE, GFP_KERNEL);
+		if (!dma_buf) {
+			dma_release_channel(dma_chan);
+			return -ENOMEM;
+		}
+		dma_phys = dma_map_single(dma_chan->device->dev,
+			dma_buf, AMBA_UART_RX_DMA_BUFFER_SIZE,
+			DMA_FROM_DEVICE);
+		if (dma_mapping_error(dma_chan->device->dev, dma_phys)) {
+			dev_err(dma_chan->device->dev,
+				"failed mapping rx dma buffer\n");
+			dma_release_channel(dma_chan);
+			return -ENOMEM;
+		}
+	} else {
+		dma_phys = dma_map_single(dma_chan->device->dev,
+			amb_port->port.state->xmit.buf, UART_XMIT_SIZE,
+			DMA_TO_DEVICE);
+		if (dma_mapping_error(dma_chan->device->dev, dma_phys)) {
+			dev_err(dma_chan->device->dev,
+				"failed mapping tx dma buffer\n");
+			dma_release_channel(dma_chan);
+			return -ENOMEM;
+		}
+		dma_buf = amb_port->port.state->xmit.buf;
+	}
+
+	if (dma_to_memory) {
+		dma_sconfig.src_addr = amb_port->port.mapbase + UART_DMAF_OFFSET;
+		dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		dma_sconfig.src_maxburst = 8;
+		dma_sconfig.direction = DMA_DEV_TO_MEM;
+	} else {
+		dma_sconfig.dst_addr = amb_port->port.mapbase + UART_DMAF_OFFSET;
+		dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		dma_sconfig.dst_maxburst = 16;
+		dma_sconfig.direction = DMA_MEM_TO_DEV;
+	}
+
+	ret = dmaengine_slave_config(dma_chan, &dma_sconfig);
+	if (ret < 0) {
+		dev_err(amb_port->port.dev,
+			"Dma slave config failed, err = %d\n", ret);
+		goto scrub;
+	}
+
+	if (dma_to_memory) {
+		amb_port->rx_dma_chan = dma_chan;
+		amb_port->rx_dma_buf_virt = dma_buf;
+		amb_port->rx_dma_buf_phys = dma_phys;
+	} else {
+		amb_port->tx_dma_chan = dma_chan;
+		amb_port->tx_dma_buf_virt = dma_buf;
+		amb_port->tx_dma_buf_phys = dma_phys;
+	}
+	return 0;
+
+scrub:
+	serial_ambarella_dma_channel_free(amb_port, dma_to_memory);
+	return ret;
+}
+
+static int serial_ambarella_startup(struct uart_port *port)
+{
+	int rval = 0;
+	struct ambarella_uart_port *amb_port;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	if (amb_port->txdma_used) {
+		rval = serial_ambarella_dma_channel_allocate(amb_port, false);
+		if (rval < 0) {
+			dev_err(amb_port->port.dev, "Tx Dma allocation failed, err = %d\n", rval);
+			return -EBUSY;
+		}
+	}
+
+	if (amb_port->rxdma_used) {
+		rval = serial_ambarella_dma_channel_allocate(amb_port, true);
+		if (rval < 0) {
+			dev_err(amb_port->port.dev, "Rx Dma allocation failed, err = %d\n", rval);
+			return -EBUSY;
+		}
+
+		rval = serial_ambarella_start_rx_dma(amb_port);
+		if (rval < 0) {
+			dev_err(amb_port->port.dev, "Not able to start Rx DMA\n");
+			return rval;
+		}
+		amb_port->rx_in_progress = true;
+	}
+
+	serial_ambarella_hw_setup(port);
+
+	return rval;
+}
+
+static void serial_ambarella_hw_deinit(struct ambarella_uart_port *amb_port)
+{
+	struct uart_port *port = &amb_port->port;
+
+	/* Disable interrupts */
+	writel_relaxed(0, port->membase + UART_IE_OFFSET);
+	/* Disable DMA */
+	writel_relaxed(0, port->membase + UART_DMAE_OFFSET);
+	/* Reset the Rx and Tx FIFOs */
+	writel_relaxed(UART_FCR_CLEAR_XMIT | UART_FCR_CLEAR_RCVR,
+			port->membase + UART_SRR_OFFSET);
+}
+
+static void serial_ambarella_shutdown(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+	u32 lcr;
+	unsigned long flags;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	if (amb_port->txdma_used || amb_port->rxdma_used) {
+		serial_ambarella_hw_deinit(amb_port);
+		spin_unlock_irqrestore(&port->lock, flags);
+
+		if (amb_port->txdma_used) {
+			dmaengine_terminate_all(amb_port->tx_dma_chan);
+			serial_ambarella_dma_channel_free(amb_port, false);
+			amb_port->tx_in_progress = false;
+		}
+		if (amb_port->rxdma_used) {
+			dmaengine_terminate_all(amb_port->rx_dma_chan);
+			serial_ambarella_dma_channel_free(amb_port, true);
+			amb_port->rx_in_progress = false;
+		}
+
+		spin_lock_irqsave(&port->lock, flags);
+	}
+
+	lcr = readl_relaxed(port->membase + UART_LC_OFFSET);
+	writel_relaxed(lcr & ~UART_LC_BRK, port->membase + UART_LC_OFFSET);
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static void serial_ambarella_set_termios(struct uart_port *port,
+	struct ktermios *termios, const struct ktermios *old)
+{
+	struct ambarella_uart_port *amb_port;
+	unsigned int baud, quot;
+	u32 lc = 0x0;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+	amb_port->c_cflag = termios->c_cflag;
+
+	port->uartclk = clk_get_rate(amb_port->uart_pll);
+	switch (termios->c_cflag & CSIZE) {
+	case CS5:
+		lc |= UART_LC_CLS_5_BITS;
+		break;
+	case CS6:
+		lc |= UART_LC_CLS_6_BITS;
+		break;
+	case CS7:
+		lc |= UART_LC_CLS_7_BITS;
+		break;
+	case CS8:
+	default:
+		lc |= UART_LC_CLS_8_BITS;
+		break;
+	}
+
+	if (termios->c_cflag & CSTOPB)
+		lc |= UART_LC_STOP_2BIT;
+	else
+		lc |= UART_LC_STOP_1BIT;
+
+	if (termios->c_cflag & PARENB) {
+		if (termios->c_cflag & PARODD)
+			lc |= (UART_LC_PEN | UART_LC_ODD_PARITY);
+		else
+			lc |= (UART_LC_PEN | UART_LC_EVEN_PARITY);
+	}
+
+	baud = uart_get_baud_rate(port, termios, old, 0, port->uartclk / 16);
+	quot = uart_get_divisor(port, baud);
+
+	disable_irq(port->irq);
+	uart_update_timeout(port, termios->c_cflag, baud);
+
+	port->read_status_mask = UART_LSR_OE | UART_LSR_THRE | UART_LSR_DR;
+	if (termios->c_iflag & INPCK)
+		port->read_status_mask |= UART_LSR_FE | UART_LSR_PE;
+	if (termios->c_iflag & (BRKINT | PARMRK))
+		port->read_status_mask |= UART_LSR_BI;
+
+	port->ignore_status_mask = 0;
+	if (termios->c_iflag & IGNPAR)
+		port->ignore_status_mask |= UART_LSR_PE | UART_LSR_FE;
+	if (termios->c_iflag & IGNBRK) {
+		port->ignore_status_mask |= UART_LSR_BI;
+		if (termios->c_iflag & IGNPAR)
+			port->ignore_status_mask |= UART_LSR_OE;
+	}
+	if ((termios->c_cflag & CREAD) == 0)
+		port->ignore_status_mask |= UART_LSR_DR;
+
+	if ((termios->c_cflag & CRTSCTS) == 0) {
+		amb_port->mcr &= ~UART_MC_AFCE;
+		port->status &= ~UPSTAT_AUTOCTS;
+	} else {
+		amb_port->mcr |= UART_MC_AFCE;
+		port->status |= UPSTAT_AUTOCTS;
+	}
+
+	writel_relaxed(UART_LC_DLAB, port->membase + UART_LC_OFFSET);
+	writel_relaxed(quot & 0xff, port->membase + UART_DLL_OFFSET);
+	writel_relaxed((quot >> 8) & 0xff, port->membase + UART_DLH_OFFSET);
+	writel_relaxed(lc, port->membase + UART_LC_OFFSET);
+	if (UART_ENABLE_MS(port, termios->c_cflag))
+		__serial_ambarella_enable_ms(port);
+	else
+		__serial_ambarella_disable_ms(port);
+	serial_ambarella_set_mctrl(port, port->mctrl);
+
+	enable_irq(port->irq);
+}
+
+static void serial_ambarella_pm(struct uart_port *port,
+	unsigned int state, unsigned int oldstate)
+{
+}
+
+static void serial_ambarella_release_port(struct uart_port *port)
+{
+}
+
+static int serial_ambarella_request_port(struct uart_port *port)
+{
+	return 0;
+}
+
+static void serial_ambarella_config_port(struct uart_port *port, int flags)
+{
+}
+
+static int serial_ambarella_verify_port(struct uart_port *port,
+					struct serial_struct *ser)
+{
+	int rval = 0;
+
+	if (ser->type != PORT_UNKNOWN && ser->type != PORT_UART00)
+		rval = -EINVAL;
+	if (port->irq != ser->irq)
+		rval = -EINVAL;
+	if (ser->io_type != SERIAL_IO_MEM)
+		rval = -EINVAL;
+
+	return rval;
+}
+
+static const char *serial_ambarella_type(struct uart_port *port)
+{
+	return "ambuart";
+}
+
+#ifdef CONFIG_CONSOLE_POLL
+static void serial_ambarella_poll_put_char(struct uart_port *port,
+	unsigned char chr)
+{
+	struct ambarella_uart_port *amb_port;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+	if (!port->suspended) {
+		wait_for_tx(port);
+		writel_relaxed(chr, port->membase + UART_TH_OFFSET);
+	}
+}
+
+static int serial_ambarella_poll_get_char(struct uart_port *port)
+{
+	struct ambarella_uart_port *amb_port;
+
+	amb_port = (struct ambarella_uart_port *)(port->private_data);
+	if (!port->suspended) {
+		wait_for_rx(port);
+		return readl_relaxed(port->membase + UART_RB_OFFSET);
+	}
+	return 0;
+}
+#endif
+
+static const struct uart_ops serial_ambarella_pops = {
+	.tx_empty	= serial_ambarella_tx_empty,
+	.set_mctrl	= serial_ambarella_set_mctrl,
+	.get_mctrl	= serial_ambarella_get_mctrl,
+	.stop_tx	= serial_ambarella_stop_tx,
+	.start_tx	= serial_ambarella_start_tx,
+	.stop_rx	= serial_ambarella_stop_rx,
+	.enable_ms	= serial_ambarella_enable_ms,
+	.break_ctl	= serial_ambarella_break_ctl,
+	.startup	= serial_ambarella_startup,
+	.shutdown	= serial_ambarella_shutdown,
+	.set_termios	= serial_ambarella_set_termios,
+	.pm		= serial_ambarella_pm,
+	.type		= serial_ambarella_type,
+	.release_port	= serial_ambarella_release_port,
+	.request_port	= serial_ambarella_request_port,
+	.config_port	= serial_ambarella_config_port,
+	.verify_port	= serial_ambarella_verify_port,
+#ifdef CONFIG_CONSOLE_POLL
+	.poll_put_char	= serial_ambarella_poll_put_char,
+	.poll_get_char	= serial_ambarella_poll_get_char,
+#endif
+};
+
+/* ==========================================================================*/
+#if defined(CONFIG_SERIAL_AMBARELLA_CONSOLE)
+
+static struct uart_driver serial_ambarella_reg;
+static void ambarella_uart_of_enumerate(void);
+
+static void serial_ambarella_console_putchar(struct uart_port *port, unsigned char ch)
+{
+	wait_for_tx(port);
+	writel_relaxed(ch, port->membase + UART_TH_OFFSET);
+}
+
+static void serial_ambarella_console_write(struct console *co,
+	const char *s, unsigned int count)
+{
+	struct uart_port *port;
+	int locked = 1;
+	unsigned long flags;
+
+	port = &ambarella_port[co->index].port;
+
+	if (!port->suspended) {
+		local_irq_save(flags);
+		if (port->sysrq) {
+			locked = 0;
+		} else if (oops_in_progress) {
+			locked = spin_trylock(&port->lock);
+		} else {
+			spin_lock(&port->lock);
+			locked = 1;
+		}
+
+		uart_console_write(port, s, count,
+			serial_ambarella_console_putchar);
+		wait_for_tx(port);
+
+		if (locked)
+			spin_unlock(&port->lock);
+		local_irq_restore(flags);
+	}
+}
+
+static int __init serial_ambarella_console_setup(struct console *co,
+	char *options)
+{
+	struct uart_port *port;
+	int baud = 115200, bits = 8, parity = 'n', flow = 'n';
+
+	if (co->index < 0 || co->index >= serial_ambarella_reg.nr)
+		co->index = 0;
+
+	port = &ambarella_port[co->index].port;
+	if (!port->membase) {
+		pr_err("No device available for serial console\n");
+		return -ENODEV;
+	}
+
+	port->ops = &serial_ambarella_pops;
+	port->private_data = &ambarella_port[co->index];
+	port->line = co->index;
+
+	serial_ambarella_hw_setup(port);
+
+	if (options)
+		uart_parse_options(options, &baud, &parity, &bits, &flow);
+
+	return uart_set_options(port, co, baud, parity, bits, flow);
+}
+
+static struct console serial_ambarella_console = {
+	.name		= "ttyS",
+	.write		= serial_ambarella_console_write,
+	.device		= uart_console_device,
+	.setup		= serial_ambarella_console_setup,
+	.flags		= CON_PRINTBUFFER | CON_ANYTIME,
+	.index		= -1,
+	.data		= &serial_ambarella_reg,
+};
+
+#ifdef CONFIG_PM
+/* when no_console_suspend is specified in cmdline, Linux thought the console
+ * would never suspend. But actually we may put system into STR and power off
+ * the SoC, so the console must be initialized when system exit STR.
+ *
+ * NOTE: We MUST ensure that no information will be output via UART until
+ * syscore_resume() is completed, otherwise the UART may be in deadloop.
+ */
+static void serial_ambarella_console_resume(void)
+{
+	struct console *co = &serial_ambarella_console;
+	struct ambarella_uart_port *amb_port;
+	struct uart_port *port;
+	struct ktermios termios;
+
+	if (console_suspend_enabled)
+		return;
+
+	if (co->index < 0 || co->index >= serial_ambarella_reg.nr)
+		return;
+
+	amb_port = &ambarella_port[co->index];
+
+	port = &ambarella_port[co->index].port;
+	if (!port->membase)
+		return;
+
+	clk_set_parent(amb_port->uart_pll, amb_port->parent_pll);
+	clk_set_rate(amb_port->uart_pll, amb_port->clk_rate);
+
+	clear_bit(AMBA_UART_RESET_FLAG, &amb_port->flags);
+	serial_ambarella_hw_setup(port);
+
+	memset(&termios, 0, sizeof(struct ktermios));
+	termios.c_cflag = amb_port->c_cflag;
+	port->ops->set_termios(port, &termios, NULL);
+}
+
+static int serial_ambarella_console_suspend(void)
+{
+	struct console *co = &serial_ambarella_console;
+	struct ambarella_uart_port *amb_port;
+
+	if (console_suspend_enabled)
+		return 0;
+
+	if (co->index < 0 || co->index >= serial_ambarella_reg.nr)
+		return 0;
+
+	amb_port = &ambarella_port[co->index];
+
+	clk_set_parent(amb_port->uart_pll, NULL);
+
+	return 0;
+}
+
+static struct syscore_ops ambarella_console_syscore_ops = {
+	.resume	 = serial_ambarella_console_resume,
+	.suspend = serial_ambarella_console_suspend,
+};
+#endif
+
+static int __init serial_ambarella_console_init(void)
+{
+	struct device_node *np;
+	const char *name;
+	int id;
+
+	ambarella_uart_of_enumerate();
+
+	name = of_get_property(of_chosen, "linux,stdout-path", NULL);
+	if (name == NULL)
+		return -ENODEV;
+
+	np = of_find_node_by_path(name);
+	if (!np)
+		return -ENODEV;
+
+	id = of_alias_get_id(np, "serial");
+	if (id < 0 || id >= serial_ambarella_reg.nr)
+		return -ENODEV;
+
+	ambarella_port[id].port.membase = of_iomap(np, 0);
+
+	ambarella_port[id].uart_pll = of_clk_get(np, 0);
+	if (IS_ERR(ambarella_port[id].uart_pll)) {
+		pr_err("No clock available for serial console\n");
+		return -ENODEV;
+	}
+	ambarella_port[id].parent_pll = clk_get_parent(ambarella_port[id].uart_pll);
+
+	register_console(&serial_ambarella_console);
+
+#ifdef CONFIG_PM
+	register_syscore_ops(&ambarella_console_syscore_ops);
+#endif
+
+	return 0;
+}
+
+console_initcall(serial_ambarella_console_init);
+
+static void serial_ambarella_console_early_write(struct console *con, const char *s,
+		unsigned int count)
+{
+	struct earlycon_device *dev = con->data;
+
+	uart_console_write(&dev->port, s, count, serial_ambarella_console_putchar);
+}
+
+static int __init serial_ambarella_console_early_setup(struct earlycon_device *dev,
+		const char *opt)
+{
+	if (!dev->port.membase)
+		return -ENODEV;
+
+	dev->con->write = serial_ambarella_console_early_write;
+
+	return 0;
+}
+OF_EARLYCON_DECLARE(ambarella_uart, "ambarella,uart", serial_ambarella_console_early_setup);
+
+#define AMBARELLA_CONSOLE	(&serial_ambarella_console)
+#else
+#define AMBARELLA_CONSOLE	NULL
+#endif
+
+/* ==========================================================================*/
+static struct uart_driver serial_ambarella_reg = {
+	.owner		= THIS_MODULE,
+	.driver_name	= "ambarella-uart",
+	.dev_name	= "ttyS",
+	.major		= TTY_MAJOR,
+	.minor		= 64,
+	.nr		= 0,
+	.cons		= AMBARELLA_CONSOLE,
+};
+
+static int serial_ambarella_probe(struct platform_device *pdev)
+{
+	struct ambarella_uart_port *amb_port;
+	struct resource *mem;
+	struct pinctrl *pinctrl;
+	int irq, id, rval = 0;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		dev_err(&pdev->dev, "no mem resource!\n");
+		return -ENODEV;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "no irq resource!\n");
+		return -ENODEV;
+	}
+
+	id = of_alias_get_id(pdev->dev.of_node, "serial");
+	if (id < 0 || id >= serial_ambarella_reg.nr) {
+		dev_err(&pdev->dev, "Invalid uart ID %d!\n", id);
+		return -ENXIO;
+	}
+
+	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
+	if (IS_ERR(pinctrl)) {
+		dev_err(&pdev->dev, "Failed to request pinctrl\n");
+		return PTR_ERR(pinctrl);
+	}
+
+	amb_port = &ambarella_port[id];
+
+	amb_port->uart_pll = of_clk_get(pdev->dev.of_node, 0);
+	if (IS_ERR(amb_port->uart_pll)) {
+		dev_err(&pdev->dev, "Get uart clk failed!\n");
+		return PTR_ERR(amb_port->uart_pll);
+	}
+	amb_port->parent_pll = clk_get_parent(amb_port->uart_pll);
+
+	amb_port->mcr = DEFAULT_AMBARELLA_UART_MCR;
+	/* check if using modem status register,  available for non-uart0. */
+	if (of_find_property(pdev->dev.of_node, "amb,msr-used", NULL))
+		amb_port->msr_used = 1;
+	else
+		amb_port->msr_used = 0;
+	/* check if workaround for tx fifo is needed */
+	if (of_find_property(pdev->dev.of_node, "amb,tx-fifo-fix", NULL))
+		amb_port->tx_fifo_fix = 1;
+	else
+		amb_port->tx_fifo_fix = 0;
+	/* check if registers like FIFO status register are NOT provided. */
+	if (of_find_property(pdev->dev.of_node, "amb,less-reg", NULL))
+		amb_port->less_reg = 1;
+	else
+		amb_port->less_reg = 0;
+	/* check if using tx dma */
+	if (of_find_property(pdev->dev.of_node, "amb,txdma-used", NULL)) {
+		amb_port->txdma_used = 1;
+		dev_info(&pdev->dev, "Serial[%d] use txdma\n", id);
+	} else
+		amb_port->txdma_used = 0;
+	/* check if using rx dma */
+	if (of_find_property(pdev->dev.of_node, "amb,rxdma-used", NULL)) {
+		amb_port->rxdma_used = 1;
+		dev_info(&pdev->dev, "Serial[%d] use rxdma\n", id);
+	} else {
+		amb_port->rxdma_used = 0;
+	}
+	/* check if ignore frame error */
+	if (of_find_property(pdev->dev.of_node, "amb,ignore-fe", NULL)) {
+		amb_port->ignore_fe = 1;
+		dev_info(&pdev->dev, "Serial[%d] ignores FE\n", id);
+	} else {
+		amb_port->ignore_fe = 0;
+	}
+
+	amb_port->port.dev = &pdev->dev;
+	amb_port->port.type = PORT_UART00;
+	amb_port->port.iotype = UPIO_MEM;
+	amb_port->port.fifosize = UART_FIFO_SIZE;
+	amb_port->port.uartclk = clk_get_rate(amb_port->uart_pll);
+	amb_port->port.ops = &serial_ambarella_pops;
+	amb_port->port.private_data = amb_port;
+	amb_port->port.irq = irq;
+	amb_port->port.line = id;
+	amb_port->port.mapbase = mem->start;
+	amb_port->port.membase =
+		devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	if (!amb_port->port.membase) {
+		dev_err(&pdev->dev, "can't ioremap UART\n");
+		return -ENOMEM;
+	}
+
+	rval = uart_add_one_port(&serial_ambarella_reg, &amb_port->port);
+	if (rval < 0)
+		dev_err(&pdev->dev, "failed to add port: %d, %d!\n", id, rval);
+
+	rval = request_irq(irq, serial_ambarella_irq, IRQF_TRIGGER_HIGH,
+			dev_name(amb_port->port.dev), &amb_port->port);
+
+	platform_set_drvdata(pdev, amb_port);
+
+	return rval;
+}
+
+static int serial_ambarella_remove(struct platform_device *pdev)
+{
+	struct ambarella_uart_port *amb_port;
+	int rval = 0;
+
+	amb_port = platform_get_drvdata(pdev);
+	rval = uart_remove_one_port(&serial_ambarella_reg, &amb_port->port);
+	if (rval < 0)
+		dev_err(&pdev->dev, "uart_remove_one_port fail %d!\n",	rval);
+	free_irq(amb_port->port.irq, &amb_port->port);
+
+	dev_notice(&pdev->dev,
+		"Remove Ambarella Media Processor UART.\n");
+
+	return rval;
+}
+
+#ifdef CONFIG_PM
+static int serial_ambarella_suspend(struct platform_device *pdev,
+	pm_message_t state)
+{
+	struct ambarella_uart_port *amb_port;
+	int rval = 0;
+
+	amb_port = platform_get_drvdata(pdev);
+	rval = uart_suspend_port(&serial_ambarella_reg, &amb_port->port);
+
+	amb_port->clk_rate = clk_get_rate(amb_port->uart_pll);
+	clk_set_parent(amb_port->uart_pll, NULL);
+
+	dev_dbg(&pdev->dev, "%s exit with %d @ %d\n",
+		__func__, rval, state.event);
+
+	return rval;
+}
+
+static int serial_ambarella_resume(struct platform_device *pdev)
+{
+	struct ambarella_uart_port *amb_port;
+	int rval = 0;
+
+	amb_port = platform_get_drvdata(pdev);
+
+	clk_set_parent(amb_port->uart_pll, amb_port->parent_pll);
+	clk_set_rate(amb_port->uart_pll, amb_port->clk_rate);
+
+	clear_bit(AMBA_UART_RESET_FLAG, &amb_port->flags);
+	serial_ambarella_hw_setup(&amb_port->port);
+
+	rval = uart_resume_port(&serial_ambarella_reg, &amb_port->port);
+
+	dev_dbg(&pdev->dev, "%s exit with %d\n", __func__, rval);
+
+	return rval;
+}
+#endif
+
+static const struct of_device_id ambarella_serial_of_match[] = {
+	{ .compatible = "ambarella,uart" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ambarella_serial_of_match);
+
+static void ambarella_uart_of_enumerate(void)
+{
+	struct device_node *np;
+	int nr = 0;
+
+	if (serial_ambarella_reg.nr <= 0) {
+		for_each_matching_node(np, ambarella_serial_of_match) {
+			nr++;
+		}
+
+		if (nr > AMBA_UART_MAX_NUM)
+			nr = AMBA_UART_MAX_NUM;
+
+		serial_ambarella_reg.nr = nr;
+	}
+}
+
+
+static struct platform_driver serial_ambarella_driver = {
+	.probe		= serial_ambarella_probe,
+	.remove		= serial_ambarella_remove,
+#ifdef CONFIG_PM
+	.suspend	= serial_ambarella_suspend,
+	.resume		= serial_ambarella_resume,
+#endif
+	.driver		= {
+		.name	= "ambarella-uart",
+		.of_match_table = ambarella_serial_of_match,
+	},
+};
+
+static int __init serial_ambarella_init(void)
+{
+	int rval;
+
+	ambarella_uart_of_enumerate();
+
+	rval = uart_register_driver(&serial_ambarella_reg);
+	if (rval < 0)
+		return rval;
+
+	rval = platform_driver_register(&serial_ambarella_driver);
+	if (rval < 0)
+		uart_unregister_driver(&serial_ambarella_reg);
+
+	return rval;
+}
+
+static void __exit serial_ambarella_exit(void)
+{
+	platform_driver_unregister(&serial_ambarella_driver);
+	uart_unregister_driver(&serial_ambarella_reg);
+}
+
+module_init(serial_ambarella_init);
+module_exit(serial_ambarella_exit);
+
+MODULE_AUTHOR("Anthony Ginger");
+MODULE_DESCRIPTION("Ambarella Media Processor UART driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ambarella-uart");
diff --git a/drivers/tty/serial/ambarella_uart.h b/drivers/tty/serial/ambarella_uart.h
new file mode 100644
index 000000000000..991fee680e16
--- /dev/null
+++ b/drivers/tty/serial/ambarella_uart.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2023, Ambarella, Inc.
+ */
+
+#ifndef __AMBARELLA_UART_H__
+#define __AMBARELLA_UART_H__
+
+/* ==========================================================================*/
+#define UART_RB_OFFSET			0x00
+#define UART_TH_OFFSET			0x00
+#define UART_DLL_OFFSET			0x00
+#define UART_IE_OFFSET			0x04
+#define UART_DLH_OFFSET			0x04
+#define UART_II_OFFSET			0x08
+#define UART_FC_OFFSET			0x08
+#define UART_LC_OFFSET			0x0c
+#define UART_MC_OFFSET			0x10
+#define UART_LS_OFFSET			0x14
+#define UART_MS_OFFSET			0x18
+#define UART_SC_OFFSET			0x1c	/* Byte */
+#define UART_DMAE_OFFSET		0x28
+#define UART_DMAF_OFFSET		0x40	/* DMA fifo */
+#define UART_US_OFFSET			0x7c
+#define UART_TFL_OFFSET			0x80
+#define UART_RFL_OFFSET			0x84
+#define UART_SRR_OFFSET			0x88
+#define UART_RTR_OFFSET			0xac
+#define UART_TTR_OFFSET			0xb0
+
+/* UART[x]_IE_REG */
+#define UART_IE_PTIME			0x80
+#define UART_IE_ETOI			0x20
+#define UART_IE_EBDI			0x10
+#define UART_IE_EDSSI			0x08
+#define UART_IE_ELSI			0x04
+#define UART_IE_ETBEI			0x02
+#define UART_IE_ERBFI			0x01
+
+/* UART[x]_II_REG */
+#define UART_II_MODEM_STATUS_CHANGED	0x00
+#define UART_II_NO_INT_PENDING		0x01
+#define UART_II_THR_EMPTY		0x02
+#define UART_II_RCV_DATA_AVAIL		0x04
+#define UART_II_RCV_STATUS		0x06
+#define UART_II_CHAR_TIMEOUT		0x0c
+
+/* UART[x]_FC_REG */
+#define UART_FC_RX_ONECHAR		0x00
+#define UART_FC_RX_QUARTER_FULL		0x40
+#define UART_FC_RX_HALF_FULL		0x80
+#define UART_FC_RX_2_TO_FULL		0xc0
+#define UART_FC_TX_EMPTY		0x00
+#define UART_FC_TX_2_IN_FIFO		0x10
+#define UART_FC_TX_QUATER_IN_FIFO	0x20
+#define UART_FC_TX_HALF_IN_FIFO		0x30
+#define UART_FC_DMA_SELECT		0x08
+#define UART_FC_XMITR			0x04
+#define UART_FC_RCVRR			0x02
+#define UART_FC_FIFOE			0x01
+
+/* UART[x]_LC_REG */
+#define UART_LC_DLAB			0x80
+#define UART_LC_BRK			0x40
+#define UART_LC_EVEN_PARITY		0x10
+#define UART_LC_ODD_PARITY		0x00
+#define UART_LC_PEN			0x08
+#define UART_LC_STOP_2BIT		0x04
+#define UART_LC_STOP_1BIT		0x00
+#define UART_LC_CLS_8_BITS		0x03
+#define UART_LC_CLS_7_BITS		0x02
+#define UART_LC_CLS_6_BITS		0x01
+#define UART_LC_CLS_5_BITS		0x00
+/*	quick defs */
+#define	UART_LC_8N1			0x03
+#define	UART_LC_7E1			0x0a
+
+/* UART[x]_MC_REG */
+#define UART_MC_SIRE			0x40
+#define UART_MC_AFCE			0x20
+#define UART_MC_LB			0x10
+#define UART_MC_OUT2			0x08
+#define UART_MC_OUT1			0x04
+#define UART_MC_RTS			0x02
+#define UART_MC_DTR			0x01
+
+/* UART[x]_LS_REG */
+#define UART_LS_FERR			0x80
+#define UART_LS_TEMT			0x40
+#define UART_LS_THRE			0x20
+#define UART_LS_BI			0x10
+#define UART_LS_FE			0x08
+#define UART_LS_PE			0x04
+#define UART_LS_OE			0x02
+#define UART_LS_DR			0x01
+
+/* UART[x]_MS_REG */
+#define UART_MS_DCD			0x80
+#define UART_MS_RI			0x40
+#define UART_MS_DSR			0x20
+#define UART_MS_CTS			0x10
+#define UART_MS_DDCD			0x08
+#define UART_MS_TERI			0x04
+#define UART_MS_DDSR			0x02
+#define UART_MS_DCTS			0x01
+
+/* UART[x]_US_REG */
+#define UART_US_RFF			0x10
+#define UART_US_RFNE			0x08
+#define UART_US_TFE			0x04
+#define UART_US_TFNF			0x02
+#define UART_US_BUSY			0x01
+
+/* ==========================================================================*/
+#define UART_FIFO_SIZE			(16)
+
+#define DEFAULT_AMBARELLA_UART_MCR	(0)
+#define DEFAULT_AMBARELLA_UART_IER	(UART_IE_ELSI | UART_IE_ERBFI | UART_IE_ETOI)
+
+#endif /* __AMBARELLA_UART_H__ */
-- 
2.34.1

