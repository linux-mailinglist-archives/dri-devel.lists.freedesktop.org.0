Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF016F916
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D116E1CF;
	Wed, 26 Feb 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A99B6EBA9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 20:45:07 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k29so165146pfp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTrYdgShUxjhTgN/M+5vDyiCIj0nQYIb/LpyI8hkLng=;
 b=qaiVU/umPhZpHouJrJKxTpm7lGWegiVkyARizWMrBascabBG7bhdKuD5gXNY0Lxf+C
 Tw8SNBSWfUJVIb60Yl/iHWZI7+fSaA/nfIjuPo2KO//ezjPHPK783YjWvZD/fqAScKTS
 pduUK/KUxzQO0mqeX11wj3YfM03olD8Rm9wSCfNSNYpCeibRLkVX9407/W+o3DHFoqEL
 Bozx4v2hVD/aEFJyfM7E4UXpDupBznLQNVJ/zgIcee0QEq794v1OTHQz43gavHOl3RJi
 Svdh9kFemOS+j3gyKYfDt9AK7ra+N3epuUToyoq9YkVhPM67JKbkyXXzYTEuZW+tikNH
 uNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTrYdgShUxjhTgN/M+5vDyiCIj0nQYIb/LpyI8hkLng=;
 b=injBVxV8Zm17yzUkP9eZQ80vusNod9LuC/lWP/76jWzhE7nPjqvRheupjdLSudC0Le
 Lpq9z27l8U2Q52JbjoLhD6lOlOlaUEhWA6PfKmCoumAQXnaRNMivmOwOIVAAoREo7lpo
 mHFNNWmFxz3OpfZzxInCcRnMG1WAlaNDuWMW2w/wR4DozJz03KJvvm7yF0mGM/7ea2oK
 WMecUp2oRL6IlGHBrXumXpn0xs9pMpQPEdsU5xYwU0AZXrYU4mfsyd8m4lMn6z6+NdtK
 n5cza1Yli9gvPUcym9jwdto7RElIT4XP118fG2ymuNhTYgPRJ5Pjw3tcWwmtWa7CiJCK
 VzOg==
X-Gm-Message-State: APjAAAXP9AwNBOJVzGiUmtPRoLgBEtAel00kMgWyrxdJoU7utbll1pyT
 aKD7mHNJRnje2Hu65dMixhU=
X-Google-Smtp-Source: APXvYqyGvajkwKcLRMSWOmO2kJ/LSy6jL5WbReeJGFI6FCRLEOWLDc8sBXYbmFRvsoP8IHmCn35vOQ==
X-Received: by 2002:a63:3d44:: with SMTP id k65mr327215pga.349.1582663506812; 
 Tue, 25 Feb 2020 12:45:06 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id e2sm4047954pjs.25.2020.02.25.12.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 12:45:06 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Date: Tue, 25 Feb 2020 12:44:46 -0800
Message-Id: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
it never gets freed.

Free it in dma_buf_release().

Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
Acked-by: Chenbo Feng <fengc@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..c343c7c10b4c 100644
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
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
