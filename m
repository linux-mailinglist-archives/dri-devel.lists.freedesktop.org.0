Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F8C12B403
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 11:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C09E6E3E3;
	Fri, 27 Dec 2019 10:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2714B899A5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 06:32:40 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b137so13989176pga.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 22:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2aAZsrFg19vll1emaW6XpIeha1H0m56azXvY0CR3CNI=;
 b=QVLqmpEAbgO2c42Y8tN7yjEwEflGvvFkcpiVcMD3XIqLRILUAeL2JgE94lP0d2l6Jo
 8Olnde1TWqU37CNeGWvivKNnyz2cP4Hwd2dzMYqXlB6DHV56xEmF/XZO0a1Mhp591qHJ
 mvrM/dnOi92oltV+os0KafIuom1VBvkfu30pivZzaFTDpeM6K1nLYhUN/Sy5EVtqVfSr
 7hexdgBSXUopcPY9xUp3khH7XPKs9RJTovJ/mmCKwWcE+7GwuP1GBI2yti1SkprgbHaf
 iU70Y1IKvUbosCXMhnpvOvCl233EWQzCNc08hlvDR/ahyEG4gHsXFb53b+45hLer3iG/
 ZBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2aAZsrFg19vll1emaW6XpIeha1H0m56azXvY0CR3CNI=;
 b=fwOLiJ5sqzZweTI91si+E542wrLNt91NKw3J2k1mX1FkAt3s/oIB9fwnpzB4HqlvUJ
 AAsIDfGBhx6wTiB8FG9F1XByCvWdpmeA8GmQftnpADGbpVokcMQoDpcSOk1m4jboJNtF
 L1Py6dkHgPyi8wm/NeEVCbPjCvRJYp8p9lIsje9n83SOhQIWwlqhDXLy28EHyHQq1AC2
 weKBlXUqgunu3rQ0NON8t9DKbhXS0dt48ANoczhZfYEb21mDPhY0l42/q8KSIZMu2C7q
 l8oiGt5xvw3nuAygj2SCmwwuGTfVY4rV5s/ITXe/kPo16k1Wbux1Cp42LqxxaGjNgBwO
 4o/Q==
X-Gm-Message-State: APjAAAXoU9m8ZTbxW6DJraYZRtjFUiGDpoCDj+ndzvb95aLSebVVV+7o
 mMiKFpaXcuTNgDbUB0SfVUrAdR26
X-Google-Smtp-Source: APXvYqzpfH2rh0jD8O3cY2+AVWY6TqBk7XZZSc+kF3cJWPXyqCwoDqf0/S76vRyOMV17qmNwfXnOOw==
X-Received: by 2002:a63:215f:: with SMTP id s31mr51237960pgm.27.1577428359435; 
 Thu, 26 Dec 2019 22:32:39 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id s18sm34388938pfh.179.2019.12.26.22.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 22:32:38 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Date: Thu, 26 Dec 2019 22:32:04 -0800
Message-Id: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 10:39:14 +0000
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
Cc: Chenbo Feng <fengc@google.com>, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 Cong Wang <xiyou.wangcong@gmail.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
it never gets freed.

Free it in dma_buf_release().

Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
Cc: Greg Hackmann <ghackmann@google.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ce41cd9b758a..2427398ff22a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
 		dma_resv_fini(dmabuf->resv);
 
 	module_put(dmabuf->owner);
+	kfree(dmabuf->name);
 	kfree(dmabuf);
 	return 0;
 }
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
