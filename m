Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520DD247FD0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2BB89C9C;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6056E079;
 Mon, 17 Aug 2020 09:17:32 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id i92so7691490pje.0;
 Mon, 17 Aug 2020 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UG2QYTpQjXlotAWADPceeuZ+a4WccgODIdL2SjgoSFk=;
 b=ZeVN/cVui5hARZlV9DLrMIOor7bXGKxDQb3si3ZQHQtGAl+gyHm5RQmQAm+U8a868z
 SfhKCHilsvyZ8k65l+2WpkyRlkzWLDL/jfYAeWhxcLcKyqTMuvwWxny/I711b9K6Ka/c
 qU19D1f4ygPSCnzBkg7vnGsSmAqIN+KJ9YD5vRaZDkEYRec7BEeXUloXtSSjP/h0zdD2
 y8iQKaxZSkBypYVJgugn93siIydTKHNU7nKLc7byOFPl1yL+XlGMjxhnt+Sl4x0xg8E7
 THDBMvKb4FAxdRAPTEm+7Oc0febnTEszLxJacN6Rex2mxZy8ETX+RYUFKr21pcddTk/u
 LBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UG2QYTpQjXlotAWADPceeuZ+a4WccgODIdL2SjgoSFk=;
 b=qHdTTvs88zpmLiRVi2w0N5GvirkMs9Q6Y9dfzHtdqxBGppcpTta1t7EOHe0Ml6rEC3
 4gLXjlu/nP32Xptoahah+khSjAhvm2wpp1lWGBNhK9oXuwWf+JmgONi/DHcWiok4xVLR
 kPU8+QeyY0snXjYls1/mcEntECDH308wMwcBHTIk2UJfUBr3KZde3DX7Rv474xFjnRfx
 /mkuRYd9fLkUXVERSBMrNIGOcvf66vb3EjCIscNazMkDCfwt/FyBhmK2QgvHKYa2bC7k
 bat2Ee1CVi2oZWuxX5YO1SvwGHScCjuLkdI3tSXZIJwUN+oFpWXT784M3yXlU85lF0hV
 PReg==
X-Gm-Message-State: AOAM5320tLovuSGfkDXzGJEZTekRTdZYwg20H2FgqZ6cBKoX3ZoztbvZ
 Two/ZRYDUsuNrkbUmDFxtck=
X-Google-Smtp-Source: ABdhPJwBbiijKUiPwWYDQLbl/zO2PUmpUuyYq3nZYKVN2sTG8ZtBy9G/bOlO3xG/4Ws7FpssYE/UHQ==
X-Received: by 2002:a17:90a:3ae1:: with SMTP id
 b88mr11550846pjc.156.1597655852504; 
 Mon, 17 Aug 2020 02:17:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:17:31 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 3chas3@gmail.com, axboe@kernel.dk, stefanr@s5r6.in-berlin.de,
 airlied@linux.ie, daniel@ffwll.ch, sre@kernel.org,
 James.Bottomley@HansenPartnership.com, kys@microsoft.com, deller@gmx.de,
 dmitry.torokhov@gmail.com, jassisinghbrar@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, maximlevitsky@gmail.com, oakad@yahoo.com,
 ulf.hansson@linaro.org, mporter@kernel.crashing.org, alex.bou9@gmail.com,
 broonie@kernel.org, martyn@welchs.me.uk, manohar.vanga@gmail.com,
 mitch@sfgoth.com, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH] drivers: atm: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:45:59 +0530
Message-Id: <20200817091617.28119-5-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817091617.28119-1-allen.cryptic@gmail.com>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 keescook@chromium.org, linux-parisc@vger.kernel.org,
 linux-ntb@googlegroups.com, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-atm-general@lists.sourceforge.net,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-block@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/atm/eni.c       |  9 +++++----
 drivers/atm/fore200e.c  | 14 +++++++-------
 drivers/atm/he.c        |  8 ++++----
 drivers/atm/solos-pci.c |  8 ++++----
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/atm/eni.c b/drivers/atm/eni.c
index 39be444534d0..540edea0ad7a 100644
--- a/drivers/atm/eni.c
+++ b/drivers/atm/eni.c
@@ -1521,10 +1521,11 @@ static irqreturn_t eni_int(int irq,void *dev_id)
 }
 
 
-static void eni_tasklet(unsigned long data)
+static void eni_tasklet(struct tasklet_struct *t)
 {
-	struct atm_dev *dev = (struct atm_dev *) data;
-	struct eni_dev *eni_dev = ENI_DEV(dev);
+	struct eni_dev *eni_dev = from_tasklet(eni_dev, t, task);
+	struct atm_dev *dev = container_of((void *)eni_dev, typeof(*dev),
+					  dev_data);
 	unsigned long flags;
 	u32 events;
 
@@ -1838,7 +1839,7 @@ static int eni_start(struct atm_dev *dev)
 	     eni_dev->vci,eni_dev->rx_dma,eni_dev->tx_dma,
 	     eni_dev->service,buf);
 	spin_lock_init(&eni_dev->lock);
-	tasklet_init(&eni_dev->task,eni_tasklet,(unsigned long) dev);
+	tasklet_setup(&eni_dev->task,eni_tasklet);
 	eni_dev->events = 0;
 	/* initialize memory management */
 	buffer_mem = eni_dev->mem - (buf - eni_dev->ram);
diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index a81bc49c14ac..8c6226b50e4d 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -1180,9 +1180,9 @@ fore200e_interrupt(int irq, void* dev)
 
 #ifdef FORE200E_USE_TASKLET
 static void
