Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C9507376
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0614710F0DA;
	Tue, 19 Apr 2022 16:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531E910F0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD2AB6186B;
 Tue, 19 Apr 2022 16:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C57C385AD;
 Tue, 19 Apr 2022 16:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386559;
 bh=6qz24JeYkT/szoUulUC11ktMbSMxaia2ZM53W0WWa5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQbcZhU1YyaWiVoymRlCpzVRaDV6+oOUhic1Kg4DXMriEEdQTb3Ol248UgeiguRcV
 AADXBOzx4zqgQNOk8kqSzTZHT8QIWeMxKyU23zO+RJE2VESVS0XI60vTW/g7muIAwS
 8PC9xUtDQIiLYabZtjUMpFcY4iEN8SE8ABotebLwqZt2mev8Theryu21oiciT6uNJG
 jkegeWr772BxLlRDA+zY95CIesNGVFaK7EjAjyLas9VMV8jQ2YcKVPWTYE+Of1svA5
 xXLxVX0vDq/uA9rastXjDbWACQcopxN6Tk8sAWc6oesLyUD/wEISCwtksws8Opfw6K
 j1eP3Wy/Abdpw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 29/48] Input: wm97xx - switch to using threaded IRQ
Date: Tue, 19 Apr 2022 18:37:51 +0200
Message-Id: <20220419163810.2118169-30-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Instead of manually disabling and enabling interrupts and scheduling work
to access the device, let's use threaded oneshot interrupt handler. It
simplifies things.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/wm97xx-core.c | 42 +++++--------------------
 include/linux/wm97xx.h                  |  1 -
 2 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 1b58611c8084..2757c7768ffe 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -285,11 +285,12 @@ void wm97xx_set_suspend_mode(struct wm97xx *wm, u16 mode)
 EXPORT_SYMBOL_GPL(wm97xx_set_suspend_mode);
 
 /*
- * Handle a pen down interrupt.
+ * Codec PENDOWN irq handler
+ *
  */
-static void wm97xx_pen_irq_worker(struct work_struct *work)
+static irqreturn_t wm97xx_pen_interrupt(int irq, void *dev_id)
 {
-	struct wm97xx *wm = container_of(work, struct wm97xx, pen_event_work);
+	struct wm97xx *wm = dev_id;
 	int pen_was_down = wm->pen_is_down;
 
 	/* do we need to enable the touch panel reader */
@@ -343,27 +344,6 @@ static void wm97xx_pen_irq_worker(struct work_struct *work)
 	if (!wm->pen_is_down && wm->mach_ops->acc_enabled)
 		wm->mach_ops->acc_pen_up(wm);
 
-	wm->mach_ops->irq_enable(wm, 1);
-}
-
-/*
- * Codec PENDOWN irq handler
- *
- * We have to disable the codec interrupt in the handler because it
- * can take up to 1ms to clear the interrupt source. We schedule a task
- * in a work queue to do the actual interaction with the chip.  The
- * interrupt is then enabled again in the slow handler when the source
- * has been cleared.
- */
-static irqreturn_t wm97xx_pen_interrupt(int irq, void *dev_id)
-{
-	struct wm97xx *wm = dev_id;
-
-	if (!work_pending(&wm->pen_event_work)) {
-		wm->mach_ops->irq_enable(wm, 0);
-		queue_work(wm->ts_workq, &wm->pen_event_work);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -374,12 +354,9 @@ static int wm97xx_init_pen_irq(struct wm97xx *wm)
 {
 	u16 reg;
 
-	/* If an interrupt is supplied an IRQ enable operation must also be
-	 * provided. */
-	BUG_ON(!wm->mach_ops->irq_enable);
-
-	if (request_irq(wm->pen_irq, wm97xx_pen_interrupt, IRQF_SHARED,
-			"wm97xx-pen", wm)) {
+	if (request_threaded_irq(wm->pen_irq, NULL, wm97xx_pen_interrupt,
+				 IRQF_SHARED | IRQF_ONESHOT,
+				 "wm97xx-pen", wm)) {
 		dev_err(wm->dev,
 			"Failed to register pen down interrupt, polling");
 		wm->pen_irq = 0;
@@ -509,7 +486,6 @@ static int wm97xx_ts_input_open(struct input_dev *idev)
 	wm->codec->dig_enable(wm, 1);
 
 	INIT_DELAYED_WORK(&wm->ts_reader, wm97xx_ts_reader);
-	INIT_WORK(&wm->pen_event_work, wm97xx_pen_irq_worker);
 
 	wm->ts_reader_min_interval = HZ >= 100 ? HZ / 100 : 1;
 	if (wm->ts_reader_min_interval < 1)
@@ -560,10 +536,6 @@ static void wm97xx_ts_input_close(struct input_dev *idev)
 
 	wm->pen_is_down = 0;
 
-	/* Balance out interrupt disables/enables */
-	if (cancel_work_sync(&wm->pen_event_work))
-		wm->mach_ops->irq_enable(wm, 1);
-
 	/* ts_reader rearms itself so we need to explicitly stop it
 	 * before we destroy the workqueue.
 	 */
diff --git a/include/linux/wm97xx.h b/include/linux/wm97xx.h
index 462854f4f286..85bd8dd3caea 100644
--- a/include/linux/wm97xx.h
+++ b/include/linux/wm97xx.h
@@ -281,7 +281,6 @@ struct wm97xx {
 	unsigned long ts_reader_min_interval; /* Minimum interval */
 	unsigned int pen_irq;		/* Pen IRQ number in use */
 	struct workqueue_struct *ts_workq;
-	struct work_struct pen_event_work;
 	u16 acc_slot;			/* AC97 slot used for acc touch data */
 	u16 acc_rate;			/* acc touch data rate */
 	unsigned pen_is_down:1;		/* Pen is down */
-- 
2.29.2

