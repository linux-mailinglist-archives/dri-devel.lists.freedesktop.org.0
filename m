Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE1247FE5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F7889D61;
	Tue, 18 Aug 2020 07:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A196E0F8;
 Mon, 17 Aug 2020 09:16:41 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id e4so7524702pjd.0;
 Mon, 17 Aug 2020 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nYi1qCRVXukm3Vys4Ax0zzpvhrxgpQ9/OWRIEzi7jMM=;
 b=mxWi/elPlQYhLXMLOAt36tJYQ+Hp1VAtd/uz+Kc8cIdiewSdg8n95X+KYxSdWGZJ1y
 /1rHnM4HvYeEmKOOLXL2wTqM2vSxMsb9VJZkfdrjZ8c8pWQ4rrQImtoKQ977EHgQ+THx
 Aa919IaWGz3+LC2CnAhGPcCnKZKjEcT2ftL3tbor1l7DdNN51bTmd6wf3G7Uglbn9gd3
 IvO4ciTbor+qNIHbn5ZnArhfiWQHMjs284hcUdKxz9v7/11dHOTVFY1ki+iFopZAQ166
 233J/wFqybY2SkuhDb0GHf7Xk3e7tw+qSNZabUjFckMBu8dhIwFr7uUw3BLLKtx0v0Fq
 3HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nYi1qCRVXukm3Vys4Ax0zzpvhrxgpQ9/OWRIEzi7jMM=;
 b=uaPkfB4T5hPFhd32wPZ//+gENq/ZaNYILTZZJg5kiKNqnjZcyzKgKOnzQ58yZUpRgZ
 /4l2v9zUBQkK3tP3C4VP/VYMunGUxAMF3F0eqoolGgq8ggTJuf84f1LLUjPz6DS2ioei
 5Za3YEm330KDjB0IOlT3kTBN/3QHlRXjq58byTL9o6DPl6jzHdbArEEnSdQ3JqzjAMz/
 Z3jkrRga0CqtdHrZO7GjJyeMdXouLTHu8ggDYVM1mA7et2spm/vCuLLPg2Skz7fWPMdq
 sxPTpN72e9Ja+nmxg6eIL9OZukhEJ2YuDKu0gxxvUW2VSrt+I0z87+jKjo2fyvJbsHPA
 zrog==
X-Gm-Message-State: AOAM530SfSv7+VScP93CT6hH9de1bvGu+MQ1skUTN6VSiFqqvqZL0pe5
 wKtZloXsaLyOOZ0NPSajC7E=
X-Google-Smtp-Source: ABdhPJx+wEvCOSvKZxezpdY6lLs7UvfZeX3QH5NUsgJeM5vKZGxtJnJRJpZ8+dEdqnJdMBLPa9KLfg==
X-Received: by 2002:a17:902:8495:: with SMTP id
 c21mr10840498plo.82.1597655800670; 
 Mon, 17 Aug 2020 02:16:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:16:39 -0700 (PDT)
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
Subject: [PATCH] arch: um: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:45:55 +0530
Message-Id: <20200817091617.28119-1-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 arch/um/drivers/vector_kern.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 8735c468230a..06980870ae23 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1196,9 +1196,9 @@ static int vector_net_close(struct net_device *dev)
 
 /* TX tasklet */
 
-static void vector_tx_poll(unsigned long data)
+static void vector_tx_poll(struct tasklet_struct *t)
 {
-	struct vector_private *vp = (struct vector_private *)data;
+	struct vector_private *vp = from_tasklet(vp, t, tx_poll);
 
 	vp->estats.tx_kicks++;
 	vector_send(vp->tx_queue);
@@ -1629,7 +1629,7 @@ static void vector_eth_configure(
 	});
 
 	dev->features = dev->hw_features = (NETIF_F_SG | NETIF_F_FRAGLIST);
-	tasklet_init(&vp->tx_poll, vector_tx_poll, (unsigned long)vp);
+	tasklet_setup(&vp->tx_poll, vector_tx_poll);
 	INIT_WORK(&vp->reset_tx, vector_reset_tx);
 
 	timer_setup(&vp->tl, vector_timer_expire, 0);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