-fore200e_tx_tasklet(unsigned long data)
+fore200e_tx_tasklet(struct tasklet_struct *t)
 {
-    struct fore200e* fore200e = (struct fore200e*) data;
+    struct fore200e* fore200e = from_tasklet(fore200e, t, tx_tasklet);
     unsigned long flags;
 
     DPRINTK(3, "tx tasklet scheduled for device %d\n", fore200e->atm_dev->number);
@@ -1194,15 +1194,15 @@ fore200e_tx_tasklet(unsigned long data)
 
 
 static void
-fore200e_rx_tasklet(unsigned long data)
+fore200e_rx_tasklet(struct tasklet_struct *t)
 {
-    struct fore200e* fore200e = (struct fore200e*) data;
+    struct fore200e* fore200e = from_tasklet(fore200e, t, rx_tasklet);
     unsigned long    flags;
 
     DPRINTK(3, "rx tasklet scheduled for device %d\n", fore200e->atm_dev->number);
 
     spin_lock_irqsave(&fore200e->q_lock, flags);
-    fore200e_rx_irq((struct fore200e*) data);
+    fore200e_rx_irq(fore200e);
     spin_unlock_irqrestore(&fore200e->q_lock, flags);
 }
 #endif
@@ -1943,8 +1943,8 @@ static int fore200e_irq_request(struct fore200e *fore200e)
 	   fore200e_irq_itoa(fore200e->irq), fore200e->name);
 
 #ifdef FORE200E_USE_TASKLET
-    tasklet_init(&fore200e->tx_tasklet, fore200e_tx_tasklet, (unsigned long)fore200e);
-    tasklet_init(&fore200e->rx_tasklet, fore200e_rx_tasklet, (unsigned long)fore200e);
+    tasklet_setup(&fore200e->tx_tasklet, fore200e_tx_tasklet);
+    tasklet_setup(&fore200e->rx_tasklet, fore200e_rx_tasklet);
 #endif
 
     fore200e->state = FORE200E_STATE_IRQ;
diff --git a/drivers/atm/he.c b/drivers/atm/he.c
index 8af793f5e811..9c36fea4336f 100644
--- a/drivers/atm/he.c
+++ b/drivers/atm/he.c
@@ -100,7 +100,7 @@ static void he_close(struct atm_vcc *vcc);
 static int he_send(struct atm_vcc *vcc, struct sk_buff *skb);
 static int he_ioctl(struct atm_dev *dev, unsigned int cmd, void __user *arg);
 static irqreturn_t he_irq_handler(int irq, void *dev_id);
-static void he_tasklet(unsigned long data);
+static void he_tasklet(struct tasklet_struct *t);
 static int he_proc_read(struct atm_dev *dev,loff_t *pos,char *page);
 static int he_start(struct atm_dev *dev);
 static void he_stop(struct he_dev *dev);
@@ -383,7 +383,7 @@ static int he_init_one(struct pci_dev *pci_dev,
 	he_dev->atm_dev->dev_data = he_dev;
 	atm_dev->dev_data = he_dev;
 	he_dev->number = atm_dev->number;
-	tasklet_init(&he_dev->tasklet, he_tasklet, (unsigned long) he_dev);
+	tasklet_setup(&he_dev->tasklet, he_tasklet);
 	spin_lock_init(&he_dev->global_lock);
 
 	if (he_start(atm_dev)) {
@@ -1925,10 +1925,10 @@ he_service_rbpl(struct he_dev *he_dev, int group)
 }
 
 static void
-he_tasklet(unsigned long data)
+he_tasklet(struct tasklet_struct *t)
 {
 	unsigned long flags;
-	struct he_dev *he_dev = (struct he_dev *) data;
+	struct he_dev *he_dev = from_tasklet(he_dev, t, tasklet);
 	int group, type;
 	int updated = 0;
 
diff --git a/drivers/atm/solos-pci.c b/drivers/atm/solos-pci.c
index 94fbc3abe60e..f44e1880cb74 100644
--- a/drivers/atm/solos-pci.c
+++ b/drivers/atm/solos-pci.c
@@ -167,7 +167,7 @@ static struct atm_vcc* find_vcc(struct atm_dev *dev, short vpi, int vci);
 static int atm_init(struct solos_card *, struct device *);
 static void atm_remove(struct solos_card *);
 static int send_command(struct solos_card *card, int dev, const char *buf, size_t size);
-static void solos_bh(unsigned long);
+static void solos_bh(struct tasklet_struct *t);
 static int print_buffer(struct sk_buff *buf);
 
 static inline void solos_pop(struct atm_vcc *vcc, struct sk_buff *skb)
@@ -754,9 +754,9 @@ static irqreturn_t solos_irq(int irq, void *dev_id)
 	return IRQ_RETVAL(handled);
 }
 
-static void solos_bh(unsigned long card_arg)
+static void solos_bh(struct tasklet_struct *t)
 {
-	struct solos_card *card = (void *)card_arg;
+	struct solos_card *card = from_tasklet(card, t, tlet);
 	uint32_t card_flags;
 	uint32_t rx_done = 0;
 	int port;
@@ -1294,7 +1294,7 @@ static int fpga_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	pci_set_drvdata(dev, card);
 
-	tasklet_init(&card->tlet, solos_bh, (unsigned long)card);
+	tasklet_setup(&card->tlet, solos_bh);
 	spin_lock_init(&card->tx_lock);
 	spin_lock_init(&card->tx_queue_lock);
 	spin_lock_init(&card->cli_queue_lock);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
