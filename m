Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2541B55C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FBE6E1F4;
	Thu, 23 Apr 2020 07:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11796EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 15:53:37 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r14so1303610pfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DXOAVnHR/JBy0Y4uPJ7GHHi938/y6M1uaE+uBo8UB4=;
 b=p37iL8woIBWNU97EnJMT9VwP7l2RKgc8soMSx4IV+IX62SYlHIqQdpGySbCjARcv7D
 qDHkwJRGOOhe5LB/rrzCnEOCGZrjk8QWB0EE52Sp0aHSY13nrTMj3aX4A59ll4UidDsO
 IVGCKAZ/VSuHoDsim1ZSp1O8r3x7kkkFQIfiWPsMLYHAOwAEQw9dfuBPZLQXeLe8OxBB
 AfAEET9OzEtDYHMI5c5tecVubReXE3btLphVRcTBTOxwA362MdDP7/LsMtArPvYySZxp
 vB4ufq7h+xTpZmo3zmohx4Efzthsovh+DjhsL4tZIvQKPeCoevAXisI2BmTEHKgrR+l4
 1DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DXOAVnHR/JBy0Y4uPJ7GHHi938/y6M1uaE+uBo8UB4=;
 b=r3IRuKzGc8Agr4HpA8guO2XtulF2F7RFIBn9D1IKWTxJa08qp2nTZJP3os+cn3hgzk
 b09mJOlROcqX6ttq6frZ4ukMb8DjX+hEKM/2OYEljxCe12we/c67rtbtJxUn1OtP16BA
 skalpvxCpdU9F7ldvFQaKfu90U2JCvloHSCuZFocBIbez3O/EavEV2iSN3G45szyXGis
 5GACm0sSv2FFOP4+iXsfxb6PpLJxec+4Oz5UAZSnXUwOW5jdlSWTMQYPCWNbUkNYdk2+
 SOVKykPJoywWh7aECHs6LbseFQa2zcMZN1KJpze93SItU/PK493dxnOHcLLNkduabU6r
 0Clg==
X-Gm-Message-State: AGi0PuZCFN5ThTa917tiVzEEGK+nrnX5GDuTE+x145zmEUS4hGW2pH4Z
 noH2oOHKIlJ6CM4ea1fpaaQ=
X-Google-Smtp-Source: APiQypLhyEB4b+85IkZPJo2ASXh+Y/49d68Z1e97PBFqQn5TiO1hKIDkGgZIzkquqVbKKzf4UK/c8g==
X-Received: by 2002:a63:594:: with SMTP id 142mr26040751pgf.418.1587570817396; 
 Wed, 22 Apr 2020 08:53:37 -0700 (PDT)
Received: from localhost ([89.208.244.140])
 by smtp.gmail.com with ESMTPSA id 36sm5529103pgs.70.2020.04.22.08.53.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 08:53:36 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: b.zolnierkie@samsung.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 tsbogend@alpha.franken.de, FlorianSchandinat@gmx.de, ralf@linux-mips.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v1] console: fix an issue about ioremap leak.
Date: Wed, 22 Apr 2020 23:53:28 +0800
Message-Id: <20200422155328.27473-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if do_take_over_console() return an error in the newport_probe(),
due to the io virtual address is not released, it will cause a leak.

Fixes: e84de0c6190503 ("MIPS: GIO bus support for SGI IP22/28")
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/video/console/newport_con.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 00dddf6e08b0..6bfc8e3ffd4a 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -720,6 +720,9 @@ static int newport_probe(struct gio_device *dev,
 	console_lock();
 	err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
 	console_unlock();
+
+	if (err)
+		iounmap((void *)npregs);
 	return err;
 }
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
