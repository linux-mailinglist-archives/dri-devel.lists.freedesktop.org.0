Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B6247FED
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465B489D8A;
	Tue, 18 Aug 2020 07:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE886E0F8;
 Mon, 17 Aug 2020 09:20:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g7so6063960plq.1;
 Mon, 17 Aug 2020 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=48ZUy5TmzQBYUzPrjZvYPJeHWlYkLbZYovshPbclrcg=;
 b=FoufY+wCt538UGODDBNoxdFMHMLuyZNGQ6MHR7pZXvqvIrAnPj8PHB4pQsWp/mWg6o
 KsvcX8Y87zDteEZApNo70LMlrBVZaBliAR2vLGx60Xbo7CohHtYkdt/Mg+u50DG1h36h
 9Fwly9brTQHjZlbl7lAqxgOWAbzrsFhJBcqUC23aSRj/VpiU2JCK2mbui+uqvhxhgmrl
 IvuQewyHW9KqIl6MAWFr6dd8dgP34kntnReO4dunTk9vfs81InEHWHE3302xh+V3TqjN
 5ledaxK7A0foZnhRefzAA6Ra/wxb6d+K7gxqNB1TdKvqBatRR5FaVQrX9ZSt/5m+frdy
 H7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=48ZUy5TmzQBYUzPrjZvYPJeHWlYkLbZYovshPbclrcg=;
 b=YbLp81nkjQYzCC3RbNefQ0pJ3DtjzsR0IBs814E09oqC2HRSR+/cEK7qaHo95/kFYV
 Ygd/BOFU/e9J8pKRTQWrmTnPX4Zdc5unW89G/2XyHUczaw0Ic2hzU+clY+W1bo3sZrGc
 Xj7+Y1RTqO2VeT7J9RszE+bGOYwRJ0tVjdfQvsjcS3ZpYxZpBDnEKORJ/cWN05lcrbBD
 s9oZi9VZ/glsHjgL0LPV8o4372cVCqPv2oI6zS4i3fUFjaorCqfJLT/Rga9h8ESDSK9K
 S6m0EYWWAJy80K1MXLCYyCR/mvIn8ypF7VZIaMWuHUWrtK3sMq3igpsoJWyOrnA+HHa4
 x/gw==
X-Gm-Message-State: AOAM533PNFwnUzenbWL1ihtDLpQfWxcdqHIJYnEa+Iafnhl6vY/v8Qer
 x0pzjbMTsVv5pRHPE4Vsy+s=
X-Google-Smtp-Source: ABdhPJzGq3wy6E/Dy/SnfM+UdmLXd8ExYtYFE4LwG7DZVH6d40QHdot/zCUw6TFKmzo3uMNttbjBZg==
X-Received: by 2002:a17:902:bd85:: with SMTP id
 q5mr9922465pls.99.1597656014891; 
 Mon, 17 Aug 2020 02:20:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:20:14 -0700 (PDT)
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
Subject: [PATCH] net: atm: convert tasklets callbacks to use from_tasklet()
Date: Mon, 17 Aug 2020 14:46:11 +0530
Message-Id: <20200817091617.28119-17-allen.cryptic@gmail.com>
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

Update all the callbacks of all tasklets by using
from_tasklet() and remove .data field.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 net/atm/pppoatm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/atm/pppoatm.c b/net/atm/pppoatm.c
index 579b66da1d95..3803be8470f7 100644
--- a/net/atm/pppoatm.c
+++ b/net/atm/pppoatm.c
@@ -416,7 +416,6 @@ static int pppoatm_assign_vcc(struct atm_vcc *atmvcc, void __user *arg)
 	pvcc->chan.mtu = atmvcc->qos.txtp.max_sdu - PPP_HDRLEN -
 	    (be.encaps == e_vc ? 0 : LLC_LEN);
 	pvcc->wakeup_tasklet = tasklet_proto;
-	pvcc->wakeup_tasklet.data = (unsigned long) &pvcc->chan;
 	err = ppp_register_channel(&pvcc->chan);
 	if (err != 0) {
 		kfree(pvcc);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
