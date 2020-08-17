Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87453247FDC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C63289D5C;
	Tue, 18 Aug 2020 07:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE45F6E0F8;
 Mon, 17 Aug 2020 09:20:00 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v15so7823085pgh.6;
 Mon, 17 Aug 2020 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lUWUV2v5oTJVUGMm6xf12JUfYyiWzcefGfdAtQk2jwM=;
 b=mbKVOHJMzNpskDzHydVD5JZdcRfrw+xd2+Uv78XbvKMc+387psZ2V2hk4qrHnsS81T
 /zH73TElq4axoclHQIy0bA2CbV9hfC8GYC+eakgtOktC3A5XsD2xiPjCrklKsR3XFyFd
 fsIOloQVGdK6RU/6EWDMjEAfDxSohJd//jLLtalmI0rGbeu1xwfLvpwSymywSxSBVX3G
 uhosJxEfiUcPuUNVJvS0yzIPELIzVumGhuE5Qx9Ojw3cmc6kmaA4ZQewhXRClGiu+tq2
 Aj/I10puZjlvAygrQvpRDOADkQfmJxn+4bXKvfXCvf9sZS7FhECvv/YiYSa/EN75dMVj
 0suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lUWUV2v5oTJVUGMm6xf12JUfYyiWzcefGfdAtQk2jwM=;
 b=goFuqeN2EwgYIq26nY9c5h9iG1S0E8L4m7MQcLAJFO/VNtblLlsosNVex0uV1RyZ9M
 WcoaoxoapSNnA4CuBtSV7JwGK4XVYLcjwQtBdcI9ciwSCE99nH+cu/jlX0LovQ4g2Y2K
 FermPpL3otgqfNryi3ky6IquPfAaABQ2J2NhOaQf8QO/2IDhqyJ9t0EikrcCWEBsmcfx
 NWqE1xa79i5cOi/JTcEgxzU4tZOuiifJtLvYxPNTYM8hOiKwCnc+HU9F5CF4VAVsWsak
 8sV5fgjbtZwDItNfrHIO/ve4Uq5hqL/OmiyVEnuQhnxHx3KHJ0KVAaLn84UUX3HpXKGm
 Yevw==
X-Gm-Message-State: AOAM532ziQYTtIrM2sL9iFmQL2Nolo2rFk+0SLBREQFMO6KrgXJzQP58
 kepZf+tDGNd1Nsh2ySrNwN4=
X-Google-Smtp-Source: ABdhPJxQcfdrrCrfZXVUBP2XgAqTEjdFaPRIHC7BcYbo0cXrAVQPSPy8pM2ZDmwAm4cu8q6kfjMCtw==
X-Received: by 2002:a62:7785:: with SMTP id
 s127mr10452297pfc.196.1597656000455; 
 Mon, 17 Aug 2020 02:20:00 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:19:59 -0700 (PDT)
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
Subject: [PATCH 1/2] misc: ibmvmc: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:46:10 +0530
Message-Id: <20200817091617.28119-16-allen.cryptic@gmail.com>
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
 drivers/misc/ibmvmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ibmvmc.c b/drivers/misc/ibmvmc.c
index 2d778d0f011e..347278c1a5e4 100644
--- a/drivers/misc/ibmvmc.c
+++ b/drivers/misc/ibmvmc.c
@@ -2064,10 +2064,10 @@ static void ibmvmc_handle_crq(struct ibmvmc_crq_msg *crq,
 	}
 }
 
-static void ibmvmc_task(unsigned long data)
+static void ibmvmc_task(struct tasklet_struct *t)
 {
-	struct crq_server_adapter *adapter =
-		(struct crq_server_adapter *)data;
+	struct crq_server_adapter *adapter = from_tasklet(adapter, t,
+							  work_task);
 	struct vio_dev *vdev = to_vio_dev(adapter->dev);
 	struct ibmvmc_crq_msg *crq;
 	int done = 0;
@@ -2150,7 +2150,7 @@ static int ibmvmc_init_crq_queue(struct crq_server_adapter *adapter)
 	queue->cur = 0;
 	spin_lock_init(&queue->lock);
 
-	tasklet_init(&adapter->work_task, ibmvmc_task, (unsigned long)adapter);
+	tasklet_setup(&adapter->work_task, ibmvmc_task);
 
 	if (request_irq(vdev->irq,
 			ibmvmc_handle_event,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
