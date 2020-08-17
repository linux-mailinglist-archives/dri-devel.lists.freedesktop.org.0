Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E82247FD9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F6589D02;
	Tue, 18 Aug 2020 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA766E079;
 Mon, 17 Aug 2020 09:17:20 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l60so7512392pjb.3;
 Mon, 17 Aug 2020 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=exYXzHUMf/iFSguNQmfag8NVMIwmEs2D9XqDGt6aa9s=;
 b=sp0LSuWIOb4/MJIas068i1WpBEM3xuHmLSe+GoqlRW4vIuITcNFJlJZEQ6Qrp7Gf8n
 6ZVCV1OINCx8t0WTqiL2c2t/g73ZusUr8ZD0u7//k2W+3P69SlufEUzmU5sCLgEHp84w
 yYp5Hp0oOcosUCxUvw9aTc0Gf+wAJMQldYs5DlgXSeVn+Q4cbUzMlxEGp7MBce0mjFxl
 Q5uA/NH5nqVh53jSmBqdxLG7n/3BQKjEJWUq/EbpLwSoODEaMoOj4MUW3Qcbs42qaS1D
 /vRxYXv8CpEx8JUXV/f5y9ACHSk0+6v8lT4AzuKQRJ4ziUkSyXhhGjH+ZnIuX/kGCFSG
 OdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=exYXzHUMf/iFSguNQmfag8NVMIwmEs2D9XqDGt6aa9s=;
 b=EJVDa7S0jwMvatfSJYETZl/GSZ/6Y2nHBvCyhPj3JrKzNKydaZSSeTgDSHj3zS83Ou
 yKvp+khfx2sCNWmjACAlTUI6eZQ0pQa3sCzfTW9ffC5OHuT2FgboAt9EcJar75KHpTbn
 Acap78K1ghVQ2uODUBvfxw4k1WEEt7Xl+inn2xUMT4ugpgisU6WsL9dFHDDXemKyO6m+
 NmVkecfm52Z6s2FOR66Ibm+eAaqo8Wm3lPnR9NEKIzj/vgSXDtuSDt0IyefRxdnnNQWO
 rAGcf4nrqxbOJ+Wb/TOdP+V6E/ZTTl54I/ncfVtRK/pBmmhEW7Vi/uJndMWaluUBKWi4
 mKCA==
X-Gm-Message-State: AOAM533CML0g6h9l2h0SyC6aJBlEZzCpsLr0zPc1dVdGlaI/8PjKdns7
 8hd3Hr2jji7Eh61ado6gFE8=
X-Google-Smtp-Source: ABdhPJyAMB+6G62oEcrfzb24DAgVNvD84uFYo9XA6NUaYrL1tECz8B9ZQEChkhePghU0D+aehqQc+g==
X-Received: by 2002:a17:90b:1287:: with SMTP id
 fw7mr7732879pjb.218.1597655840401; 
 Mon, 17 Aug 2020 02:17:20 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:17:19 -0700 (PDT)
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
Subject: [PATCH] driver: hv: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:45:58 +0530
Message-Id: <20200817091617.28119-4-allen.cryptic@gmail.com>
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
 drivers/hv/channel_mgmt.c | 3 +--
 drivers/hv/connection.c   | 4 ++--
 drivers/hv/hv.c           | 3 +--
 drivers/hv/hyperv_vmbus.h | 4 ++--
 drivers/hv/vmbus_drv.c    | 4 ++--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index 591106cf58fc..640fc1688d49 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -321,8 +321,7 @@ static struct vmbus_channel *alloc_channel(void)
 
 	INIT_LIST_HEAD(&channel->sc_list);
 
-	tasklet_init(&channel->callback_event,
-		     vmbus_on_event, (unsigned long)channel);
+	tasklet_setup(&channel->callback_event, vmbus_on_event);
 
 	hv_ringbuffer_pre_init(channel);
 
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 11170d9a2e1a..23e10ebecf5c 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -322,9 +322,9 @@ struct vmbus_channel *relid2channel(u32 relid)
  *    If this tasklet has been running for a long time
  *    then reschedule ourselves.
  */
-void vmbus_on_event(unsigned long data)
+void vmbus_on_event(struct tasklet_struct *t)
 {
-	struct vmbus_channel *channel = (void *) data;
+	struct vmbus_channel *channel = from_tasklet(channel, t, callback_event);
 	unsigned long time_limit = jiffies + 2;
 
 	trace_vmbus_on_event(channel);
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index da69338f92f5..91a0582387d6 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -96,8 +96,7 @@ int hv_synic_alloc(void)
 	for_each_present_cpu(cpu) {
 		hv_cpu = per_cpu_ptr(hv_context.cpu_context, cpu);
 
-		tasklet_init(&hv_cpu->msg_dpc,
-			     vmbus_on_msg_dpc, (unsigned long) hv_cpu);
+		tasklet_setup(&hv_cpu->msg_dpc, vmbus_on_msg_dpc);
 
 		hv_cpu->synic_message_page =
 			(void *)get_zeroed_page(GFP_ATOMIC);
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 40e2b9f91163..36199d8ea8c3 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -351,8 +351,8 @@ void vmbus_disconnect(void);
 
 int vmbus_post_msg(void *buffer, size_t buflen, bool can_sleep);
 
-void vmbus_on_event(unsigned long data);
-void vmbus_on_msg_dpc(unsigned long data);
+void vmbus_on_event(struct tasklet_struct *t);
+void vmbus_on_msg_dpc(struct tasklet_struct *t);
 
 int hv_kvp_init(struct hv_util_service *srv);
 void hv_kvp_deinit(void);
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 910b6e90866c..6b7987dac97a 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1043,9 +1043,9 @@ static void vmbus_onmessage_work(struct work_struct *work)
 	kfree(ctx);
 }
 
-void vmbus_on_msg_dpc(unsigned long data)
+void vmbus_on_msg_dpc(struct tasklet_struct *t)
 {
-	struct hv_per_cpu_context *hv_cpu = (void *)data;
+	struct hv_per_cpu_context *hv_cpu = from_tasklet(hv_cpu, t, msg_dpc);
 	void *page_addr = hv_cpu->synic_message_page;
 	struct hv_message *msg = (struct hv_message *)page_addr +
 				  VMBUS_MESSAGE_SINT;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
