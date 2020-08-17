Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47A247FCA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E88D89C80;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31DE6E513;
 Mon, 17 Aug 2020 09:18:25 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j21so7815113pgi.9;
 Mon, 17 Aug 2020 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FQvu3zIKHcfDVUfKtSNhAC6ZzQDedEm/LuwK8bWrPeg=;
 b=D7eDa0sTjwHCA8r6MCWSFMRxFQkDRfX7e4fguBwE+NqCdLaBdvT8ONpLvgzAjxtVQT
 0ppL357zpK2cqmejsnz5VEqE9kmyIvsp/43Twv5a9NzWcoSYF0wGizjZ9zjUOZUarpa6
 Rc3XCG4Wm/C+XLOLCzBVfdIXQ90RWb8AEOKqZXhdPJ/NfRn3hfLtGberOYeprAHUwSJQ
 ulOOErg41MiOj1g2LNgno+3QMivuYXqc4mkuyqq2LhWdKpn3CpDymg1ZrwPxHiavkADA
 aWCo+QxkF5OeKgNSC4ix5Pl06VUDNeICDFdGAyaW4Q4qIj4LQJvAqaJseGgPjYZCbCYI
 stcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FQvu3zIKHcfDVUfKtSNhAC6ZzQDedEm/LuwK8bWrPeg=;
 b=DEt4v6ZJpxAXtOt2UbAsEpuwuxOydNSuFVZEaSwExP5cftuaOZXUI4DYkIi6GYPV9x
 cPZct70h+XDOOPIU4DliKwC4W8K+yv80UjzH9cMDv7d0CnFZwWU7CGq+YFYqtM6uqV/g
 eebdDUboPIv0jeYXf3MdK44HYk2VTqeaO+5gQe6v8KHYVLk24csAjzWXuurVR6NiKOJC
 /WHzktAQnwIdCv0HR+Eb3g5S3s0zXHbqsMfPG9qF3gg0MTgWzVN5tCF5FotZttbr8y7C
 1ktB0lvweObdvIMdWI/3Py17jAVwQr0YVD4/lcyJnqduRx3OXa5OmebGzkR9H9NCbh9r
 c11A==
X-Gm-Message-State: AOAM532efDbc90hvcosM+lIlgvCmAR0MyjmBsBIfiAn51pl5r6XHUizo
 HtK1dHp0FTMkpAl09mfIh78=
X-Google-Smtp-Source: ABdhPJwtRhOmhjCwN7IXEf1tWrXGn9elZdq5DEvcUP+b4kgMpyQCKqzdT+NRfaecTuV91gmR9bNLEw==
X-Received: by 2002:aa7:8c42:: with SMTP id e2mr10326531pfd.181.1597655905521; 
 Mon, 17 Aug 2020 02:18:25 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:18:24 -0700 (PDT)
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
Subject: [PATCH] drivers: vme: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:46:03 +0530
Message-Id: <20200817091617.28119-9-allen.cryptic@gmail.com>
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
 drivers/vme/bridges/vme_fake.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/vme/bridges/vme_fake.c b/drivers/vme/bridges/vme_fake.c
index 6a1bc284f297..38dd5f949cd0 100644
--- a/drivers/vme/bridges/vme_fake.c
+++ b/drivers/vme/bridges/vme_fake.c
@@ -90,13 +90,13 @@ static struct device *vme_root;
 /*
  * Calling VME bus interrupt callback if provided.
  */
-static void fake_VIRQ_tasklet(unsigned long data)
+static void fake_VIRQ_tasklet(struct tasklet_struct *t)
 {
 	struct vme_bridge *fake_bridge;
 	struct fake_driver *bridge;
 
-	fake_bridge = (struct vme_bridge *) data;
-	bridge = fake_bridge->driver_priv;
+	bridge = from_tasklet(bridge, t, int_tasklet);
+	fake_bridge = bridge->parent;
 
 	vme_irq_handler(fake_bridge, bridge->int_level, bridge->int_statid);
 }
@@ -1098,8 +1098,7 @@ static int __init fake_init(void)
 	/* Initialize wait queues & mutual exclusion flags */
 	mutex_init(&fake_device->vme_int);
 	mutex_init(&fake_bridge->irq_mtx);
-	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
-			(unsigned long) fake_bridge);
+	tasklet_setup(&fake_device->int_tasklet, fake_VIRQ_tasklet);
 
 	strcpy(fake_bridge->name, driver_name);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
