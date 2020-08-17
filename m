Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF06247FF8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D289D7F;
	Tue, 18 Aug 2020 07:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5026E4B3;
 Mon, 17 Aug 2020 09:19:16 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 74so7908895pfx.13;
 Mon, 17 Aug 2020 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BhmC2dfR9Z2FpcZrdiI/rF+di1B3O2m2kCZjxi0Nzus=;
 b=pH1u/a65jck4CF/HaoBjMB2yQ7DQRuOjq2EQe/YOxb/OD7LRTsfaGPckhcN+7n9R1u
 8haLtPH3/hoBwBJOPjlUu2iYNKNPElK2iQu8xAhfWEfShI0bje7FwzTh8mTzsrV2FN/G
 T9q7gfYpRkJs922O9WCJDcFzNiLghUNavbp+zlHscWAG2oqdLCD4z56Z3vUZOyp4D6dk
 KhQqBlfrQV46/Pb2iMfJWkdHHcpVNp7jqYJJ9NEWjQKozVbz9oxhRN55xVrJNhB3JaO3
 Dp4F6ts/oPz/ziaWkRipTHlRzYfTQoj0G/RUnkwPSw1bnvtUKBj+EftqSWTMiaLoQ1jv
 lH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BhmC2dfR9Z2FpcZrdiI/rF+di1B3O2m2kCZjxi0Nzus=;
 b=B0GpMB1bQQH9VKTtngdxJulOiFvnlRPE01yJrOTouxcV595dMdV3uUaKo5ejgCdgap
 5HMiPN1Ve/kqfXYRWxB5ugCVpG/8AKWUvGC/SNICUv5+FlnbNCEjxlftkV86TIEguLHY
 Oli0k/p3Am0m5Bz2mgY9ngo3/BroTnqH1XctDcTAuC1sB8URC3tLHrn180bCw3Q333Nq
 flSneUFkv9BYvsMCP5R6WJ1WIkWLng7Pn+WfP7tY0y84TgBFtNTXELW5NiU4PgQrN0xd
 /eX6U2pZd7IYsN5LJuSIUzvLLZW4RqfWLsCA78OG2bQnWiQOob/+hk7Z1PzXkYW2lv5J
 zjTg==
X-Gm-Message-State: AOAM5318NNGYNnqGnRJaRh2dVU3awmSbKxlk9IK6jJJgT/B2Sx0L73tS
 YO+IFH10Jb1IPkMSHzQvwI4=
X-Google-Smtp-Source: ABdhPJyB5tc5dUu27VbUdOZ9DzBdNo9HMZYO5yS/FgK5KFnwUfpfaMSoblaoVOfdDSu8KmjNrpWWGw==
X-Received: by 2002:a63:2e87:: with SMTP id u129mr9420810pgu.347.1597655956522; 
 Mon, 17 Aug 2020 02:19:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:19:15 -0700 (PDT)
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
Subject: [PATCH] input: serio: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:46:07 +0530
Message-Id: <20200817091617.28119-13-allen.cryptic@gmail.com>
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
 drivers/input/serio/hp_sdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 13eacf6ab431..91f8253ac66a 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -301,7 +301,7 @@ static irqreturn_t hp_sdc_nmisr(int irq, void *dev_id)
 
 unsigned long hp_sdc_put(void);
 
-static void hp_sdc_tasklet(unsigned long foo)
+static void hp_sdc_tasklet(struct tasklet_struct *unused)
 {
 	write_lock_irq(&hp_sdc.rtq_lock);
 
@@ -890,7 +890,7 @@ static int __init hp_sdc_init(void)
 	hp_sdc_status_in8();
 	hp_sdc_data_in8();
 
-	tasklet_init(&hp_sdc.task, hp_sdc_tasklet, 0);
+	tasklet_setup(&hp_sdc.task, hp_sdc_tasklet, 0);
 
 	/* Sync the output buffer registers, thus scheduling hp_sdc_tasklet. */
 	t_sync.actidx	= 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
