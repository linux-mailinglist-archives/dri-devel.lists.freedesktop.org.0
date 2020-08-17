Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4920247FE2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21F689D3E;
	Tue, 18 Aug 2020 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0996E0F8;
 Mon, 17 Aug 2020 09:19:04 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x6so7812161pgx.12;
 Mon, 17 Aug 2020 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H53NItB96hhK0lZMvS5UWr62MZO4kDlJxK+OZQUxxIA=;
 b=Q9//06PpCdzBcB5+2FmR3vcPX8ASc3s+ZqMBFaeRwEkDMjoO3ubFfEuRDvNyw69Dic
 A+UvP5p7Sa7LwPskN9TiPkDaTIGuH2iea/lkrw98pDSnGmsaUfJX37kbIJa1u46YHB5f
 Biss505SKwh0HAGB5MaLRxgXu1CO2EwXczixBc538BCK83Jyz086JRCbTSXgutB7e4FX
 /W9NvIU4fSh/Ib/tv7t7BztqxaZ4vcJQgOiXTE1ktzbLpdXGu8a6uU6wMvjuhA4hl/Yv
 klgo2KrIpjJmP8zUsX/rM/tO2Wej91r/JteBk1SMuYF1iBTXfyMg4piAFIrY2mqWn3/s
 KsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H53NItB96hhK0lZMvS5UWr62MZO4kDlJxK+OZQUxxIA=;
 b=Xjf69nyaFiOW4ugVp5puY5Vv5n+qceujznAlgI82+iyccQb65+1xnIFI6NuflFanVr
 y5KKRSRDyRVpcA/ONZIncpZykYj4GPpNyYWAyg57o7IvI/OXdZ9xVg1ktNyWLxc07EIO
 Qvar1B0NVqY+CqQ3kfwOdP+HOh3aMjUp2PufWr5ZUE/WpZ8YBeEwiUlA9ZDT9U7yLb9g
 HbxeWusTUS4vKSizwX1X6FUyuhR/dDCAIbwmmiDq0sdR0/7r6612PmueRiGR96nveeU+
 rFHSqCRM9tJVQu8BYYCShflCsv93wSLB5NegmuOeFKdqGJGRmo9ZTvWrfpklEO7Hqsbf
 yEAA==
X-Gm-Message-State: AOAM533iDbC9fZC5ZyShr+MrWtgYJSZgc+C39WuklK1cncOhESjZFPbh
 Z0TMJ6j157j22KLN3ixZA2Q=
X-Google-Smtp-Source: ABdhPJwwv5IFUmxu6OFvp0ePee/WauDvfAGFpW7BnuWSsn7pFfdtUZETkOuz5u6jMhvkrLcgz5ASfg==
X-Received: by 2002:a63:5552:: with SMTP id f18mr8843602pgm.298.1597655944120; 
 Mon, 17 Aug 2020 02:19:04 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:19:03 -0700 (PDT)
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
Subject: [PATCH 1/2] hsi: nokia-modem: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:46:06 +0530
Message-Id: <20200817091617.28119-12-allen.cryptic@gmail.com>
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
 drivers/hsi/clients/nokia-modem.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hsi/clients/nokia-modem.c b/drivers/hsi/clients/nokia-modem.c
index cd7ebf4c2e2f..36d373f089ce 100644
--- a/drivers/hsi/clients/nokia-modem.c
+++ b/drivers/hsi/clients/nokia-modem.c
@@ -36,9 +36,10 @@ struct nokia_modem_device {
 	struct hsi_client	*cmt_speech;
 };
 
-static void do_nokia_modem_rst_ind_tasklet(unsigned long data)
+static void do_nokia_modem_rst_ind_tasklet(struct tasklet_struct *t)
 {
-	struct nokia_modem_device *modem = (struct nokia_modem_device *)data;
+	struct nokia_modem_device *modem = from_tasklet(modem, t,
+						nokia_modem_rst_ind_tasklet);
 
 	if (!modem)
 		return;
@@ -155,8 +156,8 @@ static int nokia_modem_probe(struct device *dev)
 	modem->nokia_modem_rst_ind_irq = irq;
 	pflags = irq_get_trigger_type(irq);
 
-	tasklet_init(&modem->nokia_modem_rst_ind_tasklet,
-			do_nokia_modem_rst_ind_tasklet, (unsigned long)modem);
+	tasklet_setup(&modem->nokia_modem_rst_ind_tasklet,
+			do_nokia_modem_rst_ind_tasklet);
 	err = devm_request_irq(dev, irq, nokia_modem_rst_ind_isr,
 				pflags, "modem_rst_ind", modem);
 	if (err < 0) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
