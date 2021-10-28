Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0643D856
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 03:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954C6E039;
	Thu, 28 Oct 2021 01:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8BE6E8F9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 01:01:42 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id m26so4382770pff.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 18:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDvRc3zSZmPMaUlLovS+QCbZBjY1LcMWYS4FPlOxhUE=;
 b=ZBXEcxpctXzRRxgxaCNpMlghQfSLZqwZO3Tbe3akH1DeJjnmEfkqN287iSsYZLidVC
 xJE6fAw7CKtEl0SHiSFtzZH4XhlZNZfJ/6wdxfuuY9ijwjUTT58TUqZS6GskSMwl7CoG
 Teuin4CGu/hvT+BR26GjEL+tug36Id5l+b8CZVeN/axgDLN8xJn67giB/q96h/ns3mJi
 iU8O3aEpEPTZsGmkq8VcC/WJqQvtULlYV0M7EmsGsX0N75LfqmnSQjPhyh+Rlp+Z7NzU
 BTh3n4vW8gxR1l3UfuqKm6GnwMkNNw6h6sJjoi/QR/dOUIGK2++OUzOsvH63mzFT24tM
 6DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDvRc3zSZmPMaUlLovS+QCbZBjY1LcMWYS4FPlOxhUE=;
 b=ii1tDqz2+C/mUZqZdvVCoeuEXs99i6nTtmYesvsdPaI1y5I17u4MzhrFgbGarvPo+u
 qrj/5ixLUHbtc92iTIH/46Wy/8duTeFnvhugdA6QAs22PHpm/87bHmuXCx2d0jXlRUCM
 NQOUxBGbgNMQ8EfARGZZdKecSb8YbT+NRD+4ueid6HfmFpgSzs4PuEuIrqmGTlGzgItE
 DBuQD9IVHFfdbKEYs6+5XPfVcSnxS2FAS8EtHXLqrnm5Wv5D/1z/4cfetzBViWakyo63
 Z78Ls8mTb7Hc7YmONa3PLUn1Vwq9cyVW1vi4PF2ZJKjsPWHDp5y03+a9BRq+Hn0DBGRi
 J1gg==
X-Gm-Message-State: AOAM5335rVfbjNvEwzIrHP295V/3Bfh2FCRGX7/S5XgpW/CxY1oMfUAb
 IubB4oxy16m9+CoHUy9sdXA9CtOdu9Q=
X-Google-Smtp-Source: ABdhPJw/02gEZFtyzsCkNG027d512vf0kGUzOzi8v2Of6RGkWlg1RsvHFDTkYGcSw1ql+hXMudDYHA==
X-Received: by 2002:a63:b519:: with SMTP id y25mr849122pge.237.1635382901741; 
 Wed, 27 Oct 2021 18:01:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id k14sm856108pji.45.2021.10.27.18.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 18:01:41 -0700 (PDT)
From: Yang Guang <cgel.zte@gmail.com>
X-Google-Original-From: Yang Guang <yang.guang5@zte.com.cn>
To: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Yang Guang <yang.guang5@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: use swap() to make code cleaner
Date: Thu, 28 Oct 2021 01:01:34 +0000
Message-Id: <20211028010134.7681-1-yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using swap() make it more readable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 266a5582f94d..742f62986b80 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -213,7 +213,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 		/* This does some fuzzy mode naming detection */
 		if(sscanf(strbuf1, "%u %u %u %u", &xres, &yres, &depth, &rate) == 4) {
 			if((rate <= 32) || (depth > 32)) {
-				j = rate; rate = depth; depth = j;
+				swap(rate, depth);
 			}
 			sprintf(strbuf, "%ux%ux%u", xres, yres, depth);
 			nameptr = strbuf;
-- 
2.30.2

