Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD330247FD3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4513089CC1;
	Tue, 18 Aug 2020 07:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E876E0F8;
 Mon, 17 Aug 2020 09:20:29 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d19so7815147pgl.10;
 Mon, 17 Aug 2020 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QhPrNAdoeJw7hjMh0pGw+sjN4I+tDKGZ699gTXbu9Pc=;
 b=cTZNXtt7wNfV+e9cJ76fTsPPVQZeYJIEY2TuWXhYA+6rL5+mQtvGCpP7nLFEEHniIY
 ttRYkgElaSdYzjheNY+aJq+wt2TbwHocg2rHezNcVM8LeXUN8gM2nT5FPn17bkKOZJ/R
 FpcUeStKvy2IzIoPd11K1+w6c4p381QKwm4Dhy02AfZUx3SzHjBImZSC4gDgffWV6h+v
 8YTTF/IpemIy0SQFRYOlz4ZDOq/9HJmYTUqHCVWY4C5ejhmLcUfPEpCe73ql4ONWBhLK
 UZXD9rMiGnEuf0tCOKH/CAPFPO+ziHa24otJgykW+Fa09Aud/a6J7DqgcJ9+cKbuVreV
 L6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QhPrNAdoeJw7hjMh0pGw+sjN4I+tDKGZ699gTXbu9Pc=;
 b=svCyUqWx+naulMu2aXLdY6kYaBHeLIHB+TJyCWxo7jFl3MzbMOJlEe/wb6VK+mz/kk
 N2QcFzvVdweEXapcV751nckZTZcuDeRjM1fMUEKkeOVszWGjsnx83IlQnj0yxGKZ0+7F
 puM/6+05GiTun3UxPDz/zNIbiU75yNRV8NHaNI1V58J+VXBNv1cFc3t3YW8OedhjIG4j
 BTksgVupg8v+3voetnluvk/4ovi/7Ieh3pQoGEvpaEWVOcZFvbZlmNm3gKZ1Wfegi7Xe
 39rK5D5myhffqLfd0Y6Qvi6bBKfWovjty0DtrFsK8xBUQ5moGBu55xHi0dGOUcsuRuvI
 TknQ==
X-Gm-Message-State: AOAM532uQOO6aoBcDAFwxZLtbYhLAyT/WVJK53SxXbyYmwytuQo0qlF3
 L2CmqKg2ShoEYGiBNMsAMQk=
X-Google-Smtp-Source: ABdhPJzDyD/NrPXHKKUPdhhRODzrKgFhi3OcVBh0EqkEsk2AwP8x+cz/Kr8PlDriSCVb6p68quAdVw==
X-Received: by 2002:a63:4545:: with SMTP id u5mr9191366pgk.229.1597656028627; 
 Mon, 17 Aug 2020 02:20:28 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:20:28 -0700 (PDT)
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
Subject: [PATCH] platform: goldfish: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:46:12 +0530
Message-Id: <20200817091617.28119-18-allen.cryptic@gmail.com>
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
 drivers/platform/goldfish/goldfish_pipe.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index 1ab207ec9c94..b9bead07760c 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -577,10 +577,10 @@ static struct goldfish_pipe *signalled_pipes_pop_front(
 	return pipe;
 }
 
-static void goldfish_interrupt_task(unsigned long dev_addr)
+static void goldfish_interrupt_task(struct tasklet_struct *t)
 {
 	/* Iterate over the signalled pipes and wake them one by one */
-	struct goldfish_pipe_dev *dev = (struct goldfish_pipe_dev *)dev_addr;
+	struct goldfish_pipe_dev *dev = from_tasklet(dev, t, irq_tasklet);
 	struct goldfish_pipe *pipe;
 	int wakes;
 
@@ -811,8 +811,7 @@ static int goldfish_pipe_device_init(struct platform_device *pdev,
 {
 	int err;
 
-	tasklet_init(&dev->irq_tasklet, &goldfish_interrupt_task,
-		     (unsigned long)dev);
+	tasklet_setup(&dev->irq_tasklet, &goldfish_interrupt_task);
 
 	err = devm_request_irq(&pdev->dev, dev->irq,
 			       goldfish_pipe_interrupt,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
