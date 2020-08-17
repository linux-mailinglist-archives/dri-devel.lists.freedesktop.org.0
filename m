Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF7247FCF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21EA89C9B;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AAC6E0F8;
 Mon, 17 Aug 2020 09:17:45 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t6so7405118pjr.0;
 Mon, 17 Aug 2020 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mo6iICj1w8TKwOisUCBNzTZG5p5dM66mXRaY4cwKyZk=;
 b=TzbwEFTqX0QCsBFflLiO6trddpNRzDxFXlyalb8p8shAuNzSqnVRPY8vMtBs1W5gGO
 YUc9r1hZWkAsv9H25E5N7kwqFWChbTSHzlTwFhWkQtf63DEW68snGk4kLIJ5B50DmJxW
 MWiO1udraHvmpV1CUmZxnsCDK3iuigHsru9yj+Oquzzzyly4+EM9iRLcN2KRuZWEdlkQ
 fk0Czl4+kqYHd4k4r0smEt/HwPMvVApbc9poEuzVer5sNiD49xlJWmv3Z+GjWTQ1m5b+
 aFLAe1vugsFxn+AMoHEAGT8072rZH7m2jZyN/wKgUUmGiQtrTmT5nZIW44CYFt5Ph9RF
 ifXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Mo6iICj1w8TKwOisUCBNzTZG5p5dM66mXRaY4cwKyZk=;
 b=A0aMow6vJ2eY9DqWcssFiELl7G91ZQNc6M444zYR+IGmgcfM/r7UUZRK4pR2y3LTMI
 BtNUgf5rKKAKM15bDoBQYdoO5Gv+qrfubkom9Nu4ZiZLnGR0Dox3NS+r1V/2zc8SDQRN
 Ikq98/QGrHN01Lcfqqqh57RycxsR0gDc/aKi4bdDuDAWa0Pni5YWbd3JPxnBU3rjfpYt
 /qODptzYTlIgIZ7Ep6GEVZ5U8YZgSclx2+So7HV+cNubbSNKFiedczZ0eDstQOA7hRVb
 WHSbHghs8nc3KXg+KCHtDU3VswdPaFiRTT/F5eJ+hZ4yI0g3oNOTDjE5sOeC4LoEHdty
 ryIg==
X-Gm-Message-State: AOAM531Uo7eg7auFh3XrytjALokDtLfpOJn1QI3w3c9egmmfHBO+DNwt
 nVxIsLojUQUwP6sZZKzm1Go=
X-Google-Smtp-Source: ABdhPJwq6UEku9ZvxUlcSd9v3lLdDcS44qfn7fyf+CsiORE4iW8DsxOdwJSiRT3OcMi8Q3GfQoOtrg==
X-Received: by 2002:a17:90a:2210:: with SMTP id
 c16mr12286360pje.65.1597655865119; 
 Mon, 17 Aug 2020 02:17:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:17:44 -0700 (PDT)
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
Subject: [PATCH] drivers: ntb: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:46:00 +0530
Message-Id: <20200817091617.28119-6-allen.cryptic@gmail.com>
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
 drivers/ntb/ntb_transport.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
index e6d1f5b298f3..ab3bee2fc803 100644
--- a/drivers/ntb/ntb_transport.c
+++ b/drivers/ntb/ntb_transport.c
@@ -273,7 +273,7 @@ enum {
 #define NTB_QP_DEF_NUM_ENTRIES	100
 #define NTB_LINK_DOWN_TIMEOUT	10
 
-static void ntb_transport_rxc_db(unsigned long data);
+static void ntb_transport_rxc_db(struct tasklet_struct *t);
 static const struct ntb_ctx_ops ntb_transport_ops;
 static struct ntb_client ntb_transport_client;
 static int ntb_async_tx_submit(struct ntb_transport_qp *qp,
@@ -1234,8 +1234,7 @@ static int ntb_transport_init_queue(struct ntb_transport_ctx *nt,
 	INIT_LIST_HEAD(&qp->rx_free_q);
 	INIT_LIST_HEAD(&qp->tx_free_q);
 
-	tasklet_init(&qp->rxc_db_work, ntb_transport_rxc_db,
-		     (unsigned long)qp);
+	tasklet_setup(&qp->rxc_db_work, ntb_transport_rxc_db);
 
 	return 0;
 }
@@ -1685,9 +1684,9 @@ static int ntb_process_rxc(struct ntb_transport_qp *qp)
 	return 0;
 }
 
-static void ntb_transport_rxc_db(unsigned long data)
+static void ntb_transport_rxc_db(struct tasklet_struct *t)
 {
-	struct ntb_transport_qp *qp = (void *)data;
+	struct ntb_transport_qp *qp = from_tasklet(qp, t, rxc_db_work);
 	int rc, i;
 
 	dev_dbg(&qp->ndev->pdev->dev, "%s: doorbell %d received\n",
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
