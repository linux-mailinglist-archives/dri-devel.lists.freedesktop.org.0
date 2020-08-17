Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA6247FEE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9C89DDF;
	Tue, 18 Aug 2020 07:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77076E079;
 Mon, 17 Aug 2020 09:17:07 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id d4so7394344pjx.5;
 Mon, 17 Aug 2020 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uZ+1GKxChp21LTxKeZeHItaYyTUEZmeDAjJJ3IuyUSU=;
 b=QOU3It2wstSJQ8rTV/fRKD6g3FxnjKR7x+Yn8XhXibiXjd9f+wMUX06FxPTeJckaOy
 b461ZvK+YUE+a4MgqglsIfnmBh1hfgw+OcprCrJKfwn6S7iF4u002CSD866ly3D9ewzl
 KZefKfGEV/Ayb6cOaQMdIuFxRgOzaQ6p54wUjWaECLiKBrgQHy3tV6AeZbifktOme+eH
 NjF7sOjZeNi5IMHEZbD9MOiEmhtBLqVvzb4547MxWG8lXsvmAhu3YelPfx4zHgGe28Jc
 2XbbfK00LrxN/7E2T3xL/1NXOWZUugF7t8FyOW2q/Qb6jXYDE7eKIouYXUKYiMSgzqKW
 ix0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uZ+1GKxChp21LTxKeZeHItaYyTUEZmeDAjJJ3IuyUSU=;
 b=NSsr9SYg8hpCWwOD1phaR2GBAqUfoXB/OhzFtFE96c34DL46xT5wymR6yzi8G23syQ
 EM3wglQ9ghnNeINptYxAjhlZuiU29GL6RK1M5qggkqM8sdOfpWD5QRkP/4+t5GQrY9nc
 VpZD4dfcwOEugkpb/XHbCF8o59IeJX72pFhUhcuPoFEtsdSEK58f8UmMf0wsIS/8KmxY
 fH5MuEE/29uvWW/kt0Lr4ESf/XnzTtm1YmCrSaP7oj+Ves3z/plodGhzxSs3xK84FZdd
 s9lD7iWpooNufebtC8Bp1f7JBPCp/Z15f/rsCH9+NRCYYAaDlDJSvfeynDMA3wwi7La7
 DmBQ==
X-Gm-Message-State: AOAM531kwoYU5NDsbg0ysXNqx9X0RkgauAeT5juxOIc5ehnJUaf/8ZQD
 yGWn+MOWPfQshIBeIJkRmNA=
X-Google-Smtp-Source: ABdhPJwXoSwxxXkSke3l7PujHUMjPUXY5EKX6zhSfgL0hCl2GRP8rzNL2p+R0J7BH7wXM281JFEI2Q==
X-Received: by 2002:a17:90a:3948:: with SMTP id
 n8mr8798780pjf.156.1597655827403; 
 Mon, 17 Aug 2020 02:17:07 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:17:06 -0700 (PDT)
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
Subject: [PATCH] char: ipmi: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:45:57 +0530
Message-Id: <20200817091617.28119-3-allen.cryptic@gmail.com>
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
 drivers/char/ipmi/ipmi_msghandler.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 737c0b6b24ea..e1814b6a1225 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -39,7 +39,7 @@
 
 static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
 static int ipmi_init_msghandler(void);
-static void smi_recv_tasklet(unsigned long);
+static void smi_recv_tasklet(struct tasklet_struct *t);
 static void handle_new_recv_msgs(struct ipmi_smi *intf);
 static void need_waiter(struct ipmi_smi *intf);
 static int handle_one_recv_msg(struct ipmi_smi *intf,
@@ -3430,9 +3430,8 @@ int ipmi_add_smi(struct module         *owner,
 	intf->curr_seq = 0;
 	spin_lock_init(&intf->waiting_rcv_msgs_lock);
 	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
-	tasklet_init(&intf->recv_tasklet,
-		     smi_recv_tasklet,
-		     (unsigned long) intf);
+	tasklet_setup(&intf->recv_tasklet,
+		     smi_recv_tasklet);
 	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
 	spin_lock_init(&intf->xmit_msgs_lock);
 	INIT_LIST_HEAD(&intf->xmit_msgs);
@@ -4467,10 +4466,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
 	}
 }
 
-static void smi_recv_tasklet(unsigned long val)
+static void smi_recv_tasklet(struct tasklet_struct *t)
 {
 	unsigned long flags = 0; /* keep us warning-free. */
-	struct ipmi_smi *intf = (struct ipmi_smi *) val;
+	struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
 	int run_to_completion = intf->run_to_completion;
 	struct ipmi_smi_msg *newmsg = NULL;
 
@@ -4542,7 +4541,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
 
 	if (run_to_completion)
-		smi_recv_tasklet((unsigned long) intf);
+		smi_recv_tasklet(&intf->recv_tasklet);
 	else
 		tasklet_schedule(&intf->recv_tasklet);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
