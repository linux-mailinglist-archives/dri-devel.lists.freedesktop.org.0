Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BF2ACC50
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 04:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CBF8920E;
	Tue, 10 Nov 2020 03:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781CF8920E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 03:54:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B838720731;
 Tue, 10 Nov 2020 03:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980469;
 bh=HJPSa0KmKV95ZybTLaMu/IKpYZrY18GvP37V/Fllc/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IwJTRFwHXcu69xXgkHndxHFheCIkaqqJBMiKe3n6wiq+Ja+RKehIWT10m17dif05H
 7AdCPULCCEihdzA9uG8JQ61jTjOa9nFotqQHxKLUkb3MfuVkRFum9ilbhC7Rkadl2V
 Ll3hHXIWLZNb9XlB2ECgMUpv7JIMxAYhqvG+217E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 49/55] i2c: sh_mobile: implement atomic transfers
Date: Mon,  9 Nov 2020 22:53:12 -0500
Message-Id: <20201110035318.423757-49-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035318.423757-1-sashal@kernel.org>
References: <20201110035318.423757-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ulrich Hecht <uli+renesas@fpond.eu>

[ Upstream commit a49cc1fe9d64a2dc4e19b599204f403e5d25f44b ]

Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
similar boards.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
[wsa: some whitespace fixing]
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 86 +++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index cab7255599991..bdd60770779ad 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -129,6 +129,7 @@ struct sh_mobile_i2c_data {
 	int sr;
 	bool send_stop;
 	bool stop_after_dma;
+	bool atomic_xfer;
 
 	struct resource *res;
 	struct dma_chan *dma_tx;
@@ -330,13 +331,15 @@ static unsigned char i2c_op(struct sh_mobile_i2c_data *pd, enum sh_mobile_i2c_op
 		ret = iic_rd(pd, ICDR);
 		break;
 	case OP_RX_STOP: /* enable DTE interrupt, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
 	case OP_RX_STOP_DATA: /* enable DTE interrupt, read data, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		ret = iic_rd(pd, ICDR);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
@@ -429,7 +432,8 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 
 	if (wakeup) {
 		pd->sr |= SW_DONE;
-		wake_up(&pd->wait);
+		if (!pd->atomic_xfer)
+			wake_up(&pd->wait);
 	}
 
 	/* defeat write posting to avoid spurious WAIT interrupts */
@@ -581,6 +585,9 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
 	pd->pos = -1;
 	pd->sr = 0;
 
+	if (pd->atomic_xfer)
+		return;
+
 	pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
 	if (pd->dma_buf)
 		sh_mobile_i2c_xfer_dma(pd);
@@ -637,15 +644,13 @@ static int poll_busy(struct sh_mobile_i2c_data *pd)
 	return i ? 0 : -ETIMEDOUT;
 }
 
-static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
-			      struct i2c_msg *msgs,
-			      int num)
+static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
+			 struct i2c_msg *msgs, int num)
 {
-	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
 	struct i2c_msg	*msg;
 	int err = 0;
 	int i;
-	long timeout;
+	long time_left;
 
 	/* Wake up device and enable clock */
 	pm_runtime_get_sync(pd->dev);
@@ -662,15 +667,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		if (do_start)
 			i2c_op(pd, OP_START);
 
-		/* The interrupt handler takes care of the rest... */
-		timeout = wait_event_timeout(pd->wait,
-				       pd->sr & (ICSR_TACK | SW_DONE),
-				       adapter->timeout);
-
-		/* 'stop_after_dma' tells if DMA transfer was complete */
-		i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, pd->stop_after_dma);
+		if (pd->atomic_xfer) {
+			unsigned long j = jiffies + pd->adap.timeout;
+
+			time_left = time_before_eq(jiffies, j);
+			while (time_left &&
+			       !(pd->sr & (ICSR_TACK | SW_DONE))) {
+				unsigned char sr = iic_rd(pd, ICSR);
+
+				if (sr & (ICSR_AL   | ICSR_TACK |
+					  ICSR_WAIT | ICSR_DTE)) {
+					sh_mobile_i2c_isr(0, pd);
+					udelay(150);
+				} else {
+					cpu_relax();
+				}
+				time_left = time_before_eq(jiffies, j);
+			}
+		} else {
+			/* The interrupt handler takes care of the rest... */
+			time_left = wait_event_timeout(pd->wait,
+					pd->sr & (ICSR_TACK | SW_DONE),
+					pd->adap.timeout);
+
+			/* 'stop_after_dma' tells if DMA xfer was complete */
+			i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg,
+						 pd->stop_after_dma);
+		}
 
-		if (!timeout) {
+		if (!time_left) {
 			dev_err(pd->dev, "Transfer request timed out\n");
 			if (pd->dma_direction != DMA_NONE)
 				sh_mobile_i2c_cleanup_dma(pd);
@@ -696,14 +721,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 	return err ?: num;
 }
 
+static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
+			      struct i2c_msg *msgs,
+			      int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = false;
+	return sh_mobile_xfer(pd, msgs, num);
+}
+
+static int sh_mobile_i2c_xfer_atomic(struct i2c_adapter *adapter,
+				     struct i2c_msg *msgs,
+				     int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = true;
+	return sh_mobile_xfer(pd, msgs, num);
+}
+
 static u32 sh_mobile_i2c_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static const struct i2c_algorithm sh_mobile_i2c_algorithm = {
-	.functionality	= sh_mobile_i2c_func,
-	.master_xfer	= sh_mobile_i2c_xfer,
+	.functionality = sh_mobile_i2c_func,
+	.master_xfer = sh_mobile_i2c_xfer,
+	.master_xfer_atomic = sh_mobile_i2c_xfer_atomic,
 };
 
 static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
