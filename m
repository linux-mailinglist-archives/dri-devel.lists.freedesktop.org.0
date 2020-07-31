Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83815234630
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44A36EA84;
	Fri, 31 Jul 2020 12:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961126EA80;
 Fri, 31 Jul 2020 12:51:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b11so16797604lfe.10;
 Fri, 31 Jul 2020 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P8zgpF044pgTW1uK5Q8AXrv/7bel3rEWKcAtjS7WDeo=;
 b=WgUyGPBfwmJ9bTlFZ1iykzmaC+/eyxO2mETTCyh0EN7DEuu6cfihmRQOfjN0UX17KJ
 1XK/aClkr4jouIfR2Uq33SHtLP56E4y8DgZ87NMJDRnE/5HMKnL0qQRmTaRqEurFsoxI
 D/R3+eHgdIAl42+OdJRKAhPJheLy6IATe2ljDZKS9Ir/9TnHfgeT9ND6Q078g/e5NeAs
 I2W7ZBR4JYFb7XWCyVQlSdl0Ydv93Ytn/B8SI+DrRwYKxIF7FMjE6FYcroqJuyHyrA1S
 e7Z785IPUZkU0urptiMhDbgonuN0KgLkpcNKcT+5pvixgh0YZDlTJ29FOCn97utl+t8+
 hahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P8zgpF044pgTW1uK5Q8AXrv/7bel3rEWKcAtjS7WDeo=;
 b=nx5viLW93jnT15MTYvQjrOCu68+J37PfEeET3rYospAxYsRutwLU93SctZQe74OTc/
 BBTakncnYGCSvc8ksFmHSxLtMj46DfalSAqvzgx7iRERQ8BGEoL8USnwcdINRSRx4ry6
 Wlo8h0AOekrAiROeeIkA/PVlVfZO4G/i+nyogifU2XCxXlhdo7fxqZDvAk/gt1v+TXPY
 mkUFEBnlAarmJMXccP2kfaYYSPnhnKuzXqUIsBIm8Iohqs7F5PoHHr6fUP8GyNwMZ5aj
 YwQyIfbrNcFmAUCTLdHybbbpkyeIMgieHsuI9VjgeXrlemx4w1gDd0rfn1n/W38saEIs
 2PaA==
X-Gm-Message-State: AOAM53265QZSjB24RfdhBtS5y97/vVgieSTcGm3E/6M4Qrnv9bjbpOgh
 KqLUctJCl934Ciw2CrslzMc=
X-Google-Smtp-Source: ABdhPJzATe0fCD2sbhssHSnUfNXc6kWFAY41kSspFrVQTiQcz0U9VH0isUKE3+W9ohrCIfVkdQXBSg==
X-Received: by 2002:ac2:5683:: with SMTP id 3mr1948307lfr.69.1596199873919;
 Fri, 31 Jul 2020 05:51:13 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:13 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/6] xen/gntdev: Fix dmabuf import with non-zero sgt offset
Date: Fri, 31 Jul 2020 15:51:04 +0300
Message-Id: <20200731125109.18666-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

It is possible that the scatter-gather table during dmabuf import has
non-zero offset of the data, but user-space doesn't expect that.
Fix this by failing the import, so user-space doesn't access wrong data.

Fixes: 37ccb44d0b00 ("xen/gntdev: Implement dma-buf import functionality")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/xen/gntdev-dmabuf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 75d3bb948bf3..b1b6eebafd5d 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -613,6 +613,14 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 		goto fail_detach;
 	}
 
+	/* Check that we have zero offset. */
+	if (sgt->sgl->offset) {
+		ret = ERR_PTR(-EINVAL);
+		pr_debug("DMA buffer has %d bytes offset, user-space expects 0\n",
+			 sgt->sgl->offset);
+		goto fail_unmap;
+	}
+
 	/* Check number of pages that imported buffer has. */
 	if (attach->dmabuf->size != gntdev_dmabuf->nr_pages << PAGE_SHIFT) {
 		ret = ERR_PTR(-EINVAL);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
